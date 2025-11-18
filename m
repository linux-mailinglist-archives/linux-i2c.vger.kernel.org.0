Return-Path: <linux-i2c+bounces-14151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37448C6B014
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 18:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 314D74F4588
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 17:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7B433C19B;
	Tue, 18 Nov 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="G9RPzdtO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6333C198
	for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487173; cv=none; b=GiiOg953sXwhusZ6uouww40b/miBxTfdFGiPHMjnn5wq9NdM3O1CVuJj3apbj/3W9hAL6FfHszk3nULaosPdeXMCEIjB0llg1iZKcWJPuRJ8u9rxcVw1RJrGWx/HNqhdylhCeZiZIJh0wA85373FkdCZ4Zn2DqPUqr5h2N0TeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487173; c=relaxed/simple;
	bh=xsbCHfdfJS3GyOiFBe9tPYn5s7T1RShrdeMH8RFRZu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdxbN+B/YWlqAF9Bv36YSd/Db6CkJSuI5PRslo1LrVWjb16au+vvbYlQdmvq4VFMOE0wP/qyO8bFYUoMUdu5MoTi+T+MBTOGOmBVtCSc6pJvAgLmSGoEGMw6AVEmmeufw572tf/wljJ0BSkj6r8hgKMJulO01Fft9oscDIHCFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=G9RPzdtO; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-4335726d0f2so21189085ab.1
        for <linux-i2c@vger.kernel.org>; Tue, 18 Nov 2025 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487170; x=1764091970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=G9RPzdtODoGFdSXIdHiw+2/9xNd0/u11waPmgyfh/5wUMM76KYiHU2G/o/OuokPwKy
         3jltB7RDXy0SderdHBlqX6GFI5xOdiJuwm/PZaUV4ZRK6s2G5VTSVhVrU9nPNAD+yQhs
         aaUTwoNxdYHde7x9tjqCJdmFARZngkdN7qpN3MWn69mSbKUlIS5Aq6PaFZgyRptdCo4J
         baKBt8MgTDWKJjFKXOPBwtvX8nrQDPj4DZYyncWKf9N00yO5EegIyCmT3UvbeUU0BSSY
         fAUGH3aW3Y5Wthex54MBkjItzhb1pqEnrCzfMmsY47ptflsRvQwfCswdhy1wZ398g7+T
         xH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487170; x=1764091970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qi2g01Pl4HghpEkqiXiXs3PDN1XWinc+i2ynrpZ9eb8=;
        b=Ht9alQIQKyWkCXeJYQ191WUC9eZOpSELn2jSgQLjfeHGqZ+WXusyywsrhnj3L+BV8O
         QZnjxipuaXcu3OS9aWjmFpVFmNogZxtTPn65hUEvOwrTKjGeO+pu6dMVunTyAGO0/jN1
         71NU/HlsEYimP5D02S3qhqmhJMaDH+VdongI2qa5MLCFyeWeAgCsri6Fn/LO4isqLiB1
         /+9rQZ8W7JUGD2JqeOd7isxKc97u/x3fuTH4rjTke34vdiE04rm9HL3dvBC+fsZF0CNd
         bZqdBPGQDw4R2fVqjonWNn/LGm7qYcKLSwBNJBv2djPd6EnzF9qC7KF2Ubm3apwfAM88
         oVlw==
X-Forwarded-Encrypted: i=1; AJvYcCXq8DKt70xTZap/6YuPFovdkEIs1llXQz+j9wwXJAOtg2k4L8Lz5ENBeqUkJTO4KQ7Vb5nUKjFu23c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAfw37pyupydnXHIvm5SE3R+FZ1K1LlqB8/iJModq0yGGn0UV
	KQDY2G29GqUY7lWPtAmUo+7Z6uCnV8hku8oXUtqmKkQ3irlA8DkvDAgTpc9TMFsWcKU=
X-Gm-Gg: ASbGncs9WfxpOg3O1dSy4b/hNTt/Sx/oBKDEEBF5OiTjKxEwFEMcL//GgUzs0uhvsIi
	u0toBjV5j+w1ntSYDNiu9oVfL3ESZYXLD5Fzj3fF58qA773xCeVeCu0ul+sAENBgVX19exCMxqP
	rYLFxefeNnhz3woYKYcNK99txdGXEcgMyBragA8ycvBk5/uHWkSi12zMRAJJxH7c3dDWrhqeLEU
	ct4Xn+zN2XLaZe0MnzjTXdYGk3bG622owpJ0NUuJ8hfn9EYn1qZPOpFshAi46McO2b/ET4Mix89
	rNyifDdrTdq/9aXt8jesHxPSEQu6ZRvpu65BNcR/b04gCaiSiZ7qvT6KNJcpqnjWqi9dz92NeBp
	STPcl0/qX46+muF+9v8DFjL7jtOB18jT++ArlfP0B0Yb0fsGhCSaz0n2z9BKvBZo4d7TABfKo00
	IA4XHWFk/J7W8EbcCnvvQYUo7HcAaXlT3OA0lOa61ekXeTqn79OQ==
X-Google-Smtp-Source: AGHT+IEvjf8wjHz1IDZuMlpDmRvZ1PR2gWcJIHsR0vG4NMPKURJNCf3jErqqY7OwlQvDOA+3W4E9nA==
X-Received: by 2002:a05:6e02:156f:b0:434:74a6:4907 with SMTP id e9e14a558f8ab-4348c94e271mr229950765ab.30.1763487170478;
        Tue, 18 Nov 2025 09:32:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:49 -0800 (PST)
Message-ID: <4e8ef549-9c31-480a-a88b-5704f9e12bec@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:49 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.

In particular, it looks like it doesn't depend on I2C...

> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - modify commit message
> - change default value from ARCH_SPACEMIT to MFD_SPACEMIT_P1
> - Link to v2: https://lore.kernel.org/all/20251027-p1-kconfig-fix-v2-3-49688f30bae8@linux.spacemit.com/
> ---
>   drivers/rtc/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 2933c41c77c88e60df721fe65b9c8afb995ae51e..b392e6d096ed077e841a2e68b70d8b80d9ad1cde 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -409,8 +409,8 @@ config RTC_DRV_MAX77686
>   config RTC_DRV_SPACEMIT_P1
>   	tristate "SpacemiT P1 RTC"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	select MFD_SPACEMIT_P1
> -	default ARCH_SPACEMIT
> +	depends on MFD_SPACEMIT_P1
> +	default MFD_SPACEMIT_P1

If possible, this should maybe be:

	default m if MFD_SPACEMIT_P1

In any case, this looks like an improvement.

Acked-by: Alex Elder <elder@riscstar.com>

>   	help
>   	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>   	  This driver can also be built as a module, which will be called
> 


