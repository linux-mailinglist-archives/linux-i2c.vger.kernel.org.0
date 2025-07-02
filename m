Return-Path: <linux-i2c+bounces-11756-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D74AAF0CAB
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 09:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2435E4E0A67
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C932236E8;
	Wed,  2 Jul 2025 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8C+sd9d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86C1D514E
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751441704; cv=none; b=hDlQ0EiB7KqBitdkkN0Qqb4D5/SZVfTl48oa/+2Pr8KV35zVDq5wUfj4r9kGs2Zm6gVIcPXv8zJEM7gBscB8KjRHLKfjWBDVWGEPhBhTwK/2FmFLPWVjj58jgfPOxK6rTzPhRwL7guwE6G0LKh5+3yJLJySlf/pibK11gTyb4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751441704; c=relaxed/simple;
	bh=eQ9+3uQo04qOS3R/m434PAZKlA3lc2m+RaZuXRO/GVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6BwswNxfo3X7IK5JOcBDbQ2OJGFTOCcmLE2crqNxiGC0bWkkP/7rIi8OLHALbeEtCFgRluCWQfCa7O2/4fQfuCvUVqdoOnGXi5ERbKFFPkz8UFhY7tysf9+25fK9ODx2UtXZtwDxqvTYyj/eNK9OYrxYX8s+Ql0fYwg8POmMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8C+sd9d; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so3557552f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751441701; x=1752046501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ9+3uQo04qOS3R/m434PAZKlA3lc2m+RaZuXRO/GVU=;
        b=F8C+sd9dtOBezE+k3YdozUH/M6TikbhrwalFoQlH53dvouzkHY2qfGBUTWle3RfZ2u
         6lh0AXeBROfqMlb7ETNflA2F4wGXNSeY998kp++TBU/7cGA4jn3LYX/WPSEdMC9a1+tx
         xbaOKgcTCTi6zxOY6McuNLwTvAas4g4YSf4y+Sb/b+njK+EPvWBWQ90EGW5aaUjRKQvL
         2lJpmRvL89NkIjge9d4UZX0cMDoZn+fwZITkAdX+fQ+I7lrc8XOovd1YfI+VQt4zujUw
         /byJqRuuCPMuNp+qvNJxRjRpIZvDUzGmXm7wV8J6Mbvsmn1ydSS5AUqc+sUYfk1OzEDQ
         UXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441701; x=1752046501;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQ9+3uQo04qOS3R/m434PAZKlA3lc2m+RaZuXRO/GVU=;
        b=c/qZLxkKVQhh1S7BzvHVfQATmBMFIwcm7udQ9hoV4jmc1txAZLwrcnMrcS4cJRQjh5
         LUGhVkbQ2sxbBaxnwP4y/e5tBRNACISYjEWOlIfcbUwz0neu9a71jBNVJNsIykxf7PKl
         DJvGePrqZarrAkdWFW4UIexLiIrp+BgzRxaeolGMmLBTN4qSBmLpIJ4Sp+8GFV9Aryqd
         xrJG3y0zEOkS/WTzngGLzSQwE80Tua8IwGJvGXFqdAfuuVZD/JDyJNynMqS6zyCsgXx1
         sFF345m6I8S0MFddhxOVpi0e2tXV+1HpjLDruHMoY1leEKSSe0UyMYutMpv4ml8pF+oC
         MLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS1Qk+OCZ/jeZ+P16MEdZfvvW4uiunasaO8Gfcldhh1HMvfKOJWaFfrfI1mQ3rbtOeNkt0NWJp3TY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQaaRvEYseH6L7NrSIQYxNj4T1S9sIHp4iv3I2zNJUVNTZjEZ
	rE7ofhWU/MKJSa5L6cN+jnbgitkZ9/dO28sahP5I9eyiZiK+AH+5DcXmqC5VlMyu
