Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7CA2F26FE
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jan 2021 05:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729615AbhALEWF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 23:22:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbhALEWF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 23:22:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B406522D05;
        Tue, 12 Jan 2021 04:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610425284;
        bh=TsQ5N/b8jTbHsTT7wjsqsmFoFMAyspIEwv3xRLTBXRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HW1OluuMX5BkajIIDsr5Sru/LKMrLiSPVM484dHVF9OCF9j6YQ2zU9FO6/gg2vf3O
         uXKs2XUp0VqpXblbRK/OnjeFWJSQDC1C8L9BSiCC5WWrfFcTQaduF6/IuqJv4vnq+k
         EvEQTApqcFDeD667MsotoPomv0BX3kvCu/gTa5nBethHRMPHg7NxmGsSRGiFp0wCw5
         /o0qhyS6xVwdZFbDUgOe1LEWSdJdh1AjrqUV4H5oWRoQjUMlrtT+RPcgIAhw+/xovQ
         Q9J0mh2BqeB/tnZD3AmT7o+JbjnMWFKhrRoBZYQYy2w0LFDp/t+r/ni+ocPCQfnwMe
         grmmu92hDrBjQ==
Date:   Tue, 12 Jan 2021 09:51:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sdm845: Add gpi dma node
Message-ID: <20210112042120.GG2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-7-vkoul@kernel.org>
 <X/yXoY/3pqvvDpd6@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/yXoY/3pqvvDpd6@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 12:23, Bjorn Andersson wrote:
> On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:
> 
> > This add the device node for gpi dma0 instances found in sdm845.
> 
> I think the 0 in "dma0" should go?

oops, will update

> 
> Apart from that, this looks good.
> 
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 46 ++++++++++++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index bcf888381f14..c9a127bbd606 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -1114,6 +1114,29 @@ opp-128000000 {
> >  			};
> >  		};
> >  
> > +		gpi_dma0: dma-controller@800000 {
> > +			#dma-cells = <3>;
> 
> Nit. I know #dma-cells are important to you ;) but I would prefer to
> have the standard properties (e.g. compatible) first.

Yes will reorder
-- 
~Vinod
