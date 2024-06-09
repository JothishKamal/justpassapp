import 'package:flutter/material.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/hive/journal_entry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justpassapp/cubit/journal_cubit.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  bool _isEditing = false;
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late JournalEntry _entry;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as JournalEntry;
    _entry = args;
    _titleController = TextEditingController(text: _entry.title);
    _contentController = TextEditingController(text: _entry.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveEntry() {
    if (_titleController.text.isNotEmpty &&
        _contentController.text.isNotEmpty) {
      final updatedEntry = _entry.copyWith(
        title: _titleController.text,
        content: _contentController.text,
      );
      context.read<JournalCubit>().updateJournalEntry(_entry.key, updatedEntry);
      setState(() {
        _isEditing = false;
        _entry = updatedEntry;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.check : Icons.edit,
              color: Colors.white,
            ),
            onPressed: _isEditing ? _saveEntry : _toggleEditing,
          ),
        ],
        backgroundColor: primary,
        elevation: 0,
      ),
      body: Container(
        color: primary,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isEditing)
              TextField(
                controller: _titleController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                ),
              )
            else
              Text(
                _entry.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: _isEditing
                    ? TextField(
                        controller: _contentController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Content',
                          hintStyle: TextStyle(color: Colors.white60),
                          border: InputBorder.none,
                        ),
                      )
                    : Text(
                        _entry.content,
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
