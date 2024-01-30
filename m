Return-Path: <linux-i2c+bounces-1541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB51842E3F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 21:52:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 945AC1C23ADA
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 20:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F106A00F;
	Tue, 30 Jan 2024 20:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHf1Mh0m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499B069E12
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 20:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706647918; cv=none; b=cr35Z6yyENHxGc9noqSrZR+zUsl/hV4UHH7nGyeAujYouIpOYmGsZAzmFPx56k9x3Hu6Q13BpbjWBE+KU7weszVEa40FBtsdhBREzBD/ag8yxU/6VLZYQwxZY9PPSwC5Dg57jRSdMf7RS+zM8JNzHL+BTsLbqIO0XQaKBEwZfUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706647918; c=relaxed/simple;
	bh=LIeXJjJRj+Hkqt5Rzv8to65q6emD94yK0BGXySVH0Y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK0Zj4S/3oXOnv3FCPZ5Zs/NU4Jz8A0teKHcIuy2GEkX/1Udpfe0v9xK4aMu9W6/QQpnu7W1yEjipoP/MWsueib0MquyZR/WQdDkBTs/4gVDxYEn564abfhAAcChlkCrN4lbzxbeNIIr7tM+twRmXyKFhW8ld2VjnNwD9D/Pqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHf1Mh0m; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so4788041a12.2
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 12:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706647914; x=1707252714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oSc3TBTawbhbpGaUehoXagp5FdTMVFS65sfuKeQ5h3Y=;
        b=UHf1Mh0mLgxVsqy+DfbdSg0GMNuij28rsAGD2MiNv1yJ+u4ip6gos/q/RYiNmPnWaJ
         JNsUyoFTOGhrE4sA6/CjLuBHC4pP7vddB67fD2h9bNsdzzRWmZcomPdS9azZu/HhHaXh
         77irW3JrBT64MPo7BLvlwslI5RyyKYwhm3DPT5y83zJrjBMm/zOJdWo34KeBeILnLCz1
         5wUyHfoDVxUT0Z+/HVL6u7f2g5Q5PJSyAuWCIxH3V0gXOJcVRe1D4190H4U9iYxuq/Xz
         0ZpHYrN+wyg/6OxeuGZ5ZniXvOj28uA1LFXK8X3sdWtQAi7kq/6Wj1dT0aTH6f+v4TnC
         jyiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706647914; x=1707252714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSc3TBTawbhbpGaUehoXagp5FdTMVFS65sfuKeQ5h3Y=;
        b=CFHett3GNTYzHXaOJITVD1iI14SUf57j15Y0nHeivdLXgwnTiBcNkLQORs2aWpTtwH
         T/MbwIHFHBlR3aiYUZ3Lh2CqSMKrxOlA2RXxgetEe+rWY3OhgNVlMOyhvjCw+AiltrzP
         wwqPqExM2Uj9y85A8W2C4VKUs2CCdEpmGdRJwzZWdxyRrficBqJB5rgM4+P39+tLrEgw
         Tt6dJxzs5IFQQaWVyN+PZycJUSCxOU9UJujdttQ6XjWIoXezLdW+HMXqTU2pGse1ofvz
         vi4fxs2DEMkliTziuue6HoShpUmeCqeeM6w1/zX80u5u/n+uXl0wETPywMDjJwpJaFyt
         Hm0A==
X-Gm-Message-State: AOJu0YzYkB6EqdwHa+wHfNvElQOdlNpv6dFzq0uO4kVeIWZxPR5z//YU
	Te8E5jgb61C9386xui1YWWn4VfJIdLDsS7hv6LQWkOarWjsW1kvF
X-Google-Smtp-Source: AGHT+IFKgXwJjevCi7JFaUdBBZJS86kDAygchV9ToYWR3CF3SdET6L7QQ1FV8REzEV4kw0h7EyqbuQ==
X-Received: by 2002:a05:6402:b4c:b0:55f:327c:d18a with SMTP id bx12-20020a0564020b4c00b0055f327cd18amr2088139edb.36.1706647914238;
        Tue, 30 Jan 2024 12:51:54 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:1c50:e52f:e8a8:3ab5? (dynamic-2a01-0c22-7399-9100-1c50-e52f-e8a8-3ab5.c22.pool.telefonica.de. [2a01:c22:7399:9100:1c50:e52f:e8a8:3ab5])
        by smtp.googlemail.com with ESMTPSA id e8-20020a056402104800b0055ef2c893b3sm2899860edu.52.2024.01.30.12.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 12:51:53 -0800 (PST)
Message-ID: <987579af-6416-4fe3-a8a4-4cdfad97f7f1@gmail.com>
Date: Tue, 30 Jan 2024 21:51:53 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i2c: i801: Split i801_block_transaction
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>
 <pnzgygb7zlm5x2xkn6i7etzrmcf5rrfyaxh2s5zvbmuoqmqh63@m5wravpyp32r>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <pnzgygb7zlm5x2xkn6i7etzrmcf5rrfyaxh2s5zvbmuoqmqh63@m5wravpyp32r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 01:09, Andi Shyti wrote:
> Hi Heiner,
> 
> ...
> 
>> +static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
>> +				      u8 addr, u8 hstcmd, char read_write, int command)
>> +{
>> +	int result;
>> +	u8 hostc;
>> +
>> +	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>> +		return -EPROTO;
>> +	/*
>> +	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
>> +	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
>> +	 * the read will fail if we don't set the R/#W bit.
>> +	 */
>> +	i801_set_hstadd(priv, addr,
>> +			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
>> +
>> +	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
>> +	if (read_write == I2C_SMBUS_READ)
>> +		outb_p(hstcmd, SMBHSTDAT1(priv));
>> +	else
>>  		outb_p(hstcmd, SMBHSTCMD(priv));
>> -		break;
>> +
>> +	if (read_write == I2C_SMBUS_WRITE) {
>> +		/* set I2C_EN bit in configuration register */
>> +		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
>> +		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
>> +	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
>> +		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
>> +		return -EOPNOTSUPP;
>>  	}
> 
> These two if...else blocks can be merged.
> 
> But here the case of "command == I2C_SMBUS_BLOCK_DATA" is doing
> something different from the original code. E.g. if command =
> I2C_SMBUS_BLOCK_DATA and read_write = READ, then there is a
> functional change. Or am I getting confused?
> 
I2C_SMBUS_BLOCK_DATA is handled by the new function
i801_smbus_block_transaction(). What may contribute to the confusion is that
there's also the command I2C_SMBUS_I2C_BLOCK_DATA, which is handled by
i801_i2c_block_transaction() now.

> Thanks,
> Andi


