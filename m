Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422DB2FABDE
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 21:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390629AbhARUwT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 15:52:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388137AbhARUwL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 15:52:11 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FD5C061573;
        Mon, 18 Jan 2021 12:51:30 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id a12so17694048wrv.8;
        Mon, 18 Jan 2021 12:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5E1Zqwt5UjpmEr7JHA37Jh75pgHb6STpqkB7TTBWW50=;
        b=Ivs93hOFttTr3QutQiEn7v4khyR/Cu0v7nXNxL0kVULz949KUenftU31wNhGejsWR3
         2cj2BVKyW17bOqfGKu+O0OEJP93thm0gSjrYUSCvy470l6Mf4Hrh6jyCjOIFdAlLUePL
         K1/gFKbFB49NnwxixupCEbEdY9sFDCXxyGzPEkJ+aj33Xbgz46lPAWg4Dx1Sxt+3HWZP
         WTU08A3D4ArtfZMxRa10Qfo+sPgmba98/mKn3rpxZQPOuSs9ifU5BqhHpX5q9WmyZhb3
         WCTo1F5tGFeSyit7GyCFHo+fdrxsMJxnPymObrVz7zPr8S0nJekjqsWOWTy2v8BMBocF
         sSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5E1Zqwt5UjpmEr7JHA37Jh75pgHb6STpqkB7TTBWW50=;
        b=DR40pFUtXie2K6/mocihXY26rIacjZm1h+FTDLxjJS7xo/a5JtEfzMrqg1KS508/n9
         iA1fkprdUt2Nh92VWo5AX43v/1T5svv5Yv9XFTj6j6EDAhLgIzeaKoeyit7ACh+G75r1
         D48f1SMVXrmSC9+vONQ7VyVLelGRj9Ed6lY/we54irij5MzYPNTAHIDXiHk+0f8VsBIh
         CPLKbk6dQu0XaNJcUdQn9eVOmPdnsVygqFbXCnJuBbcoKd53Vg1SywP0FvcJA6fk93ha
         2jFxrrBUGLnl0sEbGYHdyS5W8Z2kuPLsTYzZ0dXrHdn+zQBugtABY7UWnWViiXHOdixt
         5qEw==
X-Gm-Message-State: AOAM531N+X/f2OOvScol8CVhROaNVfD9X0Hm2dyp6XZ8Tj1OxIgKDY9F
        X5zYAT+8g7bSIgqqH9fIOfw=
X-Google-Smtp-Source: ABdhPJxGidmbbneboahUdZhjGq8xt0VCVCs84Wz2eeHobWmhtpd0J6mJOTZntq2sHo3iKJuEkbuTWQ==
X-Received: by 2002:a05:6000:1082:: with SMTP id y2mr1144586wrw.233.1611003088948;
        Mon, 18 Jan 2021 12:51:28 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id v11sm31392225wrt.25.2021.01.18.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 12:51:28 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
Date:   Mon, 18 Jan 2021 20:51:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>> In some ACPI tables we encounter, devices use the _DEP method to assert
>> a dependence on other ACPI devices as opposed to the OpRegions that the
>> specification intends. We need to be able to find those devices "from"
>> the dependee, so add a function to parse all ACPI Devices and check if
>> the include the handle of the dependee device in their _DEP buffer.
> What exactly do you need this for?


So, in our DSDT we have devices with _HID INT3472, plus sensors which
refer to those INT3472's in their _DEP method. The driver binds to the
INT3472 device, we need to find the sensors dependent on them.


> Would it be practical to look up the suppliers in acpi_dep_list instead?
>
> Note that supplier drivers may remove entries from there, but does
> that matter for your use case?


Ah - that may work, yes. Thank you, let me test that.


>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v2:
>>         - Used acpi_lpss_dep() as Andy suggested.
>>
>>  drivers/acpi/utils.c    | 34 ++++++++++++++++++++++++++++++++++
>>  include/acpi/acpi_bus.h |  2 ++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
>> index 78b38775f18b..ec6a2406a886 100644
>> --- a/drivers/acpi/utils.c
>> +++ b/drivers/acpi/utils.c
>> @@ -831,6 +831,18 @@ bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
>>         return false;
>>  }
>>
>> +static int acpi_dev_match_by_dep(struct device *dev, const void *data)
>> +{
>> +       struct acpi_device *adev = to_acpi_device(dev);
>> +       const struct acpi_device *dependee = data;
>> +       acpi_handle handle = dependee->handle;
>> +
>> +       if (acpi_lpss_dep(adev, handle))
>> +               return 1;
>> +
>> +       return 0;
>> +}
>> +
>>  /**
>>   * acpi_dev_present - Detect that a given ACPI device is present
>>   * @hid: Hardware ID of the device.
>> @@ -866,6 +878,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
>>  }
>>  EXPORT_SYMBOL(acpi_dev_present);
>>
>> +/**
>> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev
>> + * @adev: Pointer to the dependee device
>> + * @prev: Pointer to the previous dependent device (or NULL for first match)
>> + *
>> + * Return the next ACPI device which declares itself dependent on @adev in
>> + * the _DEP buffer.
>> + *
>> + * The caller is responsible to call put_device() on the returned device.
>> + */
>> +struct acpi_device *acpi_dev_get_next_dep_dev(struct acpi_device *adev,
>> +                                             struct acpi_device *prev)
>> +{
>> +       struct device *start = prev ? &prev->dev : NULL;
>> +       struct device *dev;
>> +
>> +       dev = bus_find_device(&acpi_bus_type, start, adev, acpi_dev_match_by_dep);
>> +
>> +       return dev ? to_acpi_device(dev) : NULL;
>> +}
>> +EXPORT_SYMBOL(acpi_dev_get_next_dep_dev);
>> +
>>  /**
>>   * acpi_dev_get_next_match_dev - Return the next match of ACPI device
>>   * @adev: Pointer to the previous acpi_device matching this @hid, @uid and @hrv
>> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
>> index 02a716a0af5d..33deb22294f2 100644
>> --- a/include/acpi/acpi_bus.h
>> +++ b/include/acpi/acpi_bus.h
>> @@ -683,6 +683,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
>>
>>  bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
>>
>> +struct acpi_device *
>> +acpi_dev_get_next_dep_dev(struct acpi_device *adev, struct acpi_device *prev);
>>  struct acpi_device *
>>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);
>>  struct acpi_device *
>> --
>> 2.25.1
>>
