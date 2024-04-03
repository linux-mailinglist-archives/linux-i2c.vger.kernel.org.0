Return-Path: <linux-i2c+bounces-2755-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD78978EA
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 21:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C98EB25805
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 19:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BC21552EE;
	Wed,  3 Apr 2024 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnS6x3Vo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB92152DE9
	for <linux-i2c@vger.kernel.org>; Wed,  3 Apr 2024 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712171889; cv=none; b=rRm+mjLFm5xzhdgWnYFLtkxWBVWwrr5UKbnH0oh4z94dQbJOr8pN4xZ7qkTgkbPYydxx9DVEV76N1GcLaK8SytGlkgdy5/18SExfE9Vs/JV9vd06cGqcMfUFrWJEO/7bRC/AiAr2DfmVt3zJVpkCl+NNuaWQdggKAt7fjj/L0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712171889; c=relaxed/simple;
	bh=KhcrmNTySC8jkLam/0fE/47EqZjANp6+IM4s9zhRn+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQzjJ2BXsPkSnIj8zbpGw3rJsLxmSlPcmMuoyEFcjpXfIQLEEHmQkOSlTRAsEeArNzAyFy4qguNq8slryOIvVWhGSRyroDXdLWlFkbNsqbzFF4WFz3pDZmxQWYJmPLV0o/wBpIXkv1r7dl5SF/vzn3wyxH0b1CtvBlvln8XzPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnS6x3Vo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a47385a4379so257995166b.0
        for <linux-i2c@vger.kernel.org>; Wed, 03 Apr 2024 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712171886; x=1712776686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WQWZ+tdqibVy9sVAs9x28Ux2FbrNT8gXihRnDobjlO8=;
        b=YnS6x3VoEUdKJLnDFn6iYKbcbMIOwSq1sN74IjRN1ajuZD2qaxZFIjSzHCuVhhKb0e
         ro49t3CEz6C5u4zBhBAQZBS4wvH0fsUd/klDgYfcjwrR7lT7JyjceIztgacIe/A4JN+f
         zFsT3+MQrkVuEeab1j0Gl9RaXoukmN45rVG02yn0bQIpZijhIUv2W56ypM2jeS3uxW66
         QFh61talaF9ZkmMSVDQ2OvQ6I3fCtXq/ajVPdosvHGvh06ljFrVt0XMKUM3a2ZnkLY0O
         eoi4mP5r0cj1Acj4rwyV7o3hOoQzK7zQXDTRntiY+oVu9fYoYJtIkv6aJ8asG6omSH6q
         2hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712171886; x=1712776686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQWZ+tdqibVy9sVAs9x28Ux2FbrNT8gXihRnDobjlO8=;
        b=pDC1SK2S3HRvoKlmlFmjYadckYOELyctHdmsbLe4kPhFfkt8g1d39SkbFFFo9uURD3
         /Vpwg/UqoJj0PvqqVyKXvPnJ1AarSoaiZK1oYICyvvmizXcQ7FpISHJrK6CMxpMjSWaM
         tlj4XUWedoEMwrXrPIDZyhsXAclVvnVW2fvTB+/bX71ozOkEg0tpNvKUEjS6czM30Uga
         avlHkMxfareAQNi0SZCqoJc5ooLMFCsmXYxXQ5An1mwSY56RlVQ3a3bRyb+YPmlRZbiM
         Jhl2GQse2dV02x17pQL7GkAymwh0QmGo7MUCqrnTrwJd/86eXPmPhRrWPCxFNg7QNmiy
         mBeA==
X-Gm-Message-State: AOJu0YyX1rPplETkV8t5N0gGSlgkHYnDNTvgQ/K02536+QvGjLq3pv2Z
	IRB8GKjeAL9YQ66MZrB6Bz7YJOnZ2EPcsCFAbZA6y/QOM0/TQTf7Nd1a+D6a
X-Google-Smtp-Source: AGHT+IGSpo9stxjNdHmLCBaW3t4j+OJvYONldztEUeAJcdcj4u6dMAOoaWIhIgfsxihZxd6xwDU3kw==
X-Received: by 2002:a17:907:7d8f:b0:a4e:8da0:8646 with SMTP id oz15-20020a1709077d8f00b00a4e8da08646mr579981ejc.29.1712171885965;
        Wed, 03 Apr 2024 12:18:05 -0700 (PDT)
Received: from ?IPV6:2a02:3100:90c7:f000:61e7:d107:348a:431c? (dynamic-2a02-3100-90c7-f000-61e7-d107-348a-431c.310.pool.telefonica.de. [2a02:3100:90c7:f000:61e7:d107:348a:431c])
        by smtp.googlemail.com with ESMTPSA id do21-20020a170906c11500b00a455d78be5bsm8071939ejc.9.2024.04.03.12.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 12:18:05 -0700 (PDT)
Message-ID: <4cb242be-2dbf-4b6d-a962-42e31df165d0@gmail.com>
Date: Wed, 3 Apr 2024 21:18:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Call i2c_register_spd for muxed child segments
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org
References: <f9df04f6-9dc2-4874-bc6c-473dc3d692b9@gmail.com>
 <171184484323.16458.16364948555678328368.b4-ty@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <171184484323.16458.16364948555678328368.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.03.2024 01:27, Andi Shyti wrote:
> Hi
> 
> On Tue, 26 Mar 2024 21:42:44 +0100, Heiner Kallweit wrote:
>> Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
>> this creates the i2c adapters for the muxed child segments.
>> We can use the bus notifier mechanism to check for creation of the
>> child i2d adapters, and call i2c_register_spd() for them. This allows
>> to detect all DIMM's on systems with more than 8 memory slots.
>>
>>
>> [...]
> 
> Applied to i2c/i2c-host on
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
I don't see the patch in this repo. Technical problem or any other
reason I may be missing?

> Thank you,
> Andi
> 
Heiner

> Patches applied
> ===============
> [1/1] i2c: i801: Call i2c_register_spd for muxed child segments
>       commit: d33bd3b707f476efcb907a7fd3ba3352f49775ed
> 


