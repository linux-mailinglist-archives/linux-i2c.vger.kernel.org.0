Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2FA443C82
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 06:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhKCFYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 01:24:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:34426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhKCFYc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 01:24:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E936A60FC4;
        Wed,  3 Nov 2021 05:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635916912;
        bh=PC04ZXTUEVgQ2y63bQaj8gzG38ZDoPKDfzJuERsCgF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g4eBRZPsmAoLH/vLkQHbJ6pTPpyySEQMD1B7yaAyM00M9qXJZ8jbbTIZ/K3IKdP93
         75ki+V64lrqgXtXifFtSTW36Y0zosaBjcBIsbAXWHNSm53NypIlhx+P9rklnRybC66
         HHgceiRkOa8RFPsWIof7GP3yusNyAZimxKcr7oLOcwAp4ncHYStUvyNgpjilGVzIlk
         6gRwNgW51ffw0Tmxif2VKJhO8Kr+lnAWsDuUrpXHlwzIp6ym1RVa1bK+lTndLjzUI2
         e7bOJERE2vMwUwAGfHR49u4wCNvZRfa9npTFNFQ6+gJSSW7LpN3W9iHzhXyT1HO57R
         3Fb/Z0QPzPQFg==
Date:   Wed, 3 Nov 2021 10:51:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
Message-ID: <YYIca8877aa6hNmd@matsya>
References: <20211019060158.1482722-1-vkoul@kernel.org>
 <eb297333-63bb-91c4-6340-801c3c9e3663@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb297333-63bb-91c4-6340-801c3c9e3663@postmarketos.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Alexey,

On 03-11-21, 05:13, Alexey Minnekhanov wrote:
> 19.10.2021 09:01, Vinod Koul wrote:
> > This adds capability to use GSI DMA for I2C transfers
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> > Changes since v3:
> >   - remove separate tx and rx function for gsi dma and make a common one
> >   - remove global structs and use local variables instead
> > 
> 
> Hi, I've tried this patch on sm8150 board and I'm seeing weird things:
> 
> [    0.428829] gpi c00000.dma-controller: Adding to iommu group 0
> [    0.480453] geni_se_qup cc0000.geniqup: Adding to iommu group 1
> [    0.484019] geni_i2c c80000.i2c: Bus frequency not specified, default to
> 100kHz.
> [    0.487172] geni_i2c c80000.i2c: error 0000000000000000: Failed to get tx
> DMA ch
> [    0.495499] geni_i2c c80000.i2c: error 0000000000000000: Failed to get rx
> DMA ch
> [    0.499842] geni_i2c c80000.i2c: Grabbed GPI dma channels
> [    0.504784] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
> [    0.510812] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added
> 
> It seems weird to me that it "failed to get DMA channels", but then says
> anyway "Grabbed GPI DMA channels" and "Using GPI DMA mode for I2C".
> 
> What I did in dts is basically include sm8150.dtsi and do
> 
> &gpi_dma2 {
> 	status = "okay";
> };
> 
> &i2c17 {
> 	status = "okay";
> 	dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
> 		<&gpi_dma2 1 0 QCOM_GPI_I2C>;
> 	dma-names = "tx", "rx";
> 	/* empty - no clients */
> }
> 
> Another observation, even if I comment out "dmas" and "dma-names" in i2c17
> node, I get
> 
> [    0.487037] geni_i2c c80000.i2c: error (____ptrval____): Failed to get tx
> DMA ch
> [    0.490077] geni_i2c c80000.i2c: error (____ptrval____): Failed to get rx
> DMA ch
> [    0.493077] geni_i2c c80000.i2c: Grabbed GPI dma channels
> [    0.496061] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
> [    0.500155] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added

This does not look correct. In absence of dmas property, the channel
allocation should not have gone ahead and you should not see " Grabbed
GPI dma channels" message!

Btw what is the output of below when dmas was commented out:
cat /sys/kernel/debug/dmaengine/summary

This would show the channels allocated to each controller

-- 
~Vinod
