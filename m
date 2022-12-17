Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8BA64FB34
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 18:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiLQRWG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 12:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLQRWF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 12:22:05 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6713BEE2E
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 09:22:03 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg10so3849565wmb.1
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 09:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfasWIS4q6GvWx5f6Sq+YcT8Re6vVzqiuwp9qDtmjhI=;
        b=ljTtWNlRSoWIfLnqb8dnyR0sU+f3nJ0yJSfZmbJQdCMofqRSFgxgPuRFHIPMPc9SK3
         ODqlFsB1eMz/AsT1kaVZ2TBcUVbyuthA+jTQV22NFh3K0fCBttqfVlT/vkBqkawMQ7YE
         P5ci884b5e4hyxN18ZPT1D2mNiRZPBlZXEFH4oilVQkxU4cGzzxtz+Uqm9jGdRZ2K43s
         w/R9Z+EpT834am2FZzcIg9pqkYIDjkxILZ0iJDURMLSUVZZPsBR0XxALJuDoHiD42S4T
         rYUWt17H/3k3sE4eibaybFj/SskRecT+mPWlK8i8mSkVSiY1MmOhQNrirTYODp9XZGez
         Yrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfasWIS4q6GvWx5f6Sq+YcT8Re6vVzqiuwp9qDtmjhI=;
        b=OQ9c56AJJW9wePM5d5ekXL4C1ev/E+MPBfgYp0NPNjwH57xc2vozMQURPQMbAWg0AE
         t/2PPgKBiI1YRt3rL3tEkcnIpxUd1ScAPxgpcrhu16FjJASHcdb1T/1OO5R2UGcYMare
         hljIYqdv/Tfc4f+/sR8VOe9p2pgk4JfXDC2XQ3SaWyDGvqchrS16W3iHs79KwDGwSarc
         gsuDimwzuNKQzX2xMSbUQTcPFecvLuwcw5jk/ZZlhCf4i5fNBu2oUPLiDGa5eik+Mc6p
         j4E8C2qpnH5w869z+gCVDCMnxQ9Ovq3BvMn1H92bH7Te7QEdWzeYQ/rDnVMQIBSEEaYd
         Mo1A==
X-Gm-Message-State: ANoB5pkoC7kuC0AJM4/UioTr/am2OLmuO4dmaUNJrOiTtzbcQiBGxICM
        1XcfJrzxndqfItYMhtzWhpkSLDOEUrA=
X-Google-Smtp-Source: AA0mqf5fS74HM36fznhBUWkyNLnyLejsJxy2ZGI2VH5xI/jua85z7DLBCoU0iUcxmbo2JD+ugdJ8cg==
X-Received: by 2002:a05:600c:1c23:b0:3d2:2f48:9443 with SMTP id j35-20020a05600c1c2300b003d22f489443mr15190415wms.15.1671297721805;
        Sat, 17 Dec 2022 09:22:01 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:5300:8868:b389:215f:d1? (dynamic-2a01-0c22-7af7-5300-8868-b389-215f-00d1.c22.pool.telefonica.de. [2a01:c22:7af7:5300:8868:b389:215f:d1])
        by smtp.googlemail.com with ESMTPSA id f24-20020a1c6a18000000b003b95ed78275sm6355101wmc.20.2022.12.17.09.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 09:22:01 -0800 (PST)
Message-ID: <fc2988f8-fe75-d1bc-75b0-6f7014fbd074@gmail.com>
Date:   Sat, 17 Dec 2022 18:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH 6/8] i2c: i801: add i801_single_transaction(),
 complementing i801_block_transaction()
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <4125f9ce-ce5f-fbcf-7d6f-9bc586ac43e0@gmail.com>
 <eba39e4d-fb5f-c9d3-0d51-001f8d584d51@gmail.com>
 <20220610130324.1ab2725d@endymion.delvare>
Content-Language: en-US
In-Reply-To: <20220610130324.1ab2725d@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10.06.2022 13:03, Jean Delvare wrote:
> Hi Heiner,
> 
> On Fri, 15 Apr 2022 18:58:03 +0200, Heiner Kallweit wrote:
>> This patch factors out non-block pre/post processing to a new function
>> i801_single_transaction(), complementing existing function
>> i801_block_transaction(). This makes i801_access() better readable.
> 
> I like the idea, but I have objections about some implementation
> details, see below.
> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 95 +++++++++++++++++++++--------------
>>  1 file changed, 58 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index bf77f8640..8c2245f38 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -771,6 +771,62 @@ static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *
>>  	return result;
>>  }
>>  
>> +/* Single transaction function */
> 
> The term "single transaction" is a bit misleading. Block transactions
> are also single transactions, in the sense that there's one start
> condition at the beginning and one stop condition at the end. I'd
> rather call non-block transactions "single value transactions" or
> "simple transactions".
> 
OK

