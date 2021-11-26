Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD99245EC6E
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 12:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239241AbhKZLYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 06:24:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27987 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239060AbhKZLWR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 06:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637925544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DEigbysMKZscWuG/nrx9AX2D3SqvZ+Fu4CJlrP/uHHg=;
        b=UPGybewkWLMZzE0qa3LaZdn1H9l+Fh9gSkQRHPyjXvyNlz7tdiVR1WW1N0ztFHsXRocxmk
        IJfWWuSbcyedhnwqwqz6uqrIpntWIgzSJ3wzLtx6uLFvTRhU8wIGtDyqao1jq19hmd/ABL
        Mah7mSbpPKr8apERvgGVteYBc9kv+VY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-gdg3R8YTM6qXQ5vYxPcJlw-1; Fri, 26 Nov 2021 06:19:03 -0500
X-MC-Unique: gdg3R8YTM6qXQ5vYxPcJlw-1
Received: by mail-ed1-f70.google.com with SMTP id v10-20020aa7d9ca000000b003e7bed57968so7727209eds.23
        for <linux-i2c@vger.kernel.org>; Fri, 26 Nov 2021 03:19:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DEigbysMKZscWuG/nrx9AX2D3SqvZ+Fu4CJlrP/uHHg=;
        b=MAuMg0D2T1IUSSaGPv1KZhQU20elQDoYxtuclq5n51i3m+EeV+zwuM1lcRgtoYlODk
         4gm2JO7y9Zf0tPYks4zXRsB9A7+7OKfF/7Ndo/7i58y64KOBHxdFVyv2stc2jIbiWL1D
         kfkPULeF72/lNqAJ93CzvycFG6n2+DfRTwKiwjdiUr2C+NsNP2ybwXENOOL2Hdm184LR
         0BUMMPUkzJLDJc8abMAytNDeesFIt9ckbHk4MOgDKzhi2LyoclalzedRkCNmOC3WA9vN
         p5WkpOJwqt1rYVYz5aaeDo0/c+zWhG9/8r3A1klOgNIzxXpny20sQOdSYXHr90WOUW5X
         RBig==
X-Gm-Message-State: AOAM533GYkORQ6v8Zngha/rKQx7zr2FzTtSM0qI7e37GXLx9u/kzYFb4
        7xNRk0AldRlFS6VxVOPt+HiNTdyq4fpKZC1ABI7obS1jVxD4ZMAXarDLLi2gZEYm61uoj1FcZur
        g0kwgdW/Mtwj46a4HdioG
X-Received: by 2002:a05:6402:185:: with SMTP id r5mr44737577edv.259.1637925542415;
        Fri, 26 Nov 2021 03:19:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwahPgaHB3vNloRByTEj2b+ZXi68UUpneC/4sfhsoKP7oJ8BOIxq7zoR/6CW0ILA40KMefQgw==
X-Received: by 2002:a05:6402:185:: with SMTP id r5mr44737558edv.259.1637925542223;
        Fri, 26 Nov 2021 03:19:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sa3sm3072930ejc.113.2021.11.26.03.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 03:19:01 -0800 (PST)
Message-ID: <5c6511e1-1264-a2f8-377c-a9da34469468@redhat.com>
Date:   Fri, 26 Nov 2021 12:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 03/15] i2c: acpi: Add i2c_acpi_new_device_by_fwnode()
 function
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211125165412.535063-1-hdegoede@redhat.com>
 <20211125165412.535063-4-hdegoede@redhat.com>
 <CAHp75VdBf-xNfx5a70LWnP7-qJpjB9gWSVQExqCz3emrgrT7Zw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdBf-xNfx5a70LWnP7-qJpjB9gWSVQExqCz3emrgrT7Zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 11/25/21 18:22, Andy Shevchenko wrote:
> On Thu, Nov 25, 2021 at 6:54 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Change i2c_acpi_new_device() into i2c_acpi_new_device_by_fwnode() and
>> add a static inline wrapper providing the old i2c_acpi_new_device()
>> behavior.
>>
>> This is necessary because in some cases we may only have access
>> to the fwnode / acpi_device and not to the matching physical-node
>> struct device *.
> 
> One nit-pick below.
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you, I've fixed the nit-pick in my local tree, either for v7 of
the series, of for in the immutable branch which I plan to create for
this.

Regards,

