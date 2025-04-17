Return-Path: <linux-i2c+bounces-10465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20076A92016
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 16:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D4C3B134E
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 14:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548092528E8;
	Thu, 17 Apr 2025 14:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="luH7tDRQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14782522A0;
	Thu, 17 Apr 2025 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901216; cv=none; b=U5UWZfSLcUV2NYQ9ptAnXV9aD+PPINixPUMqCoPWmNzQmzqdGJEVqn7PEaFIQgTp8HwDb25aKS6NCjBOI0f+x8rdpNX6vpEJxCjWZv3ONARC5Gyc/VDo31FY5Lo3n5MFSABrfItP6IwIy5rtl9akIqpYAJwSUrJysCSDbeROhrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901216; c=relaxed/simple;
	bh=H70yVHYWvJ5Z8+txqrRrnuk6aHTbOYbR3Ii5eVeOgvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2YvAFvSLglvX6Dc1vkVBKATTMmH4LW60vjA23F1zYeY3Eqzzc7kbWbDP3xLiAA+IM+qLw83M2DRxWJS37JE3tNvCZ4xtGdINw13HgAYtH6XdHy0r+K6rWw4KC+rWF1ws++hOUgcSsZZtPOA4Fen8Tm6WPRthQAnofwfRTAa5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=luH7tDRQ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 260612053D;
	Thu, 17 Apr 2025 16:46:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yks9lixajrJd; Thu, 17 Apr 2025 16:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744901210; bh=H70yVHYWvJ5Z8+txqrRrnuk6aHTbOYbR3Ii5eVeOgvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=luH7tDRQhPOJIbn/CeP7p11nW39ynuzSqQO3wQqRbdFcN6g6xV8Y1tEEfAE2qxG5x
	 aV0WQflcd7f4fnhm84pQSUW4Ls4kUBc/lq20rjm7Aoy4Jh7/UmjzwoPbGCC43bGrbC
	 R/cyqUNjfzlTUR5zlVoPkB/l+QGtImggJMOxiP/uxozzBFo3pT6Or+p/aIY9hE5YKQ
	 yT4FrLlKTyZrYkxU3Eo3Fs4kF0G9b/mmdDMHS+Yh+1YVA484zRXjwsJ4HDrwsxzFyr
	 KpvCz8k8xX+yjihoTtR/uOF5mBvpNG+2yGOQxMgFGBVRhCdUdiLA87D6+XMltkRaIO
	 LtMEmPytLFcGg==
Date: Thu, 17 Apr 2025 14:46:35 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for
 RK3528
Message-ID: <aAEUS7QQbXSvrcEs@pie.lan>
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-5-ziyao@disroot.org>
 <ff583eb3-d01d-4850-9f9b-f6b15ddaf137@kernel.org>
 <c6d3e343-7005-48a9-a133-bf39cb6790ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6d3e343-7005-48a9-a133-bf39cb6790ee@kernel.org>

On Thu, Apr 17, 2025 at 04:36:57PM +0200, Krzysztof Kozlowski wrote:
> On 17/04/2025 16:36, Krzysztof Kozlowski wrote:
> > On 17/04/2025 14:01, Yao Zi wrote:
> >> Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
> >> I2C-4 and I2C-7 which come with only a set of possible pins, a default
> >> pin configuration is included.
> >>
> >> Signed-off-by: Yao Zi <ziyao@disroot.org>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 +++++++++++++++++++++++
> >>  1 file changed, 110 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> index 826f9be0be19..2c9780069af9 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> >> @@ -24,6 +24,14 @@ aliases {
> >>  		gpio2 = &gpio2;
> >>  		gpio3 = &gpio3;
> >>  		gpio4 = &gpio4;
> >> +		i2c0 = &i2c0;
> >> +		i2c1 = &i2c1;
> >> +		i2c2 = &i2c2;
> >> +		i2c3 = &i2c3;
> >> +		i2c4 = &i2c4;
> >> +		i2c5 = &i2c5;
> >> +		i2c6 = &i2c6;
> >> +		i2c7 = &i2c7;
> > Aliases are not properties of the SoC but boards.
> 
> Of course this should be: Bus/interface aliases are not...

Thanks for the explanation. Will move them to the board DT.

> Best regards,
> Krzysztof

Best regards,
Yao Zi