>> +static int i801_single_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
>> +				   char read_write, int command)
>> +{
>> +	int xact, ret;
>> +
>> +	switch (command) {
>> +	case I2C_SMBUS_QUICK:
>> +		xact = I801_QUICK;
>> +		break;
>> +	case I2C_SMBUS_BYTE:
>> +                xact = I801_BYTE;
>> +                break;
> 
> Previous 2 lines are indented with spaces instead of tabs.
> 
OK

>> +	case I2C_SMBUS_BYTE_DATA:
>> +		if (read_write == I2C_SMBUS_WRITE)
>> +			outb_p(data->byte, SMBHSTDAT0(priv));
>> +		xact = I801_BYTE_DATA;
>> +		break;
>> +	case I2C_SMBUS_WORD_DATA:
>> +		if (read_write == I2C_SMBUS_WRITE) {
>> +			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>> +			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>> +		}
>> +		xact = I801_WORD_DATA;
>> +		break;
>> +	case I2C_SMBUS_PROC_CALL:
>> +		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>> +		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>> +		xact = I801_PROC_CALL;
>> +		break;
>> +	default:
>> +		return -EOPNOTSUPP;
> 
> That's never going to happen.
> 
> Generally speaking, I'm worried about having the same switch/case
> construct here that we already have in i801_access. Looks to me like we
> are doing half of the work here and the other half there and I fail to
> see the rationale for splitting the work like that. I mean, I see how
> it solves the asymmetry between the block and non-block code paths, but
> the result doesn't look appealing. From a performance perspective it's
> questionable too.
> 
> What prevents us from doing all the work on either side? Maybe we
> should move more code into i801_single_transaction (possibly in a
> subsequent patch)?
> 
Makes sense. Ill add this in v2.

>> +	}
>> +
>> +	ret = i801_transaction(priv, xact);
>> +
> 
> Traditionally no blank line here.
> 
OK

>> +	if (ret || read_write == I2C_SMBUS_WRITE)
>> +		return ret;
>> +
>> +	switch (command) {
>> +	case I2C_SMBUS_BYTE:
>> +	case I2C_SMBUS_BYTE_DATA:
>> +		data->byte = inb_p(SMBHSTDAT0(priv));
>> +		break;
>> +	case I2C_SMBUS_WORD_DATA:
>> +	case I2C_SMBUS_PROC_CALL:
>> +		data->word = inb_p(SMBHSTDAT0(priv)) +
>> +			     (inb_p(SMBHSTDAT1(priv)) << 8);
>> +		break;
>> +	default:
>> +		break;
> 
> Default case is not needed.
> 
OK

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
>>  {
>>  	addr <<= 1;
>> @@ -784,9 +840,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  		       unsigned short flags, char read_write, u8 command,
>>  		       int size, union i2c_smbus_data *data)
>>  {
>> -	int hwpec;
>> -	int block = 0;
>> -	int ret, xact;
>> +	int hwpec, ret, block = 0;
>>  	struct i801_priv *priv = i2c_get_adapdata(adap);
>>  
>>  	mutex_lock(&priv->acpi_lock);
>> @@ -804,36 +858,23 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  	switch (size) {
>>  	case I2C_SMBUS_QUICK:
>>  		i801_set_hstadd(priv, addr, read_write);
>> -		xact = I801_QUICK;
>>  		break;
>>  	case I2C_SMBUS_BYTE:
>>  		i801_set_hstadd(priv, addr, read_write);
>>  		if (read_write == I2C_SMBUS_WRITE)
>>  			outb_p(command, SMBHSTCMD(priv));
>> -		xact = I801_BYTE;
>>  		break;
>>  	case I2C_SMBUS_BYTE_DATA:
>>  		i801_set_hstadd(priv, addr, read_write);
>>  		outb_p(command, SMBHSTCMD(priv));
>> -		if (read_write == I2C_SMBUS_WRITE)
>> -			outb_p(data->byte, SMBHSTDAT0(priv));
>> -		xact = I801_BYTE_DATA;
>>  		break;
>>  	case I2C_SMBUS_WORD_DATA:
>>  		i801_set_hstadd(priv, addr, read_write);
>>  		outb_p(command, SMBHSTCMD(priv));
>> -		if (read_write == I2C_SMBUS_WRITE) {
>> -			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>> -			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>> -		}
>> -		xact = I801_WORD_DATA;
>>  		break;
>>  	case I2C_SMBUS_PROC_CALL:
>>  		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
>>  		outb_p(command, SMBHSTCMD(priv));
>> -		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
>> -		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
>> -		xact = I801_PROC_CALL;
>>  		read_write = I2C_SMBUS_READ;
>>  		break;
>>  	case I2C_SMBUS_BLOCK_DATA:
>> @@ -883,7 +924,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  	if (block)
>>  		ret = i801_block_transaction(priv, data, read_write, size);
>>  	else
>> -		ret = i801_transaction(priv, xact);
>> +		ret = i801_single_transaction(priv, data, read_write, size);
>>  
>>  	/* Some BIOSes don't like it when PEC is enabled at reboot or resume
>>  	   time, so we forcibly disable it after every transaction. Turn off
>> @@ -891,26 +932,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
>>  	if (hwpec || block)
>>  		outb_p(inb_p(SMBAUXCTL(priv)) &
>>  		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
>> -
>> -	if (block)
>> -		goto out;
>> -	if (ret)
>> -		goto out;
>> -	if ((read_write == I2C_SMBUS_WRITE) || (xact == I801_QUICK))
>> -		goto out;
>> -
>> -	switch (xact) {
>> -	case I801_BYTE:	/* Result put in SMBHSTDAT0 */
>> -	case I801_BYTE_DATA:
>> -		data->byte = inb_p(SMBHSTDAT0(priv));
>> -		break;
>> -	case I801_WORD_DATA:
>> -	case I801_PROC_CALL:
>> -		data->word = inb_p(SMBHSTDAT0(priv)) +
>> -			     (inb_p(SMBHSTDAT1(priv)) << 8);
>> -		break;
>> -	}
>> -
>>  out:
>>  	/*
>>  	 * Unlock the SMBus device for use by BIOS/ACPI,
> 
> 


