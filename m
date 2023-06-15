Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C221C732191
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jun 2023 23:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjFOVWc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jun 2023 17:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236242AbjFOVWb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jun 2023 17:22:31 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F4A2962
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 14:22:30 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f8d0d68530so25204315e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jun 2023 14:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686864148; x=1689456148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkgp/c0C5NoB3ePJZtL8tDZR4yngpfOV12ITnHQiuqg=;
        b=XQfBmBIcrWwPzC1aIzZ1qHuEBSIAoeio3RUVfevy9sLQ+AkbhqZxgMofzvEGAdQQgr
         c/peLs+YBjrOsYUhfFFb1NKqaPs4xWkmhmrHd8Hp7G4IBz7uvg5OesERq4W88LL8NwKy
         mTeEORAn52hKba2S3yp+2VMycYuys81UGK3fqaORqSfkx0WlPZ+34qSOORz40ciqby9Y
         wdDPwnAL8Mc9rnIWs3lqGJmPAtrz0hw6g77AJE9JMhETbNaJNEq+kBbhj4UUqZqbzE5K
         yX+86ZN6i8m3oakB+j2/5D5JrIkhoruZHpsWiaUpFximF0eNNLS5hytyuW+RzWoj6ZDz
         8ffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686864148; x=1689456148;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nkgp/c0C5NoB3ePJZtL8tDZR4yngpfOV12ITnHQiuqg=;
        b=SPX91aiS4XgfwC99r8kS9WjFFmtUV/ysSP+f7zZLsrgrepoYXaOvVkEgA+oA3kLlzu
         h88ROVsNYIMrZVYky5zjH9EZ3Hi+Bs/2RI6cxo10oVeannulietejU/G1anfan3BMCYn
         xBkbmcmdeOiqBzPuC/bmEK92RE3deKj/17PriPczk/76YsU/lVuaIPw2fJd0jOlQr4Lz
         maNGQU/u0O+3fRfX5vBFB6ikctic5US1GfOh+Lo5p4tXgHRXur+WZNsr1diCvf8NnpDH
         df6aTzGHCuXwspmtk0uelYPp563i1vof+/GhsxW+ua9vpyQB18f9GL7Z3jr2C1CYiLm7
         PsEg==
X-Gm-Message-State: AC+VfDyS3/hZXV/iBnZB2GUGXlwVLAsR9dxHxS09Zn1VoOHbUO6S5ugg
        v31hsJPSAd84KvkR7rLia68=
X-Google-Smtp-Source: ACHHUZ5eD268Do4HeGJuylfmC7IZ5Mgzn/BPimGUepSJgHWSqXx4E8saGLbcFjDQbJ7MLpwSkDaxeQ==
X-Received: by 2002:adf:f3d0:0:b0:311:1bd2:de6f with SMTP id g16-20020adff3d0000000b003111bd2de6fmr62744wrp.12.1686864148104;
        Thu, 15 Jun 2023 14:22:28 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6ec5:c500:ad06:edcc:b27e:b067? (dynamic-2a01-0c22-6ec5-c500-ad06-edcc-b27e-b067.c22.pool.telefonica.de. [2a01:c22:6ec5:c500:ad06:edcc:b27e:b067])
        by smtp.googlemail.com with ESMTPSA id e3-20020a056000194300b0030ae901bc54sm21967071wry.62.2023.06.15.14.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 14:22:27 -0700 (PDT)
Message-ID: <325e5dbd-13f2-51c4-f30f-e6bf2706c4c6@gmail.com>
Date:   Thu, 15 Jun 2023 23:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] i2c: i801: Replace acpi_lock with I2C bus lock
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <c39c8371-5ab5-45f7-d3cf-39ea50de0afb@gmail.com>
 <8f88906f-c7da-eb3a-2f14-0f4d46202517@gmail.com>
 <20230614223149.r375pmbbnhyte6jl@intel.intel>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230614223149.r375pmbbnhyte6jl@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15.06.2023 00:31, Andi Shyti wrote:
> Hi Heiner,
> 
> On Sat, Mar 04, 2023 at 10:33:05PM +0100, Heiner Kallweit wrote:
>> I2C core ensures in i2c_smbus_xfer() that the I2C bus lock is held when
>> calling the smbus_xfer callback. That's i801_access() in our case.
>> I think it's safe in general to assume that the I2C bus lock is held
>> when the smbus_xfer callback is called.
>> Therefore I see no need to define an own mutex.
> 
> I think it makes sense... unless I missed something I don't see
> anything else being racy in i801_access().
> 
> Have you checked i801_acpi_io_handler()?
> 
acpi_os_read_port() resolves to a simple inb() et al.
Therefore I don't see anything in i801_acpi_io_handler()
that would speak against using the I2C bus lock.

> Andi
> 
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
>> -- 
>> 2.39.2
>>
>>

