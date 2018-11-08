package by.belkevich.services;

import by.belkevich.entities.Slide;
import by.belkevich.repository.RepositoryJPAImpl;
import org.springframework.beans.factory.annotation.Autowired;

@org.springframework.stereotype.Service
public class SlideServiceImpl extends ParentService<Slide> implements SlideService {

    @Autowired
    public SlideServiceImpl(RepositoryJPAImpl<Slide, Long> repositoryJPA) {
        super(repositoryJPA);
    }

}
