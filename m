Return-Path: <linux-i2c+bounces-3655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88D8CDA5A
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97BB42835F1
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 19:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898A6762DC;
	Thu, 23 May 2024 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgztMBPF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495341A87;
	Thu, 23 May 2024 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490960; cv=none; b=NOHz/TJulgkouOuClcMbqhRi1SzPUbeH9r/IHuURmjOkuqmms48AYUYwwtkGYi1rLH5V0W4iRoyiXOU3YVH/I72xpihKj27dk6sfRSdFGcC/NMqV3lQQtHVSbjeOS2ce9zJ3wQw/TBhoQ+bKSDrQoWAMNiV5IdhEq2DWMWLs7G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490960; c=relaxed/simple;
	bh=gfkz/J8nYGjD56/dQaiy4UsG2977FaOY/pSGvSeeors=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrEuqkLsdNNWTQgHdOr1oO6sW3o0CuA6QL+fglWtByN2MX8GzCdFu5ZmG5QTKqZe5JnVoD8wznSx2PKpM3iTylBDNDc2fvPiLeRQN5azlMGgssp8ha0aVFaB4h9uZU3b7hNGHOJ2bMX67Xq+xjT1nvp2pOTmciYY/uCD26tEcbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgztMBPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D35C2BD10;
	Thu, 23 May 2024 19:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716490959;
	bh=gfkz/J8nYGjD56/dQaiy4UsG2977FaOY/pSGvSeeors=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=sgztMBPFbrjZvr1E6gEF2akirFN2oIML14ycvXRZDy/K6YlhH7WW56Zwpr6BNtr1U
	 cBBf+8o1AEbVBPCioTYXc0U4BCsSCH/dw9hcFH74chTrwkd2wpROR7FaAdjpgkMA14
	 EoETuJPcIJ/AnOErgkg+M1XyNpKBOK7S2qQ+O3V9e8uWAfFJ8w34WaTsz5ntTXmcb0
	 SwWk/qjgcOacbsjojyn9LZyZfv/DjhDqXHRDrXtxtNitc+etCiOiBfmIDnft31kgKt
	 1d3LHN80adQeIDYyWQwaafJZn3LwtwWi9JmUKcgC124MKdS3z8IYBToiqyFDp0ZiKF
	 apjA/0qlWvKhA==
Date: Thu, 23 May 2024 21:02:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host changes for v6.10 - pt. 2
Message-ID: <fnznf6fb6vzk72b42lkir3jbopb6cog6mmjjr3f44o5ejmyelj@ehkhoevbn6dr>
References: <2qtn3bk6pat2xkw7qz34pjpgh6zariuz6zjxhmuuo2jcddfpi4@xn6aqqppl3hi>
 <20240523154820.vza7xbdkgqyyth6w@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523154820.vza7xbdkgqyyth6w@ninjato>

Hi Wolfram,

> > now that the dependencies are fixed and no error report has been
> > sent on these two patches, I can finally send the second part of
> > the i2c pull request.
> 
> Pulled, but I can't send out to Linus because
> e22e0e483b2c76728ccd119fdcfea81eb176b3a5 (drm/amd/pm: remove deprecated
> I2C_CLASS_SPD support from newly added SMU_14_0_2) is not in his tree
> yet, only in next.

argh! Good catch! I don't have drm amd in my config.

Indeed I don't see Hiner's patch in the DRM pull request and not
even in the AMD's.

OK that needs to shift to the 6.11 pull request.

Thanks,
Andi

