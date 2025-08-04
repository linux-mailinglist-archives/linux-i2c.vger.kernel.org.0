Return-Path: <linux-i2c+bounces-12142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC33B19E1F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 11:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A2803A3407
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A574923BD13;
	Mon,  4 Aug 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iV1oOM2m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B596517D346;
	Mon,  4 Aug 2025 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298142; cv=none; b=Tda1I6KGpWoUnmaAx3KildiUIGDyMHKPkbLGhAOB3wcK6Ftk/WZMZPrfbtbt84DUZ425XtRrUG0Ddg4UU54xs+Bd/BeeHyIzj8RCqqqDcIvKFPRp+GQFCIlqP7xmE/A2VYWmGcub/Q0G6Wrk1wNBDTSOjEBpuJoh41Q/Lc+d6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298142; c=relaxed/simple;
	bh=pBkKwyaysTI2tNSOJlV8HJWUyiE4eecoZ3LwUDB9goE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFCRt1JMnU0dKFmGZ1jEhxTyd0Nr7PpDpIbeUAzKb+/3tx+50UMxuhFJvlkDzEvZKLA4eo3yO6BQ5nWoQRIPYT1rkNlfztmgWVtRoxLltUt7ToOOepm7n11ipBKapg2HKQb80IkcGAGWJYjbY57ZbeNZeBht4AIHbWDRMZ9yXUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iV1oOM2m; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af96524c5a9so121995166b.1;
        Mon, 04 Aug 2025 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754298139; x=1754902939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMarMyQx0dw4VTpe/KpEJ2eJd5u+1X9ZMvVB5mW57UY=;
        b=iV1oOM2mUDgI4PSrN4Os59QlqmZEn4+u5yP+fZyAC8vYNq21fgMgFDZr8570XINyrT
         BU7jKETxdkJTMeZJzY5cNY1yOa/TJAUPCV9CsV8zFP6pC5nRF1HB1NOUudwCDhzAZEwl
         k2gFIJYnoDiO88BQxCdkosL/6kQpM3oKKKuoQMzU4qMR29/d2HeIIEAmIsvNgMxRxrQR
         mUm+anUvwhMpxRbkHHDrnn7R9aXJrtLGciJ6UWmCrYPoj0D8P7ZxfOR3VoBFjymCSXag
         0YDU7oG91jAwtJgEjr/HqR6+jRVXWnbvJSIFH02jRJ694sRi7ZfwT4DTsY+nS/phSDZE
         O3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298139; x=1754902939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMarMyQx0dw4VTpe/KpEJ2eJd5u+1X9ZMvVB5mW57UY=;
        b=qayZlquZ2tfUFwpjG/76Vkf+vLbh3pdJaakeWUom1Ar5AWCkGopifjmZsP/O5ZyUVI
         uYxiDVwb5GHhAh9qOyl/7NYh1/YK0vU4lqqqUliQG63g6SgOVYbzIj8Rl1ujEYT9XRN4
         YxTQkyRrTvna26lI6WMB2tc22yOSQwp9koZNklGEKeGCjXmUYUcGttNLXOEMwQaFLJpl
         bnOOBgKkr+cn6i1nHgRnF4Jjr1m/kacStEgILd7aNEOYwbWZue6l6vkGPNrIWhhzwxI1
         wzLxuXYP+OXZ+0mfr9hjpsxzNcaNlVqOMitd1RanjkI18cViwFOkGGS6bPFO+jAFurwb
         Ooiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgpiGuL4KWuGSq7pUqm5JqKwk4INCb9gAKyvpVGZZ5IXNVkz25has0fntHFx88PucLJXieXn+kWPCbhg5+@vger.kernel.org, AJvYcCWUdfewBirtcnMEBPan1jRMmm4Pw6Nuep2AXZATosZJpPL2o7mN9L1MAiEiEHSko+alNkhOE3OY2Wjf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd2fYfN8Td4ifwrMbbpNWyLVETU+tJo3zm7C4OyF5I+rAtfjUf
	UFw9HDm0f3zoHSi9AgE9SAbBhpWDeo/uV3tdJGVNODT2OAdAD/sEdn7o517LeQ==
