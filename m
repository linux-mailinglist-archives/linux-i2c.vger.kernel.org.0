Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C77B5ED73E
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Sep 2022 10:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233674AbiI1INj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Sep 2022 04:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbiI1INf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Sep 2022 04:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE23C12B484
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664352810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lNzA3PtO6KVkcwvX2e9uAcm92K64t3NApyRdbIxailw=;
        b=C29y1fnMHsiN+HuLCfCcTO59YzM1RECL+jvKd7ZdO2iN94Ti2ipkQoTf2i6gtlvP2KVWpz
        KjsQnohQNDimo+CK31VaR7VfzlDgtbGQ0s04TeyWEPL4lLQj+RADuZY3dvBR4cA5U9lAWY
        ZjDRimvND1q4eOZPI2mmVgQs5+YZ3m0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-00nPSxTWMEuKWTJcjmSHDQ-1; Wed, 28 Sep 2022 04:13:28 -0400
X-MC-Unique: 00nPSxTWMEuKWTJcjmSHDQ-1
Received: by mail-ed1-f72.google.com with SMTP id b17-20020a056402351100b00453b19d9bd0so9588064edd.4
        for <linux-i2c@vger.kernel.org>; Wed, 28 Sep 2022 01:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lNzA3PtO6KVkcwvX2e9uAcm92K64t3NApyRdbIxailw=;
        b=Fzr32/WK7jph2in08SSrFa5i1MFgkZbzPh263G+so5/WGJoDtoUTW2Q+D4ZgYrf2jd
         QPhtHI0CsmHElxFZvwlF4ywsxLVxBe3qxUZwjte/ALzq0eHKJASBe49vtbznW4uFjKve
         VVc1fZntiW5tBEkyHamkudUQf1LW0j7ng/q5XSMUtSMzi/kYQPS+1nFCLHhGVxIlNvLR
         Q+AV5cuwuQwO6oQRqp7lvZ89ZufSI9OWznmiSySd5dtSPbNGPE482LoN7zM0CBE5Mxeu
         U7XXZgNblgw4Nr603MrSUZ2udEREn8LnEi7P3Ws4kvUh1JHMfVqCTw9Tbv/nqdFAXKzo
         VLyw==
X-Gm-Message-State: ACrzQf3ljYm9TBGPKWE+TWs7gXFuVLWLAp53d1wXHzdJZIIBwfokdYi8
        7BINI1ZLPKwswkElYOjlbOVFc9C0nAWdCEy9Z2Om8QRTzjViBdKdTQTiKbZarNYxWB6FfLs4f32
        DQ0FpdVAfekOXr7DjBDRN
X-Received: by 2002:a17:907:1df1:b0:779:4f57:6bb2 with SMTP id og49-20020a1709071df100b007794f576bb2mr26774867ejc.407.1664352807227;
        Wed, 28 Sep 2022 01:13:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5dA1MWILEDniSI11YNVQ9D8vaRwbRSstK1PCtmzAzQIvf+LLKoLYEFDlGlOG4F8R/ghzbRng==
X-Received: by 2002:a17:907:1df1:b0:779:4f57:6bb2 with SMTP id og49-20020a1709071df100b007794f576bb2mr26774851ejc.407.1664352807047;
        Wed, 28 Sep 2022 01:13:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090653ce00b0077f20a722dfsm1949464ejo.165.2022.09.28.01.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:13:26 -0700 (PDT)
Message-ID: <5b8a4060-b800-6701-e0c9-cc8dfa0e6b67@redhat.com>
Date:   Wed, 28 Sep 2022 10:13:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] i2c: designware: Fix handling of real but unexpected
 device interrupts
Content-Language: en-US, nl
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Samuel Clark <slc2015@gmail.com>, stable@vger.kernel.org
References: <20220927135644.1656369-1-jarkko.nikula@linux.intel.com>
 <YzMKHf+aNKiGVkyn@smile.fi.intel.com>
 <31477388-b57b-5383-9c6a-18905c28253e@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <31477388-b57b-5383-9c6a-18905c28253e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On 9/28/22 07:49, Jarkko Nikula wrote:
> + Hans
> 
> I forgot to Cc you yesterday even especially had a question for you :-(

Yes I can test this on BYT and CHT hw where one of the i2c-designware
busses is shared with the PUNIT. I have added this patch to me personal
tree which I regularly test on these kinda devices.

I will let you know if I hit any issues, if you don't hear anything from
me then you can assume I have not hit any issues :)

You also mention being especially interested on testing on hw where
the interrupt line is shared with other devices. I don't think the
i2c-designware interrupts are ever shared with other hw on the BYT/CHT
devices I have.

Regards,

Hans



> Patch here and my comment to Andy below.
> 
> https://patchwork.ozlabs.org/project/linux-i2c/patch/20220927135644.1656369-1-jarkko.nikula@linux.intel.com/
> 
> On 9/27/22 17:35, Andy Shevchenko wrote:
>> On Tue, Sep 27, 2022 at 04:56:44PM +0300, Jarkko Nikula wrote:
>>>   #define STATUS_IDLE            0x0
>>
>> A side note: I think the clearer is to use STATUS_MASK and use
>> '&= ~STATUS_MASK' instead of '= STATUS_IDLE' in the affected pieces
>> of the code.
>>
>>> -#define STATUS_WRITE_IN_PROGRESS    0x1
>>> -#define STATUS_READ_IN_PROGRESS        0x2
>>> +#define STATUS_ACTIVE            0x1
>>> +#define STATUS_WRITE_IN_PROGRESS    0x2
>>> +#define STATUS_READ_IN_PROGRESS        0x4
>>
>> Can we at the same time replace them with BIT()?
>>
>> ...
>>
>> Otherwise looks good to me,
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
> Good points. I'll add these to follow up patches.
> 
> Jarkko
> 

