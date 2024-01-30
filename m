Return-Path: <linux-i2c+bounces-1531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56473842132
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 11:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0ADF1F24F38
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 10:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11D8960DE0;
	Tue, 30 Jan 2024 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zgt6GEtW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CC60DC9
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610333; cv=none; b=CnPBa5rf1NLePaS8mNeSxBTRb/d+kSWolu4CzEQCjXSr7DlEqrArSuUMXFgz62+JrsIQckUVAeD8NQYtXeyIFBG1g6heIqkgC6fr9BeR3CLNGlSodHQHHmyP4q2balWbwAkfTDLcb75zjK4nE3OvZwVdqW1qQrXGdpzMMroZO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610333; c=relaxed/simple;
	bh=Ala16XimMYoYU4tjF/aQ6fzkIdLIHH/TOImFMV6xJ0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OB3Yk7OqFYc0cyOOoxk7laCvP6igmxV3VJxvbhSTdm+hp9Am8UZ0yazzDnNhSOtxeaykjRzyF8wB+0rvhTIFnZxHZdbgTFtijfjNN4E1lvhagxr7UUx3KkF2ATyC8CQ2ZOwcK18itUOZcKndQNDXUvNf2x2IRU+USTugl9xV940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zgt6GEtW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33ae51f8111so1852067f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 02:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706610330; x=1707215130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glMkDewCSikWZVDLoYe1Er6Q7Qb8O+nKFzVFfR++JZU=;
        b=Zgt6GEtWmAForhxMXZAlsfpuDcDkxE6rLlkFgpcdiRv97W+PXK/pYg7RMDDKkpLu1E
         VX4qgBUlht8fXhFl4eKEwLX0F47FscH/3WjYO1gIKtuu28IWzWWZCuA302eyC3pPAP0V
         jMBDFfoBsUrsh8XMcm4PQCBs5hHZlikZOeRbuqga9hBnnz8tNZ1dUw/kTqM6+/bjVCA3
         AkJyU6RMDnexV5HH1W+B9e0oR+QXkjVoM3BCtMs76cHQVERUuLLLjtcAyzVdnyuBF4CQ
         JiCG2iDaeJa4KR7iDs5tq84rmf4L8hRKOKzShMgBlFognK+a8cwmyiC9y1Tsjlf8wmWF
         vlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706610330; x=1707215130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glMkDewCSikWZVDLoYe1Er6Q7Qb8O+nKFzVFfR++JZU=;
        b=VGYD3LOepcIGmpIZEciG8gU8/7imdvoprJiV1VCZdIqhPPdwlaJ2O0OabjIbOb1mVl
         moosal813ltcb1I7DXSsPs1+edSYfUPWaOrCidWJseMmYTR0UFSdB35n2Awbut+bTHDO
         /oYhpJA2vF1Xn1alTBAuG3HqMOH6RC1MSDgBSC45VTlHdsSaeTRL7lZuMMg+i3eIcTyD
         Aj2DOMFCvgRokj0hNfj0qEH0FASr6hoEmqX6kiJvPAmtzhhFgyOzaBFoYchyBogiaK+X
         saWFPjMrVBS4ys/na1SM3+c2MmoQoTHYNTftLyESHt8+/IThwe7GpEMsAMDLK+7J+pGh
         6GFA==
X-Gm-Message-State: AOJu0YyuxMWDlI9xwpFSLgAVAiDnqI9SttTjjy3RRTwlkVkKPy0+GGcl
	75ynYb4THw/5zr7dZyzZPi4Z+z8pykE5rdJsDEHKSCMD248aDUb7
X-Google-Smtp-Source: AGHT+IEvkKdo3iB5r9/x9TyOY4bSmIX1MXAHBPNoyfxFIm4lu0+94oiAgepgey+BXSVrPxmSx5hRlA==
X-Received: by 2002:a5d:588a:0:b0:33a:f41e:f68b with SMTP id n10-20020a5d588a000000b0033af41ef68bmr3993204wrf.25.1706610330052;
        Tue, 30 Jan 2024 02:25:30 -0800 (PST)
Received: from ?IPV6:2a01:c22:7399:9100:1c45:43fe:6a:a7e6? (dynamic-2a01-0c22-7399-9100-1c45-43fe-006a-a7e6.c22.pool.telefonica.de. [2a01:c22:7399:9100:1c45:43fe:6a:a7e6])
        by smtp.googlemail.com with ESMTPSA id eo6-20020a056000428600b0033af5086c2dsm2952420wrb.58.2024.01.30.02.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 02:25:29 -0800 (PST)
Message-ID: <b86980f9-add0-4e59-bb4b-4353344d5f2d@gmail.com>
Date: Tue, 30 Jan 2024 11:25:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] i2c: i801: Use i2c core default adapter timeout
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <380b592a-cb28-47ef-b110-e2ee6e8550fb@gmail.com>
 <dgctw2imnpwhlef72pkcubaok2zi7s3ej3m3cdvlhmjv6xv3be@sltjtakw24jt>
 <5816ddf4-1623-4bbd-9178-342a79eab768@gmail.com>
 <7ljbyo7slq74nnwelifdtjhfopy2vozo4qy7cfvrzbeqderpox@ijrb5fqwfztn>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <7ljbyo7slq74nnwelifdtjhfopy2vozo4qy7cfvrzbeqderpox@ijrb5fqwfztn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.01.2024 11:00, Andi Shyti wrote:
> Hi Heiner,
> 
>>> On Fri, Sep 22, 2023 at 09:35:55PM +0200, Heiner Kallweit wrote:
>>>> I see no need for a driver-specific timeout value, therefore let's go
>>>> with the i2c core default timeout of 1s set by i2c_register_adapter().
>>>
>>> Why is the timeout value not needed in your opinion? Is the
>>> datasheet specifying anything here?
>>>
>> I2C core sets a timeout of 1s if driver doesn't set a timeout value.
>> So for me the question is: Is there an actual need or benefit of
>> setting a lower timeout value? And that's something I don't see.
> 
> yes, that's why I am asking and I would like to have an opinion
> from Jean. I will try to get hold of the datasheets, as well and
> see if there is any constraint on the timeout.
> 
The datasheet for the 7-series (doc# 326776-003) states:

5.21.3.2 Bus Time Out (The PCH as SMBus Master)
If there is an error in the transaction, such that an SMBus device does not signal an
acknowledge, or holds the clock lower than the allowed time-out time, the transaction
will time out. The PCH will discard the cycle and set the DEV_ERR bit. The time out
minimum is 25 ms (800 RTC clocks). The time-out counter inside the PCH will start
after the last bit of data is transferred by the PCH and it is waiting for a response.
The 25-ms time-out counter will not count under the following conditions:
1. BYTE_DONE_STATUS bit (SMBus I/O Offset 00h, Bit 7) is set
2. The SECOND_TO_STS bit (TCO I/O Offset 06h, Bit 1) is not set (this indicates that
the system has not locked up).

It's my understanding that the chip will signal timeout after 25ms. So we should never
have the case that the host timeout kicks in (as long as it's >25ms).
So the host timeout value doesn't really matter.

> Thanks,
> Andi

Heiner

