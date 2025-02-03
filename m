Return-Path: <linux-i2c+bounces-9258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5664EA25355
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 08:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA661162A62
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3856E1F9F47;
	Mon,  3 Feb 2025 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwVLYWoR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16501E7C34;
	Mon,  3 Feb 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569298; cv=none; b=VShy9QaL1vDq8lBpgi0ZZMhsGjgZfrEgUkho3rpFsonhObsFnf7kjHRDearTklH34oTvIm2rIzNBt/NEF9ljJ5gOMsmbiTgp2WviAc36EX+4uQxFyGw/dIYvbLQzFSQh8c9744rXt+/YzXXjS99vqFTcBpaefGgjZYt2nGTpHOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569298; c=relaxed/simple;
	bh=Vjg/ZcQVDN+Ca75e3lqacBpyaOhpu24vEZ6rdbWC6RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfjyJbxByQRatAkHm+DDyPoaOj+0JRquU3Nu447Yrtsz+OtPVSIsNxB71IjxtzkcIsQXSRMOt4KNDSiNtBdKRBSvIPHUCfh8jI9nmzRESUrKUftHJAuZTsCUP0LAWihGp2ZypmF+kevbnsQJQl0Q43Q5Jd4UdKcouevfG10s3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwVLYWoR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE47C4CEE2;
	Mon,  3 Feb 2025 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738569297;
	bh=Vjg/ZcQVDN+Ca75e3lqacBpyaOhpu24vEZ6rdbWC6RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwVLYWoRQW3nmevqdQ0qxAVrjkFjwL1Ke44rdKWjOxT9tqVrylYJJwCxcRE+rn3FE
	 GHLrKA99WxFYPkUjRtqI7SMSDajq+zX7rDBIQ0LqUBciA3E7+drheu+4Xwg0xL4mbP
	 48HpVZy9TiQlPk6sVf0J0y67ml0DV69SPIwZJf+9u4hOd0dVlEDOhqrj9K6GOnafGA
	 fbDrMV0SAiOdd6QpOTtOiPj0wAcJ7irBGalEw4dJNjmqDLaytiyKDbahVYnyO2HENj
	 XHK2fF1D1cfADmWqh0mtF8h8+nvvspM/1yfR11facw7Wu9yU62TF9rowkcPEX3xQ4x
	 fFjGjnIF/wlyw==
Date: Mon, 3 Feb 2025 08:54:54 +0100
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
Subject: Re: [PATCH 02/33] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
Message-ID: <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190758.14986-1-kauschluss@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202190758.14986-1-kauschluss@disroot.org>

On Mon, Feb 03, 2025 at 12:37:58AM +0530, Kaustabh Chakraborty wrote:
> From: Sergey Lisov <sleirsgoevy@gmail.com>
> 
> Add unique identifiers for exynos7870 clocks for every bank. It adds all
> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
> CMU_PERI.
> 
> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
>  1 file changed, 324 insertions(+)

Look at git log - that's never a separate commit.

Best regards,
Krzysztof


