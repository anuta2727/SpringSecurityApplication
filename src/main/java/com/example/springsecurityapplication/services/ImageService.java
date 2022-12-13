package com.example.springsecurityapplication.services;


import com.example.springsecurityapplication.repositories.ImageRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = true)
public class ImageService {

    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    @Transactional
    public void deleteProduct(int id){
        imageRepository.deleteById(id);
    }
}
