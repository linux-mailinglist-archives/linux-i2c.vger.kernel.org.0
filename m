Return-Path: <linux-i2c+bounces-9256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13129A25340
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 08:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57109162949
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 07:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540031F541E;
	Mon,  3 Feb 2025 07:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdzDDw+T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6B1C695;
	Mon,  3 Feb 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569189; cv=none; b=RK6zTqSvmB1mon6xxP9Hl7c9LUwb/++yf/7zbilddxFpJAYeE1ZpRqDC20RRsQLsFZA2/1FUIn8Wkyq+jrQZPx2UcG7BNMFa/XV8Y8mUoeDRLvdSeRyN8DIHydI0FfOzwlaeDJlXpdYSE6F+3vNTFsGPIao44C5pbD244cpZ9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569189; c=relaxed/simple;
	bh=98P8X6HMfcm3Oxb2BZKVpxuLvrRbMpgR2GrkKyq4mkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcdFWNoWRqb2nhtgwALRKvLQtX38l0NowDU6Cb1ZMUy41xWgk66rivjTt1L5QLviMo4YSG/XdbEs2KMQCGU5xk3/6fFZ1AqzTvq8ltvNy9vRwrAPeRYtbymobM4thMa5PEH9akZJAP9ls2p2p1sADvDeGNwAeTXAdjH+EZvMpwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdzDDw+T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D18AC4CEE2;
	Mon,  3 Feb 2025 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738569188;
	bh=98P8X6HMfcm3Oxb2BZKVpxuLvrRbMpgR2GrkKyq4mkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdzDDw+TQ2RB5QCOljApbh1Dlc8hoYjvO4lSQ/49lsQ6ZVV2A4k2pJaVsWI+FbVNo
	 VJ0yLHPv9e01G669yA0cuIG1WK5T0WTiUegMwrtsOhcnUeitdHku8VcHPoepnDJlw8
	 nKJqcmFLJrGplgm03KhG48/AI5d0XlKpajVGrFIv7SBLqq6QE05rpho4o4HNhHNnXr
	 d8pLn1baGWmyQ7nL3QgzE6t+29sl0NIKOwo3GOwMGDtBM0fK9eXa7LqHDX5ggldgBy
	 NAhtDZ4dmKbGXZwVM37OEtQwAQvLvyAJXI61czxKGZ0rwcFHOkR0idtiPKZFfgURMR
	 VVlgiT8sUR8Pg==
Date: Mon, 3 Feb 2025 08:53:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 02/34] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250203-roadrunner-of-unnatural-wind-54bddf@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190353.14572-1-kauschluss@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190353.14572-1-kauschluss@disroot.org>

On Mon, Feb 03, 2025 at 12:33:53AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-chipid" to the documentation,
> with a fallback to "samsung,exynos4210-chipid".

This we see from the diff. Say something not obvious about hardware
instead of repeating redudundantly subject and diff. Otherwise what you
said is equivalent in just few words: "Document Exynos7870 ChipID."
instead of two lines of text. Instead say whether device is or is not
compatible.

Best regards,
Krzysztof


