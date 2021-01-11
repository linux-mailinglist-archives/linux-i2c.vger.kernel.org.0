Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F8A2F1CD9
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 18:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389859AbhAKRo2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 12:44:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:59456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389732AbhAKRo2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 12:44:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF1FC22ADF;
        Mon, 11 Jan 2021 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610387027;
        bh=6+/ilvJJLN7TEww9JbHDtpJW8J0ABFB6fdnOEzOK4r8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nFB3b/0Izl0LF2J1c+1JcukWORbRPjL7BOXwUoKN1RoRXSb4emMMhoYKv723oe7Bx
         rGYGf6kXaJC1clVuaUkQwgOb+zayO6GKyxFznd7R2M0N7XyoEeq0ZReYJ4D/RTkC0P
         QAd0QEXLV4qLZrsaU9mFIRLFcVR9t5YezS8FobwDsOlKVzhItuK2GxWr9UITkX+jzn
         g06gPHzCFAHHYQ0eozc8ErLrxpf7iOooJwkj2UnBBIy9cm9tvJ1Jpx9hacEzod0aON
         I5pt25He4ENNRfvh1sUy5AUbsqaV8fXIwhmn1bhndiM9iv3rPPAOEv5+haamXa8z2S
         7rSXtjhAu8ETw==
Date:   Mon, 11 Jan 2021 23:13:42 +0530
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
Subject: Re: [PATCH 2/7] soc: qcom: geni: move struct geni_wrapper to header
Message-ID: <20210111174342.GB2771@vkoul-mobl>
References: <20210111151651.1616813-1-vkoul@kernel.org>
 <20210111151651.1616813-3-vkoul@kernel.org>
 <X/xwHeRAs4Cl/efj@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/xwHeRAs4Cl/efj@builder.lan>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11-01-21, 09:34, Bjorn Andersson wrote:
> On Mon 11 Jan 09:16 CST 2021, Vinod Koul wrote:
> 
> > I2C geni driver needs to access struct geni_wrapper, so move it to
> > header.
> > 
> 
> Please tell me more!
> 
> Glanced through the other patches and the only user I can find it in
> patch 5 where you use this to get the struct device * of the wrapper.

That is correct. The dma mapping needs to be done with SE device.

> At least in the DT case this would be [SE]->dev->parent, perhaps we
> can't rely on this due to ACPI?

I would have missed that then, but I somehow recall trying that.. Though
I have not looked into ACPI..

Given that we would need to worry about ACPI, do you recommend using
parent or keeping this

-- 
~Vinod
