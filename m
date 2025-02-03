Return-Path: <linux-i2c+bounces-9257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED5A25349
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 08:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B313A17A5
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Feb 2025 07:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391EC1E7C34;
	Mon,  3 Feb 2025 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxlFIwf1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CC01EEA28;
	Mon,  3 Feb 2025 07:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569266; cv=none; b=oYSG+7bXIVr4Iv8OVMp5GQvw4FyrtHI+qwvRipujIz9qrg7NNW/zj4w3oHWrxBfUrTR+EVHsQmb161E44PpOqscfefJ3Qkvc4sZCZunPxnaUv+XbfJ7VDjVBdN6ekgeGUkcuODsdrgIO5PHL4sKC7XynUoouipgCB2j14lqLyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569266; c=relaxed/simple;
	bh=h2Tgk866PVTB33WTwVVqd9bu13KATTuNBIINA6qpSEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kER6Mcl/2G31TM565iUaTZ1bMTMrgOeWnnSbtdvgsQQFeSMekT6laOdmthlFM3prTTyW1rTAD3xwhxXimINQeUEqPiaO98LWhq2qgy1TwK9Qrs84H7mr+VEmQM9rgrTmGVjicmllpPl7kO77DA72exzlElJhFKwskm8AURAc/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxlFIwf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF66C4CEE2;
	Mon,  3 Feb 2025 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738569265;
	bh=h2Tgk866PVTB33WTwVVqd9bu13KATTuNBIINA6qpSEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxlFIwf1m1t7UrcDrBKcGXvWYHcpnk81A5FScAehD+Bz6Tp+Ejot0cpnnuwnOVmyo
	 TO00GpHeFpiNDIh0D9EsLiEl3s6wLJVLXG0hawuTCQjt7+wNPC7kXv3T1FLCdIzG5h
	 C7wzXDXz26V9RSI2UDe5bYJ7t/Vn2xVjntg7+PwTOPTlu+bqgPSMs6rc0Qh+26UnKE
	 plWs82UTbwcd1ejVM+vS6Rv44R8xbRgYCjY4msr2nzzVYHvUe1PPlfQg7FF+3jCSN5
	 uTc/4H11eQGEkwnxYuijm8S6CWEP5hYDArY6FOlDqK/E/XBMt8Tis9+N2oFjppYhFo
	 P4BP+IWAUgpYA==
Date: Mon, 3 Feb 2025 08:54:22 +0100
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
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 01/33] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos7870-chipid compatible
Message-ID: <20250203-slim-jovial-dinosaur-3d7afe@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-exynos7870-v1-1-2b6df476a3f0@disroot.org>

On Mon, Feb 03, 2025 at 12:06:34AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-chipid" to the documentation,
> with a fallback to "samsung,exynos4210-chipid".
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

That's mess, how could you have two same commits in Git log? The only
answer I see is that you did not create it on top of git repo. That's
not how you should work. Use either b4 or git format-patch
--cover-letter, not some other methods.

Best regards,
Krzysztof


