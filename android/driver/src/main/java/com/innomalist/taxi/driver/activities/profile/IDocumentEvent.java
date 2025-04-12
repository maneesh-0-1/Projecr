package com.innomalist.taxi.driver.activities.profile;


import com.minimal.taxi.driver.GetDriverQuery;

public interface IDocumentEvent {
    void onClicked(GetDriverQuery.Document media);
}
