Return-Path: <linux-i2c+bounces-1548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 370FE843822
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 08:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2421C253DE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 07:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BFA5A0E5;
	Wed, 31 Jan 2024 07:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7q4YBeN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC3858138
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706687031; cv=none; b=FTEYW9nNbhWA95P6J3A2G2gGS2sz3KUUJjqV94vKuMnoLIcvIAnWkyLgc7xEKZLBmU2tX5d1Vk4zeHmUJyk854fQHy6zvEH+VO/bew2ja6p0PmDdK9rEMyPjWbyZvK3+b+l0RfeqjTi/ecLHPju/irtokK34/dazE43vUifJ26s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706687031; c=relaxed/simple;
	bh=92pgO59hfpAuqq4z9ddM41d2fiOedSxUU+wqZfXG0Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5Jn+oMCvbTqs98s6o0ddXGKxkRRrjphEboEIngu96RW/JQb/jyRKKn/9/QL4LPiF1dk6NhR4SYqX5+KzrUE9/vWzkLIX4xsnN/qxiNbdNcETqG7f8rExG0Co+Cwrie2z3So2qoH/8Mk9Aa04R+IqH1K6PSIktkA5b1Uv30SAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7q4YBeN; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d051fb89fbso32406821fa.2
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 23:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706687028; x=1707291828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VQZmHA6yFaOyWdsKv10WJ0EyLfokdNJ+U9RWSzbDRs=;
        b=B7q4YBeNAnBUH6Qeqng6H5XFtBinXnTBPY4xx71sKJY7YyW/PUbNYFmpnkCPDFOU1A
         4RCJOWl77OBCtUmS1wYsih/InMpAQRncA/10i0Hviffjhtjmbuuk+txvjyLX+N44smCO
         60dIVmj7I8uJQVe/KpQdHhSN6o3RZcZ0jQYNGWN0a/s4SZFJfFTuQjNVjIb4MB/BKTf9
         vQYE2IJQdmMiuy9y9INSg+U6f1j1yjUzHhVlepXwlrrtZK7XCptkFL8kQaghPVCOElll
         okrUINyvxFsibeWCpte1YfN/T9k2PgCgYzSPVWQP/3ztKB1vq0kzf+tyESYMxCxMPRgL
         EvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706687028; x=1707291828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VQZmHA6yFaOyWdsKv10WJ0EyLfokdNJ+U9RWSzbDRs=;
        b=DWUyUI6IZ/C8BG4Iu+RkVUkA4ib5EMUClqJHYzwfFFUWdYP8zhGnhxu5DXgqUii+xx
         0/dmKjkfQqAYakXAmnPg7jpHXJlMdWVoH9Flp0AoT0zMCEGp1ZSsJXzY0YUc1sn+53g7
         G/7sGFNozk3c+9qNXOKGvv1d4CCId85E92dtjcDNX0nrEcxqTRRxCNsa2NBoOatwDpKK
         8j73VXvwRhUQWy5p940AuhMsRk9SGLNEO3x15gyaMXABncLS1zO0gVipZD21gKoNIotk
         MXzRghVGOBuD0K4apnZHOLIjj5+fQJsahmG2QW87iU+pPqiqMEcUxhCB+CstflF1jnwd
         vycw==
X-Gm-Message-State: AOJu0YwxMn/3gAAVtem6vxASPphoFfNGkFbvDV08Vzvnh5KL7lQ7Nabt
	6dTnWEdbj3PeT6VN8uJu13Bfc4o2IKLY7EtXC31KGxpvMKUWQpmh9LXlfkQZ
X-Google-Smtp-Source: AGHT+IFnG0tUQxrXohJXGmEWaRexg1zjcHXeE0HWnHtHHu6EiJdsl9CaH4nyOaDBWz+XnHKiHdTdKw==
X-Received: by 2002:a2e:90cd:0:b0:2cd:f914:bba7 with SMTP id o13-20020a2e90cd000000b002cdf914bba7mr608735ljg.34.1706687027326;
        Tue, 30 Jan 2024 23:43:47 -0800 (PST)
Received: from ?IPV6:2a01:c23:b988:d300:e5d3:e87e:2ada:d09b? (dynamic-2a01-0c23-b988-d300-e5d3-e87e-2ada-d09b.c23.pool.telefonica.de. [2a01:c23:b988:d300:e5d3:e87e:2ada:d09b])
        by smtp.googlemail.com with ESMTPSA id u23-20020aa7db97000000b00558a3e892b3sm5635447edt.41.2024.01.30.23.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 23:43:46 -0800 (PST)
