Return-Path: <linux-i2c+bounces-2567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEF78877C1
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 10:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A016F1F21D92
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Mar 2024 09:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782A5FC1A;
	Sat, 23 Mar 2024 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmGkF125"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED7DDC5;
	Sat, 23 Mar 2024 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711185637; cv=none; b=ncOmAjFw4nEPoF0J2y/49n7YILGtVM/GZBxJPRBw7iGx8Q3CF1vxx75esN0JU+6OiKH8slJCUM7G2sYETfMhHBbpRJ7CpCBwHVf9u+7Oyej1He8OBtFzL0YYOMFdz/B17Y3BzBgzDeYdlmG37+laJae/kelDEGxseod/p95RRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711185637; c=relaxed/simple;
	bh=aGTQuZy7vZpxuhlc2uWM1FWO2cNVLUpXYHPr+30NYM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rh0DSAdSQVNBS1adbiZGMY4peRzHf0OTI1CLdrkJl+mE1QbOUeJ4y6uzhifAP3lPqxAJ+LIqYAI9lNkveAzkyTTykksIouPaF+eEm+Dp1DBn5jBle6zAmfSWwrlcPoHoim7asJCNSjOC4eFVZF68Wj1uh+JRYU+LavkF/Ophhpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmGkF125; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C0C433F1;
	Sat, 23 Mar 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711185636;
	bh=aGTQuZy7vZpxuhlc2uWM1FWO2cNVLUpXYHPr+30NYM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmGkF125xegySFWAiHvPntmZ+07s8hZQPC/0IVIftdkxYeMJTqDHDoBaq087Sl4Ry
	 qKx2QcAVw6S410SG7j4biAqt4/h5dTjc1vKUs5R8LJBjxtJSQyMNE1PxZTAhzLwpa+
	 ZvDOHlqhfPGo+3K1JP9tq5K11rxRL31gNRIYe4fcfJjyAcpNQmozM0AzDwGqt7aAAm
	 vL1bo7yWAyyXHWJXICav98Il7syCI5t9aEO0HLvfyTQ7cJVQX5WfpHiaD8JmvRG1Zm
	 VmI4taBLphr2uo/nVmCk1uj3x3TE6/IYqaCXMkAcTk/3yvQe9KoaZIneVeSaGY4Thk
	 hCCXd6I1k2Bcg==
Date: Sat, 23 Mar 2024 10:20:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:53PM +0100, Wolfram Sang wrote:
> Okay, we need to begin somewhere...
> 
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.

yes, very good! It's clearly stated in all three documentations
that Target replaces Slave and Controller replaces Master (i3c is
at the 1.1.1 version).

> My motivation is to improve the I2C core API, in general. My motivation
> is not to clean each and every driver. I think this is impossible
> because register names based on official documentation will need to stay
> as they are. But the Linux-internal names should be updated IMO.

Also because some drivers have been written based on previous
specifications where master/slave was used.

> That being said, I worked on 62 drivers in this series beyond plain
> renames inside 'struct i2c_algorithm' because the fruits were so
> low-hanging. Before this series, 112 files in the 'busses/' directory
> contained 'master' and/or 'slave'. After the series, only 57. Why not?
> 
> Next step is updating the drivers outside the 'i2c'-folder regarding
> 'struct i2c_algorithm' so we can remove the anonymous union ASAP. To be
> able to work on this with minimal dependencies, I'd like to apply this
> series between -rc1 and -rc2.
> 
> I hope this will work for you guys. The changes are really minimal. If
> you are not comfortable with changes to your driver or need more time to
> review, please NACK the patch and I will drop the patch and/or address
> the issues separeately.
> 
> @Andi: are you okay with this approach? It means you'd need to merge
> -rc2 into your for-next branch. Or rebase if all fails.

I think it's a good plan, I'll try to support you with it.

> Speaking of Andi, thanks a lot to him taking care of the controller
> drivers these days. His work really gives me the freedom to work on I2C
> core issues again.

Thank you, Wolfram!

Andi

