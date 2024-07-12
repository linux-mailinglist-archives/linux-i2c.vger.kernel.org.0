Return-Path: <linux-i2c+bounces-4963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5795A92F8D4
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 843651C21F0E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 10:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EED614039E;
	Fri, 12 Jul 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyHfZcvC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5467116A93F;
	Fri, 12 Jul 2024 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779671; cv=none; b=F+1jdvcezh/SOsKRtPTNqsuwy0bT92zJ0B0fMSXDbnb5/hszU73c3Ltj9i7UTpFGMEecQP8Hu23/QzdlampZw6FKqI7N4MzlXYr3NpkTSJNhPEQl/26c2KD3M71mPfEbG0WRlSUTZWMk2VzRTg7DE7yvQ7A4YVYFALX1QqgtTNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779671; c=relaxed/simple;
	bh=9st9u7e2cOLLQ/5LBWYWeIb/6hhcja9HdeGWYR9Hszs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogTJK8uGO4yvumettAHo9k58swnyeROZjgVsvfuJlUfKqRkzDdoPxvmSBl+jnoXCFpko8hRy5mRuLpjkvVzarCWhKMhXiO2pGMPNccF/AQRoXlwbXAgmeQ+mM0ZI+6erTE7GB2Z4wuT6kpGELFX3xpRGlGE9K8cHCPaNSsM1WWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyHfZcvC; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so2310417a12.3;
        Fri, 12 Jul 2024 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720779668; x=1721384468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zXCrqhsCQcvrt5chjxptgCg8UjbKxV4LwdMFaqekb6s=;
        b=DyHfZcvCb3Ls86Gx3kCcWPnKyzd663JJvcD8IalfMjLPIiOcAofnlVuRomyt46E6Jn
         spC6kS1WljdVCeQoj2Eno6S0Vab6SCj49j9UyMRbMww4g3ts/7Db2culz1PFxQIdDw5d
         /vLkjqaAr1wnyXGuk9GCkFztqXw8s//DkBUwTVNgGGRmgHV2450zI/01FlgZb7jwPIeI
         r5cJu8+yfiuFYoqidMDV19kiSn+CBfZ+z5RWCA+3eFKgmC0mvqNz1lu8+YdQVD4fHYsg
         FTe2ktXVdqaAi71/P2a1cPpPiDIxMXJPux+d9w+w8XW08mKvJCNIa5qPnxHKOONP7hRo
         Sebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720779668; x=1721384468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXCrqhsCQcvrt5chjxptgCg8UjbKxV4LwdMFaqekb6s=;
        b=DnD/+eGLJQeO3vekRf3pFROCObRCVoEAcxdmaCCsG24O/ALgA6OTKvXaNpohLqDuYr
         JYkGkscSLXhh/70wKq6zemF19DnZJhbkiRaKVFpdjNo9Lo0xYliIUbJW/T9JRqrzBpZk
         JKwk82SktZ6pRrFsSHUkYExNbZahhyABUzIxx31WOHfqeyYJEmHhlLR6M+qI5xIVnG+s
         0YPcKPnqWUU15gTIrbs6lMR2nP/xRJGz8fyfy0S/IyHDU3pkKw5pFVog+Vtd1TEUskcb
         wCS03B7sjqCEmThIpfYXZw5JdqnfMyUHiiepBvJbOYrJc4e0mIHX5ZpQCmez17nv26nZ
         9wfw==
X-Forwarded-Encrypted: i=1; AJvYcCUaaFtnyG4QoeZZyx7xRDVO65qO+Jj40+hIXlsQ8dthZlPYPVPyiChdiAsZKV9Qf61i4Lc1ZupLEQ57h017okcg9iVf2y6FGhOskYL3
X-Gm-Message-State: AOJu0YyLt1UnlL5tC6E+xCAYM4p2/XS5Ht+QLIjXHPJzklvgUTWcjoTb
	iF6Bc3B7yCwRyyOf/QGtGp+Wmw5L1n2gmSKuO2Cn21pAA+z3wSMq
X-Google-Smtp-Source: AGHT+IGS+kl661mXk/BuY/3giibYBa8x51k4GNmsJhXImM6VhWUD/puRZ/yRIeX4frRZZ0S1h47P8w==
X-Received: by 2002:a05:6402:4316:b0:57c:a77d:a61e with SMTP id 4fb4d7f45d1cf-594bab80111mr8136375a12.7.1720779667359;
        Fri, 12 Jul 2024 03:21:07 -0700 (PDT)
Received: from ?IPV6:2a02:3100:94f8:3900:401f:db36:ee8e:80d1? (dynamic-2a02-3100-94f8-3900-401f-db36-ee8e-80d1.310.pool.telefonica.de. [2a02:3100:94f8:3900:401f:db36:ee8e:80d1])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-599a00b6bc0sm625670a12.34.2024.07.12.03.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:21:06 -0700 (PDT)
Message-ID: <97cf818b-f72c-4461-afec-307ac98d2bf9@gmail.com>
Date: Fri, 12 Jul 2024 12:21:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] i2c: smbus: remove i801 assumptions from SPD
 probing
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-1-9d1daa204983@weissschuh.net>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240709-piix4-spd-v3-1-9d1daa204983@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 19:35, Thomas Weißschuh wrote:
> The check and warning are very specific to the SPD usage of the i801
> driver. That was fine as long as i801 was the only caller of
> i2c_register_spd(). Now that piix4 will be added as another user of that
> function, the check and warning are not accurate anymore.
> Instead of introducing a more complicated calling protocol only to print
> a warning, drop the warning.
> Even in cases where not all slots can be probed,
> then at least probe the 8 slots that can be.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/i2c/i2c-smbus.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>



