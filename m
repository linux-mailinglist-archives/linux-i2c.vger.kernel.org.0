Return-Path: <linux-i2c+bounces-11461-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB29AD91C2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 17:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DEB8167FA7
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4FE1FC7D9;
	Fri, 13 Jun 2025 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5jH3+zO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3931F0E24;
	Fri, 13 Jun 2025 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829473; cv=none; b=R9p78ZYS3MjBVqkFlGv2+ShXDLx4DUlANrsgttj+pb7DYsoJTDzADHvIqNeRc/qXfGgi6B1oa+L/X1WpCcN0uBeqkOAd4KF0QG0JQkUZ60vopOoiuKKCLJvaZAWkdBPlzsSHp07FmKJhjxviXd1B9ImMtEjeZHaYu/Qr09DXmpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829473; c=relaxed/simple;
	bh=cNXTOY+jw0QaNec5Dnl+hrHqpRXE5eXNgvUeICWzwy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0mxhTpJ3adQXlin/g7RdVXSgOdobdWFgbZ8NtYONHVBCut7D6dpPscbf956MiW6YTnDbIijHB4gG9J73L0IFX4OKrxeutnyBzXMzoOJd8/Bxpcutdlt4gqxwb+RbMe7sB08apA+Gj5FWIMIAZ/daNuhME5kA8anmmkfc9UUnkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5jH3+zO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1780691a12.3;
        Fri, 13 Jun 2025 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829471; x=1750434271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqIM8HZnplhZGKcbWU5pZbbMLNhFw2iwzIjxpnBgMKw=;
        b=G5jH3+zOJodCgOFcVJ17BBCjowEm6r+x2SCTgJCTaV+P4mK74Nkzbd+9pW/VvlEw2k
         al5xrPzlzODXp+5Ycz5UAQfAycKndF0BD4WLYhnB6YmW+HNcxDOhfGFjlz0e7ZBSUXZ2
         gO01Ra97fQwr2yydSdQbnJAkhN/X7h8RgKSCNagPFXqIv1FxgyhD9hEZJ6DJlPdA1kX0
         tZeKTI0Jm0GhyMxQ9Zai+JRe8eZ14jrS+4omHEBVOshifk7GJncunXHYw0b8VfZg8MTl
         VQz+68e/lwz+Be5lm1YtJ7oOiqLAMLy51wfowPKkfA053NP5n4n96YvEDfoAB3Azut6y
         ne1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829471; x=1750434271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqIM8HZnplhZGKcbWU5pZbbMLNhFw2iwzIjxpnBgMKw=;
        b=td4RW7vGhws19VispMbuFkEYyJlfJqlVc9eiDcBtmYF4gWpO1OXnN9vTBzJtAlf+dg
         MxuxGnjvYgbrc/iEjxkPhpRXe8Crhj6dxyoMHzCcr8ssoYokCkjmOUVPAxMYzzoIBz8t
         YvyHA9BYlr2Tp/uoKAfk+/KUWymkiXDOJ+TQ1pHOoYiQCh+2TqWxqs9CaoOYkEyP6KE0
         Y8kRn+ehxMuc2mATIHQxmJNF/adI8tNwU47dgbohC3fnXKrXa+QFp8sWqEgzMcWED09F
         5jb6e6DKdWCngU92LkOo+txChfLmH9kMlIQfpoeBfOqApuQtntHNxoQHv9hsjsL9gHjT
         BN5g==
