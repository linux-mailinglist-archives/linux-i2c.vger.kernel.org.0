Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17DB64F84A
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 09:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbiLQIks (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 03:40:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbiLQIkp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 03:40:45 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2696621AD
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:44 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so5561383wmb.2
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 00:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HOfUGsqT26zopCRPAzvwC7XygXVY/3a++s71BCQzio=;
        b=BWULXxnRpN5SvnDBXNXJSh5BCRyi4dEfGeYI4UCYgCBgBBfuOh+e8yuj0pnpIfQqf7
         FBajHYHAYqColpoAqgyva1M5vEY2OWeM7GqsJYpobGQybbuALEUQvFIxvNBHw3VUCaGK
         QDARyBhGzQDOZttMlu80ItLQIjaTQjVavKwVEWo6ZeiKE1jpaVXlJN+cqvTxukzCsg20
         2ggF7X6GKlEp+pFX0A/Q28WkT9KmUPyJsZLCn8pKWauyacvlMAb7JwSRUr+uP2GMkLUA
         r4Yk1psf+xg1ZwdxSeESA2VavaViZfvOhGt1TkOH/h2fNLD8PrIGv2MwQCbZ8JHsyLO5
         IbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HOfUGsqT26zopCRPAzvwC7XygXVY/3a++s71BCQzio=;
        b=Oj9wV55oaAG7/SDjXRTIYFJgI4foIW+Dyp0/BLXVR/upye8OF9qEtcAFfVTRzPhcCm
         QMuU2e+t+UZ/yeDnF8cNORsrtZrMKAaNmQ7a6Qq9U0udTRhQBXwmjl0pbWee1KenKadG
         7upnyU1cmdJTcnhGSc/h91wafZuv9jAGyPC4sw7+aWmQno7umpL4vf1lAlEl2aKt9fSO
         3wPiTkNM5XYAE0JW7d3//ltH/V2wl4aWQ2sNfQDfSVeQANeGw2zpcicNRDnVrrn8YOte
         SnyP1EC2wLg+VXE4xN1iaSTkd6+QXi9+dtbMhEHlghzeCcgtHbJmV63zSYQKBhtc7XaM
         aDtw==
X-Gm-Message-State: ANoB5pn3Y94aTYOATWZ2V9wwpaIzMnhXnAoIM2eQevdKbGVeXlYEC53a
        GESnyk0e0Km7IonMzKihqToFoTB5zCY=
X-Google-Smtp-Source: AA0mqf4Rdx1LB8L0TUuaiLi/YgYe9WvGoyVMZoV9XAq1BIzYo6yzT07fKOg6dWVszBYcge8jO7LQ+Q==
X-Received: by 2002:a1c:7303:0:b0:3cf:a258:971 with SMTP id d3-20020a1c7303000000b003cfa2580971mr37544247wmb.41.1671266442455;
        Sat, 17 Dec 2022 00:40:42 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id o3-20020a05600c4fc300b003cfbbd54178sm24538660wmq.2.2022.12.17.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 00:40:42 -0800 (PST)
Message-ID: <cc9b2a1c-1233-d3d3-cdec-f125b0d68cf8@gmail.com>
Date:   Fri, 16 Dec 2022 22:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/8] i2c: i801: add helper i801_set_hstadd()
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <e07379b5-609c-fd2b-3e66-f79c984c3a55@gmail.com>
 <20220609155326.30147f58@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20220609155326.30147f58@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09.06.2022 15:53, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 15 Apr 2022 18:57:21 +0200, Heiner Kallweit wrote:
