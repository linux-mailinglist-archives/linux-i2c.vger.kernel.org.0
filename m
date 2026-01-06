Return-Path: <linux-i2c+bounces-14934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36181CFAA41
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 20:26:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF625304E5DA
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 19:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E06734DCC9;
	Tue,  6 Jan 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUJ2fCwr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC687347FCC;
	Tue,  6 Jan 2026 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767727570; cv=none; b=bvEbkZOI2d1TL+84nFSPM99K6QUzTdLTUUm0Q4W45RaZ6eHdXCztqgmxcLtFjnSScHH5YyxPXHZ9PzD9Ap/Oss1nq72BHCJjnq8sb9A765MV6lbpNl1qldzb48dj/NuY4o/0BtcJ/TeEw3bROc1lUgsDmdv80xqQ5h3VnaeRVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767727570; c=relaxed/simple;
	bh=gGVc1/KapFEOxarFtrkNbrunR8xtn/xMdPW8P332DNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4RzxC88jMC24AqybGMxMcfpYdtFALYT1f4znmUjpPjGMDxV++/FHqwl2EHnhOZtmnmc1N842CQJ8IRHwJT91JqbHdcI7KSoXl0TBYUcLmNDJlTGlRLaCykkSNP337HfCHPnpAvfjQgY4VA8iGrA5rptyEdUBxIUE2122z0/H6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUJ2fCwr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29130C116C6;
	Tue,  6 Jan 2026 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767727570;
	bh=gGVc1/KapFEOxarFtrkNbrunR8xtn/xMdPW8P332DNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUJ2fCwrJr8YWbHTBbd8BZa5z/dFXkNDde2l+lmKXasALMB2hPE2eybmWaJ1VE1RY
	 hjOyDXDeVz/MtIIT9dVelVBD6BI1j1bF1Y6piBbPTQoQz6MoAh2QUJaDfXRbTwqt1q
	 PpD/+Zcq5izUoJo7ibfO6od7/bMGeIgJQ4MInJ0XZRRagPT5jbdvaxhTUGARx108YW
	 KSSoosAoESldk6xLr5X+YN8GLRbTGatuuhmQMT1/jH1U6DKshYcyQN1Jb2M+9HLgw8
	 kZaA595gXXKT3o121bTxhzNciWthx+l8+wyd22N4cd3b4KDdEoJ5DrwFe4hBcx6kSp
	 Kil0N6SnGi2ZQ==
Date: Tue, 6 Jan 2026 13:26:09 -0600
From: Rob Herring <robh@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Message-ID: <20260106192609.GA2581379-robh@kernel.org>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>

On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile              |  2 +
>  arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo

You need to add talos-evk-camera.dtbo to dtb-y if you want it preserved 
and able to be installed (via dtbs_install). If you don't want that, 
then why is it a .dtbo?

Looks like other .dtbo's might have the same issue.

>  talos-evk-lvds-auo,g133han01-dtbs	:= \
>  	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb

