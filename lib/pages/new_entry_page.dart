import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justpassapp/cubit/journal_cubit.dart';
import 'package:justpassapp/consts.dart';
import 'package:justpassapp/hive/journal_entry.dart';
import 'package:hive/hive.dart';

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  @override
  NewEntryPageState createState() => NewEntryPageState();
}

class NewEntryPageState extends State<NewEntryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<String> _imagePaths = [];
  final List<String> _attachmentPaths = [];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePaths.add(pickedFile.path);
      });
    }
  }

  Future<void> _openCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagePaths.add(pickedFile.path);
      });
    }
  }

  Future<void> _addAttachment() async {
    // Logic to add attachments (e.g., using a file picker)
    // For demonstration, let's assume we add a dummy file path
    setState(() {
      _attachmentPaths.add('/path/to/attachment');
    });
  }

  Future<void> _addVoiceNote() async {
    // Logic to add voice notes
    // For demonstration, let's assume we add a dummy file path
    setState(() {
      _attachmentPaths.add('/path/to/voice_note');
    });
  }

  void _saveEntry() {
    if (_titleController.text.isNotEmpty &&
        _contentController.text.isNotEmpty) {
      final title = _titleController.text;
      final content = _contentController.text;

      context.read<JournalCubit>().addJournalEntry(
            title,
            content,
            _imagePaths,
            _attachmentPaths,
          );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          JournalCubit(Hive.box<JournalEntry>('journal_entries')),
      child: Scaffold(
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
          backgroundColor: primary,
          elevation: 0,
        ),
        body: Container(
          color: primary,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'New Entry',
                  hintStyle: TextStyle(
                    color: Colors.white60,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TextField(
                  controller: _contentController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Type here...',
                    hintStyle: TextStyle(color: Colors.white60),
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                  cursorColor: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.image, color: Colors.white),
                    onPressed: _pickImage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: _openCamera,
                  ),
                  IconButton(
                    icon: const Icon(Icons.link, color: Colors.white),
                    onPressed: _addAttachment,
                  ),
                  IconButton(
                    icon: const Icon(Icons.graphic_eq, color: Colors.white),
                    onPressed: _addVoiceNote,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: _saveEntry,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