X-Gm-Gg: ASbGncswPSXKBT0QPYDUWuyID2S2K2HqcxImnoEk7Cozg2b0knV0Oiz1EjPqE48sLQB
	OrCY2ScfY0Ysdf/6tdFKYDA/M1FFuR7Ll+kZuY3aWyS3IqyAaVoI8SNfd44lTy15yBiNdyzC1tl
	Yxmzq29bjHkB+pJcHtLfIcKvwtOSYDxE/LYezgXkY2o4yELgeEobMeid8ob1bPztJw57Jev+K3v
	Qpdt2TQ1030ht2pmnxV9yWMz92x2YQJH8uw+jU7l93OivGEjGMGYtn32L6k4LELSjMU6dLjWXGg
	WbuEpUf8PGCzdvCSJSTYFKNGt9zD4iv8idWx10SneeU8kGU7ijp+YqTTNagnrexbQa0NvB5742N
	u02K8GJtRji8UHNtloT+D0Y4yL2UxedBVKe1ziZ9iLvGSJK9/glwmYtG0M6YSOfaqCcMSaXyqNX
	U8+CgIQf8JdbkHSi/kRPIdSQ==
X-Google-Smtp-Source: AGHT+IEpUQUYLFv1wDK6DW5cCKG+ayi+mhCPSNVKGBiR3YM5k3cHeZOIyab9J1PQqbnKwsdKUlYHgA==
X-Received: by 2002:a17:907:7f90:b0:ade:8720:70a0 with SMTP id a640c23a62f3a-af94001cb4cmr939119366b.20.1754298138717;
        Mon, 04 Aug 2025 02:02:18 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f109:3c32:c90f:30eb:29c2:ee3a? ([2001:9e8:f109:3c32:c90f:30eb:29c2:ee3a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af96e2bf721sm93853266b.52.2025.08.04.02.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 02:02:18 -0700 (PDT)
Message-ID: <1f1a4185-0995-4bee-a45b-2e9d329cc90f@gmail.com>
Date: Mon, 4 Aug 2025 11:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] i2c: rework and extend RTL9300 I2C driver
Content-Language: en-GB
To: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Sven Eckelmann <sven@narfation.org>
References: <20250729075145.2972-1-jelonek.jonas@gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20250729075145.2972-1-jelonek.jonas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 29.07.2025 09:51, Jonas Jelonek wrote:
> This patch series reworks the current implementation of the driver for
> I2C controller integrated into RTL9300 SoCs to simplify support
> extension, and adds support for the RTL9310 series.
> Goal of this is to have RTL9310 support upstream in a proper
> implementation to be able to drop downstream versions of this driver.
>
> The first patch reworks the driver to use more of the regmap API.
> Instead of using macros, all registers are defined as reg_field and
> operations on these registers are performed using regmap_field and the
> corresponding API. This simplifies adding support for further chip
> families and avoids potential redundant code by just providing
> chip-specific functions for every chip family.
>
> The second patch extends the existing dt-bindings of RTL9300 for RTL9310
> support.
>
> The third patch makes use of previous changes by adding support for the
> RTL9310 series, providing the correct register definitions and a few
> specifics. This also uses a new vendor dt-property which was added by
> the second patch to properly manage the I2C controllers. Having this
> property is necessary to properly describe the hardware and allow the
> driver to correctly work with the I2C controllers.
>
> Both has been tested successfully on RTL9302B-based Zyxel XGS1210-12
> and RTL9313-based Netgear MS510TXM.
>
> Compile-tested with Linux, run-tested as backport in OpenWrt on the
> aforementioned devices.
>
> --
> Changelog
>
> v4: - fixed an incorrect check for number of channels which was already
>       present in original code
>
> v3: - narrowed vendor property per variant to be required only
>       for RTL9310
>     - narrowed usable child-node i2c addresses per variant
>     - no changes to driver patches
>
> v2: - Patch 1:
>         - adjusted commit message
>         - retained Tested-By and Reviewed-By from Chris Packham
>     - Patch 2:
>         - simplified check as suggested by Markus Stockhausen
>         - fixed commit message
>     - Patch 3 (all requested by Krzysztof):
>         - use vendor property instead of generic
>         - add front compatibles to make binding complete
>         - fix commit message
>     - reordered patches, dt-bindings patch now comes before its 'user'
>     - properly add device-tree list and relevant maintainers to To/Cc
>
> --
>
> Jonas Jelonek (3):
>   i2c: rework RTL9300 I2C controller driver
>   dt-bindings: i2c: realtek,rtl9301-i2c: extend for RTL9310 support
>   i2c: add RTL9310 support to RTL9300 I2C controller driver
>
>  .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  58 ++++-
>  drivers/i2c/busses/i2c-rtl9300.c              | 231 +++++++++++++-----
>  2 files changed, 218 insertions(+), 71 deletions(-)
>

If accepted, this should be merged AFTER the recent patchset from Sven [1].

I'll rebase this on top of [1], fix outstanding issues and probably propose some
more cleanup in the next version (because I'm not satisfied with how the code is
currently structured).

Best regards,
Jonas

[1] https://lore.kernel.org/linux-i2c/20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org/

