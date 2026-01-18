Return-Path: <linux-i2c+bounces-15259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AB1D39B83
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 00:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C417930012FD
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Jan 2026 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C27F328B64;
	Sun, 18 Jan 2026 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuTyV86w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C92F3B2AA;
	Sun, 18 Jan 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768780690; cv=none; b=LoARnZfLg7SvjDyfkzmwyoJ8lhcjZfXEno4JzewLQTvrZUdrJKuzJINexRpl+LSC2nIhS90U1gUl4Tsxc7mITqvAmAcZvIzy9zhmeBFCTNc8pgdm7ElKuBgqXMZRIBW4H5C4ECKmXRhe5wrOpBvj5ARpMSjHb2LX6yIQMpgr7C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768780690; c=relaxed/simple;
	bh=6bMKJ5lG0PNdrSpn1+M0W36NUJ6bnMbRMOKJStqQ4yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/x4Fmypl0SGXdo3dzk5DRDfT+FLHdcCbtpv2XSS0PhekFz7AHpEcCPqeB87bS/8eZ9EuZGO0ucIYbM3n5uCNBKnHGmeTZvLQFSqNC7BIeBm2kqt0vgI+E+B2lLYxEni/XlKq83VlqNNOGzKPHGY2WzSfllvuaBYsovgpXGcOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuTyV86w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82652C116D0;
	Sun, 18 Jan 2026 23:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768780689;
	bh=6bMKJ5lG0PNdrSpn1+M0W36NUJ6bnMbRMOKJStqQ4yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tuTyV86wzK2Ik/Ya2XK6dOYuwvctqTKnZO3kTt4mNF4DumN8NWsF96RjVQu0ZXjKa
	 i2s/HqLuyalOM7Gw2f2ZG/3QTXaRpSXqixHqWu09hUqBZnNzTk50ljCqePctcx87G1
	 zb3yE/FsZn43FxhjfnNo/RremMNUWzXDtscaSpMlV7Y+fCRsMDwgGcm0kOdkKmomlR
	 Uq4gw03GebaUUU8BlXgmcrgTA17ecqQS8p228GE2SnS+OnbcC9wRao6CrwM64O5X6H
	 yNjpqH3k5cZqh6KzWgbRSk1ihvx9a9VFBAZKQNpBVGB+zmqfYggbq6V0Lr/DQQWGaE
	 X94BS51f5yNyw==
Date: Mon, 19 Jan 2026 00:58:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx-lpi2c: Add runtime PM support for IRQ and
 clock management on i.MX8QXP/8QM
Message-ID: <aW1zaXZsC_8KaM3N@zenone.zhora.eu>
References: <20251125084718.2156168-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125084718.2156168-1-carlos.song@nxp.com>

Hi Carlos,

On Tue, Nov 25, 2025 at 04:47:18PM +0800, Carlos Song wrote:
> On i.MX8QXP/8QM SoCs, both the lvds/mipi and lvds/mipi-lpi2c power domains
> must enter low-power mode during runtime suspend to achieve deep power
> savings.
> 

...

> - Free its IRQ during runtime suspend and re-request it on resume.
> - Disable and unprepare all clocks during runtime suspend and prepare
>   and rne ble them on resume.
> 
> This enables the lvds/mipi domains to enter deep low-power mode,
> significantly reducing power consumption compared to active mode.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

