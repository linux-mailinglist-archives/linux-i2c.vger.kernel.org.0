Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F216443B4B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 03:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhKCCW7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Nov 2021 22:22:59 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:48026 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230478AbhKCCW7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 2 Nov 2021 22:22:59 -0400
X-Greylist: delayed 417 seconds by postgrey-1.27 at vger.kernel.org; Tue, 02 Nov 2021 22:22:58 EDT
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id DAEDD616ED;
        Wed,  3 Nov 2021 02:13:24 +0000 (UTC)
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, linux-i2c@vger.kernel.org
References: <20211019060158.1482722-1-vkoul@kernel.org>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <eb297333-63bb-91c4-6340-801c3c9e3663@postmarketos.org>
Date:   Wed, 3 Nov 2021 05:13:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019060158.1482722-1-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.10.2021 09:01, Vinod Koul wrote:
> This adds capability to use GSI DMA for I2C transfers
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since v3:
>   - remove separate tx and rx function for gsi dma and make a common one
>   - remove global structs and use local variables instead
> 

Hi, I've tried this patch on sm8150 board and I'm seeing weird things:

[    0.428829] gpi c00000.dma-controller: Adding to iommu group 0
[    0.480453] geni_se_qup cc0000.geniqup: Adding to iommu group 1
[    0.484019] geni_i2c c80000.i2c: Bus frequency not specified, default 
to 100kHz.
[    0.487172] geni_i2c c80000.i2c: error 0000000000000000: Failed to 
get tx DMA ch
[    0.495499] geni_i2c c80000.i2c: error 0000000000000000: Failed to 
get rx DMA ch
[    0.499842] geni_i2c c80000.i2c: Grabbed GPI dma channels
[    0.504784] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
[    0.510812] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added

It seems weird to me that it "failed to get DMA channels", but then says 
anyway "Grabbed GPI DMA channels" and "Using GPI DMA mode for I2C".

What I did in dts is basically include sm8150.dtsi and do

&gpi_dma2 {
	status = "okay";
};

&i2c17 {
	status = "okay";
	dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
		<&gpi_dma2 1 0 QCOM_GPI_I2C>;
	dma-names = "tx", "rx";
	/* empty - no clients */
}

Another observation, even if I comment out "dmas" and "dma-names" in 
i2c17 node, I get

[    0.487037] geni_i2c c80000.i2c: error (____ptrval____): Failed to 
get tx DMA ch
[    0.490077] geni_i2c c80000.i2c: error (____ptrval____): Failed to 
get rx DMA ch
[    0.493077] geni_i2c c80000.i2c: Grabbed GPI dma channels
[    0.496061] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
[    0.500155] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added

-- 
Regards
Alexey Minnekhanov