Message-ID: <3bd0980e-d17e-4a3c-b4aa-8e110622c308@gmail.com>
Date: Wed, 31 Jan 2024 08:43:48 +0100
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
 <ed800c55-fffe-4080-9e0c-ae13bcc76353@gmail.com>
 <bjxphy2qlvvv4zp3dnucehkoeh7rayany3v5lc5gx747zptr6h@fmg4tikg2jpy>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <bjxphy2qlvvv4zp3dnucehkoeh7rayany3v5lc5gx747zptr6h@fmg4tikg2jpy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 23:07, Andi Shyti wrote:
> Hi Heiner,
> 
> On Tue, Jan 30, 2024 at 12:20:26PM +0100, Heiner Kallweit wrote:
>> On 30.01.2024 01:09, Andi Shyti wrote:
>>>> +static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
>>>> +				      u8 addr, u8 hstcmd, char read_write, int command)
>>>> +{
>>>> +	int result;
>>>> +	u8 hostc;
>>>> +
>>>> +	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
>>>> +		return -EPROTO;
>>>> +	/*
>>>> +	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
>>>> +	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
>>>> +	 * the read will fail if we don't set the R/#W bit.
>>>> +	 */
>>>> +	i801_set_hstadd(priv, addr,
>>>> +			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
>>>> +
>>>> +	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
>>>> +	if (read_write == I2C_SMBUS_READ)
>>>> +		outb_p(hstcmd, SMBHSTDAT1(priv));
>>>> +	else
>>>>  		outb_p(hstcmd, SMBHSTCMD(priv));
>>>> -		break;
>>>> +
>>>> +	if (read_write == I2C_SMBUS_WRITE) {
>>>> +		/* set I2C_EN bit in configuration register */
>>>> +		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
>>>> +		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
>>>> +	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
>>>> +		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
>>>> +		return -EOPNOTSUPP;
>>>>  	}
>>>
>>> These two if...else blocks can be merged.
>>>
>> Yes, but I didn't do it because they cover different functionality.
>> IMO it's better readable this way.
> 
> it's OK, this is a matter of taste.
> 
>>> But here the case of "command == I2C_SMBUS_BLOCK_DATA" is doing
>>> something different from the original code. E.g. if command =
>>> I2C_SMBUS_BLOCK_DATA and read_write = READ, then there is a
>>> functional change. Or am I getting confused?
>>>
>>
>> At least there's no intentional functional change.
>> Can you describe the functional change you see?
>> Then it's easier to comment.
> 
> I wrote it :-)
> 
> when command is I2C_SMBUS_BLOCK_DATA, before it was simply doing:
> 
> 	i801_set_hstadd(priv, addr, read_write);
> 	outb_p(hstcmd, SMBHSTCMD(priv));
> 
> while now it does:
> 
> 	i801_set_hstadd(priv, addr,
> 			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
> 	if (read_write == I2C_SMBUS_READ)
> 		outb_p(hstcmd, SMBHSTDAT1(priv));
> 	else
> 		outb_p(hstcmd, SMBHSTCMD(priv));
> 

That's a code snippet from new function i801_i2c_block_transaction() and not
the path taken in case of I2C_SMBUS_BLOCK_DATA. I think the diff is
hard to read. It's easier to look at new function i801_smbus_block_transaction()
after applying the patch.

Due to the change in i801_access() now i801_smbus_block_transaction() is called
in case of I2C_SMBUS_BLOCK_DATA. Because of the split this function became quite
simple. It does the same as before for I2C_SMBUS_BLOCK_DATA.

static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
                                        u8 addr, u8 hstcmd, char read_write, int command)
{
        if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
                data->block[0] = I2C_SMBUS_BLOCK_MAX;
        else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
                return -EPROTO;

        if (command == I2C_SMBUS_BLOCK_PROC_CALL)
                /* Needs to be flagged as write transaction */
                i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
        else
                i801_set_hstadd(priv, addr, read_write);
        outb_p(hstcmd, SMBHSTCMD(priv));

        if (priv->features & FEATURE_BLOCK_BUFFER)
                return i801_block_transaction_by_block(priv, data, read_write, command);
        else
                return i801_block_transaction_byte_by_byte(priv, data, read_write, command);
}


>> And yes: All the strange and misleading function argument naming
>> makes it quite confusing. This starts in I2C core:
> 
> you could try to play around with different diff algorithms when
> generating the patch. Some of them perform better when renaming
> functions.
> 
> Andi
> 
> PS. I'm not sure, though, this patch is improving readability,
>     but I will check it again.
> 
> 
>> smbus_xfer() has an argument "command", which is typically
>> a data value. See i2c_smbus_write_byte()
>> Argument "size" however is actually the command.
>>
>>> Thanks,
>>> Andi
>>
>> Heiner


