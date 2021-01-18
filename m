Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B3C2F9B54
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 09:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387837AbhARIcu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 03:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbhARIci (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 03:32:38 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A4FC061573;
        Mon, 18 Jan 2021 00:31:56 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id 6so8254396wri.3;
        Mon, 18 Jan 2021 00:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mV6Bo6RnxoD+Wo+WZWXYj5Z/xntqPRjWRdQIckQx4+s=;
        b=R7Xg4fdNVNvV1pjh0MXgS0lrsw0EbZ82Zr1s7Re2aHAHuSL81ou6Oclr4q6MrsN7G5
         QB3JI4InchASbmxYjgUrrs+B1QvTBANCqyIFc+5bFKm7jPU+86pHBsYILBY6v8/6GhSP
         ZehxNKrH84r6p1TYLwx7vjzkP+by56EtxjcUR9EEvdoyMvdAr1a5+HF5R9OFpoxnKKCn
         VevZleRUpkZ1bY+aOaHvxyrtt20PO2GmqXsFHtZWZeyez9WPgJ6xN0RAmhbeBV5UmYuK
         kteQbfJrZsZf9QMs4O/QDTS9XtBKxv9w0fC5XFrxTY/6hM4IZ6K5ual0FCMXUnjoGk2q
         oHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mV6Bo6RnxoD+Wo+WZWXYj5Z/xntqPRjWRdQIckQx4+s=;
        b=lNTJLtD5CQVi4vCNUKhUJbWQBQiqWOBglvzli17Z8q1U/C4We7Rj8A4UhXR/DL37OD
         zkdSKp11X12cOpj1T9YXtswXCXQlQXpHo4V8h1B3D4vJP3hIjAcEqJBpWeeGWjdZ0NHy
         Gf9CKqrM+PkOtTMETJ553we5yFzgc27DoH3CCeKbYS6cUOdWcApi1BeZXEnFcXsmu0WQ
         R8R7sUPfap1CtVVwyG/rLkNl4aKc/lAb9zb7zSioV74S9iwdMZOzos9PdhRju6DKHZkB
         BUm4lMrOMlMJWAanZCCLRkLN3fj82qCBdHQfDPv/06nGB3YKSm6GYqaAOKYFrEDG/KNQ
         P8QA==
X-Gm-Message-State: AOAM532RcYV+LW3F+CK6mCKx+yl58HCtS6Afr6fBQi6Lad8rmlannncF
        MCGRpep7WQ1V2joPCeE7VrH1eOZneudt7g==
X-Google-Smtp-Source: ABdhPJxZBCHKwlIldrumbbeb3NS0Fy5oV5Jm1Q4nPb19wsm+4b4tguqLaJiglYZRuof4GpdxIi48gQ==
X-Received: by 2002:a05:6000:222:: with SMTP id l2mr24227009wrz.392.1610958715325;
        Mon, 18 Jan 2021 00:31:55 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id p15sm28555537wrt.15.2021.01.18.00.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 00:31:54 -0800 (PST)
Subject: Re: [PATCH v2 1/7] acpi: utils: move acpi_lpss_dep() to utils
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-2-djrscally@gmail.com>
 <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0ac56c5f-7a8b-5bab-13fc-300206d65d13@gmail.com>
Date:   Mon, 18 Jan 2021 08:31:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAU3msXszVZ8CLjs@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent

On 18/01/2021 07:24, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Jan 18, 2021 at 12:34:22AM +0000, Daniel Scally wrote:
>> I need to be able to identify devices which declare themselves to be
>> dependent on other devices through _DEP; add this function to utils.c
>> and export it to the rest of the ACPI layer.
>>
>> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v2:
>> 	- Introduced
>>
>>  drivers/acpi/acpi_lpss.c | 24 ------------------------
>>  drivers/acpi/internal.h  |  1 +
>>  drivers/acpi/utils.c     | 24 ++++++++++++++++++++++++
>>  3 files changed, 25 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
>> index be73974ce449..70c7d9a3f715 100644
>> --- a/drivers/acpi/acpi_lpss.c
>> +++ b/drivers/acpi/acpi_lpss.c
>> @@ -543,30 +543,6 @@ static struct device *acpi_lpss_find_device(const char *hid, const char *uid)
>>  	return bus_find_device(&pci_bus_type, NULL, &data, match_hid_uid);
>>  }
>>  
>> -static bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
>> -{
>> -	struct acpi_handle_list dep_devices;
>> -	acpi_status status;
>> -	int i;
>> -
>> -	if (!acpi_has_method(adev->handle, "_DEP"))
>> -		return false;
>> -
>> -	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
>> -					 &dep_devices);
>> -	if (ACPI_FAILURE(status)) {
>> -		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
>> -		return false;
>> -	}
>> -
>> -	for (i = 0; i < dep_devices.count; i++) {
>> -		if (dep_devices.handles[i] == handle)
>> -			return true;
>> -	}
>> -
>> -	return false;
>> -}
>> -
>>  static void acpi_lpss_link_consumer(struct device *dev1,
>>  				    const struct lpss_device_links *link)
>>  {
>> diff --git a/drivers/acpi/internal.h b/drivers/acpi/internal.h
>> index cb229e24c563..ee62c0973576 100644
>> --- a/drivers/acpi/internal.h
>> +++ b/drivers/acpi/internal.h
>> @@ -79,6 +79,7 @@ static inline void acpi_lpss_init(void) {}
>>  #endif
>>  
>>  void acpi_apd_init(void);
>> +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle);
> "lpss" stands for low power subsystem, an Intel device within the PCH
> that handles I2C, SPI, UART, ... I think the function should be renamed,
> as it's now generic. acpi_dev_has_dep() is a potential candidate, I'm
> sure better ones exist. A bit of kerneldoc would also not hurt.
Okedokey; I shall add kerneldoc and think of an appropriate name, plus
rename all the uses of it. How about acpi_dev_is_dep()? "has_dep" to me
implies anything at all in _DEP should return true.
>>  
>>  acpi_status acpi_hotplug_schedule(struct acpi_device *adev, u32 src);
>>  bool acpi_queue_hotplug_work(struct work_struct *work);
>> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
>> index ddca1550cce6..78b38775f18b 100644
>> --- a/drivers/acpi/utils.c
>> +++ b/drivers/acpi/utils.c
>> @@ -807,6 +807,30 @@ static int acpi_dev_match_cb(struct device *dev, const void *data)
>>  	return hrv == match->hrv;
>>  }
>>  
>> +bool acpi_lpss_dep(struct acpi_device *adev, acpi_handle handle)
>> +{
>> +	struct acpi_handle_list dep_devices;
>> +	acpi_status status;
>> +	int i;
>> +
>> +	if (!acpi_has_method(adev->handle, "_DEP"))
>> +		return false;
>> +
>> +	status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
>> +					 &dep_devices);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_dbg(&adev->dev, "Failed to evaluate _DEP.\n");
>> +		return false;
>> +	}
>> +
>> +	for (i = 0; i < dep_devices.count; i++) {
>> +		if (dep_devices.handles[i] == handle)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>  /**
>>   * acpi_dev_present - Detect that a given ACPI device is present
>>   * @hid: Hardware ID of the device.
