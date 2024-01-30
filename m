Return-Path: <linux-i2c+bounces-1527-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14722841C5B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 08:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7213C2898FE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE14A52F93;
	Tue, 30 Jan 2024 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0vYNktW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169EA51C5D
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706598695; cv=none; b=nNu3Q2clzcfsFNbVWjHggrn7Hklvt8zjda1sANUXiCgosWDu2pgCgA4ta7B0ZWYr28BkJAW6CthmAX537BthRp8EPx5xWvxGVUG9+0U+1vIc+IJw8MZSPiUx/sPD2/yqVyGUsIQbFL2jELV8X05yA9KniwT2HEzzdvPe+d6NND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706598695; c=relaxed/simple;
	bh=3APybLhRXAn5khE7rNj6JMyZSVF7QPe7I8wDH65qaX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkoZ6C+kO0gssgl1h2tP6Ythud7eDehsLkO8kdaCuHQJZx2XCqOu7nUJS5ySxoMXOvf7K7M7yYJSPQYJjOBT0/0488t9eygoTQyMDJtKMZhrorJGVabk6q4yH0n+f5gq231nmeHTTfT1qz06NAACHyl3XI02ozUX4bfypceDoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0vYNktW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40eacb6067dso49955095e9.1
        for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706598692; x=1707203492; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1iy+ERy68ZJDkt+WYICZXdh0hhXGVZdfkE5HyzR4ak=;
        b=N0vYNktWkAYE01Uu0LjazyDYklb00jpT6F1QP5TQT4bKN4BK/CW9KQ0LJ3TORfqsp8
         arNFdsQEyytXKMWFBjdl4M3Agc1HP984f8lUGUdD1bbDRZFfd5qA7Te0p8fwFUTXR3Az
         D+xBnfJuuey4DsHoSK18thkNLkR2nVe67bQQcuQylZg3Hu+03U+Erpo3hK5kiZZi7dRN
         HtIgYVXp2Xc3JkX6T6fDrKCcw8WL2p9gJASUkz/8gPcMOk7xCE1yjL9HpFOakb2i/VsH
         qwX7jUL7mFHB91ZR4Ljyh44yU2BWDg3Rpwkc7hkmaGDUl0D+YVwq8YEDjIzV109P7lbK
         m+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706598692; x=1707203492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1iy+ERy68ZJDkt+WYICZXdh0hhXGVZdfkE5HyzR4ak=;
        b=P08hj2zyoAA1lnwDhBSBlm+UqbsAj04SYJmFcYWwIOx7StAwj/Q4ufbFp+ofa/wYgo
         MQu1vaTrm7HqmMWKYEFgb2ap+L+bL5ItL0Vy3SLNYtBKUlkVPQkPKbRSgoc0NHGeruLp
         Pm50CiuStMusrCfr4fn3SjeIdfeUbzHaDS1g9Tl8aKYdAYqYacKcv0Vn3u1DlggKJMZ4
         p521MIh+bV4vl0irc9d+xp9Covh/sese+Qi6ZwzGTak7cXR4HOg8Kz41P79/6+TE1dbl
         ND1GMF7ZFxcWN1enyxx+WT1BsbqkJWJ837qIqgzmtr4B3p9Ua/MDqWm+qPiLefKlcx7z
         lHoQ==
X-Gm-Message-State: AOJu0YyzipSJbJYUmEaIu0IuRwyTQNzOOouM2Wl35AkHWbxtmR6Xm9YB
	LI9+DRRNo+ufDyiw29VUZr2HE+Cw8e7e/JP1puq807/mYwqQ4LPE
X-Google-Smtp-Source: AGHT+IG3IZaJhLfmFj+B45OQlKFk43rrzN85+SFzUrDRvdkfQmxHoxK5HCpqughfPm7oWDXCuw4N9g==
X-Received: by 2002:adf:f9c3:0:b0:33a:fcfc:660a with SMTP id w3-20020adff9c3000000b0033afcfc660amr150616wrr.16.1706598692090;
        Mon, 29 Jan 2024 23:11:32 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:513:e902:472a:9202? (dynamic-2a01-0c22-7399-9100-0513-e902-472a-9202.c22.pool.telefonica.de. [2a01:c22:7399:9100:513:e902:472a:9202])
        by smtp.googlemail.com with ESMTPSA id ch19-20020a5d5d13000000b00337b47ae539sm9949225wrb.42.2024.01.29.23.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:11:31 -0800 (PST)
Message-ID: <65f774fa-25f0-45d1-9fee-b05b1780ed9b@gmail.com>
Date: Tue, 30 Jan 2024 08:11:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] i2c: i801: Add SMBUS_LEN_SENTINEL
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <07acdfa5-0ab6-4885-a588-d169a31793c4@gmail.com>
 <n5oirtvl4g4orngv2u3dc477lhq7wtrgepjkueeu62uuljrz5f@6rycpg5hgezx>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <n5oirtvl4g4orngv2u3dc477lhq7wtrgepjkueeu62uuljrz5f@6rycpg5hgezx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 01:23, Andi Shyti wrote:
> On Fri, Sep 22, 2023 at 09:40:25PM +0200, Heiner Kallweit wrote:
>> Add a sentinel length value that is used to check whether we should
>> read and use the length value provided by the slave device.
>> This simplifies the currently used checks.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index a9d3dfd9e..30a2f9268 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -204,6 +204,8 @@
>>  #define STATUS_FLAGS		(SMBHSTSTS_BYTE_DONE | SMBHSTSTS_INTR | \
>>  				 STATUS_ERROR_FLAGS)
>>  
>> +#define SMBUS_LEN_SENTINEL (I2C_SMBUS_BLOCK_MAX + 1)
>> +
>>  /* Older devices have their ID defined in <linux/pci_ids.h> */
>>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS		0x02a3
>>  #define PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS		0x06a3
>> @@ -541,8 +543,7 @@ static void i801_isr_byte_done(struct i801_priv *priv)
>>  {
>>  	if (priv->is_read) {
>>  		/* For SMBus block reads, length is received with first byte */
>> -		if (((priv->cmd & 0x1c) == I801_BLOCK_DATA) &&
>> -		    (priv->count == 0)) {
>> +		if (priv->len == SMBUS_LEN_SENTINEL) {
>>  			priv->len = inb_p(SMBHSTDAT0(priv));
>>  			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
>>  				dev_err(&priv->pci_dev->dev,
>> @@ -697,8 +698,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
>>  		if (status)
>>  			return status;
>>  
>> -		if (i == 1 && read_write == I2C_SMBUS_READ
>> -		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
>> +		if (len == SMBUS_LEN_SENTINEL) {
>>  			len = inb_p(SMBHSTDAT0(priv));
>>  			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
>>  				dev_err(&priv->pci_dev->dev,
>> @@ -805,7 +805,7 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
>>  					u8 addr, u8 hstcmd, char read_write, int command)
>>  {
>>  	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
>> -		data->block[0] = I2C_SMBUS_BLOCK_MAX;
>> +		data->block[0] = SMBUS_LEN_SENTINEL;
> 
> This patch is good, but a few comments for each change to tell
> where the sentinel will be used and where the sentinel was set
> would help to better understand the use of the sentinel.
> 

OK

> Thanks,
> Andi
> 
>>  	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>>  		return -EPROTO;
>>  
>> -- 
>> 2.42.0
>>
>>


