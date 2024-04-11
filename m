Return-Path: <linux-i2c+bounces-2889-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EC8A0CDF
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 11:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B211F22777
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 09:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE74145345;
	Thu, 11 Apr 2024 09:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Azw/e+Cu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67C13FD80
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712829376; cv=none; b=mOZUGgzw3TCP4jDMnx0YIynJkcr25o0nY/V8qpCIgdx18E9xaCoHH0PzNG6tPe6cC3kpJxF9KLhz/F3fXF1mg5E7TG2VdgybsQZrFu9YJhWyjlXx60LtSF2m5r4hMtFqlDWm5WHw8Xyq8QH8X72lWbppRgdBPhMhQMeDpmKUxOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712829376; c=relaxed/simple;
	bh=2RSMI32SmTPJGY8jQBCSnBTSCLT1VXUTUygQmkHc0Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLTMM31qMx5wnSCeIhORLUX8ZdRU79920gGfPEtHBNZ+RR9uamgk/iNNGL5C+rwHP7ADcwAk6ZQh6dmDcTjuD/OFEfMZ1ZkQrh1p2X27DOw4Z1/oEFD/rHSVSL7QGMW6zms9w6DL3M+3YCYJ2UWQDmwlTjwVOvsQ+L/drQm92Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Azw/e+Cu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14AB4C433F1;
	Thu, 11 Apr 2024 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712829375;
	bh=2RSMI32SmTPJGY8jQBCSnBTSCLT1VXUTUygQmkHc0Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Azw/e+CuGVGwu7AeRtz3pDFC827OLkJrPTs9aM/fPVHPQ9uGQ+jAT2Tz3ZhVet60V
	 y4Xw+bRGg2/KAOY1s4bWiPiV24Gzu/2b4XfJe/8A6LzPeuQ2pONPRi8a9sENbNZ4xP
	 s9vcTe+GsLUy2ZaPQDEu78Jg5gnZRj15pHQiHvw/VbAB4ZOX5N1+kdwk8a9jshU1tF
	 H+vMJ1aLoIy5sucuFHyqTKRKrTp6a0s8+So1SXjQidqltDPHtlwW48sU42C+GrHtWV
	 izHLvW4dIDQ0WngayPhsVhO2VXajmyGDDWlTTphqIbGusDjP+rBRgA98G+LuA6nZvx
	 QJ0CCGyg3KSxw==
Date: Thu, 11 Apr 2024 11:56:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <c2jhysndjivp5neavi4l2kh2xjk5agjh7ebbsyl2fy4yglmnqc@abjdy73snkgj>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>

Hi Heiner,

On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
> The original change adds usage of i2c_root_adapter(), which is
> implemented in i2c-mux.c. Therefore we can't use the multiplexing
> if I2C_I801=y and I2C_MUX=m.
> Handling the dependencies in the code would become unnecessarily
> complex, therefore create a new config symbol.
> 
> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child segments")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I forgot that the original patch was queued for the next merge
window, so that this patch goes through i2c-host.

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: i801: Fix missing Kconfig dependency
      commit: ab9713bb88443f8791e2917833ff1ed802046b2f

