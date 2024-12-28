Return-Path: <linux-i2c+bounces-8790-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF209FDC49
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 22:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B9C3A166F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 21:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125B8192D79;
	Sat, 28 Dec 2024 21:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbFiLOuA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC2C158A09;
	Sat, 28 Dec 2024 21:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419681; cv=none; b=Rw3mkSTvQBdW0+NvEDnHzRzrTPqE1j5plfYDkBMv+Zh11KXZ7jqtgoPx3Kuf24VxrhOuSd32pFRFm2NNcqvMa/2G7UgcwyvSyZ8+LvQcSfKTQRfhmOWbadxXiFkhNAHjsjDcPZxPlV1fxi43UelTMHeQ0Zs1q96HI8VtHEtl7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419681; c=relaxed/simple;
	bh=JSy7kKq7vvXln6X37mx3NLcerk0ooPQdIqGHyzb0PMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjX5PuZV0Yj4vcU39wDsMxwenLzKKlzHdihbUlsfaJse0KcDKQohyLJH83ICIcy8z1uZ08ZHBGJfdYIpudas3SIOS4xpdSEDtcWHB9RgLNqm11xa5H8rcC/JkrkE4PkyZGUdWsY1/e670ID2dsF5pWB4JJ4XqIskdrCLQXkTRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbFiLOuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CD7C4CECD;
	Sat, 28 Dec 2024 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735419681;
	bh=JSy7kKq7vvXln6X37mx3NLcerk0ooPQdIqGHyzb0PMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbFiLOuA0eQ9ejBBfHrFyL7mSreqjiOeJrMmtw0Zuu+93uRaUSdR55Upta+G551/8
	 x38gTjEkC9+NKvr4kH6egRYEXPXhVFCSsNSmIyfxiA5NsFLH0VcNG+j29E122Ii/LZ
	 RkXVWMit7LVjKDkMMgwPg8Gz+j8sGjJeOq85aSATw0z9K4y4aDca3J79eIIbHCGwEf
	 ojBwJi4NFyGc6Vq/JKdqPEls0vOliOD8orYtjPj4sk4vSsLsa7pL8lV3xcvOwgJ1pY
	 QfAX2O9Ta9f8HkYxwG7Q6nsQLmbzZGfhXv3Zt0OPUy3m8BYgUE4j0xrVERqquOtI0a
	 iAzFdPAugk31g==
Date: Sat, 28 Dec 2024 22:01:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Message-ID: <lv7cliatuynamsimld546tjr7uhn3r7dqq5d7uhype2wh3au45@mdiv4asd33ti>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
 <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>

Hi Carlos,

On Sat, Dec 28, 2024 at 09:53:22PM +0100, Andi Shyti wrote:
> On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> > lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it maybe
> > unused, so should add __maybe_unused to both functions to avoid build
> > warning.
> > 
> > Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> 
> yeah, I have different PM configuration to catch these kind of
> error and I missed this.
> 
> Rather than applying a fix over a recent patch, I am going to
> remove your original patch and ask you to send a v7 of your
> "imx-lpi2c: add target mode support".
> 
> Is it OK with you?

I removed the patch and updated patchwork. I will be waiting for
your v7.

Thanks,
Andi

