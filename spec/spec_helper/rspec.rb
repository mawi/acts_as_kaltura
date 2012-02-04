RSpec.configure do |config|
  config.mock_with :rspec

  config.before(:each) do
    ActiveRecord::Base._kaltura_config_file = Rails.root.join('spec', 'fixtures', 'kaltura.yml')
  end

  config.before(:each) do
    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=start&service=session").
        to_return(:status  => 200,
                  :body    => %{<?xml version="1.0" encoding="utf-8"?><xml><result>NjczYzk0NzYyYTliMDQ4MTBjOGMzOTM5NWFkYWU3YzJiYjRmNDBiMnw4MTk0NDI7ODE5NDQyOzEzMjczMjM1ODA7MjsxMzI3MjM3MTgwLjY0Mjk7Ozs7</result><executionTime>0.046139001846313</executionTime></xml>},
                  :headers => { })

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=upload&service=media").
        to_return(:status  => 200,
                  :body    => %{<?xml version="1.0" encoding="utf-8"?><xml><result>8194421327237180.6429_ntsgo7eblwg0scc4soss.m4v</result><executionTime>0.2022590637207</executionTime></xml>},
                  :headers => { })

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=addFromUploadedFile&service=media").
        to_return(:status => 200,
                  :body   => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaMediaEntry</objectType><id>0_zg72qm1n</id><name>Video 1</name><description>Video description 1</description><partnerId>819442</partnerId><userId></userId><tags></tags><adminTags></adminTags><categories></categories><categoriesIds></categoriesIds><status>1</status><moderationStatus>6</moderationStatus><moderationCount>0</moderationCount><type>1</type><createdAt>1327237192</createdAt><updatedAt>1327237193</updatedAt><rank>0</rank><totalRank>0</totalRank><votes>0</votes><groupId></groupId><partnerData></partnerData><downloadUrl>http://cdnbakmi.kaltura.com/p/819442/sp/81944200/raw/entry_id/0_zg72qm1n/version/0</downloadUrl><searchText></searchText><licenseType>-1</licenseType><version>0</version><thumbnailUrl>http://cdnbakmi.kaltura.com/p/819442/sp/81944200/thumbnail/entry_id/0_zg72qm1n/version/0</thumbnailUrl><accessControlId>713272</accessControlId><startDate></startDate><endDate></endDate><referenceId></referenceId><replacingEntryId></replacingEntryId><replacedEntryId></replacedEntryId><replacementStatus>0</replacementStatus><partnerSortValue>0</partnerSortValue><conversionProfileId>2400242</conversionProfileId><rootEntryId>0_zg72qm1n</rootEntryId><operationAttributes></operationAttributes><plays>0</plays><views>0</views><width></width><height></height><duration>0</duration><msDuration>0</msDuration><durationType></durationType><mediaType>1</mediaType><conversionQuality>2400242</conversionQuality><sourceType>1</sourceType><searchProviderType></searchProviderType><searchProviderId></searchProviderId><creditUserName></creditUserName><creditUrl></creditUrl><mediaDate></mediaDate><dataUrl>http://cdnbakmi.kaltura.com/p/819442/sp/81944200/flvclipper/entry_id/0_zg72qm1n/version/0</dataUrl><flavorParamsIds></flavorParamsIds></result><executionTime>0.94745492935181</executionTime></xml>})

    stub_request(:post, 'http://www.kaltura.com/api_v3/index.php?service=media&action=delete').
        to_return(:status => 200,
                  :body   => %{<?xml version="1.0" encoding="utf-8"?><xml><result></result><executionTime>0.28570890426636</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=get&service=media").
        to_return(:status => 200,
                  :body   => %{<?xml version="1.0" encoding="utf-8" ?><xml><result><objectType>KalturaMediaEntry</objectType><id>0_zg72qm1n</id><thumbnailUrl>http://cdnbakmi.kaltura.com/p/819442/sp/81944200/thumbnail/entry_id/0_zg72qm1n/version/0</thumbnailUrl><name>Demo Video</name><description/><partnerId>1</partnerId><userId/><tags/><adminTags>demo</adminTags><status>2</status><type>1</type><createdAt>1240844664</createdAt></result><executionTime>0.08957796096802</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=update&service=media").
        to_return(:status => 200,
                  :body   => %{<?xml version="1.0" encoding="utf-8"?><xml><result></result><executionTime>0.28570890426636</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=add&service=cuepoint_cuepoint").
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaAnnotation</objectType><id>0_ibrtqzuc</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_p6eg0ber</entryId><partnerId>819442</partnerId><createdAt>1327987669</createdAt><updatedAt>1327987669</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></result><executionTime>0.70482802391052</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=get&service=cuepoint_cuepoint").
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaAnnotation</objectType><id>0_ibrtqzuc</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_p6eg0ber</entryId><partnerId>819442</partnerId><createdAt>1327987669</createdAt><updatedAt>1327987669</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></result><executionTime>0.20425009727478</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=update&service=cuepoint_cuepoint").
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaAnnotation</objectType><id>0_2tw8xzva</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_uhmpu5of</entryId><partnerId>819442</partnerId><createdAt>1328073737</createdAt><updatedAt>1328073737</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>hi hi</systemName><parentId>0</parentId><text>hola hola</text><endTime>1000</endTime><duration>0</duration></result><executionTime>0.077766895294189</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=count&service=cuepoint_cuepoint").
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result>10</result><executionTime>0.072910070419312</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?service=cuepoint_cuepoint&action=list").
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaCuePointListResponse</objectType><objects><item><objectType>KalturaAnnotation</objectType><id>0_2tw8xzva</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_uhmpu5of</entryId><partnerId>819442</partnerId><createdAt>1328073737</createdAt><updatedAt>1328073737</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 1328073735</systemName><parentId>0</parentId><text>Chapter text 1328073735</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_4m4z6q6o</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988641</createdAt><updatedAt>1327988641</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655977276</systemName><parentId>0</parentId><text>Chapter text 2655977276</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_60rmeh02</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988447</createdAt><updatedAt>1327988447</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_654e1e9r</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_8xnn84g8</entryId><partnerId>819442</partnerId><createdAt>1328073896</createdAt><updatedAt>1328073896</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2656147786</systemName><parentId>0</parentId><text>Chapter text 2656147786</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_6tbvbyxj</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988607</createdAt><updatedAt>1327988607</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655977206</systemName><parentId>0</parentId><text>Chapter text 2655977206</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_b6mix2jm</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327994810</createdAt><updatedAt>1327994810</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655989616</systemName><parentId>0</parentId><text>Chapter text 2655989616</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_cvyf2jwn</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_wawuknpx</entryId><partnerId>819442</partnerId><createdAt>1328073664</createdAt><updatedAt>1328073664</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 1328073661</systemName><parentId>0</parentId><text>Chapter text 1328073661</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_gw8fwcmm</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327997248</createdAt><updatedAt>1327997248</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655994492</systemName><parentId>0</parentId><text>Chapter text 2655994492</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_ibrtqzuc</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_p6eg0ber</entryId><partnerId>819442</partnerId><createdAt>1327987669</createdAt><updatedAt>1327987669</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_jlroz41s</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_o38celv3</entryId><partnerId>819442</partnerId><createdAt>1327997327</createdAt><updatedAt>1327997327</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655994648</systemName><parentId>0</parentId><text>Chapter text 2655994648</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_kbusaai9</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_sqns0c39</entryId><partnerId>819442</partnerId><createdAt>1328073878</createdAt><updatedAt>1328073878</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 1328073876</systemName><parentId>0</parentId><text>Chapter text 1328073876</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_o1k0f08t</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_qew24w0c</entryId><partnerId>819442</partnerId><createdAt>1327932722</createdAt><updatedAt>1327932722</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_wh1np377</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327994846</createdAt><updatedAt>1327994846</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655989688</systemName><parentId>0</parentId><text>Chapter text 2655989688</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_zpyspzd5</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327997141</createdAt><updatedAt>1327997141</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655994278</systemName><parentId>0</parentId><text>Chapter text 2655994278</text><endTime>1000</endTime><duration>0</duration></item></objects><totalCount>14</totalCount></result><executionTime>0.086468935012817</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=list&service=cuepoint_cuepoint").
        with(:body    => { "format"=>"2", "clientTag"=>"ruby", "filter:objectType"=>"KalturaCuepointFilter", "filter:orderBy"=>"created_at", "pager:objectType"=>"FilterPager", "pager:pageSize"=>"5", "partnerId"=>"819442", "ks"=>"NjczYzk0NzYyYTliMDQ4MTBjOGMzOTM5NWFkYWU3YzJiYjRmNDBiMnw4MTk0NDI7ODE5NDQyOzEzMjczMjM1ODA7MjsxMzI3MjM3MTgwLjY0Mjk7Ozs7", "kalsig"=>"bc939998963be210e61ebd5378b53262" },
             :headers => { 'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'320', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby' }).
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaCuePointListResponse</objectType><objects><item><objectType>KalturaAnnotation</objectType><id>0_4m4z6q6o</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988641</createdAt><updatedAt>1327988641</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655977276</systemName><parentId>0</parentId><text>Chapter text 2655977276</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_60rmeh02</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988447</createdAt><updatedAt>1327988447</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_6tbvbyxj</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_npvlcjxa</entryId><partnerId>819442</partnerId><createdAt>1327988607</createdAt><updatedAt>1327988607</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2655977206</systemName><parentId>0</parentId><text>Chapter text 2655977206</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_ibrtqzuc</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_p6eg0ber</entryId><partnerId>819442</partnerId><createdAt>1327987669</createdAt><updatedAt>1327987669</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item><item><objectType>KalturaAnnotation</objectType><id>0_o1k0f08t</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_qew24w0c</entryId><partnerId>819442</partnerId><createdAt>1327932722</createdAt><updatedAt>1327932722</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 2</systemName><parentId>0</parentId><text>Chapter text 2</text><endTime>1000</endTime><duration>0</duration></item></objects><totalCount>14</totalCount></result><executionTime>0.13580298423767</executionTime></xml>})

    stub_request(:post, 'http://www.kaltura.com/api_v3/index.php?service=cuepoint_cuepoint&action=add').
        to_return(:status => 200, :body => %{<?xml version="1.0" encoding="utf-8"?><xml><result><objectType>KalturaAnnotation</objectType><id>0_mfqpxegu</id><cuePointType>annotation.Annotation</cuePointType><status>1</status><entryId>0_x1vzba3v</entryId><partnerId>819442</partnerId><createdAt>1328085512</createdAt><updatedAt>1328085512</updatedAt><tags></tags><startTime>1000</startTime><userId></userId><partnerData></partnerData><partnerSortValue></partnerSortValue><forceStop></forceStop><thumbOffset></thumbOffset><systemName>Chapter title 3984256530</systemName><parentId>0</parentId><text>Chapter text 3984256530</text><endTime>2000</endTime><duration>1000</duration></result><executionTime>0.20050406455994</executionTime></xml>})

    stub_request(:post, "http://www.kaltura.com/api_v3/index.php?action=delete&service=cuepoint_cuepoint").
        with(:body    => { "format"=>"2", "clientTag"=>"ruby", "id"=>"0_mfqpxegu", "partnerId"=>"819442", "ks"=>"NjczYzk0NzYyYTliMDQ4MTBjOGMzOTM5NWFkYWU3YzJiYjRmNDBiMnw4MTk0NDI7ODE5NDQyOzEzMjczMjM1ODA7MjsxMzI3MjM3MTgwLjY0Mjk7Ozs7", "kalsig"=>"6dc8d2e200ef4fa3bbfebd2b75af61ef" },
             :headers => { 'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'Content-Length'=>'214', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'Ruby' }).
        to_return(:status => 200, :body => "", :headers => { })

  end
end