X-Forwarded-Encrypted: i=1; AJvYcCUgfdrW6wM63E/lz40zimSIET2ReVUkFiwthxzwP+r7YgSOPuJ5jeCF45eP7ByjIiPa4hyPA2a1191uVoGv@vger.kernel.org, AJvYcCVEBaivHBfYrmrT7/MTdsVEYpTm9gcr3T8S2orEb28bnceNBwJah3LbylIqa2Mk1glEBv3/G+W4XEIv@vger.kernel.org, AJvYcCVOd3HrEYyCq1DrC/kvNztuw5775zOKC8WCE8saSwwsw55RQ0Oo8GM+51NCqHSyfr0haavVgQ+uTwo=@vger.kernel.org, AJvYcCVYTG0tGTOjvPBZUvvHu+XEorhi86s4FcGtAVNOeBZmvzzIryA38EeexwPqi/9wKzqS9mx9Zk/vu9s=@vger.kernel.org, AJvYcCWBnkt3IDlM1A2aKjMg5tjw1Fke9ifi3WlodaE6Bd11YvJH7zoacBPn5nbgNEEMo7gPCIcLKzVpWKMzbKg=@vger.kernel.org, AJvYcCWZUuaeUP5NhX0gR6eDGaZ3OH1NlRh/EIEydJir7BYj0OwRrSM/L2HgGyGxXwGCIbrXxOOsq02AWP5koYg=@vger.kernel.org, AJvYcCWpbMTQpXNoCKXvqFBtLNFTE1FfcwS9+ybAYWeIb711zSbM1+F4XkQkbGPrL8IQkDz91hpmrjje1z87@vger.kernel.org
X-Gm-Message-State: AOJu0YwuyoYAJ9wpMXcuTVLDymnj8yS0Yz1UvfN20j75Izg1AfqSn7cV
	CRjJu8WJCd4aryVgEl9+R2V8ysnXDaTSHQQly74vN04vMNV9XXM3fyF5
X-Gm-Gg: ASbGnctiKpAKgQoPxrlhQF9zJoHuPJ4ppz5TqKJX2o6UWI4g+ECLRoVD7HGoF8ts7+z
	czrJ+vvz201nNy281HUt6JAuxY8ftRao3tXWx6pxwpMeT8eQfzQ17oZbMDN9h5QligdHs/B/Ef+
	RpQGNtk/auwsUiKQ3/32ZUxLl54xWgfIcivhbHCNA6zopjmpq+n7y0311/yFX2wlvEfYYUwZpr4
	mdSZlBB7mtNs7rL1AhFfmwWU/VfeNkPhEiGupwjOWuRuFPxpJieuebmRGukzl29KoiNUwwy4gHv
	26wtjdPl4fttkUZrpWguxFxnozETGBpjxRWBMmvOLEIZH6FJ4Dkq9aYEzszS4NMfm0D5cTg4Jd3
	34RIcxfz0NOQL6D3JrW2M
X-Google-Smtp-Source: AGHT+IETWJC1IioWtKneuXgORMThHBGBuRQvos+ZKLhO3L/RBVH0UX1pCYDwIQm0SyCgDHjVsMUOBA==
X-Received: by 2002:a17:90b:350a:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-313f1d58ba9mr197515a91.20.1749829471051;
        Fri, 13 Jun 2025 08:44:31 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8fe6sm15767125ad.164.2025.06.13.08.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 08:44:30 -0700 (PDT)
Message-ID: <b99e93dd-6cee-4c9f-83a2-faf66828f6cd@gmail.com>
Date: Fri, 13 Jun 2025 23:44:24 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sven Peter 於 2025/6/13 清晨5:11 寫道:
> Enable drivers for hardware present on Apple Silicon machines.
> The power domain and interrupt driver should be built-it since these are
> critical for the system to boot, the rest can be build as modules.
>
> Previously, many of these drivers were accidentally configured as y
> such that this actually decreases the size of the kernel image:
>
> vmlinux 163628520 -> 163330632 (-297888)
> Image    48388608 ->  48384512 (-  4096)
>
> Signed-off-by: Sven Peter <sven@kernel.org>

[...]

I think you missed these drivers (all of which should be m):

BACKLIGHT_APPLE_DWI DRM_PANEL_SUMMIT DRM_ADP NVMEM_APPLE_SPMI

Nick Chan