X-Gm-Gg: ASbGncspUHBT4MEDZxw1ELOqflPyipShQyqqsNW4TP0H+UWwnFKRM0pAG9FmMuCOLgq
	arz+Ylf8YXctHOz4rjxOETr4lPRL+CWfvXVSULg5/spz+kj3KoXCPOcib1sgkzNavcp6n7vdDwC
	XS3n2IRbabXNUViFE4loD9tKgYZquBgpMKs+p72wxaCzP3MzOk9li961lyyjygY6YXF0xmbAD+D
	Pull56vM/YE+PUg4WNgo9cMKb5YFUzYYB0o7AHfOno61wg/hN+QI/zTKMI0C/uv9xlQZqK0QvMy
	uqNaQGCOr970A9cA2ct7Rga22Dw9oNAwMAyEigqAE8oT+CK6/JnPIp3xSq54HiZPn+Z8q/h4N8f
	8TOnq6tzq+jiIKpueDC6e+UZg5pTfgMedIiY=
X-Google-Smtp-Source: AGHT+IFmExrR8jhcYzoDDQyHZedjY2xIrNKiXMsT7gJuTOQ9Rn0Kg9EoaI1WVfHsGGP7e7z1q016uw==
X-Received: by 2002:a05:6000:5c5:b0:3a8:3105:1d49 with SMTP id ffacd0b85a97d-3b200b4677emr977107f8f.45.1751441700581;
        Wed, 02 Jul 2025 00:35:00 -0700 (PDT)
Received: from [192.168.44.44] (24-10-142-46.pool.kielnet.net. [46.142.10.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm219984575e9.5.2025.07.02.00.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 00:35:00 -0700 (PDT)
Message-ID: <3b357cd4-017e-43d9-a662-4f26fb9b8d68@gmail.com>
Date: Wed, 2 Jul 2025 09:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
 <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
 <b3e58bf1-d51b-481c-892c-4115bd106ed9@kernel.org>
 <123042be-63dc-46bf-b781-6da022a8f4c5@gmail.com>
 <8d671dcc-bcc2-4b1d-9063-f7d69d52d29d@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <8d671dcc-bcc2-4b1d-9063-f7d69d52d29d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

thanks for taking the time to deal with this.

On 02.07.2025 08:11, Krzysztof Kozlowski wrote:
> On 01/07/2025 16:31, Jonas Jelonek wrote:
>> For the purpose:
>> RTL9310 changed the register layout compared to RTL9300. Activating
>> the SCL line is done by setting bit 12 for master 1 and bit 13 for master 2
>> in a global register which is located before the master-specific registers.
>> Thus, the driver needs to know which master (1 or 2) it is currently doing
>> something for. That is what this property is intended to be used, naming
>> to-be-discussed.
> There is no global register space here and no syscon, so I don't
> understand how can you access it, especially when they are located
> BEFORE your address space.

Probably this explanation is still missing some background and 'global'
was misleading here. The I2C controllers are part of Realtek switchcore.
This is defined as a syscon in DTS and the I2C controller has to be
defined as a child-node of it. (see 
https://elixir.bootlin.com/linux/v6.15.1/source/arch/mips/boot/dts/realtek/rtl930x.dtsi#L45-L72)
The driver takes its regmap from this syscon node as the I2C registers
are within that switchcore address space.

Address layout in RTL9310 is (addresses relative to parent syscon node):
0x1004 - 0x100b    I2C 'global' registers
0x100c - 0x1023    I2C master 1 registers
0x1024 - 0x103b    I2C master 2 registers

The driver has to access both the registers for the master that it is
configuring AND the 'global' ones (for SCL + SDA activation).

For upstream RTL9300 it's similar with the difference of having SCL
selection in the master-specific registers and the register layout
having the order:
- I2C master 1 registers
- I2C 'global' register
- I2C master 2 registers

> Best regards,
> Krzysztof

Just an idea to discuss regarding the DT compatibles:
I was proposed out of this conversation to use something like
'i2c-otto-mango' ('otto' being the codename for their platform,
'mango' being the codename for the RTL9310 series). Based on, that
technically(!) it doesn't make sense to distinguish between the
variants of the series.

Has this any chance of acceptance, even when I do not mention
specific SoC variants anywhere in my patchset?

Best regards,
Jonas

