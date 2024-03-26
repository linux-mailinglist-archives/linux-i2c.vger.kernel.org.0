Return-Path: <linux-i2c+bounces-2586-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB588B631
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 01:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672121F3E7AA
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 00:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647AA1B800;
	Tue, 26 Mar 2024 00:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFOy9Sck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E256B1804F;
	Tue, 26 Mar 2024 00:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711413406; cv=none; b=s/wPuTkwcAZC/mztNgv2M9V/PhIGPAcx6w6BAsDWtQQGkl73MEWj569zN8pFjg74lXLCyU6P9lBTOatNDmpg9fgJ1E8UY8o4YBK8xE2/fqWCI5/w29HDPvH4V3FdgZIU2c95Rf7jXvPdtyhwRXvVjl4h5HVvJaR+/WeXjidT1bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711413406; c=relaxed/simple;
	bh=r6ja1S3WkmxWys+sE3KabUy5bKAQKHZGyKXel35g+zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dpc+FvOx18fHm1OGndsMDgpoQyDIMSjFGHKmGbshxy45Ao/sgRnwfvIaTWlts0nhnzwQS945Vc2ZXiv3G3xafTrYj66NuWfvwY14zz2rJ0arutkxDAPH3AAKEy1W4IQjXsK0GJeQkcJbU2848eYoUajcE0okRAQwhJFB19z6Pok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFOy9Sck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84803C433C7;
	Tue, 26 Mar 2024 00:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711413405;
	bh=r6ja1S3WkmxWys+sE3KabUy5bKAQKHZGyKXel35g+zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFOy9SckrUmOjcVY80p+Bpxbe+5dpDJq+JeaQvIywXepTed1YRXnEepoqUkHhDLDv
	 KZQ8orGHJmcfhxU4yqXzvKwkkh03GuDsm5VknrzWZxwAeC8moegodFxeAFmHcguP3V
	 MvMXRlBgmBX55pjBPgOUTWQbK7zrjPHUR7Ivk7miBmPv+gpyP5Ja8S02vD6UZnj61n
	 CqfQ4NXy/CKPT7KniveufUJdSfosIbl7mM5+gISfC65C9eTYs21OyRMfhMeYTy9MAj
	 ov2d24lOwn4Oj/ZJVUPrXNuEHsLe2pES4uVY1T8XSrKZegQunB7Zn3qmkn816MOaQo
	 yZPbuVAYSRHAg==
Date: Tue, 26 Mar 2024 01:36:41 +0100
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
Message-ID: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>

Hi Wolfram,

> > @Andi: are you okay with this approach? It means you'd need to merge
> > -rc2 into your for-next branch. Or rebase if all fails.
> 
> I think it's a good plan, I'll try to support you with it.

Do you feel more comfortable if I take the patches as soon as
they are reviewd?

So far I have tagged patch 1-4 and I can already merge 2,3,4 as
long as you merge patch 1.

Andi

