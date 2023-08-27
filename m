Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD44A78A029
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 18:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjH0QWA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 12:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjH0QVu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 12:21:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D805CFE
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 09:21:46 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so3330404a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 27 Aug 2023 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693153305; x=1693758105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kYabs9vUGaQTJJt3ZxESUsK/gDXfMSAFcFY8xzFlPM=;
        b=IsC+KF0SvHD5bim+PhwQSfTd2/kLNUYnQmUliNenioQlAD/jleLuvsrp5enKu59mC6
         Q5tkH3l0wG2WkPOEidMUdZmk7cNjuNuJB+Tp2O3I70XVWKhiOGLEMf9DD5PfqFjQlmUv
         HKBw8M4QLpFrapX4YI/gDqmjRyFikuJOH8d5kifGA+MtT57sN6k6TjDnjSa+wKDs3UMS
         AZ4i862+XXudw5GtnR8y9X8gWpskxJ/0GR2C4ITlvW8KsgZFxufGic/5dh4ziag6134I
         YoR+uAdp1Qwe/orwvLy0+45UPY2/0auoG9CXywjcZA2KTSDbkA5QH6Cw3rTwxZaqpQjJ
         WVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693153305; x=1693758105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1kYabs9vUGaQTJJt3ZxESUsK/gDXfMSAFcFY8xzFlPM=;
        b=gerVSs0iHgMMnMYhZl4G5c7G3wiZYI9kFi7mhJthSGobocKhBP7X46W1ah/UyWO7Uy
         1PsgvrijUUz3n5TjdRkonc9cEM93xxzqcOvGeNHkQtixR/WwZtPNjDvPSy5Tk5ja3/GQ
         gmli0Ps1cN6WJWUcrayazlky9rVFgNf+n31zC8cZRE4DSJXxwSV/nGOAratNJhN6ZCTZ
         Qyz1KMJfopOGrfdTRFlZa1uffGvkTjI0j+ShGjo+1OKXaito8pFDTMrMYhTXKaxzZXBk
         dlQFU7+XvLlwdNAJ0UD25F8JYtff4E1Gk2Xy1/z0cmS/fQbd5CwWP/yDevMRsxmyflUk
         QRZg==
X-Gm-Message-State: AOJu0YwymPQOyJnaCv0gTCkubAHt7NdpY5hELJspKN9oTNzJ3u9rmLO4
        TdlTGfgTDnTDhkpWEBll1R0WZcjbc6c=
X-Google-Smtp-Source: AGHT+IFKI3FQdQicw5zfhdBfalKnAZLOqHXlOWCJ1xiebHM+zTLIkmfsJQn4YuXAnLiNYdWAhT/0ng==
X-Received: by 2002:a05:6402:18b:b0:51e:53eb:88a3 with SMTP id r11-20020a056402018b00b0051e53eb88a3mr17801818edv.25.1693153305289;
        Sun, 27 Aug 2023 09:21:45 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9? (dynamic-2a01-0c23-c0a4-3400-90f1-4994-ce26-fdf9.c23.pool.telefonica.de. [2a01:c23:c0a4:3400:90f1:4994:ce26:fdf9])
        by smtp.googlemail.com with ESMTPSA id e10-20020aa7d7ca000000b005256994e335sm3471728eds.92.2023.08.27.09.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 09:21:44 -0700 (PDT)
Message-ID: <e31596a9-2753-8528-9fed-5fb17de1d138@gmail.com>
Date:   Sun, 27 Aug 2023 18:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
 <20230626195951.1695cda6@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230626195951.1695cda6@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26.06.2023 19:59, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sat, 04 Mar 2023 22:33:05 +0100, Heiner Kallweit wrote:
>> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
>> calling the smbus_xfer callback. That's i801_access() in our case.
>> I think it's safe in general to assume that the I2C bus lock is held
>> when the smbus_xfer callback is called.
>> Therefore I see no need to define an own mutex.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 14 ++++----------
>>  1 file changed, 4 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index d6a0c3b53..7641bd0ac 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -289,10 +289,9 @@ struct i801_priv {
>>  
>>  	/*
>>  	 * If set to true the host controller registers are reserved for
>> -	 * ACPI AML use. Protected by acpi_lock.
>> +	 * ACPI AML use.
>>  	 */
>>  	bool acpi_reserved;
>> -	struct mutex acpi_lock;
>>  };
>>  
>>  #define FEATURE_SMBUS_PEC	BIT(0)
>> @@ -871,11 +870,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  	int hwpec, ret;
>>  	struct i801_priv *priv = i2c_get_adapdata(adap);
>>  
>> -	mutex_lock(&priv->acpi_lock);
>> -	if (priv->acpi_reserved) {
>> -		mutex_unlock(&priv->acpi_lock);
>> +	if (priv->acpi_reserved)
>>  		return -EBUSY;
>> -	}
>>  
>>  	pm_runtime_get_sync(&priv->pci_dev->dev);
>>  
>> @@ -916,7 +912,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  
>>  	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
>>  	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
>> -	mutex_unlock(&priv->acpi_lock);
>>  	return ret;
>>  }
>>  
>> @@ -1566,7 +1561,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>>  	 * further access from the driver itself. This device is now owned
>>  	 * by the system firmware.
>>  	 */
>> -	mutex_lock(&priv->acpi_lock);
>> +	i2c_lock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>>  
>>  	if (!priv->acpi_reserved && i801_acpi_is_smbus_ioport(priv, address)) {
>>  		priv->acpi_reserved = true;
>> @@ -1586,7 +1581,7 @@ i801_acpi_io_handler(u32 function, acpi_physical_address address, u32 bits,
>>  	else
>>  		status = acpi_os_write_port(address, (u32)*value, bits);
>>  
>> -	mutex_unlock(&priv->acpi_lock);
>> +	i2c_unlock_bus(&priv->adapter, I2C_LOCK_SEGMENT);
>>  
>>  	return status;
>>  }
>> @@ -1640,7 +1635,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  	priv->adapter.dev.parent = &dev->dev;
>>  	ACPI_COMPANION_SET(&priv->adapter.dev, ACPI_COMPANION(&dev->dev));
>>  	priv->adapter.retries = 3;
>> -	mutex_init(&priv->acpi_lock);
>>  
>>  	priv->pci_dev = dev;
>>  	priv->features = id->driver_data;
> 
> Looks reasonable, I also can't see any reason why that wouldn't work.
> But locking and power management can be tricky of course. I'll test
> this for some time, but I don't think my system actually suffers from
> this ACPI resource conflict, so this most probably won't be testing
> much in practice.
> 
What's your opinion after more testing?

> Thanks,

