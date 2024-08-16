Return-Path: <linux-i2c+bounces-5447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D981954197
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 08:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A1B1F24B53
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 06:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA4C6F2E0;
	Fri, 16 Aug 2024 06:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsuGFnLc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC43F9D5
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723789024; cv=none; b=WgmY2fog0/9QzrOZ1nHU1rsyZhVtFySyQzbn+UAiI6Rs9w2qWoQVU4bTWgquqLhI6J+03jUTGXdYKb83SrrWU2d5VN9jJX7KLCHsNethp0e45108l57QlfLzO1YGnELcUHLDWq2WUrCM+LROEvDujjOoC3NxmIhjZGK+Pi1u4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723789024; c=relaxed/simple;
	bh=jmsxSIiCNnrecdF1GaJBa3IGkk98xCjdcc5P3kDwU1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c4GtDJP6Lu88s+w1eS6CH4DGqI3NnozEQeJcykFmUnpHX/qnNftAdQ2/6wDeJwfeyxX/6Qw/HUbmSDDtEhcYE37n1ZDKDefQ9/4ix+1KVvb6i6a3KkdotXwMgKBMKhmG6f9pD7iTLl5sJhUigfgB27Cjh4NLOeeroJ8kz6kn2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsuGFnLc; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3717de33d58so960039f8f.1
        for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789021; x=1724393821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5spsPyVwKMGzUe1L9dzoVIiNqxM24iavEJWijxA0JoM=;
        b=gsuGFnLcIxbKeUivZgxzezx7X3Oo4qK4i5t8L97cRJvDyGi/PhfS+0lGMx6+FT1y6w
         AfMFjeLhQJTAzmzLCch+aqgPTeDeKbohNxEPUZlCTfBYjqXVx84+m+QcW0/wubYBChl5
         1t0+znIkg5fNeN6eje0IkiWK4ZE6CARnN+u7D6lOnmHf2S7cUEoDreEJdMIF01kUThp/
         bQEdVvs9e4+TAAmaXw/CqVS+VBZlCHq5eAlupM2x9qGQAHXifqjzh1wBDNNLqMM/kva7
         557xk6WuHmsp+VQ6btBiQVR/IbPle+JSgWFG1nHLZXhWR2YVAbTpO8U0BJrWMtwYhpMF
         xDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789021; x=1724393821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5spsPyVwKMGzUe1L9dzoVIiNqxM24iavEJWijxA0JoM=;
        b=MIg+QStex3QRydkV4cDyJOR9QYnPn1YJ7ZcD4EZYyURB7sMv3Q8k8bZjuaxBQ8chIw
         oOKl6aMB8S+Y1RRWhsMAp1fLFnoBGx/kqlEg7ONb3dlYGy2zkA1dxQvDsIVrEgar33Sh
         BxYWxznp9AS/VnyVW1pSKQoDri2gg6cfBGE6/EejSbfYeSWdRYkDaKyJOx4wyhnB1Lb9
         V0xeBwqqVJk9VQfrMfkZ/YR6SR7zZgPorhF4AEoJDn6G1zSZ55LjgYYhNitp8274tbHE
         a2rMk7GOAjbqNcJrmH4sIwulBLPDylYW1SXXZ/Ck9EUb41YxSdbXcUj3J21BIFMUSMKo
         TgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkfloxlK9hhQ/L7vOSf8n6YvcyfFbrTS7R/tvQc1AVu6WlLSpiBjspbtr9dQTuQJZkOo/jvCDuDCBexc47qu14MpwRfkUKF+gC
X-Gm-Message-State: AOJu0YwK+PnSjTDYSWNOJmg6/nl5aYK9ROqM5sAUTSgkccl2If3AAbTa
	G+OD6ymivp8GLIwCQIvZHCXhbvFA71SlpxhpMB9b7RQbTL7qlaKwzPPx5w==
X-Google-Smtp-Source: AGHT+IFHxmF0AN5w/463a3eS1zQTZ/Nb4VcZYp+NqZW7C8eGK8W3VjSE8gEbM4ct7ZP5H2mWWo6k9g==
X-Received: by 2002:a5d:4e42:0:b0:371:88a1:3e49 with SMTP id ffacd0b85a97d-371946a03d8mr1001328f8f.53.1723789020610;
        Thu, 15 Aug 2024 23:17:00 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73d1:9100:598d:a6c0:8c7e:b859? (dynamic-2a01-0c22-73d1-9100-598d-a6c0-8c7e-b859.c22.pool.telefonica.de. [2a01:c22:73d1:9100:598d:a6c0:8c7e:b859])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37189849606sm2945193f8f.32.2024.08.15.23.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 23:17:00 -0700 (PDT)
Message-ID: <dfbe5afa-daf6-4366-8f53-c8f7434b0748@gmail.com>
Date: Fri, 16 Aug 2024 08:17:00 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZryRqVexisiS-SGp@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 13:14, Wolfram Sang wrote:
> Hi Heiner,
> 
> thanks for tackling this!
> 
>> +static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
>> +			 unsigned short flags)
> 
> What about just using 'struct i2c_client *client' here as an argument.
> It has all we need and it currently seems unlikely that we need to call
> it from somewhere else where we need this seperation.
> 
>> +	if (!(flags & I2C_CLIENT_TEN) && !(flags & I2C_CLIENT_SLAVE) &&
> 
> From a pedantic point of view, I don't see a reason for not handling
> those two cases above. I hate to be pedantic because 10-bit mode is
> practically unused (and I am tempted to remove support for it once in a
> while because it makes other solutions clumsy). And the other one is
> super unlikely to happen because the backends do not autoload. However,
> it is theoretically possible if someone loads a devicetree overlay and
> initiates via sysfs at the same time. I liked the solution with the
> bitfield and atomic access, but maybe a linked list is better?
> 
Wrt 10 bit addresses:
I didn't find a single dts(i) with a 10bit i2c device. Because you said
that you're tempted to remove 10 bit support: Could the device tree part
be a starting point?

> Happy hacking,
> 
>    Wolfram
> 
Heiner

