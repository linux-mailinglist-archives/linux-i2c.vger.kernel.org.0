Return-Path: <linux-i2c+bounces-8912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE04EA01121
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133A218845D1
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A1A1C1F27;
	Fri,  3 Jan 2025 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXkOLH7g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C11180A80;
	Fri,  3 Jan 2025 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948494; cv=none; b=Ls+PtKsoAmo4noEjnrIBDYS+0v5nlL7dYMKVBK/xo4wvqW5UkmCE7UyDY5+KqCmTsyeHXDnAohWJZXkCvRxdb+sVxbu9zs0fiEVHVu+WvOV+hi2faTyJqotGR7UF9PbkVunYH/kc0Cqv/bM+HBjCel/BRiA3jv+c7XnIuoOMCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948494; c=relaxed/simple;
	bh=hg2sd+wXGvqE6blBDDkV/2Lcm2gl0xQ7jMPUGUmSFgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKhYFyBDpCLI+C7JCb8RwngTxBPIm1tZlL2My8HxXdWbEyibS7ZJlFB9PHxukF5J5+TZcWkhKFl1QeMY4yBHJIr3LQLyKUQe7hQsv/v3eYSzj1k+4FOiUAFRUk6Kb5F5ZU5dMeVYd20HQUoHJVvzk8rLy/VrpFsKbibQEd5KMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXkOLH7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03572C4CEDD;
	Fri,  3 Jan 2025 23:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948493;
	bh=hg2sd+wXGvqE6blBDDkV/2Lcm2gl0xQ7jMPUGUmSFgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MXkOLH7gRgGOgHh5g9uKzhIyHgiB3ixJbyIpCiw95PdhzOzGZXcXB4XcGNJgC2ykc
	 dsiSj6xKtRuwSadmwIgTTWkvmb6bGPP/4MSQz5mws0/SUROYdWFuHVHIh2G9rMFNaS
	 PfRaxjLXwlaBHkPAbGCKDXWHNfiMQu3wHdklg6CtvGlGlN04U9zWGvEM5GnlxnLIKZ
	 8Fzuyl4fBgvIfOKfN4wmn8BLWLM1icRf5OyyQV7qpvvmu+VDyObu8rUMp2cOMHnOEH
	 bzgcddKIDDWO8R2bk4Kpl/oqXxxNrEBsejVm7qF1Y+Xepoqijs8nnN3uYTlrml4YH4
	 87dyaoxqTfz7w==
Date: Sat, 4 Jan 2025 00:54:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
Message-ID: <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

I will need for Andy's ack here because he had some comments.

Thanks,
Andi

On Fri, Jan 03, 2025 at 09:18:51AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Simplify and modernize the RIIC I2C driver with the following changes:
> 
> 1. Refactor error handling in `riic_i2c_probe()` and `riic_init_hw()` by
>    replacing `dev_err()` with `dev_err_probe()` and using a local `dev`
>    pointer.
> 2. Use `BIT()` and `GENMASK()` macros for consistent and clear bit
>    handling.
> 3. Manage reset lines with `devm_reset_control_get_exclusive()` to
>    simplify resource handling.
> 4. Mark `riic_irqs` as `const` and simplify clock tick calculations with
>    predefined macros.
> 5. Add `riic_bus_barrier()` to check bus availability and improve
>    reliability.
> 
> v3->v4
> -> Created new patch 1/9
> -> Dropped RB/TB tags from patch 8/9
> -> Dropped `unsigned long` cast and updated the format specifier while
>    printing bus frequency
> -> Included required headers
> -> Propogated the error
> 
> Cheers,
> Prabhakar
> 
> Lad Prabhakar (9):
>   i2c: riic: Introduce a separate variable for IRQ
>   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
>   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
>   i2c: riic: Use BIT macro consistently
>   i2c: riic: Use GENMASK() macro for bitmask definitions
>   i2c: riic: Make use of devres helper to request deasserted reset line
>   i2c: riic: Mark riic_irqs array as const
>   i2c: riic: Use predefined macro and simplify clock tick calculation
>   i2c: riic: Add `riic_bus_barrier()` to check bus availability
> 
>  drivers/i2c/busses/i2c-riic.c | 137 ++++++++++++++++++----------------
>  1 file changed, 72 insertions(+), 65 deletions(-)
> 
> -- 
> 2.43.0
> 

