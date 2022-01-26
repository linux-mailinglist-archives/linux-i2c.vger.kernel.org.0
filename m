Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4130049C9CE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jan 2022 13:36:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241379AbiAZMgp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jan 2022 07:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241367AbiAZMgo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jan 2022 07:36:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13009C06161C;
        Wed, 26 Jan 2022 04:36:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB72CB81CE3;
        Wed, 26 Jan 2022 12:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A37C340E3;
        Wed, 26 Jan 2022 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643200601;
        bh=3I+z5AVhRhlM0awDUzxxaMmboPaqYIm+jrpwPTdYzFU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y5OXzz3ICt+SdzOsxbVk8k/BY3IzCcfSI0iVXkDZLjenf9xKBWDIjWdbUPF9R5acM
         mq4frAAfR24SPgPW0JBO0Xm8eZYI8PoW9OTNGALkTK7FFmMOFe3kBIi4EmtH67e7bG
         lzOgH/DLB2djhzdUBw2LHcrNs/hZMnRnAOGE3x0ur6tyIdT9A3lWS9OnaLt/vVFRt6
         15zYTFI7OG8rTl4CBxQwtrXdHRrSCdCAYq3UeWNZk3zAuQoysSCC6kqHcnyJXsPKkE
         lJndpez/nMQ23L4EQRvpTtnKO/qqif+odnUAouQuOASqqJHoF7sasrrzKX9wEdHNT4
         1sc4JSTwgYKhQ==
Date:   Wed, 26 Jan 2022 20:36:34 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Clark Wang <xiaoning.wang@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [RESEND v4 04/10] arm64: dts: freescale: Add adma subsystem dtsi
 for imx8dxl
Message-ID: <20220126123633.GQ4686@dragon>
References: <1639680494-23183-1-git-send-email-abel.vesa@nxp.com>
 <1639680494-23183-5-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639680494-23183-5-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 16, 2021 at 08:48:08PM +0200, Abel Vesa wrote:
> Override the I2Cs, LPUARTs, audio_ipg_clk and dma_ipg_clk with
> the i.MX8DXL specific properties.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> new file mode 100644
> index 000000000000..eccc31ee8f1b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + */
> +
> +&audio_ipg_clk {
> +	clock-frequency = <160000000>;
> +};
> +
> +&dma_ipg_clk {
> +	clock-frequency = <160000000>;
> +};
> +
> +&i2c0 {
> +	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
> +	interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c1 {
> +	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
> +	interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c2 {
> +	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
> +	interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&i2c3 {
> +	compatible = "fsl,imx8dxl-lpi2c", "fsl,imx7ulp-lpi2c";
> +	interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&lpuart0 {
> +	compatible = "fsl,imx8dxl-lpuart", "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +	interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&lpuart1 {
> +	compatible = "fsl,imx8dxl-lpuart", "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&lpuart2 {
> +	compatible = "fsl,imx8dxl-lpuart", "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +	interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +
> +&lpuart3 {
> +	compatible = "fsl,imx8dxl-lpuart", "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
> +	interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
> +};
> +

Drop the newline.

Shawn
