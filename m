Return-Path: <linux-i2c+bounces-6953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97DB984111
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 10:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E101C2279D
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 08:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5207154445;
	Tue, 24 Sep 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDqZgTar"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B0A1474CF;
	Tue, 24 Sep 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167815; cv=none; b=YNjHeFhfRffu/ItIOI/mgKc9BkymqV1+91XAvPc7zbnZxxjEKuMoiYHXDlSN9czBtByYwZ0B6zP+t9s2qzpMh54+i7Gh/x+MLF8vfVANysOdncmcH/KMRlQYUoMWie9aLv9QIGJL2Dp06LOaK1FKj/mSzExjiEc5lSgceytQxOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167815; c=relaxed/simple;
	bh=Bh8SmAaVc4XgT/4g3N/J+SYtRoujP1VW37mILIdPvjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKkcV1JWNZh/480aDZSz1kR7HHbxM0qr4LReaU3NSwTl3q7UvQwwrwQrBJ1nV7r3Ab6FUvWWrthpMoPaFUNQ8VJj6NPJFeeS4JIp3KuNyO1NZH4T+midVVFLqqeQe4uldOT2nvgH4+X6W/aoUJbAIJpVxQsjgz+iYu5ZVjk7BxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDqZgTar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1968EC4CEC4;
	Tue, 24 Sep 2024 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167815;
	bh=Bh8SmAaVc4XgT/4g3N/J+SYtRoujP1VW37mILIdPvjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDqZgTarbcV23xBoRfwRsZsS8R4gAujoJVasDgXH50wS44CIca5TZrnEBaqdoieDW
	 mxn2SSeHt6l6KRkEVbEhdJSTk0cFrO24+o+/BDco1alODt3rAprAiXdK6KEYorPs6l
	 BB4JIa5VsIHEn5Am01SI0wKHaYuJ8HPKTcz3uRfxhHpd8f6U9cqKsCORuG3dY0glno
	 kdg1GX0X+W7SRLsiwmGRhRf70N7XqQNp/va4sck05F0/Ri3b9ku6vRJTgcoDMGZHmy
	 gV93TIHfREpD3vA+xnsRhXWI9QrWu4SIPeZ/MMftLYy9OydxlorFpu4L+kkW4WvF2L
	 DmBBVvQkuNJ6g==
Date: Tue, 24 Sep 2024 10:50:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tsbogend@alpha.franken.de, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mips: dts: realtek: Add I2C controllers
Message-ID: <ocmrfbu4atns3c2p7xev7vhktfzv3roy2ijz5qhqklylelgkor@zkrqoeiyvqoi>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-4-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923230230.3001657-4-chris.packham@alliedtelesis.co.nz>

On Tue, Sep 24, 2024 at 11:02:30AM +1200, Chris Packham wrote:
> Add the I2C controllers that are part of the RTL9300 SoC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - Use reg property
> 
>  arch/mips/boot/dts/realtek/rtl930x.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> index cf1b38b6c353..cc43025cd46c 100644
> --- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> @@ -33,12 +33,30 @@ lx_clk: clock-175mhz {
>  	switch0: switch@1b000000 {
>  		compatible = "realtek,rtl9302c-switch", "syscon", "simple-mfd";
>  		reg = <0x1b000000 0x10000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
>  
>  		reboot {
>  			compatible = "syscon-reboot";
>  			offset = <0x0c>;
>  			value = <0x01>;
>  		};
> +
> +		i2c0: i2c@36c {
> +			compatible = "realtek,rtl9300-i2c";
> +			reg = <0x36c 0x14>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};

This should be sent as one series... You have dependency otherwise. Also
this points to issue of mixing nodes with and without unit address.

I think i2c children should be under some sort of "i2c" bus node.

Please propose entire realtek,rtl9302c-switch binding with the I2C. It's
very confusing to see it partial.


Best regards,
Krzysztof