>> Factor out setting SMBHSTADD to a helper. The current code makes the
>> assumption that constant I2C_SMBUS_READ has bit 0 set, that's not ideal.
> 
> This isn't an "assumption". The values of I2C_SMBUS_WRITE and
> I2C_SMBUS_READ were chosen to match the bit position and values in the
> I2C protocol. Maybe it should have been made clearer by defining them
> as hexadecimal values instead of decimal values. Nevertheless, I find
> it unfortunate to not use this fact to optimize the code, see below.
> 
>> Therefore let the new helper explicitly check for I2C_SMBUS_READ.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 41 ++++++++++++++++++-----------------
>>  1 file changed, 21 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index a9737f14d..bf77f8640 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -771,6 +771,14 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>>  	return result;
>>  }
>>  
>> +static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
>> +{
>> +	addr <<= 1;
>> +	if (read_write == I2C_SMBUS_READ)
>> +		addr |= 0x01;
>> +	outb_p(addr, SMBHSTADD(priv));
> 
> This can be written:
> 
> 	outb_p((addr << 1) | read_write, SMBHSTADD(priv));
> 
> Net result -48 bytes of (x86_64) binary code. That's basically what the
> original code was doing, minus the useless masking.
> 
OK

>> +}
>> +
>>  /* Return negative errno on error. */
>>  static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		       unsigned short flags, char read_write, u8 command,
>> @@ -795,28 +803,24 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  
>>  	switch (size) {
>>  	case I2C_SMBUS_QUICK:
>> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
>> -		       SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, read_write);
>>  		xact = I801_QUICK;
>>  		break;
>>  	case I2C_SMBUS_BYTE:
>> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
>> -		       SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, read_write);
>>  		if (read_write == I2C_SMBUS_WRITE)
>>  			outb_p(command, SMBHSTCMD(priv));
>>  		xact = I801_BYTE;
>>  		break;
>>  	case I2C_SMBUS_BYTE_DATA:
>> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
>> -		       SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, read_write);
>>  		outb_p(command, SMBHSTCMD(priv));
>>  		if (read_write == I2C_SMBUS_WRITE)
>>  			outb_p(data->byte, SMBHSTDAT0(priv));
>>  		xact = I801_BYTE_DATA;
>>  		break;
>>  	case I2C_SMBUS_WORD_DATA:
>> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
>> -		       SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, read_write);
>>  		outb_p(command, SMBHSTCMD(priv));
>>  		if (read_write == I2C_SMBUS_WRITE) {
>>  			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>> @@ -825,7 +829,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		xact = I801_WORD_DATA;
>>  		break;
>>  	case I2C_SMBUS_PROC_CALL:
>> -		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>>  		outb_p(command, SMBHSTCMD(priv));
>>  		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>>  		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>> @@ -833,8 +837,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		read_write = I2C_SMBUS_READ;
>>  		break;
>>  	case I2C_SMBUS_BLOCK_DATA:
>> -		outb_p(((addr & 0x7f) << 1) | (read_write & 0x01),
>> -		       SMBHSTADD(priv));
>> +		i801_set_hstadd(priv, addr, read_write);
>>  		outb_p(command, SMBHSTCMD(priv));
>>  		block = 1;
>>  		break;
>> @@ -845,10 +848,11 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		 * However if SPD Write Disable is set (Lynx Point and later),
>>  		 * the read will fail if we don't set the R/#W bit.
>>  		 */
>> -		outb_p(((addr & 0x7f) << 1) |
>> -		       ((priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
>> -			(read_write & 0x01) : 0),
>> -		       SMBHSTADD(priv));
>> +		if (priv->original_hstcfg & SMBHSTCFG_SPD_WD)
>> +			i801_set_hstadd(priv, addr, read_write);
>> +		else
>> +			i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
> 
> Preserving the use of the ternary operator makes the generated binary
> smaller once again:
> 
> 		i801_set_hstadd(priv, addr,
> 				(priv->original_hstcfg & SMBHSTCFG_SPD_WD) ?
> 				read_write : I2C_SMBUS_WRITE);
> 
> Net result -11 bytes of (x86_64) binary code.
> 
OK

>> +
>>  		if (read_write == I2C_SMBUS_READ) {
>>  			/* NB: page 240 of ICH5 datasheet also shows
>>  			 * that DATA1 is the cmd field when reading */
>> @@ -858,11 +862,8 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		block = 1;
>>  		break;
>>  	case I2C_SMBUS_BLOCK_PROC_CALL:
>> -		/*
>> -		 * Bit 0 of the slave address register always indicate a write
>> -		 * command.
>> -		 */
>> -		outb_p((addr & 0x7f) << 1, SMBHSTADD(priv));
>> +		/* Needs to be flagged as write transaction */
>> +		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>>  		outb_p(command, SMBHSTCMD(priv));
>>  		block = 1;
>>  		break;
> 
> 

