Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0704778FD6C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 14:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjIAMlp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjIAMlo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 08:41:44 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6DB107
        for <linux-i2c@vger.kernel.org>; Fri,  1 Sep 2023 05:41:41 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c1f6f3884so232752566b.0
        for <linux-i2c@vger.kernel.org>; Fri, 01 Sep 2023 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693572100; x=1694176900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfTud3HjdfQCeOpewc8o5fZASeZHh215NP4ze+79O1Y=;
        b=n0ik4fJRaueLp8ePLfC4UONXubPg1nyYHao4D/sllcJ9zBitmqhfkI2St/YQ8C1pBI
         cXrRD99YNu2jUrL8vH8c+Qmuuzal7Rtjv05/eXQBruJ1Q0eQQoRwf5drehzXEdpmbH6w
         pCqRhRbbr+La7oq3Owv8/E7+yZagK53mOvnpbF9G/VfYI1YWFzK820z5zw/Q7l06RGtB
         GhZD/cPwOJhMsARaYNCYDorocaASoGHL+IFrQpfkalFAzQIbu9PzlOJNw8WTXgrRY7YY
         lnFmCTM6L3E8+d1hFhHoO2tgpuIZLTIELhVko8o802eDXYos9N3PhvWVORFndR4rwtpz
         VFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693572100; x=1694176900;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfTud3HjdfQCeOpewc8o5fZASeZHh215NP4ze+79O1Y=;
        b=EsMnJA04g41Y0X3IV8glW36OzkRc5zVXTfedSW4Dpi42TVEG5Hhc94TEViQYQtZNsb
         GQT4tH4oo0HgtIeUhTVdttl8DZ3gT3dc9glmRA0mykeYKS1fDnECWQJfU5o76/3gcQcd
         PAtKu/TR1YlbU2CwbroOGNUok1FzdC5WgIEP/fkyJNw1BuNhCTX0IdrfRlXozPah9Uf5
         F7/vP7JQbiubqojCTxbyZPft+0CroyCPQvsXGy0m4lmqj6mGHFwKBRrGH98eW6Hb/zN2
         +7Y8YFLemcU+lsnnp+fe+3NE2E0uHScx2JcmTZualbpGnG+FGwr8UFLsOlbIMVjdQs4V
         fTjQ==
X-Gm-Message-State: AOJu0YxW4RCtedpIfmZeRv9w/3DPgjwe1NjNx75CrswANuNak9wrwsMg
        ZbeWuhPXFsmPAB679d5zujQ=
X-Google-Smtp-Source: AGHT+IFMOEimwbFPH63s95ElioIlYXzx2Hw5bshnTsOawbe4/QjxfsKrC/QAlSVJ0yXvFxWdMGZAOQ==
X-Received: by 2002:a17:907:7793:b0:9a1:f026:b4f1 with SMTP id ky19-20020a170907779300b009a1f026b4f1mr1802592ejc.30.1693572099853;
        Fri, 01 Sep 2023 05:41:39 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72e7:e700:f12a:7a78:6447:9c5c? (dynamic-2a01-0c22-72e7-e700-f12a-7a78-6447-9c5c.c22.pool.telefonica.de. [2a01:c22:72e7:e700:f12a:7a78:6447:9c5c])
        by smtp.googlemail.com with ESMTPSA id s13-20020a1709064d8d00b0099bca8b9a31sm1920395eju.100.2023.09.01.05.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 05:41:39 -0700 (PDT)
Message-ID: <dd6c9ddd-da76-ae6d-5903-e945cf950969@gmail.com>
Date:   Fri, 1 Sep 2023 14:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <07386d35-0f9f-bcd7-185c-d8eed60fc794@gmail.com>
 <20230901141929.640fc5d5@endymion.delvare>
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] i2c: i801: fix cleanup code in remove() and error path of
 probe()
In-Reply-To: <20230901141929.640fc5d5@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01.09.2023 14:19, Jean Delvare wrote:
> Hi Heiner,
> 
> On Sun, 27 Aug 2023 22:26:05 +0200, Heiner Kallweit wrote:
>> Jean pointed out that the referenced patch resulted in the remove()
>> path not having the reverse order of calls in probe(). I think there's
>> more to be done to ensure proper cleanup.
>> Especially cleanup in the probe() error path has to be extended.
>> Not every step there may be strictly needed, but it's in line with
>> remove() now.
>>
>> Fixes: 9b5bf5878138 ("i2c: i801: Restore INTREN on unload")
> 
> I think it also fixes 9424693035a5 ("i2c: i801: Create iTCO device on
> newer Intel PCHs").
> 

Right. We should add this, even though this fix won't apply cleanly
on some older kernel versions. I think we'll need separate patches for these
LTS kernel versions.

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 73ae06432..7a0ccc584 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1754,6 +1754,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>  		"SMBus I801 adapter at %04lx", priv->smba);
>>  	err = i2c_add_adapter(&priv->adapter);
>>  	if (err) {
>> +		platform_device_unregister(priv->tco_pdev);
>> +		outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
> 
> Doesn't seem to be needed, as I can't see SMBHSTCNT being written to
> during probe?
> 
Right, this is what I was referring to in the commit message when saying
"not every step may be strictly needed". Restoring SMBHSTCNT isn't needed
here, but it makes cleanup in the probe error path the same as in remove
and therefore may improve readability and maintainability.
But I don't insist on it and don't have a strong opinion.

>> +		pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>>  		i801_acpi_remove(priv);
>>  		return err;
>>  	}
>> @@ -1779,14 +1782,13 @@ static void i801_remove(struct pci_dev *dev)
>>  {
>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>  
>> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>> -	i801_disable_host_notify(priv);
>>  	i801_del_mux(priv);
>> +	i801_disable_host_notify(priv);
>>  	i2c_del_adapter(&priv->adapter);
>> -	i801_acpi_remove(priv);
>> -	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>> -
>>  	platform_device_unregister(priv->tco_pdev);
>> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>> +	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>> +	i801_acpi_remove(priv);
>>  
>>  	/* if acpi_reserved is set then usage_count is incremented already */
>>  	if (!priv->acpi_reserved)
>> @@ -1803,8 +1805,8 @@ static void i801_shutdown(struct pci_dev *dev)
>>  	struct i801_priv *priv = pci_get_drvdata(dev);
>>  
>>  	/* Restore config registers to avoid hard hang on some systems */
>> -	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>  	i801_disable_host_notify(priv);
>> +	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
>>  	pci_write_config_byte(dev, SMBHSTCFG, priv->original_hstcfg);
>>  }
>>  
> 
> Rest looks OK, I'll give it some testing 
> 

