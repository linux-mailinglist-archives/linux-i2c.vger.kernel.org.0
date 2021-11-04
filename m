Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B36F444D5C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Nov 2021 03:44:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhKDCre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 22:47:34 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:35920 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhKDCre (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Nov 2021 22:47:34 -0400
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 0C894616ED;
        Thu,  4 Nov 2021 02:44:54 +0000 (UTC)
Subject: Re: [PATCH v4] i2c: qcom-geni: Add support for GPI DMA
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, linux-i2c@vger.kernel.org
References: <20211019060158.1482722-1-vkoul@kernel.org>
 <eb297333-63bb-91c4-6340-801c3c9e3663@postmarketos.org>
 <YYIca8877aa6hNmd@matsya>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <86ac1b82-24b3-a108-2d42-267428ae3d98@postmarketos.org>
Date:   Thu, 4 Nov 2021 05:44:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YYIca8877aa6hNmd@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.11.2021 08:21, Vinod Koul пишет:
> Hello Alexey,
> 
> On 03-11-21, 05:13, Alexey Minnekhanov wrote:
>> 19.10.2021 09:01, Vinod Koul wrote:
>>> This adds capability to use GSI DMA for I2C transfers
>>>
>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>> ---
>>> Changes since v3:
>>>    - remove separate tx and rx function for gsi dma and make a common one
>>>    - remove global structs and use local variables instead
>>>
>>
>> Hi, I've tried this patch on sm8150 board and I'm seeing weird things:
>>
>> [    0.428829] gpi c00000.dma-controller: Adding to iommu group 0
>> [    0.480453] geni_se_qup cc0000.geniqup: Adding to iommu group 1
>> [    0.484019] geni_i2c c80000.i2c: Bus frequency not specified, default to
>> 100kHz.
>> [    0.487172] geni_i2c c80000.i2c: error 0000000000000000: Failed to get tx
>> DMA ch
>> [    0.495499] geni_i2c c80000.i2c: error 0000000000000000: Failed to get rx
>> DMA ch
>> [    0.499842] geni_i2c c80000.i2c: Grabbed GPI dma channels
>> [    0.504784] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
>> [    0.510812] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added
>>
>> It seems weird to me that it "failed to get DMA channels", but then says
>> anyway "Grabbed GPI DMA channels" and "Using GPI DMA mode for I2C".
>>
>> What I did in dts is basically include sm8150.dtsi and do
>>
>> &gpi_dma2 {
>> 	status = "okay";
>> };
>>
>> &i2c17 {
>> 	status = "okay";
>> 	dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
>> 		<&gpi_dma2 1 0 QCOM_GPI_I2C>;
>> 	dma-names = "tx", "rx";
>> 	/* empty - no clients */
>> }
>>
>> Another observation, even if I comment out "dmas" and "dma-names" in i2c17
>> node, I get
>>
>> [    0.487037] geni_i2c c80000.i2c: error (____ptrval____): Failed to get tx
>> DMA ch
>> [    0.490077] geni_i2c c80000.i2c: error (____ptrval____): Failed to get rx
>> DMA ch
>> [    0.493077] geni_i2c c80000.i2c: Grabbed GPI dma channels
>> [    0.496061] geni_i2c c80000.i2c: Using GPI DMA mode for I2C
>> [    0.500155] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added
> 
> This does not look correct. In absence of dmas property, the channel
> allocation should not have gone ahead and you should not see " Grabbed
> GPI dma channels" message!
> 

If I change these lines in setup_gpi_dma()

  ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->tx_c), "Failed to get 
tx DMA ch\n");
  ...
  ret = dev_err_probe(gi2c->se.dev, IS_ERR(gi2c->rx_c), "Failed to get 
rx DMA ch\n");

to

  ret = dev_err_probe(gi2c->se.dev, PTR_ERR_OR_ZERO(gi2c->tx_c), "Failed 
to get tx DMA ch\n");
  ...
  ret = dev_err_probe(gi2c->se.dev, PTR_ERR_OR_ZERO(gi2c->rx_c), "Failed 
to get rx DMA ch\n");

Then dmesg looks as expected:

[    0.401471] geni_i2c c80000.i2c: Bus frequency not specified, default 
to 100kHz.
[    0.404609] geni_i2c c80000.i2c: error -ENODEV: Failed to get tx DMA ch
[    0.407711] geni_i2c c80000.i2c: FIFO mode disabled, but couldn't get 
DMA, fall back to FIFO mode
[    0.410542] geni_i2c c80000.i2c: i2c fifo/se-dma mode. fifo depth:16
[    0.414814] geni_i2c c80000.i2c: Geni-I2C adaptor successfully added

I think maybe IS_ERR is a mistake here, and PTR_ERR_OR_ZERO should be used?

-- 
Regards
Alexey Minnekhanov
postmarketOS developer
https://www.postmarketos.org
