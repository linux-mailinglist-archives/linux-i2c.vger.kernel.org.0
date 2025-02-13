Return-Path: <linux-i2c+bounces-9411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77612A33A0B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 09:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 117F33A9357
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 08:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75CA20C016;
	Thu, 13 Feb 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYqnhrUz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347A1EF08E;
	Thu, 13 Feb 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739435584; cv=none; b=fCkdyhDVLuTAFngB4tag9bl3PHmhfswA4bHzYvQC5ccDduTTWvZHlUdXd2qcelPhNr9xm/xRHtajT/vMTBnM/Nxdz7VsMqvDwPEuWnCs48koVDFNfQ+NnBx4FG0U7JdrDDfg3Z+tgs7XfY1byPQrr1dwwpGK8Xen3yMUNImbN7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739435584; c=relaxed/simple;
	bh=YOSaO++vZECCzgrxinsAUHhdT47ujngvImrmv9gLGZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjQKmGlaejEyydB9rYE8ckQyOOmWBusxKxLKcZ8vPqAJ9DFZe2JXHWtItqRb2XBIE0ZIqIaMSdABK6BISc6OmhPtd1NXaDNGbBVnAbfofY1EogR9tQXDX4m3JY0II473+N6X6gugmevghJqa6Vx67WDhahERfAG4QwRBXz569rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYqnhrUz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491ABC4CED1;
	Thu, 13 Feb 2025 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739435584;
	bh=YOSaO++vZECCzgrxinsAUHhdT47ujngvImrmv9gLGZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYqnhrUzZ9GFpo5aMrXJl+nqINN01UnWMEJwAFEjqjMQFP1n6p1DNIPTekioQUG3E
	 SON/lfdY/8eu3eyZRK4vnc4f1WEac9FO+f/hMSgHRzyvXaPlSZjpsXcLVZawPWtHkU
	 9+bqrFL63FQ+JZi6EcUROpJw7cU9d9I0r2c1ybwTdqGXoftcUEGRQqFSnIj0P0NQgQ
	 Q/BnSX3ANLT14/aO7PIbU54mkc0G2HJzAsgaYroCsMUZlhk3E+UTlJ4cE1e4cQjqk+
	 iXuXOCV/Q3933x/8CyzfbpXXIfUolN84Syfvi6jIBUisc8NKaVj5XhfjW15KA3TGl/
	 anjYXMdlEcaVQ==
Date: Thu, 13 Feb 2025 09:33:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	andi.shyti@kernel.org, igor.belwon@mentallysanemainliners.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: i2c: exynos5: add
 samsung,exynos990-hsi2c compatible
Message-ID: <20250213-innocent-nimble-trout-0b7dea@krzk-bin>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
 <20250212004824.1011-3-wachiturroxd150@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212004824.1011-3-wachiturroxd150@gmail.com>

On Wed, Feb 12, 2025 at 12:48:22AM +0000, Denzeel Oliva wrote:
> Add samsung,exynos990-hsi2c dedicated compatible
> for representing I2C of Exynos990 SoC.
> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


