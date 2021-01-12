Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9C72F28F3
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 08:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392007AbhALHcf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Jan 2021 02:32:35 -0500
Received: from bmailout1.hostsharing.net ([83.223.95.100]:43139 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391921AbhALHcf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jan 2021 02:32:35 -0500
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id 77F5E300002AA;
        Tue, 12 Jan 2021 08:31:52 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 68CA219B9; Tue, 12 Jan 2021 08:31:52 +0100 (CET)
Date:   Tue, 12 Jan 2021 08:31:52 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] spi: spi-geni-qcom: Add support for GPI dma
Message-ID: <20210112073152.GA11056@wunner.de>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-5-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111151651.1616813-5-vkoul@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 11, 2021 at 08:46:48PM +0530, Vinod Koul wrote:
> @@ -328,8 +609,34 @@ static int spi_geni_init(struct spi_geni_master *mas)
>  	spi_tx_cfg &= ~CS_TOGGLE;
>  	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>  
> +	mas->tx = dma_request_slave_channel(mas->dev, "tx");
> +	if (IS_ERR_OR_NULL(mas->tx)) {
> +		dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx));
> +		ret = PTR_ERR(mas->tx);
> +		goto out_pm;
> +	} else {
> +		mas->rx = dma_request_slave_channel(mas->dev, "rx");
> +		if (IS_ERR_OR_NULL(mas->rx)) {
> +			dev_err(mas->dev, "Failed to get rx DMA ch %ld", PTR_ERR(mas->rx));
> +			dma_release_channel(mas->tx);
> +			ret = PTR_ERR(mas->rx);
> +			goto out_pm;
> +		}

These channels need to be released in spi_geni_remove().

Also, you may want to fall back to PIO mode if channel allocation fails.

Thanks,

Lukas
