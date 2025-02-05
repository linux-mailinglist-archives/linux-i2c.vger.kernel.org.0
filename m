Return-Path: <linux-i2c+bounces-9317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF8A29C70
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 23:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB1B31883249
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 22:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EE9215179;
	Wed,  5 Feb 2025 22:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ccisrcf6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247091FECB9;
	Wed,  5 Feb 2025 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738793654; cv=none; b=oE+te7/HhLuWu2MGrzz5JLZt2p1OfTVH1gnLiFjRSWQFaf+9mJ1NQuQEJVNVE8Lz0MX9A8WVRmSNrSsD1Jo7z5gKHAHVc5e0MGjkS09sONKfIZLUypn2hGu40TX19+edkCh/yfTGD+MRlrZXJSSbIEJNgqo8PMNxeEXyn9MOeqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738793654; c=relaxed/simple;
	bh=aFGIUdjDssfb7zv8oCBW+9A3XqhSBZ7Ws/3yXdqV4qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGlwmVQu3uFX8zMnuBaY0STMmVOxhH7j6ounaI315lrV+J/yT0+1Ybfg7CtPmt3/wvNKHGIYx1xAKGy1Qi1CqLPBy7Im/6fmMMVQVpJDgb+RJ1mGXPgcHGX4EFGxSyVX7+EylQCliKm0rjL57XbCqVkp8aH9Ckj6SlsvjwmdVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ccisrcf6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546A2C4CED1;
	Wed,  5 Feb 2025 22:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738793653;
	bh=aFGIUdjDssfb7zv8oCBW+9A3XqhSBZ7Ws/3yXdqV4qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ccisrcf6pF6AGzbnBuURM8Dv+heEsWDX6RNMMBwPOCdU01pSaFz21peydVldIdVtA
	 FF/QfYkiw0Xt1Kp4bsHkYmp5ujsM7trdKzoNZbY87KveivGmDgzkpzURfsHfl0s5Nh
	 xGSmYxAwY9t2hluRbWdkLX4geDtzaHCQGDDTY6UwRDviwkGDgGohuUxSqGmMTnUGUD
	 aFeiuWX/p2XAEcMO8vzHewxhRh6TJm9V2IrpGTSysYjjKFn5pE1m6PmDAWllq+wxsd
	 mzc8BJJKLhExxDpNqGYg1HgBNpEki1ma/qnqH5yxsVQ71W45C/9PSi4l2jSmlsfAV1
	 HMzfb+57UH1+w==
Date: Wed, 5 Feb 2025 23:14:08 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce support for Exynos7870 I2C and HSI2C
Message-ID: <wiyifuogjo5rbqwohi46czhymsdj3zp5k4ex77uqommuiwlopm@27vjaksxlfhw>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>

Hi Kaustabh,

On Tue, Feb 04, 2025 at 02:03:31AM +0530, Kaustabh Chakraborty wrote:
> Document devicetree bindings for I2C and HSI2C drivers for Exynos7870.
> 
> This patch series is a part of Exynos7870 upstreaming.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: i2c: samsung,s3c2410: add exynos7870-i2c compatible
>       dt-bindings: i2c: exynos5: add exynos7870-hsi2c compatible

merged to i2c/i2c-host.

Thanks,
Andi

