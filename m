Return-Path: <linux-i2c+bounces-8709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C30E9FC6BD
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 23:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AB7F1881EEF
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 22:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F011B3926;
	Wed, 25 Dec 2024 22:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XahO4jNI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADC01BC3F;
	Wed, 25 Dec 2024 22:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735167565; cv=none; b=oTl59wkhgl+p1woBXz1KONoET+47oQxlW9zWgaNTzRcKbwDsNkUSomnQCi8mRqsJrS4eiSGAlSX1S6pYuq+DaA7JLUORVqOQeDUs8iJ6ODUlYa6uY4APl+h/U+Sn6edX153nZoSq8uKAi62sm3NzEmaVzQ64cXZV6eU4E5CFeS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735167565; c=relaxed/simple;
	bh=1wNj/IVbA4Di3bccZAqMUVRlHal4Sy0QkfLVEqVzyew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMlyXSy6VhHjoBnqn6eZB1fnsScBJxihaJiImxblAnF9nPwcvAen+DEmXYKbna2/Qvqr++Fz/u1yAUG4mJU4pzhk82x1bwvBkWxLrXoRR92gXueKNikxlD5Xlfd3a80La3j57WI0pFtC+rfRFZM1DIwlhy3EIHjrP8PHQgwbUOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XahO4jNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D30C4CECD;
	Wed, 25 Dec 2024 22:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735167564;
	bh=1wNj/IVbA4Di3bccZAqMUVRlHal4Sy0QkfLVEqVzyew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XahO4jNIq/4cyWj9bfxRnwgWOpJoYWtmJ2EwJYJa1czF1QzSPC81zo+/xMgMjH84S
	 P2S2z7ZIxMbJcXYaVUGQRcgr64SzQb/Pv554A9pKU9f7aJIGSjXjRzuc1MW2Sf8Kem
	 zaSFplJFo3RPdZ2mTNvtojwfZSqaEASp/luHU/ZhtVP+86XrQUb/j5omCMPjB8jtbx
	 UGpsU46m4Tyf1F/7gQyXcX2EfV/ruLWnTf/8e6c0rN0rNahTR0qp0oMBK9v47EEHn4
	 uj7+Eeevbvj5iqPXdElR+WM4D8ESsXn/Nq5WtoduX4A5Ifi5x5kPwqtG71YvgNh63X
	 jVmiyN2HzlXaw==
Date: Wed, 25 Dec 2024 23:59:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Message-ID: <djpcvn7von4rizjucplqwxlmpuaemrl7x3jsbqmojgzhybfu6o@n6l3dmtjy7jy>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
 <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

On Sat, Dec 21, 2024 at 05:19:37PM +0200, Ivaylo Ivanov wrote:
> Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
> and temp calculations are slightly changed according to the following

/changed/different/

> logic:
> 
> FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
> ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
> 
> temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
> 

...

> @@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  	 *
>  	 */
>  	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
> -	temp = clkin / op_clk - 8 - t_ftl_cycle;
> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
> +		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
> +	else
> +		temp = clkin / op_clk - 8 - t_ftl_cycle;
>  	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
>  		temp -= t_ftl_cycle;

Could you please make this:

	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
		...
	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
		...
	else
		...

For a better clarity.

Thanks,
Andi

