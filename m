Return-Path: <linux-i2c+bounces-10797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A348AAAB13
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 03:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F77A3A477C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 01:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDA72F37B1;
	Mon,  5 May 2025 23:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8mrYBtm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50538E92C;
	Mon,  5 May 2025 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486122; cv=none; b=GNpsW5CzgqlVHmiwvHuwjLxobUXqQq0zhgLUIH93PZD31LLX0cHSFlcQ2x68sOJWUcrJB5b6f6bdLB419iGjszSbeftjgGD9vLSSfI0dEC+ilrHbByqr5ZobcMORibXDR+cSmXBIrbmjbmaqf7LIPEmn2H7mEGQoksukVv2EU7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486122; c=relaxed/simple;
	bh=MruHz70q8C4LHPMWLrcifiaLFqr0szg5KcDA46S/mnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF3UAilCt1HdSezVqKDQkCATwr/i5ty3tPrkvWKl77r3CpPOXj0vabZBm6hv282nuGAPhxjOnhx2z74ZuY6DeO7R8vrpsWY9/vqblKkpkQKoyKW/2DJ8/Me46a2l2MzF0K2Jvki63Bx5E1L7bhH0gUksXzx4Fc+/31SWP7KjDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8mrYBtm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A89CC4CEED;
	Mon,  5 May 2025 23:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486121;
	bh=MruHz70q8C4LHPMWLrcifiaLFqr0szg5KcDA46S/mnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8mrYBtmF4fTFyUfX3jbyauHlWz8NT6nK80QoKyLfppZNoP0O6PRoE/FkS0bP09tc
	 lPerD+IaP9PP7Xn1p5PtIr3NY+RmdTX2N7oDpQisLIFa2XiAgS5xrjHhePnE8tBLP+
	 vppqTSQ08gZ+mPCskQiwsvXpx76Zb+W+r9dMI6FUzv6NWzRmHKYyFQETjUO/RKHNNs
	 cAnx7xj54ziPRX5HPaZbBBdQrJDSY9Y3t6AT5U4kc0QBowQwbE9eF0ozbtY+cgrSNs
	 KmhxxVmOowe8Hv43UkEGqKPhRLuxELrmBWsZYwKUq3qag0ai2divO2HUfdNXW3TmrL
	 9pyvLTi6IAI1w==
Date: Tue, 6 May 2025 01:01:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Message-ID: <aotznndpptgl5qtmkavmeuqydzpkefncnovddzyqqst6ozsm5p@fewoclduusfz>
References: <20250319145114.50771-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145114.50771-1-francesco@dolcini.it>

Hi Francesco,

I'm sorry for the late reply on this.

Can someone from NXP help with the review? Carlos? Dong?

On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Rework the read and write code paths in the driver to support operation
> in atomic contexts. To achieve this, the driver must not rely on IRQs
> or perform any scheduling, e.g., via a sleep or schedule routine. Even
> jiffies do not advance in atomic contexts, so timeouts based on them
> are substituted with delays.
> 
> Implement atomic, sleep-free, and IRQ-less operation. This increases
> complexity but is necessary for atomic I2C transfers required by some
> hardware configurations, e.g., to trigger reboots on an external PMIC chip.
> 
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 258 +++++++++++++++++++----------
>  1 file changed, 173 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 0d4b3935e687..f34b6f07e9a4 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -16,6 +16,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -187,36 +188,35 @@ struct lpi2c_imx_struct {
>  	struct i2c_client	*target;
>  };
>  
> +#define READL_POLL_TIMEOUT(atomic, addr, val, cond, delay_us, timeout_us) \

READ_POLL_TIMEOUT is not really a name that belongs to this
driver. Could we name it something like
lpi2c_imx_read_poll_timeout()? I'd prefer lowercase, but I
won't object to capital letters.

Additionally, the timeout_us value is always 500000, could we
just drop it from the parameter list? Same goes for LPI2C_MSR.

Thanks,
Andi

