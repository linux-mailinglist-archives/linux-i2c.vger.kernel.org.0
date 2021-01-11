Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405872F1CF4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389715AbhAKRrg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:47:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:60422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731491AbhAKRrg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 12:47:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 918FA20738;
        Mon, 11 Jan 2021 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610387215;
        bh=M5kVK7uF3sGT60+cuOEj9ZXacj6vUP4CkK/QSJuRLx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tyCfU3ThDjQPJZ4eZw7MvG2lkorZbmWu5xZs+sFc1zhVuLiTUNRQSME4ifdtzyWel
         0UJaDK1NPucuAA1sgO1uhXq5q5KaF5KgHsyWlqUW1WxWcH+KoBgHd2LABE6rzOrOMh
         w/ZR7DOFkraAF7vZ98WDdVIrntY9NRSWdoG8SbYWjUsMKBZcP8uHtAwLwXjLvloEOt
         8/nv6QxZR6lGEd/mtMYtY2SjDkB0+lCVgQzhiUpaY+pprwYx+80sOmEyYJ8ZwgYzp9
         fE7LnQtLKCt647CF8l+as4drdIVFvDvbHnb7Qzwd8xm66/EZT6or2Ro1ftOAopiMm6
         hjgTvXDQmbS6Q==
Date:   Mon, 11 Jan 2021 23:16:49 +0530
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
Message-ID: <20210111174649.GC2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-8-vkoul@kernel.org>
 <6cc90f43-f2c8-85f7-3d1c-f96468aab196@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cc90f43-f2c8-85f7-3d1c-f96468aab196@somainline.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Konrad,

On 11-01-21, 17:04, Konrad Dybcio wrote:
> Hi,
> 
> looks like sdm845-cheza also uses the spi0 bus, which as far as I
> understand is going to break with the GPI DMA disabled. Perhaps it
> should also be enabled over there?

If it is working without GPI enabled, it would work.. GPI for QUP is
something that requires firmware and would have to be enabled by
firmware

> Actually, is there a point in disabling DMA for BLSPs/QUPs in the SoC
> DTSI? I don't think any platform/vendor firmware disables entire
> hosts..

Since DMA support may not be available on certain targets (firmware
support), so enabling per board would make sense

Thanks
-- 
~Vinod
