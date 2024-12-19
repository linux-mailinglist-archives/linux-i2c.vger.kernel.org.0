Return-Path: <linux-i2c+bounces-8636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E09F7ADE
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 13:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01B2165CC9
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246862236FD;
	Thu, 19 Dec 2024 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0lDq/YG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DF22146F;
	Thu, 19 Dec 2024 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734609755; cv=none; b=n1geVk1huILJYXiDW2P3y1dk++vTlK4Ldbpy9cRPqGveN9WmWAughqfivIoCb4Q1fSbxy7KSnY26eqTi97yOiXfh6iFO5bZ6wBDSHzQS7FTkwA4drM9z88KcD+BqvUO6YADsH/t3KMUemdAwOcYiAjUzZFv3e5csWV3/uOwu8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734609755; c=relaxed/simple;
	bh=hFX3zZUpFJljafxwc6mZtbVjERwcv2b9BVgvXBWnGGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li7Z+50nAoMHkAK1aFReXB3AwNPWUt9cIcaIzKmeUAla6U8oLcshyJVvMO93HjcCuxcnBbPjvN6JvgdMtmDO0G+g3jR6Zoj+RjgDw1mjHOqTYUx4HooqaLml/W8W5TwpFqP5gQjjd9QdYOsr0T3FFD32HRA0foKPZ96GWpM8kc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0lDq/YG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10F9C4CECE;
	Thu, 19 Dec 2024 12:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734609754;
	bh=hFX3zZUpFJljafxwc6mZtbVjERwcv2b9BVgvXBWnGGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0lDq/YGgQS3XixO17VMlzszN0bELqF56oxoFRog7N4hgtR0PUiEgbJqO7ud5y9tg
	 d8Zizqpdyc3XrrjJ1y4SmfvfBB/oUopfrKBEfNEaQo10TigZ+5dHgP/P5BRVqXQh5r
	 RFMRhOqwYO5W1mX3SREIjucpkl+sp5yLcljg61F3M9SNfVDAd6YVEkaZpMor7zBrM4
	 Sh44vkaFBj3gAN2mwsWaUNzlwYjyiqPnF60BfWnc7+0IhlE4dTg2foMQTRcC+aiMIb
	 s2WLXZkA6RAYrd4a2dlVwErbXFHeiC0AhxD0v/lweqT8Ob5t9hfq7s3WhfAoBbPdwj
	 fnxywvxtCfexg==
Date: Thu, 19 Dec 2024 13:02:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Message-ID: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
References: <20241218043541.143194-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218043541.143194-1-carlos.song@nxp.com>

Hi Carlos,

> +	/*
> +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> +	 * this platform, that is not a real error, so just remind "only
> +	 * PIO mode is used". If DMA is enabled, but meet error when request
> +	 * DMA channel, error should be showed in probe error log. PIO mode
> +	 * should be available regardless of DMA.
> +	 */
> +	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			goto clk_notifier_unregister;
> +		else if (ret == -ENODEV)
> +			dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +		else
> +			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");

Just for understanding, should we quit in this last case, as
well?

Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
making it clear that other failures like ENOMEM might happen.

Thanks,
Andi

