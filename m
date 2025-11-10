Return-Path: <linux-i2c+bounces-14036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA5C46FF3
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 14:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B86918842B7
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Nov 2025 13:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D0420D4FC;
	Mon, 10 Nov 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGr1PmZR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6281B6CE9;
	Mon, 10 Nov 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782357; cv=none; b=Kafi10boIiU5E75lXZoL4XsXeFiqbVlZz16grtfv8jd4iPO84aLtOvwPJG+q5vcTI3G6cMIJhr8Mnf+16TIjzBNFJXRS7F3V6kaItuUjvDOMK722PQGVmOmjbwEul062iSPiW4dSpbxBIVbW+AMUyDkyKi++EC6XgWMiKQ1lqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782357; c=relaxed/simple;
	bh=BfZlbtmgRdgYv7hKoZSzpQyyse54YgiwBUgsuLLVOEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6Q7rCuklgl3ROg3awe6TIjURykYhyqDkPMXkU0R55VLifA0SSCyVR/lZW28RgjobjlZ2do3CeDUj6PT9M8ijL/YqkqSoL5DTbE7ZkKAEFP4K5jSFSVAQKz/DgrXSP5lNdyHl8LMawi4kImlVAlzupxLaE/KhzcCzj8au2LjzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGr1PmZR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835D4C2BCAF;
	Mon, 10 Nov 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762782356;
	bh=BfZlbtmgRdgYv7hKoZSzpQyyse54YgiwBUgsuLLVOEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pGr1PmZRLwYBt/uM1R1jlsuy0hADBTEbyD6JFYM/9qUmH/OSBiahCYGGplFS1TzUF
	 fzlRKv1LJnDjYZ9SoLa9wINK0OmUliXSttYyrAzFwGa1MlYTb4z8ik8fU4as9WOPdW
	 Ozt/nUh+2gA0m/XJ3p5Ms1fbTcA9DkgYyfPdwnVAWGUHuMdVQa28g5QWxudt1OOjct
	 Jzvlm8a9BwvM+gi1kTO+AiMKpvXjCc4FMQYFeyBF29yT77ji9HSTO9MkBjVjrO8lI/
	 DzpyQh8F6WHUcnGAG7YOkh7LNk9iGs6JMyerz1X/pCSGtUKnS8wn9ZQivYcOHm4RGQ
	 OH8bedllMvOGg==
Date: Mon, 10 Nov 2025 13:45:50 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <20251110134550.GE1949330@google.com>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
 <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
 <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>

On Fri, 07 Nov 2025, Troy Mitchell wrote:

> On Thu, Nov 06, 2025 at 04:04:21PM +0000, Lee Jones wrote:
> > On Mon, 27 Oct 2025 13:48:05 +0800, Troy Mitchell wrote:
> > > select will force a symbol to a specific value without considering
> > > its dependencies. As a result, the i2c-k1 driver will fail to build
> > > when OF or COMMON_CLK are disabled.
> > > 
> > > The reason for removing I2C_K1 instead of adding a depends on condition
> > > is to keep the possibility for other SoCs to use this PMIC.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/4] mfd: simple-mfd-i2c: remove select I2C_K1
> >       commit: ecf6bc474ae97c404e2125b413eb0ef3627b03c5
> Hi Lee,
> 
> I think you didn't notice this reply [1]
> (Maybe because he was replying to the cover letter).
> 
> As Aurelien mentioned, the current shutdown/reboot (and possibly the regulator
> as well) intends to use the `default MFD_SPACEMIT_P1`.
> So if there’s no `default m if ARCH_SPACEMIT`,
> the default value in subdevices may not make much sense.
> 
> But don’t worry — to make things easier for you, I’ll send an additional
> patch based on your branch (in this series).
> 
> How does that sound?

Go for it.

-- 
Lee Jones [李琼斯]

