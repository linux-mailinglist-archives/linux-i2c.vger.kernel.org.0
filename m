Return-Path: <linux-i2c+bounces-5545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC2957491
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 21:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A216B1C20E3F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 19:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4935B1DC465;
	Mon, 19 Aug 2024 19:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6aQ1s4b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082D179206;
	Mon, 19 Aug 2024 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096271; cv=none; b=YGyUaDu8gjMPgtK/V9040+0wPphTFWRIFu/J10n64FctBwCDn95BjLU+5zyPjOoW8oTNtdX2aezAyIfylBZdbEYMl8lREc1Bj2X0G/KyH5LXl2HXrDOgOo5ygpqpbAqg40Fzm9Nnn2Y0NHKr2OYepksfOlp+mBa63rKKHdHZFEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096271; c=relaxed/simple;
	bh=PBpJQ8cfDdo8zKxS2UDG3hX3O201hSXAedV6WAjp/lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1mxhklKJic3xAtniBMcdY8NdQyMjC2XvF5cIwooMFcNDZHZ30Q+Pjx0kkQLuOOcXmQCfHhNGC3G7XMhoaTB4NE0xpz8VfAioMcTzT9Pb+YGVlctisV44+EwN1nemkuOGThg5TCGhneHUJUGsSBmmb34pX7ebOXg1E8kmln5oVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6aQ1s4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AFEC32782;
	Mon, 19 Aug 2024 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724096270;
	bh=PBpJQ8cfDdo8zKxS2UDG3hX3O201hSXAedV6WAjp/lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6aQ1s4bUuunpkVUp958GYp0M2sjA6aZC0yJrkvCM1UM4PCnCJqCbPdp/w1bJ4zyx
	 VTHmzuFjxkkMcTSXh9g0EWhr3lWYLaOemIFyb4k8tFMJiPtsTNX7AjfFcoZp0Iv6Uq
	 d8jMM5bOcjh3Zr2BXCeO1z3FCmwU/N4aiXM0icJEPy//XcpvsxMiHIHLpePjxrCtx1
	 Cv2cKG96OWMQhaogyaakBwPsbhSZrl2nzrEpoNHKoGKMh+26vgHJByXH911KTL2yw1
	 5ssbFdCS7tEkvoBT5cxA1jGmU7JIm1PyZJV9+QVyx1a/wsyIIeQj0LJqkVKxzrzu3Y
	 qE/YYgvcDs4iA==
Date: Mon, 19 Aug 2024 21:37:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 05/11] i2c: riic: Add suspend/resume support
Message-ID: <ajj4fwoob5wq5guktq2b54h55fn5qlcakiybq6pk3xagiops7d@abpwevzemidy>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-6-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819102348.1592171-6-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

On Mon, Aug 19, 2024 at 01:23:42PM GMT, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Add suspend/resume support for the RIIC driver. This is necessary for the
> Renesas RZ/G3S SoC which support suspend to deep sleep state where power
> to most of the SoC components is turned off. As a result the I2C controller
> needs to be reconfigured after suspend/resume. For this, the reset line
> was stored in the driver private data structure as well as i2c timings.
> The reset line and I2C timings are necessary to re-initialize the
> controller after resume.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

This patch doesn't have tags, so I'll add mine :-)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Just one thing, though...

...

> +static int riic_i2c_resume(struct device *dev)
> +{
> +	struct riic_dev *riic = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(riic->rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = riic_init_hw(riic);
> +	if (ret) {
> +		reset_control_assert(riic->rstc);
> +		return ret;

Can I add a comment here saying:

	/*
	 * Since the driver remains loaded after resume,
	 * we want the reset line to be asserted.
	 */
	reset_control_assert(riic->rstc);

Unless I missed the point :-)

Thanks,
Andi

