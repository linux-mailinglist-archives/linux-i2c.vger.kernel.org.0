Return-Path: <linux-i2c+bounces-1532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494588422D7
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 12:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014AC28AB11
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 11:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BBF67A13;
	Tue, 30 Jan 2024 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJP6ISWi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1F767728
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706613627; cv=none; b=XC8kK/xlrZ4FNavsiTufMqbs0TR73TZ6/2MosIa0l+G3yhjtQqA66j9zxVArGLgcJlR+BQ5HLkSOlmYieCecOXnsM9y4jojEIXJZOr2NXUZBFGtBA6Chxf1b4S6yRnmv/dNSoun7o9mmgDWkA4Y1bVeYJ8xiENU535aNb+wcq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706613627; c=relaxed/simple;
	bh=eE7X9ELnFk79hjndP00m/JkECRv7ZNM4/CB8pG7QJic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLbC17khz2VKyTvt0YdNCsWhw7SQobarnH4XSoiFYrnLZnz8ehTdeK4MWeM752D0nslOD64Ng71DuaOKTyUKKsfXGcKBrAZ1roj/IeNSIzs2Iu4qODLzdrGg05gPISGcPMIe29XJqS6qpfYAxKHp4aBwoUd0XsK4hKuQW1n1Kn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJP6ISWi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d057b6ddfdso8507671fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 03:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706613623; x=1707218423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tgSRAWSwZR816u7TdF0rLXInk65s70XdLh+P3j7g7t4=;
        b=nJP6ISWiJjWkXVQLNFiH5Y6yTXU03/W2VtaUZgOLpxH761l+G35CpqxQY6rJCs4zqn
         /KxYEyj63JXKzm9Rf2CmwvpDpth5oMCi+w6eU28jsuwriv1ICVRp0SLPTsBD5jPNCOeW
         UeEuIp91qVj49uz9E80/F/R0YWDi5CbWUkepyP5iz0Qlq/G7UDNC8Jtv+nKMeAUQsp/R
         OaOsO5A/KaBaCztmsPdjgdmb9eaOxI7a0LIudzeZRngUYttHHFZEBwrlrU5Jkfytqmhw
         +PTS46ZowoNr3ZxwtuywS1be0AjWLNamlCcikNWq8lcscXp/XGGInjs/so39dRQOPMQg
         iG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706613623; x=1707218423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgSRAWSwZR816u7TdF0rLXInk65s70XdLh+P3j7g7t4=;
        b=sV4xBeBmN3E4QIoA9VBmKaScrHLbpcJn000RC5MMbgZyWVJHp1yEFQhZnQtH4zr/PO
         DhFJNWZ0QWsO23BnwepHwNZdMqRNd3QzuzBG8T2j9zll5XdgIr5jxpjyUJkNmvNwfUgr
         vuxrqTHTHhUXmLD+Kyurh3XHGZ423hs6t4/hSx74NYNG8sxpqmWq640taQTQIwkL7Tuk
         Skxvnx/0oM9kqronyaFKz+Uw5YmPwbRJEbHtHyQEmWDUuPLTt8g98cQ6bA4ZkEkqGust
         qpIcbaHXs1JGm2KIpNGJczGNs1vwuJ+DFKaoGoZMhUCUT24YwzE8F0y5tT/pCq7++kdU
         FEQw==
X-Gm-Message-State: AOJu0YxT95pJBq/86dCuUOqhlmBtYcWpjYK+5wE9Qlq0wxUh1gjQCCvj
	vUJSW+ok3F3q2P1wsM18XDfHBcymqB/X2w45w1Lq1WrbDpiOFT5FlY0qAwMK
X-Google-Smtp-Source: AGHT+IHZB158iBD6dN5gSXZD4/zS/2aoV1KhZ/s2n1eNzOT5UKF22dAnHq8eGgF7UasTjH5AO18pTA==
X-Received: by 2002:ac2:4d17:0:b0:50e:f5b5:71af with SMTP id r23-20020ac24d17000000b0050ef5b571afmr4988017lfi.40.1706613623173;
        Tue, 30 Jan 2024 03:20:23 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:1c45:43fe:6a:a7e6? (dynamic-2a01-0c22-7399-9100-1c45-43fe-006a-a7e6.c22.pool.telefonica.de. [2a01:c22:7399:9100:1c45:43fe:6a:a7e6])
        by smtp.googlemail.com with ESMTPSA id bi20-20020a05600c3d9400b0040ef04987e7sm8889358wmb.16.2024.01.30.03.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 03:20:22 -0800 (PST)
Message-ID: <ed800c55-fffe-4080-9e0c-ae13bcc76353@gmail.com>
Date: Tue, 30 Jan 2024 12:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] i2c: i801: Split i801_block_transaction
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <a5920bf7-91ef-4cf3-b6c5-0979e9325d7a@gmail.com>
 <pnzgygb7zlm5x2xkn6i7etzrmcf5rrfyaxh2s5zvbmuoqmqh63@m5wravpyp32r>
Content-Language: en-US
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
Yes, but I didn't do it because they cover different functionality.
IMO it's better readable this way.

> But here the case of "command == I2C_SMBUS_BLOCK_DATA" is doing
> something different from the original code. E.g. if command =
> I2C_SMBUS_BLOCK_DATA and read_write = READ, then there is a
> functional change. Or am I getting confused?
> 

At least there's no intentional functional change.
Can you describe the functional change you see?
Then it's easier to comment.

And yes: All the strange and misleading function argument naming
makes it quite confusing. This starts in I2C core:

smbus_xfer() has an argument "command", which is typically
a data value. See i2c_smbus_write_byte()
Argument "size" however is actually the command.

> Thanks,
> Andi

Heiner