Hans



>> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v6:
>> - New patch in v6 of this patch series
>> ---
>>  drivers/i2c/i2c-core-acpi.c | 18 ++++++++++++------
>>  include/linux/i2c.h         | 17 +++++++++++++----
>>  2 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
>> index 04338cbd08a9..1db3cc5fc47f 100644
>> --- a/drivers/i2c/i2c-core-acpi.c
>> +++ b/drivers/i2c/i2c-core-acpi.c
>> @@ -476,8 +476,9 @@ struct notifier_block i2c_acpi_notifier = {
>>  };
>>
>>  /**
>> - * i2c_acpi_new_device - Create i2c-client for the Nth I2cSerialBus resource
>> - * @dev:     Device owning the ACPI resources to get the client from
> 
>> + * i2c_acpi_new_device_by_fwnode - Create i2c-client for the Nth I2cSerialBus
>> + * resource
> 
> Can be on one line.
> 
>> + * @fwnode:  fwnode with the ACPI resources to get the client from
>>   * @index:   Index of ACPI resource to get
>>   * @info:    describes the I2C device; note this is modified (addr gets set)
>>   * Context: can sleep
>> @@ -493,15 +494,20 @@ struct notifier_block i2c_acpi_notifier = {
>>   * Returns a pointer to the new i2c-client, or error pointer in case of failure.
>>   * Specifically, -EPROBE_DEFER is returned if the adapter is not found.
>>   */
>> -struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>> -                                      struct i2c_board_info *info)
>> +struct i2c_client *i2c_acpi_new_device_by_fwnode(struct fwnode_handle *fwnode,
>> +                                                int index,
>> +                                                struct i2c_board_info *info)
>>  {
>> -       struct acpi_device *adev = ACPI_COMPANION(dev);
>>         struct i2c_acpi_lookup lookup;
>>         struct i2c_adapter *adapter;
>> +       struct acpi_device *adev;
>>         LIST_HEAD(resource_list);
>>         int ret;
>>
>> +       adev = to_acpi_device_node(fwnode);
>> +       if (!adev)
>> +               return ERR_PTR(-ENODEV);
>> +
>>         memset(&lookup, 0, sizeof(lookup));
>>         lookup.info = info;
>>         lookup.device_handle = acpi_device_handle(adev);
>> @@ -523,7 +529,7 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>>
>>         return i2c_new_client_device(adapter, info);
>>  }
>> -EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
>> +EXPORT_SYMBOL_GPL(i2c_acpi_new_device_by_fwnode);
>>
>>  bool i2c_acpi_waive_d0_probe(struct device *dev)
>>  {
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index 16119ac1aa97..7d4f52ceb7b5 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -1025,8 +1025,9 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>>                                struct acpi_resource_i2c_serialbus **i2c);
>>  int i2c_acpi_client_count(struct acpi_device *adev);
>>  u32 i2c_acpi_find_bus_speed(struct device *dev);
>> -struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>> -                                      struct i2c_board_info *info);
>> +struct i2c_client *i2c_acpi_new_device_by_fwnode(struct fwnode_handle *fwnode,
>> +                                                int index,
>> +                                                struct i2c_board_info *info);
>>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>>  bool i2c_acpi_waive_d0_probe(struct device *dev);
>>  #else
>> @@ -1043,8 +1044,9 @@ static inline u32 i2c_acpi_find_bus_speed(struct device *dev)
>>  {
>>         return 0;
>>  }
>> -static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>> -                                       int index, struct i2c_board_info *info)
>> +static inline struct i2c_client *i2c_acpi_new_device_by_fwnode(
>> +                                       struct fwnode_handle *fwnode, int index,
>> +                                       struct i2c_board_info *info)
>>  {
>>         return ERR_PTR(-ENODEV);
>>  }
>> @@ -1058,4 +1060,11 @@ static inline bool i2c_acpi_waive_d0_probe(struct device *dev)
>>  }
>>  #endif /* CONFIG_ACPI */
>>
>> +static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>> +                                                    int index,
>> +                                                    struct i2c_board_info *info)
>> +{
>> +       return i2c_acpi_new_device_by_fwnode(dev_fwnode(dev), index, info);
>> +}
>> +
>>  #endif /* _LINUX_I2C_H */
>> --
>> 2.33.1
>>
> 
> 

