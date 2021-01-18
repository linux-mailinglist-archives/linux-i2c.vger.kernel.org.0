Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112002F9B63
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 09:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbhARIht (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 03:37:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387625AbhARIhr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 03:37:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66ECC061573;
        Mon, 18 Jan 2021 00:37:05 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id m4so15551627wrx.9;
        Mon, 18 Jan 2021 00:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EPGt2LdeWKNoxp4HiESLIo6zkVMjNGJnODUmFuPMvD8=;
        b=HIKFFiUU89yug/JGQvS2Ch6GbAhJ27lxMtH3JssCEdEQolOx1j34vPZqvzZflk2t1p
         of41qn1t3ml0ZsB7WVAXOD6wsZGpEJNhnF9bWkD4N+E552CjOJyhNOccwxeXIj91kc+b
         bxHQ6rlW1mipkCOeAUfNOvbtr2ksU88lQBXKp/TcGsaMzaWZbq49p+4AzBUR1kBXR33Z
         hmCAxuBF0I1AW7+KeVvdWUBoI93YceLdm6FergzphkxZmR+ktHCNx6C31FJWhjJ3jPRd
         luw67GiYgXAIXiV3HVLO7DMRq5f3Ml6uK8rB7zyrq7eOSq+qMAKWXWqJ+5V48B4NBo8u
         B+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EPGt2LdeWKNoxp4HiESLIo6zkVMjNGJnODUmFuPMvD8=;
        b=KKpssU3swpqR2PfkakAyg2Qipz0FZjHARIX4ZnueuTcCCsrLOOVar3VITGE/mpm0lR
         rSAHDMKxkc3vbbe1/QdI+TGnxpGjGA8z9JKwNZ008Y7nMwK2IE9YYdn0i47clGz2nryc
         WIrPIMm1v4BP775jqJklbppW44OhOesdqYU3MxID2Lg141Bqj9KrNEWPp8Ow9Iyd+rKg
         okhYnL8PK7ZTsjzcC0yQKMZMq8tiTvmkPXgcOPdcIlpjdVIxq82WraS/OziYI4ViSn+C
         axp5ziIniG091M1rTfQwhG5jncObtflh+oCPp/12reDwMyyyGEFWTkuWja6hxmCigEnj
         +2mg==
X-Gm-Message-State: AOAM532RaT+a585NDAWmzEH7WTkhrN90wpHz4Mg6cA+42VUkBw2ysz6Q
        v+om/q1rfihn7HByujlqHiA=
X-Google-Smtp-Source: ABdhPJzwNgrByt4nkVH6cuaJPULjSs1BL4589sGjxb8qvEDE4pmaI0rK5+k7j0C/M2YQTyDPsDaYQg==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr17046086wrs.227.1610959024633;
        Mon, 18 Jan 2021 00:37:04 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id r13sm28143868wrt.10.2021.01.18.00.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 00:37:04 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
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
 <20210118003428.568892-3-djrscally@gmail.com>
 <YAU57AEmtBHuz6T8@pendragon.ideasonboard.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <1a0e6c92-d577-354a-cedb-79201d75a169@gmail.com>
Date:   Mon, 18 Jan 2021 08:37:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAU57AEmtBHuz6T8@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Morning Laurent

On 18/01/2021 07:34, Laurent Pinchart wrote:
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Jan 18, 2021 at 12:34:23AM +0000, Daniel Scally wrote:
>> In some ACPI tables we encounter, devices use the _DEP method to assert
>> a dependence on other ACPI devices as opposed to the OpRegions that the
>> specification intends. We need to be able to find those devices "from"
>> the dependee, so add a function to parse all ACPI Devices and check if
>> the include the handle of the dependee device in their _DEP buffer.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes in v2:
>> 	- Used acpi_lpss_dep() as Andy suggested.
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
>>  	return false;
>>  }
>>  
>> +static int acpi_dev_match_by_dep(struct device *dev, const void *data)
>> +{
>> +	struct acpi_device *adev = to_acpi_device(dev);
>> +	const struct acpi_device *dependee = data;
>> +	acpi_handle handle = dependee->handle;
>> +
>> +	if (acpi_lpss_dep(adev, handle))
>> +		return 1;
>> +
>> +	return 0;
>> +}
>> +
> I think I'd move this just before acpi_dev_get_next_dep_dev() to keep
> the two together.


Will do

>
>>  /**
>>   * acpi_dev_present - Detect that a given ACPI device is present
>>   * @hid: Hardware ID of the device.
>> @@ -866,6 +878,28 @@ bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
>>  }
>>  EXPORT_SYMBOL(acpi_dev_present);
>>  
>> +/**
>> + * acpi_dev_get_next_dep_dev - Return next ACPI device dependent on input dev
> Maybe acpi_dev_get_next_dependent_dev() ? "dep" could mean either
> dependent or dependency.


Yes, good point, I agree.

>
>> + * @adev: Pointer to the dependee device
>> + * @prev: Pointer to the previous dependent device (or NULL for first match)
>> + *
>> + * Return the next ACPI device which declares itself dependent on @adev in
>> + * the _DEP buffer.
>> + *
>> + * The caller is responsible to call put_device() on the returned device.
>> + */
>> +struct acpi_device *acpi_dev_get_next_dep_dev(struct acpi_device *adev,
>> +					      struct acpi_device *prev)
>> +{
>> +	struct device *start = prev ? &prev->dev : NULL;
>> +	struct device *dev;
>> +
>> +	dev = bus_find_device(&acpi_bus_type, start, adev, acpi_dev_match_by_dep);
> Having to loop over all ACPI devices is quite inefficient, but if we
> need a reverse lookup, we don't really have a choice. We could create a
> reverse map, but I don't think it's worth it.
>
>> +
>> +	return dev ? to_acpi_device(dev) : NULL;
>> +}
>> +EXPORT_SYMBOL(acpi_dev_get_next_dep_dev);
> I would have used EXPORT_SYMBOL_GPL. I'm not sure what the policy is in
> the ACPI subsystem, and it's also a personal choice.
EXPORT_SYMBOL_GPL would be my usual choice, but the other functions in
the file all use EXPORT_SYMBOL, so I assumed there was some policy that
that be used (since basically everywhere else I've touched in the kernel
so far defaults to the GPL version)
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

>
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
