Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B33E260C7E6
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Oct 2022 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiJYJW4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Oct 2022 05:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiJYJWU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Oct 2022 05:22:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29507153E24;
        Tue, 25 Oct 2022 02:17:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p8so20795619lfu.11;
        Tue, 25 Oct 2022 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naCfwmdlp7g6rDHlSA0owQkvXaWiCJfBnagPYXKFWZM=;
        b=JM2OP5dGKIoiPhpueJ7F5ZsAsTc/rM8qP0R5v6wi9jBJ0uuGKHVPYev2WBpNZTqs/M
         v5ItfZId/adPWS1BHNZTfXgMQOpljLINXWG/16+1X013jMD0FuKn/bOGa+/0N4GDQjR3
         MM3pB1EE693Blj2Ot0wqKv4szWBzv4HISqfnAKJbN3A3UP3QUDcKQB8oHPeFgDQQdaGO
         qtGMTXBPXxkEWAilPGZbprYep5E0L3sE0d6CwWQcSoVHoGDZZuwIkuZE0K5ulkUKC7va
         fAh2/foa9UHK8Pn0NS1BKXnXTouhfBH5HSkGhLURzRDrdF+GLWgkOh8mWWCx6ailbf1V
         9LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naCfwmdlp7g6rDHlSA0owQkvXaWiCJfBnagPYXKFWZM=;
        b=DUncOnJdM2kBAlqGU7JBiNzTPgVA5r+cqW+LBnGYgDalemz0+FipUghjGeMErJ82Ea
         6Qn1G3P1ccSB6cZz/ccBiaGk76xgLVsd75T0QehKoYlH1gx6DQxZh4DtOXvk5A2kF4fv
         YN42ZBmlTZ4SdjMQu0S3y8JUTG77MCSK0b/ah3Ox9n/0yqZ16oq/ZH87UJUuCiuTxKex
         PmMPsU1wFsQOgrEqtuABoQcgOTnPfq5gbuJyEGxl36x9vftCR2ZbUWHzlzs6leMW+v43
         zHjfUmFW2aYXcUwgLvXEMuhh2MyKt5HaZEvuP6iS7qczt2T87t5vVqVcct/VxMjjrmTW
         S4XA==
X-Gm-Message-State: ACrzQf00WNXnrbUE/utVmrFphZyYLXEMU8onTVc/YX8qSj+mQOY1C0MK
        ZtwgDuoby+7J251k6hgLH7M=
X-Google-Smtp-Source: AMsMyM5giO+B6//8TDx6oFx9rk2nhTmLTFtdmNX9iyZilZLKWQgM+5CiC2cRTTK66CJk0EwYZ/qyJg==
X-Received: by 2002:a05:6512:2a92:b0:4a1:d2c9:c2d0 with SMTP id dt18-20020a0565122a9200b004a1d2c9c2d0mr13815425lfb.278.1666689459955;
        Tue, 25 Oct 2022 02:17:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16f3:4a00::2? (dc75zzyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::2])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b004a9c6f7a776sm339464lfs.49.2022.10.25.02.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 02:17:39 -0700 (PDT)
Message-ID: <57dd517f-f3c9-5818-780b-c3a8d4c29d5a@gmail.com>
Date:   Tue, 25 Oct 2022 12:17:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] drivers: fwnode: fix fwnode_irq_get_byname()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1666687086.git.mazziesaccount@gmail.com>
 <cc853a7e4b3533585e3641620bf4972663f22edc.1666687086.git.mazziesaccount@gmail.com>
 <Y1ennbK6WSHT27Am@paasikivi.fi.intel.com>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Y1ennbK6WSHT27Am@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Moro Sakari,

Thanks for the review (and the suggestion)!

On 10/25/22 12:08, Sakari Ailus wrote:
> Moi,
> 
> On Tue, Oct 25, 2022 at 11:50:59AM +0300, Matti Vaittinen wrote:
>> The fwnode_irq_get_byname() does return 0 upon device-tree IRQ mapping
>> failure. This is contradicting the function documentation and can
>> potentially be a source of errors like:
>>
>> int probe(...) {
>> 	...
>>
>> 	irq = fwnode_irq_get_byname();
>> 	if (irq <= 0)
>> 		return irq;
>>
>> 	...
>> }
>>
>> Here we do correctly check the return value from fwnode_irq_get_byname()
>> but the driver probe will now return success. (There was already one
>> such user in-tree).
>>
>> Change the fwnode_irq_get_byname() to work as documented and according to
>> the common convention and abd always return a negative errno upon failure.
>>
>> Fixes: ca0acb511c21 ("device property: Add fwnode_irq_get_byname")
>> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>>
>> I did a quick audit for the callers at v6.1-rc2:
>> drivers/i2c/i2c-smbus.c
>> drivers/iio/accel/adxl355_core.c
>> drivers/iio/gyro/fxas21002c_core.c
>> drivers/iio/imu/adis16480.c
>> drivers/iio/imu/bmi160/bmi160_core.c
>> drivers/iio/imu/bmi160/bmi160_core.c
>>
>> I did not spot any errors to be caused by this change. There will be a
> 
> It won't as you're decreasing the possible values the function may
> return...
> 

Unless someone had implemented special handling for the IRQ mapping 
failure...

>> functional change in i2c-smbus.c as the probe will now return -EINVAL
>> should the IRQ dt-mapping fail. It'd be nice if this was checked to be
>> Ok by the peeps knowing the i2c-smbus :)
> 
> FWIW, for both patches (but see below):
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
>> ---
>>   drivers/base/property.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/property.c b/drivers/base/property.c
>> index 4d6278a84868..bfc6c7286db2 100644
>> --- a/drivers/base/property.c
>> +++ b/drivers/base/property.c
>> @@ -964,7 +964,7 @@ EXPORT_SYMBOL(fwnode_irq_get);
>>    */
>>   int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>>   {
>> -	int index;
>> +	int index, ret;
>>   
>>   	if (!name)
>>   		return -EINVAL;
>> @@ -973,7 +973,12 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>>   	if (index < 0)
>>   		return index;
>>   
>> -	return fwnode_irq_get(fwnode, index);
>> +	ret = fwnode_irq_get(fwnode, index);
>> +
> 
> This newline is extra.
> 
> Or:
> 
> 	return ret ?: -EINVAL;
> 
> Or even:
> 
> 	return fwnode_irq_get(fwnode, index) ?: -EINVAL;
> 
> Up to you.
> 

My personal preference is to not use the ternary. I think the plain 
clarity of if() just in many places justifies burning couple of lines 
more :)

Yours
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

