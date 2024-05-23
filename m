Return-Path: <linux-i2c+bounces-3664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C712E8CDBEB
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80C96285A07
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15814127E1C;
	Thu, 23 May 2024 21:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvmKpBhr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A1127E11;
	Thu, 23 May 2024 21:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716499425; cv=none; b=pcpPtiTti42RGa1OauOybYox8URcdGZ4ozGHSPwqjjMBABLUZRMep6wkdyodhfokbEFf1gle9uwcRmkMyCUlInva8gQ7y5BCguqBi6xMNtIFFW7adsM4GtHs+kVdkcHQpxtz1J2ay6lXIy+VS8P2IzEpax2nLi5AQ1GwivwjnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716499425; c=relaxed/simple;
	bh=BhxisE82YS2Tm+kO+YbMq/cbnu147OOHSg8vMxpz28k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDOZzXCxxZAA01QYzw5IgrhBSDlIxjoluiwAbAeFZ/2Z4AV+KLoA4aglCGpeGe0/wrAMr5KTCLVyz4BiOm8+kqWZnCGXBGhc6f1DuyDVkzotDNEY6nPr51LZ5rBiTX0IkLrWFWwn9KskxHx0azPNJA/p7lLP26h4L8g4Vp2wYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvmKpBhr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE986C2BD10;
	Thu, 23 May 2024 21:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716499425;
	bh=BhxisE82YS2Tm+kO+YbMq/cbnu147OOHSg8vMxpz28k=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ZvmKpBhrvMWjR1iq7qqKvXe57frza9lO7Z8+7RT+u6DINvy05B+kczyUBQKKiltRX
	 tKJCP6Vm/Hv+e6zxwLl6kzZ1gtAe7ibl1EHk98OcePebj1gp3PsvRNDL1pI+3VgbXE
	 EFKxgwQm6v1QeIo7AoyYVFrLctsqjWW9ZNPbor8BBZ0dSYQz95eZkbUrInrEmymKu0
	 QOVhfWVZWqzRQrKCaDIpOJlMXw4IFgq3dOcvxhupuVqcJj+E3lvh607NnZc6zpH1gq
	 IB3WL3+7iTQ73aQYms2mFvyCVJ2tTLIQzohRHAeO4ylgBMUrSNFcyq7Wb9AURmbsFM
	 3iRoR0mxzHjyA==
Date: Thu, 23 May 2024 23:23:41 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host changes for v6.10 - pt. 2
Message-ID: <eaph6dm5rk3ispqucu27n5uwoe7y6l2cljyiffns6c5gixqh5w@tomfq4l34l6m>
References: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>
 <20240523154820.vza7xbdkgqyyth6w@ninjato>
 <fnznf6fb6vzk72b42lkir3jbopb6cog6mmjjr3f44o5ejmyelj@ehkhoevbn6dr>
 <20240523201850.yl253jum4sqnykji@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523201850.yl253jum4sqnykji@ninjato>

On Thu, May 23, 2024 at 10:18:50PM +0200, Wolfram Sang wrote:
> > > Pulled, but I can't send out to Linus because
> > > e22e0e483b2c76728ccd119fdcfea81eb176b3a5 (drm/amd/pm: remove deprecated
> > > I2C_CLASS_SPD support from newly added SMU_14_0_2) is not in his tree
> > > yet, only in next.
> > 
> > argh! Good catch! I don't have drm amd in my config.
> 
> Me neither, I just checked with 'git grep I2C_CLASS_SPD' :)
> 
> > OK that needs to shift to the 6.11 pull request.
> 
> Hmm, that gives too much time for new users to appear IMO. If you don't
> mind, I'll take over and I'll ping them to apply the drm patch soonish,
> so I can apply the removal. Doesn't matter if it becomes rc2 or rc3.

DRM pull requests for merge window are normally sent during -rc5
and only urgent patches are accepted latest in -rc6.

Heiner's patch was taken later.

I can try to to ping Alex Deucher on that specific patch.

In the meantime, I will send a pull request with just
Christophe's patch that can safely be taken.

Thanks,
Andi

