Return-Path: <linux-i2c+bounces-12093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDBB16966
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 01:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666A87B0D60
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 23:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33802241669;
	Wed, 30 Jul 2025 23:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6aMB3CE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A889D23ED76;
	Wed, 30 Jul 2025 23:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753919193; cv=none; b=tAwPUWwl6mJxi2gitAMtDBHpCBUiQ+QOOLXlMyXa9iw1bIDXEtjbiGkqb/78I3Ok6x64u+maRES53/uOPIwBe92KBfZuABdFQZgaRz6AF8QCluYI3510kFWDKZQ+Bcg5aOYirfeis1sL4VRggGxuWctGPamAbnWzW/eLtzz1x7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753919193; c=relaxed/simple;
	bh=lVT1wO7Gp792FLsRAdREUHlRgKkz5jzpbMWb3qz8oAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPB/MkVNtCMEG6TUrVqcoqD6vhQ/tG9tQfzK0z7kDcIIWU7mEHlLAbozIIPcmyfeNcTghomvjhm/kMKpIy1TXoT6at0zhLd7vru1haB2dTk9sPzyZJl2W4NEUdce9VyMco8iI0pwGFdmSi6jFA9cSBI9FQfZwZCoRgK8gY4Jjyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6aMB3CE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE60C4CEEB;
	Wed, 30 Jul 2025 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753919193;
	bh=lVT1wO7Gp792FLsRAdREUHlRgKkz5jzpbMWb3qz8oAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6aMB3CEnMYdRMvFhM0HoWxdlsfSHx5m9Bk/+p1Tu0UGicuWCsqhq19gp+dX0Al9h
	 ufzZFFn01VVIdroTIq4MKl0fZ/jXA0kQi1QCdTjqDcwTjZxYoyfU/uuJyEJFJ07qA3
	 JeevVFdeYuOabfOwyqTlFCWN1dNkch6m/kOPdEHig9UkogvqR0kkVlL3sW42idySmr
	 x7aqCguqpUrMz8Z85WFv4WuLtwZBipysMMnejHZV3hwlBdm9je7Ql0SKF+YJtdXmhy
	 NHQOsrp+G1CwLUn1GZ0rWyOwYzqJkYhvDIzHrpoYxleGqrTIE6mU0fyubuC2rc1aQK
	 gJh+uVlo0psBg==
Date: Wed, 30 Jul 2025 18:46:31 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Saravana Kannan <saravanak@google.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/6] dt-bindings: dma: qcom,gpi: Retire passing the
 protocol ID
Message-ID: <20250730234631.GA1899887-robh@kernel.org>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>

On Wed, Jul 30, 2025 at 11:33:28AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a software construct that has no business being expressed in
> dt-bindings. Drivers can be constructed to retrieve the protocol ID at
> runtime or hardcode them per protocol.
> 
> Remove it, as a pre-requisite for further simplifying the GENI
> bindings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index bbe4da2a11054f0d272017ddf5d5f7e47cf7a443..745613b93b210afd38946030f7477e91e08c907a 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -61,14 +61,13 @@ properties:
>      maxItems: 13
>  
>    "#dma-cells":
> -    const: 3
> +    const: 2

I think you need to keep 3 and note it is deprecated. Does an existing 
kernel support this being 2 already. If not, ABI break...

>      description: >
>        DMA clients must use the format described in dma.txt, giving a phandle
>        to the DMA controller plus the following 3 integer cells:
>        - channel: if set to 0xffffffff, any available channel will be allocated
>          for the client. Otherwise, the exact channel specified will be used.
>        - seid: serial id of the client as defined in the SoC documentation.
> -      - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
>  
>    iommus:
>      maxItems: 1
> @@ -98,7 +97,7 @@ examples:
>      #include <dt-bindings/dma/qcom-gpi.h>
>      gpi_dma0: dma-controller@800000 {
>          compatible = "qcom,sdm845-gpi-dma";
> -        #dma-cells = <3>;
> +        #dma-cells = <2>;
>          reg = <0x00800000 0x60000>;
>          iommus = <&apps_smmu 0x0016 0x0>;
>          dma-channels = <13>;
> 
> -- 
> 2.50.1
> 

