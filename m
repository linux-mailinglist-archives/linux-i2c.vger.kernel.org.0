Return-Path: <linux-i2c+bounces-14807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D9CE5A1B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 01:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 164DD3006634
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 00:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18961D5CFB;
	Mon, 29 Dec 2025 00:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QIK7gcPP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45A487BE
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 00:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766969795; cv=none; b=hTrFlLQD52RtaBgqdrdaVy+8xY8hdmPKUchtyT+qa8oqXQqshXWIgq/xoW8NmZ9wXkUTsrsHSt7bc2P36+/qlbt5QXDTKhe0a7Mk65C32tFI9YQ1gHPLDzxxOp67UeL+v4pCRkLZ9L8MXTgmE+jnF3ZXY5nIe0hVsd3VzJ2GxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766969795; c=relaxed/simple;
	bh=R7P3tj+3DpYdL80hTXevwIvi3bBtH27nXSZVF9DjC2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gApSkQpVcekP3bR8TPMNpN00F+6+gcy+lMnnyz7+qXlYV3roINI1m9pplt1kzTEyciYiI2THbj1TyTivU+zI/RxS1ETPQVu2CZ6a9tIk/TFtHl+gnAdqDmXnJ7AXLwvDAJjllnR4C7OK1t35prde8df2suc6O07UaK99Y/Xx4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QIK7gcPP; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2d6df99c5so927185385a.1
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 16:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766969791; x=1767574591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=QIK7gcPPWiquTzTh1g/px2xQCgM66JToKoh0/jdVuxjzwNLCMMhEdDYRxlgE80P0m/
         /d7YjWMY4Qjdvd3fhqEu3k56pjcVh18yqvKhXaa2EclBwFk4Ws6hhPOI/emCR6AEOs+o
         IoeWaN+etoyU7A51omVuD37lny3hGxD4EJRVA7z2SD2NejGwZegPXG4zoGgwaQEyJgFt
         i1ZHHIU0kGc4d4W9poBUCgdaemf/fEg7GHIJsZFDFDYDLmAlsbzlCzbQXkISzriOdgxg
         OdWcdLgLfwnjC6/jia/zbKRF26DCLEQaRTgWi9OdKe3QpKyJcdURa0QkrakOdNvmOsHw
         3aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969791; x=1767574591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3484aXOa9txdLCLTZwQ7/4HtXoJEgnjLB1QM4Bm42c=;
        b=u/3IZpdu4q7BogLyvuDr+1aucQW/HN85geRC2VFPO6jyYODa+f95T+44YWpbTWip0X
         QpAOVMX3Rb5ZGACCQhjFP19R2j6llIEecSa9YD6VRxL8tb1gBBb1MsMAaGexIl7o4d73
         6zzph+xl1N80wy5FncB2oBQ4nXu5M9ifHf/1GGF/DGuNPSCMufddsMSYcVFTBWgZilw7
         535GBAtd2gSyb99WUDkgKiukY3AFyiQnitVngnFPEiza8vIhF8IdIsJGST5sDNYpzqbK
         vnVTDsN/mfSTpgSzVP1NmuwN8YVfzRLUZlpnbTlreNi7bXOyNo22cwzOAnYjWHOc4jWb
         fvsw==
X-Gm-Message-State: AOJu0YxMr3BWobB2tXGi1KrnA/Vja7n/k5ZkgSbO51MlsI+HjqWT547E
	lVt+pj5QkhfAp1OIXZBDtBbU0lxT2Spt3uX8R1+IDqdMinbt7yivzlAJdbkET6NDQGE=
X-Gm-Gg: AY/fxX6xVhHkcGV8+lZTAXUZNj1Jry6fhxkMw/U68VQJTUv/JRh5pGvKttov/pXYhiQ
	xts5REJg7+eWlOAd63lI/dn8+/NbKm6P7Rk4jp8XUclig5zfxc/qtaK9HUYG17FuYvIkNhl7ncM
	5f11qCfJO090oaQlBxM1RERd3AtpAQhrsiGluWPpmBa0F2Bgo4jxeaadQxoOYag8GpeW5YZv5Qh
	XD4K3G3Y92oD5MQgpVZ1gZtou8Adjzhbt86f/MZZo8yKDNi9lGU6NxWM7g5nYo7wRlRwmE9dLDO
	SxOZrLiZ0WWjcVYdvXqPqil8sFkwaVlD2nfhcXqU1azOGhDYqXpEl++EEjzp3SSPA+gazjIWEQH
	vtoDQY0m5nII2xHDmAzMGvdofBSaVfHXK/auNotkem+86G/ESPXuAx6c7L2iAGtkc6/hYJul46N
	G7+1wZEIxiTlBKfMex8QRAoskX5ht1/TFoMclj+/95HzPt5r8DN8E=
X-Google-Smtp-Source: AGHT+IENzT1DKL1F5+uqdNfJ9tGhxzUAN82qDRGsR1PVryT+X+ZT7PyJmy0IlyTNV3YfgZM449EDXw==
X-Received: by 2002:a05:620a:4055:b0:8b2:eb79:d37d with SMTP id af79cd13be357-8c08fc00228mr3954919785a.4.1766969791407;
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f08fcsm2275235285a.40.2025.12.28.16.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 16:56:31 -0800 (PST)
Message-ID: <a0c9f9d0-6453-44c0-a5b1-8d1b501acfc9@riscstar.com>
Date: Sun, 28 Dec 2025 18:56:29 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] i2c: spacemit: drop useless spaces
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/25 2:31 AM, Troy Mitchell wrote:
> Previously, the I2C driver had an extra leading space in column 0 of
> included header lines. This commit removes the redundant whitespace.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/i2c/busses/i2c-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..30cdf733deef264061c8ea565634c5a17f5aebfd 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -4,12 +4,12 @@
>    */
>   
>   #include <linux/bitfield.h>
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   
>   /* spacemit i2c registers */
>   #define SPACEMIT_ICR		 0x0		/* Control register */
> 

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

