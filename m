Return-Path: <linux-i2c+bounces-1392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27D8330A6
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 23:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BDEB1F23071
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 22:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DB258AC4;
	Fri, 19 Jan 2024 22:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0eg5u8Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42B56475;
	Fri, 19 Jan 2024 22:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705702012; cv=none; b=tzk3U0rANN31aUWhTaaOsX0G1P+gH9goe3Oe80zCB/cAnTdaOMTVeh5fuBYUK400cxdGO0BgvF3ZiE/qAh3B3vTfwyw7AdwOsqeZgw4RuH3We2WhigUBch8ooYmfmVmMdNYdGMf8o31CaEBIjoGtyUESr/A2iyaIH2sitvGpyXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705702012; c=relaxed/simple;
	bh=bAiP8neWkuFOr1UcviXY9sGWpEscgq5SMLZxG3s9Dt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyzRQGp+4KX2Pj6c32h+wj95+6zaxG1UOJCjiRayKBL9I6TUynaRuY0R1gFkRXr78u5z51p3zW1NXaOOlaNGICQjvTIJJGQr0y19zLuu7E36vWtk3MPLlv0lSSP4pdfGo2wogj6hWe1WAQSUWYF3els0TihSxDjuwQsZsN3YozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0eg5u8Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E49C433F1;
	Fri, 19 Jan 2024 22:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705702012;
	bh=bAiP8neWkuFOr1UcviXY9sGWpEscgq5SMLZxG3s9Dt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H0eg5u8QwEQ6ypQgu+Ro/nkwaVoSk6fZjoWXqYEmXDBBypv3SaURpbSvuGPnkUm9o
	 0iLO54XqFDrY5SKuQZx1PtWWdbaWIgzQTzV0z70555OEw/cl0wpl9rZN9FKfkiyBAu
	 SnG9Ko2Xb/Ck170Mviz7ss9Pl+yNAe9Xg7Gdjqf86+CfI4wXVZ78Auk6i3XkpHvEn8
	 o34tv8O0Sbg6s3KM1vurE0tBmVLz8HbPfZTpKnkQxTLGN+n1rFaTju4cEt2Sd0Ic8a
	 RkPd0onKWlpH1K9oGo+Gggwbv4VFEK2eJRyldbIWTPpp09a5rhij2/rv2jp9evvYPK
	 wyA/FwbQHedSA==
Date: Fri, 19 Jan 2024 16:06:48 -0600
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: olivier.moysan@foss.st.com, gregkh@linuxfoundation.org,
	richardcochran@gmail.com, arnd@kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, mchehab@kernel.org, peng.fan@oss.nxp.com,
	pabeni@redhat.com, rcsekar@samsung.com,
	alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
	linux-serial@vger.kernel.org, Oleksii_Moisieiev@epam.com,
	linux-spi@vger.kernel.org, will@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, lars@metafoo.de,
	conor+dt@kernel.org, linux-mmc@vger.kernel.org, kuba@kernel.org,
	linux-media@vger.kernel.org, arnaud.pouliquen@foss.st.com,
	andi.shyti@kernel.org, ulf.hansson@linaro.org,
	Frank Rowand <frowand.list@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-phy@lists.infradead.org, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee@kernel.org,
	catalin.marinas@arm.com, mkl@pengutronix.de,
	herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, hugues.fruchet@foss.st.com,
	edumazet@google.com, netdev@vger.kernel.org, vkoul@kernel.org,
	wg@grandegger.com, linux-i2c@vger.kernel.org, davem@davemloft.net
Subject: Re: [PATCH v9 02/13] dt-bindings: treewide: add access-controllers
 description
Message-ID: <170570200425.1132338.1743644162144723458.robh@kernel.org>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-3-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105130404.301172-3-gatien.chevallier@foss.st.com>


On Fri, 05 Jan 2024 14:03:53 +0100, Gatien Chevallier wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> Description of this property is added to all peripheral binding files of
> the peripheral under the STM32 firewall controller. It allows an accurate
> representation of the hardware, where various peripherals are connected
> to a firewall bus. The firewall can then check the peripheral accesses
> before allowing its device to probe.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
> 	- Minor changes in commit message
> 	- Renamed access-controller to access-controllers
> 
> Changes in V5:
> 	- Discarded review tags as the content has changed
> 	- Renamed feature-domains to access-controller
> 
> Changes in V4:
> 	- Added Jonathan's tag for IIO
> 
> Changes in V2:
> 	- Add missing "feature-domains" property declaration
> 	  in bosch,m_can.yaml and st,stm32-cryp.yaml files
> 
>  Documentation/devicetree/bindings/crypto/st,stm32-cryp.yaml   | 4 ++++
>  Documentation/devicetree/bindings/crypto/st,stm32-hash.yaml   | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dma.yaml       | 4 ++++
>  Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml    | 4 ++++
>  Documentation/devicetree/bindings/i2c/st,stm32-i2c.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml   | 4 ++++
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml       | 4 ++++
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.yaml   | 4 ++++
>  Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml | 4 ++++
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 ++++
>  .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml        | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml   | 4 ++++
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml    | 4 ++++
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml          | 4 ++++
>  Documentation/devicetree/bindings/net/can/bosch,m_can.yaml    | 4 ++++
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml        | 4 ++++
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml  | 4 ++++
>  .../devicetree/bindings/regulator/st,stm32-vrefbuf.yaml       | 4 ++++
>  Documentation/devicetree/bindings/rng/st,stm32-rng.yaml       | 4 ++++
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-sai.yaml     | 4 ++++
>  Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml      | 4 ++++
>  Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 4 ++++
>  Documentation/devicetree/bindings/usb/dwc2.yaml               | 4 ++++
>  26 files changed, 104 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


