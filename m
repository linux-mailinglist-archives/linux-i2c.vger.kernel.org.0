Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBA52F2116
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 21:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391209AbhAKUqO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 15:46:14 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:59151 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391229AbhAKUqN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Jan 2021 15:46:13 -0500
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 670233E80D;
        Mon, 11 Jan 2021 21:45:09 +0100 (CET)
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
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
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-8-vkoul@kernel.org>
 <6cc90f43-f2c8-85f7-3d1c-f96468aab196@somainline.org>
 <20210111174649.GC2771@vkoul-mobl>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <12aae061-3a7e-883f-9b82-0b608ccf9441@somainline.org>
Date:   Mon, 11 Jan 2021 21:45:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111174649.GC2771@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> If it is working without GPI enabled, it would work.. GPI for QUP is
> something that requires firmware and would have to be enabled by
> firmware


I think with the new code of yours:


mas->tx = dma_request_slave_channel(mas->dev, "tx");
+ if (IS_ERR_OR_NULL(mas->tx)) {
+ dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx)); ret = PTR_ERR(mas->tx); + goto out_pm;


it *may* fail to probe with the channels assigned in the "dmas=" property but with the engine having "status=disabled", but as I don't have any hardware to test that driver on, please confirm whether my concerns are right..


> Since DMA support may not be available on certain targets (firmware
> support), so enabling per board would make sense

Oh really, are there SDM845 boards shipping with GPI DMA *disabled to all peripherals*?


Konrad

