Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612E32F26FA
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 05:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbhALEUa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 23:20:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:36192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726723AbhALEUa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 23:20:30 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3C7D22D05;
        Tue, 12 Jan 2021 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610425189;
        bh=FO37EniEa2kQkwbyuyGiXqZ0QF3JxKl9A0w3chEQ+b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rfBIPP6/z3SWVutzIiC7OD2MXvKw+aWpy49bBTUjGrbzKh3uqvRj0I3sx5x2xBnnj
         x8tmSnu73yR4lYE0GLrAGMTvaNYaDkfwzVoOi/mZqkavS9mbqo1Mhm/AahY0jNm+fU
         S9s5aQUL3TewFP/WN2Gf3oLUwvGXNj15aPNH3PM4dn+n6q9LAtRr2EIiXr6Dx2EebW
         uFhvPQN4V1M+gaGc3EWpfZ2Tu7Y9BjtmRH93wHVH4H3p7+a+g7/rmdprqhizRwIeHG
         sv9e2AK7yJZfseqYkeyfX3mQl7jhJOj7b87GSvKhUWhoySSEGmkykMNojI4tnjna12
         1aJdktn9AsA7A==
Date:   Tue, 12 Jan 2021 09:49:44 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
Message-ID: <20210112041944.GF2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-8-vkoul@kernel.org>
 <6cc90f43-f2c8-85f7-3d1c-f96468aab196@somainline.org>
 <20210111174649.GC2771@vkoul-mobl>
 <12aae061-3a7e-883f-9b82-0b608ccf9441@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12aae061-3a7e-883f-9b82-0b608ccf9441@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 21:45, Konrad Dybcio wrote:
> 
> > If it is working without GPI enabled, it would work.. GPI for QUP is
> > something that requires firmware and would have to be enabled by
> > firmware
> 
> 
> I think with the new code of yours:
> 
> 
> mas->tx = dma_request_slave_channel(mas->dev, "tx");
> + if (IS_ERR_OR_NULL(mas->tx)) {
> + dev_err(mas->dev, "Failed to get tx DMA ch %ld", PTR_ERR(mas->tx)); ret = PTR_ERR(mas->tx); + goto out_pm;

This code would be exercised *only* when DMA mode is enabled in
firmware.. Both SPI and I2C driver would probe the mode supported
(reason for exposing stuff in first two patches of this series)..

Only if the device reports we should enable it.. Also if the device is
working with FIFO mode then DMA mode wont work..

> 
> it *may* fail to probe with the channels assigned in the "dmas="
> property but with the engine having "status=disabled", but as I don't
> have any hardware to test that driver on, please confirm whether my
> concerns are right..
> 
> 
> > Since DMA support may not be available on certain targets (firmware
> > support), so enabling per board would make sense
> 
> Oh really, are there SDM845 boards shipping with GPI DMA *disabled to
> all peripherals*?

Is the peripheral working with FIFO mode, then answer is yes :)

Thanks
-- 
~Vinod
