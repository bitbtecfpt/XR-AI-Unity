import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TopicInfoFormScreen extends StatefulWidget {
  const TopicInfoFormScreen({super.key, required String item});

  @override
  _TopicInfoFormScreenState createState() => _TopicInfoFormScreenState();
}

class _TopicInfoFormScreenState extends State<TopicInfoFormScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tell us more about you'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField("Industry", "Ex : Software Engineer"),
                    const SizedBox(height: 16),
                    _buildTextField("Target position", "Ex : Software Engineer"),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdownField("Experience Year",
                              ["1 to 3", "3 to 5", "5 to 7", "7 to 12", "over 12"]),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildDropdownField("Gender", ["Male", "Female", "Other"]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildTextField("Skills", "Input your skills...", minLines: 1, maxLines: null),
                    const SizedBox(height: 16),
                    // Thêm input cho Job Description
                    _buildTextField("Job Description", "Describe the job...", minLines: 3, maxLines: 5),
                    const SizedBox(height: 16),
                    const Text(
                      "Upload an Image",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: _selectedImage == null
                              ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_photo_alternate, size: 30, color: Colors.grey),
                              Text("Select Image", style: TextStyle(color: Colors.grey)),
                            ],
                          )
                              : Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedImage != null) {
                        print("Image selected: ${_selectedImage!.path}");
                      } else {
                        print("No image selected");
                      }
                    },
                    child: const Text("Start"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {int minLines = 1, int? maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          minLines: minLines,
          maxLines: maxLines,
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}

