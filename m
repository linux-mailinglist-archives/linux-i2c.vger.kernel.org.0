Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0482F1D37
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388804AbhAKR5Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:57:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:34080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727658AbhAKR5Q (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 12:57:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF308223C8;
        Mon, 11 Jan 2021 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610387796;
        bh=VVdoe/fFkW7e9GLeLQQFncccjyQuk+zkmjS/cC7BkAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZiDVWKpuOlP1Hbb9plKYgEkukEOXsLduoQleVA94ifUcCfJX90xAk+ve2BOmQy+Mz
         2tGlj4Ixh6iYPDjfYVTirha3ARMNQFbG3gSIX0S/oUPIwUTPTkPblLxngv3nVsbPUt
         2wLjaYyHYVBtfDQOIA7WvsrMwYkC0bRAbYH2m2gne3SpkfBKkAw0bgnTp5hLh6m53N
         ZWUhTRWv0Ev8s5uoxvSpomX7YaaINezEsA9xwwh4FH5eY1riO9oF8kIkQUTWvX0st5
         csXbhCMY3vYcovfBtn8iN5A1ev58qEngThaGnePYQatzFepWIv4e5rLUqPRySyw/vd
         d0U7o3CV0kj+w==
Date:   Mon, 11 Jan 2021 23:26:31 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi <linux-spi@vger.kernel.org>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sdm845: enable dma for spi
Message-ID: <20210111175631.GD2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-8-vkoul@kernel.org>
 <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=UPNnSmgJM33QjAb4VvTe4Xs-OHcQCkk5E+o3u+afjbjA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 08:47, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 11, 2021 at 7:18 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > @@ -2622,6 +2626,13 @@ pinmux {
> >                                                "gpio2", "gpio3";
> >                                         function = "qup0";
> >                                 };
> > +
> > +                               config {
> 
> Convention in Qualcomm device tree files seems to be that the node is
> "pinconf", not "config".

Yes missed that, thanks for pointing
> 
> 
> > +                                       pins = "gpio0", "gpio1",
> > +                                              "gpio2", "gpio3";
> > +                                       drive-strength = <6>;
> > +                                       bias-disable;
> > +                               };
> 
> Pin config almost never belongs in the SoC dtsi file.  This should be
> in the board .dts file.  What if pulls are needed on some pins?  What
> if you need a stronger or weaker drive strength?

Right I will move it to dtsi

-- 
~Vinod
