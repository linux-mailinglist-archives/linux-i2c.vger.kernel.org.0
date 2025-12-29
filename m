Return-Path: <linux-i2c+bounces-14809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377DCE5A21
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A8B23009779
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD891A8F84;
	Mon, 29 Dec 2025 00:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Q0Znj9Xy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F01A5B84
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 00:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969802; cv=none; b=WwLhyLwLNf6EjLzR935UhotsFc7WnVUNFzgwrQXxgyprJ1wYYXKGGUiSul3/gu00Rv6XVA0duKWLPO30NCOF8ZchgqNE4+l/va7fb3r1/TXwWcjxG7RsnWjugy4U4iYrtCqfJyrkHlTqKHp72U28YuW6sHom3yOLuZws2uvUOX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969802; c=relaxed/simple;
	bh=v9oOvjyAlBRUlSFD3Ik/hUyGuidHyTn+MG0ZyLe29Xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnriSEt3+CE5D//nNaZpgR+ndyaNBRof1AtOTMF+bTekMhEnZ4MRgf/aLqa7qOvbdPOTuXNyA/u/DJFZzHJkO0lWwWjY6PEykvr5+DLB0n+Pc/7lee7PD3mFtRGUqL//+GWEl6/apCSrEwoZwgszaGLCEYwS+6M+qcE946O4ioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Q0Znj9Xy; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8bb6a27d3edso869610685a.3
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 16:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969799; x=1767574599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=Q0Znj9XyJ3ZBju/LXpDKZ14ZG1ef6vsb0lIqx2jQKMLAU0IuOiP61wvwryBsyewZHp
         fWH/D9PrlsDA72toxP0ibQmgOd3PnN4BNgrR+l0V95a6FxAr7vY0MgveZXj74Nt0aUZ7
         XlmYwXs9j7NwVBsdWCk7xjGFBITcoJke00bn8Gy0gJHyGPfoEj67JuvSUdeqCTUcJy73
         w4SgLoIKlQUcvEZu+z0svZk8BV334z0z+tdaAGLSk5EajWwhiBqSQU2F54gbexXDPo0V
         ki6tX+wQP4Tp+Y1IOq+8FcNrbzhp4TsdIvJaw1P18RddhL5AN/C2vXOjuPgkhSRH6u2H
         G4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969799; x=1767574599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5YcKwFkMbcJ8/aWNC56rcK6ZT2Jj+wm+CfNyGhVwCA=;
        b=pcXZhQD6WFe34i+XgYCQh/z43QfnQrs+fWJ/VpPFLrVukKEkwoTDSQ+JSaxN2gH2Cy
         I/5mdIv75Y0Z0qDaWdxnVN9UJPK/vbOv0uF41Tc5WcWTOwNz884/0SCDyXKJWNZo8pSO
         WmuIa8A2DvgjbgWk6QZ0YO4zaWNBpMFHWdoIT4AspUBAgc4kPU6XgtzLI9edUcoYzX7K
         f3IfkZzYsdhvw59UIHNQPl16swC+jXNj8gliNY9RuJpMto3kmZP7974N0mWc9Jcv09aB
         wLHyaQBVTgMZEFyZnd4Qit1tE/DIecenfr+aa1jEsQZlUUf44RDPxV7dA25rGAL3J5L1
         eRjA==
X-Gm-Message-State: AOJu0YzhL70j4ohMH1EGxqXtdsZl7nZIaZEDNu6r4PYWz3z4wktMbZqj
	M81clQyKbqpxnfBv+mrIHhy8IQtHYBJHqrL3B3bqL02HnQcgzok0o7LKTC3pqABjvUc=
X-Gm-Gg: AY/fxX5VeqXjV2lTx3b3mPxQDc5tPgW2dc9BgznAjKwzWxKL2Ft+hEsG0ZsYsakaVYn
	O4o7ctzAB0z2zfE7RDaNr1v9Tr8MnlzPQZGWZNLMao2ogsJ5ie6+wrXuP/I78KomyFezjSmSmal
	c0b7cbUX5Nidv1GYBj/0256fwxXgbQipywoMcA40waCZu/0EWffgoUp1RWsTd4KSNe5D4Utk7tH
	6tr0CMPf/sye3UPP3fDgWwV5hdCOSUEg0KpQo/b/VVwiWMbTebJh958LbKLUeGYrmNi3IV5bdUV
	2rhaAn1a1sA9xXn54h8A/tITJlTiIgnI7aDRNKk49/MqHaEdX25c1yJfg5YW546/acl8rWFej6F
	ZUOq3agSWsHdsc8VsBfwtnG3/Z/zCu9dikh4GH75vmSoaIfE/skzwZ5vCoiuOP82c0Dd+0XzkQJ
	6d8IJrHGzBGRiWVfB0rQIMCM4kGu4Jln4nQrMjaWIgeO7CzjOhMOA=
X-Google-Smtp-Source: AGHT+IEX3O6y7wxbcIj6mJ9uEHV/yCicWvg4d6PHddWSgifd55NeGPWTFcT2cuAr4CpJraSKfFGlGA==
X-Received: by 2002:a05:620a:4489:b0:8b2:f1f3:900e with SMTP id af79cd13be357-8c08fac0b38mr4258385485a.62.1766969799303;
        Sun, 28 Dec 2025 16:56:39 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:38 -0800 (PST)
Message-ID: <b09d6add-40d8-4deb-b63e-31adc9f327b1@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:38 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] i2c: spacemit: drop warning when clock-frequency
 property is absent
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-3-b5807b7dd0e6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 2:32 AM, Troy Mitchell wrote:
> The clock-frequency property is optional according to the DT binding.
> Do not emit a warning when the property is missing and fall back to the
> default frequency instead.
> 
> Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Any error reading the "clock-frequency" property will simply leave
i2c->clock_freq alone.  This is good.

But the lines that follow this issue a warning if i2c->clock_freq
is 0.  If it's optional, you should simply use a default value,
and although you could state that rate with dev_info(), you should
not warn about it.

					-Alex
> ---
>   drivers/i2c/busses/i2c-k1.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index f0c35e23f4f2e139da0d09f314f3eb0e0462a382..c829618a66a214a12b46d63bf06ba7947b9dbbb8 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -651,9 +651,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
> -	if (ret && ret != -EINVAL)
> -		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> +	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
>   
>   	/* For now, this driver doesn't support high-speed. */
>   	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> 


