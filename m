Return-Path: <linux-i2c+bounces-15170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F02D21B6E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 00:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB5643007698
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 23:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D56333745;
	Wed, 14 Jan 2026 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuV9cC2C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2FC26F2A0;
	Wed, 14 Jan 2026 23:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432322; cv=none; b=UXWsLGopQOyGQ2OSC1fyOCJdEjB1DRSamf0pMnok7gKNXemU+Da2mv2x3D+7/Qi0A5vtJT+19EoolxHQwxnJcHeXv4s54Ts+7tFpZ13yuZakfkdvoMyzeVOvNFSUFfWBRvL/gTWPRM3NdPpkHICRCshynYyXkqoNtoiZ1ugFp3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432322; c=relaxed/simple;
	bh=8XB/D0JpDRvXAyzgdBb/JfDqdJiGXftcDUQwxJ04rPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iw89T2I1972dV7m+xrQ4pLveWNSkX27tPmyo/5KwTEH+ZLaNSKmTQ8/TAIVcC92C3vZ0kNCW6GWBm/67QzJiwJh4JDG6kwOEdDEpzJbkJ0XSjSl9KjQR11bdof/+ObYGfE0zWxP6KDFvvps67XXbAHsmgoD2mdjsR5GGVIL5cts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuV9cC2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEA2C4CEF7;
	Wed, 14 Jan 2026 23:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768432322;
	bh=8XB/D0JpDRvXAyzgdBb/JfDqdJiGXftcDUQwxJ04rPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuV9cC2CK8duvwodyE54LG+CRRkbGlXLREFuC01kExri9o5MzWHUrEzRLFD/U+XSE
	 497twA6+72SKM8ZKtMSWE1+72C4yp/WGvAjKKS1vr5zlit+ILYw+YeocEdMykmNHFe
	 86RXvU0MRZBT+ods2QEzS5Zuq3/fXFahVq7JYNjbAGv2P5u+z1xLCGMXk6xKWTSi2m
	 hOmzSJtSafrX7fznyVMZGQm5QzN8LmZgU+GKQsvlu30YbaPHKxtcK/1qw6nIyo2/P2
	 gX/073RNK10Xs1wygvKThcjkI9Y1Hg5iG41rGKfb+SbkYmaQWHsGphlM60tn7kFllA
	 2O5akDjfHVy1Q==
Date: Thu, 15 Jan 2026 00:11:57 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 1/3] i2c: spacemit: drop useless spaces
Message-ID: <aWgiV4E-KtVG3uDl@zenone.zhora.eu>
References: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
 <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226-k1-i2c-ilcr-v5-1-b5807b7dd0e6@linux.spacemit.com>

Hi Troy,

On Fri, Dec 26, 2025 at 04:31:59PM +0800, Troy Mitchell wrote:
> Previously, the I2C driver had an extra leading space in column 0 of
> included header lines. This commit removes the redundant whitespace.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I merged just this patch to i2c/i2c-host so that you don't need
to carry it around.

> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>

There was a little conflict here which was easy to fix because
linux/reset.h has been included in the meantime.

Thanks,
Andi

> +#include <linux/clk.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>  
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> 
> -- 
> 2.52.0
> 

