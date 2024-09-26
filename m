Return-Path: <linux-i2c+bounces-7019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F0986CA7
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31EB281425
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B3B188CA5;
	Thu, 26 Sep 2024 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blmOmNvh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5911AAC4;
	Thu, 26 Sep 2024 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332667; cv=none; b=DI/sTaB+TwaDKiRcciNhse4avey5ccAYMgD3tQ3UoW17yPrSVKREJ8fF4baE4fCBvRe87CT5phr5C/xtPb6LfdFRprpMRnVlrY447LeXsFlPLMROID0vQKIBO/eVR3tG3JrskPeWA4B4UVGSRzz0P+cDcUyv4poTln0zhPyajkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332667; c=relaxed/simple;
	bh=wOx3VDnN+2V5jk81bW4SKY4gtNi3PB26Lkiz+mCXQvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkkWy8V2p/Ve2JKVPZB3KZoV4Gvk7QIAyHmssvoaEfhd0WhBAcK/48sbZLOAE52qAB2KKW8vQC0E9S/Ke5juinhbyc0GCCIupUOd7JK/cpNBSY1/Js33FCtrRaJghZKGSBwe7cyPnuYoJF3Il+f0kmIUsefKomsoauy3dJbnFQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blmOmNvh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073FAC4CEC5;
	Thu, 26 Sep 2024 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727332665;
	bh=wOx3VDnN+2V5jk81bW4SKY4gtNi3PB26Lkiz+mCXQvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blmOmNvhW6JmOiLUqwznaWXbNMXydDDV0n2TTTvP+qr5zFslhYUrZ9VazPfTNYUrG
	 y/2QDRYPB/zoPYX3igZYY02ezQfrljlrw3u7zfVt7Hj1DJcsTqntprfWzc1LXReYlU
	 YoEZq1Ht1F24fty55RN6q6RY9NpgsW13jRVWq/rn5q0gwiP8MsDvAQk2tP6w6vgpya
	 wt6AAcWjPZmFDuZQa0i30ACYmEAJLijf8gDFzzITMzW9HELtnZguqSlz5cgeM+1daw
	 tgYVXo/GS5drpRDCu9YHV41J0m8bKTGJtd9awjdOdypkfpDT5HlFEp1pgs9H5nr+E2
	 oIfyLbxSQ7OpA==
Date: Thu, 26 Sep 2024 08:37:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org, sre@kernel.org, tsbogend@alpha.franken.de, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v5 5/6] mips: dts: realtek: Add I2C controllers
Message-ID: <euqypyub7f3bd7wa7w6axdt6mrvmbvckptvrum2rou3ni6sqdf@ouwm7zjuarni>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>

On Thu, Sep 26, 2024 at 09:58:46AM +1200, Chris Packham wrote:
> Add the I2C controllers that are part of the RTL9300 SoC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v5:
>     - Update compatibles
>     Changes in v4:
>     - Skipped due to combining patch series
>     Changes in v3:
>     - None
>     Changes in v2:
>     - Use reg property
> 
>  arch/mips/boot/dts/realtek/rtl9302c.dtsi |  8 ++++++++
>  arch/mips/boot/dts/realtek/rtl930x.dtsi  | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/realtek/rtl9302c.dtsi b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
> index 80d9f407e758..56c35e8b8b62 100644
> --- a/arch/mips/boot/dts/realtek/rtl9302c.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl9302c.dtsi
> @@ -5,3 +5,11 @@
>  &switch0 {
>  	compatible = "realtek,rtl9302c-switch", "realtek,rtl9300-switch", "syscon", "simple-mfd";
>  };
> +
> +&i2c0 {
> +	compatible = "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
> +};
> +
> +&i2c1 {
> +	compatible = "realtek,rtl9302c-i2c", "realtek,rtl9300-i2c";
> +};
> diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> index 89b8854596cd..2fb8461af575 100644
> --- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
> +++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
> @@ -41,6 +41,22 @@ reboot@c {
>  			reg = <0x0c 0x4>;
>  			value = <0x01>;
>  		};
> +
> +		i2c0: i2c@36c {
> +			compatible = "realtek,rtl9300-i2c";
> +			reg = <0x36c 0x14>;
> +			status = "disabled";

Usual convention is to have status the last. Maybe MIPS has different,
so keep whatever is consistent in your case.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


