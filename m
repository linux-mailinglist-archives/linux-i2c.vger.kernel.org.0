Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CD42C57CE
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Nov 2020 16:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391313AbgKZPDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Nov 2020 10:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390916AbgKZPDo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Nov 2020 10:03:44 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 853FDC061A04
        for <linux-i2c@vger.kernel.org>; Thu, 26 Nov 2020 07:03:42 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id s63so1933186pgc.8
        for <linux-i2c@vger.kernel.org>; Thu, 26 Nov 2020 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4OqB/3haiWYCNr8nadTh8VkbptmpmSoKvfEWA0bQC/U=;
        b=Pv7y3gJh/O2SA04pT3kRHcXjTKjcw8QZT9E17Tx3c1PlEwBePny6zGflC+KZvsh+3e
         cHXb6iWUtXMk1weI8tGHTbofxeKeF+LQZYJWt9rhnm90tJT0xOLLoJEHTy7WSbSECbmX
         UHfYZ6NPdiOnGzBoNvvkj+ZPuvki8eFt2kdRx9EmmfNM0FDeprIW7TkfKopFK/tGVMni
         CEDdVeHTccibrOCpGKOOWEB7vQJ0GNaay8COrzqw51o/nJb5fkwAtfR5mAYYUAh7YyMp
         4Enjsa0IpRhkke17Kt9T909WyJyLOv0AFF0KC5VR/KgOVaZJsTXyLmbMXTHAhu91X197
         mTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4OqB/3haiWYCNr8nadTh8VkbptmpmSoKvfEWA0bQC/U=;
        b=oTDjaJne3VRe/Efw5h0ff5bE96LrOlV+u6TNekQWU4gUjUFrEum48qtKcLVllWrBo0
         cRrBmbKvJuFqotBUMqtlG9CeeER4JQWzlk4cNRwNoUOJpYhixwIgliQZGYifs0YSNGTy
         yE18SLCgpfp3Z0wG8zzdmDfg3WOysnHNll2HcppK6OzeUWoKQi0eNTN44c0VABQyQ6AX
         TCyK5s9E9wGTO6s+ZwSSWSxGUn86hCyb/R241Ox0yrUEVXcsf/gVBcn9IY9MjPbvDTSB
         Eyb1SGYUzRxnPpTxAzlZ8FdsnVe3ISJnrc9BFnasmY2OA1Wrbxda6nyu4tG0R47TLCqA
         Cv+Q==
X-Gm-Message-State: AOAM532YRmYEKqe8qVfZPrqxDTa+lgBiXYv7pgqg0f0j+SZUOTSYu50J
        HjzhWAocArXe9nRdF7hwxfE6pUnLdc0t
X-Google-Smtp-Source: ABdhPJzV0LkP3ze5/E8gzvI2qrygejJBGBhcv7q10/iXU6If946LEMRLWGJaJj6madvdw476mX5vkw==
X-Received: by 2002:a63:461b:: with SMTP id t27mr2895424pga.122.1606403021920;
        Thu, 26 Nov 2020 07:03:41 -0800 (PST)
Received: from thinkpad ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id m204sm5055616pfd.118.2020.11.26.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:03:41 -0800 (PST)
Date:   Thu, 26 Nov 2020 20:33:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     loic.poulain@linaro.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: qcom: Fix IRQ error misassignement
Message-ID: <20201126150334.GC51288@thinkpad>
References: <20201126145321.18269-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126145321.18269-1-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 26, 2020 at 03:53:21PM +0100, Robert Foss wrote:
> During cci_isr() errors read from register fields belonging to
> i2c master1 are currently assigned to the status field belonging to

s/correctly/incorrectly

> i2c master0. This patch corrects this error, and always assigns
> master1 errors to the status field of master1.
> 

This patch fixes a legitimate bug. So there should be a fixes tag!

> Suggested-by: Loic Poulain <loic.poulain@linaro.org>

Reported-by?

Thanks,
Mani

> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index f13735beca58..1c259b5188de 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -194,9 +194,9 @@ static irqreturn_t cci_isr(int irq, void *dev)
>  	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
>  		if (val & CCI_IRQ_STATUS_0_I2C_M1_Q0_NACK_ERR ||
>  			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_NACK_ERR)
> -			cci->master[0].status = -ENXIO;
> +			cci->master[1].status = -ENXIO;
>  		else
> -			cci->master[0].status = -EIO;
> +			cci->master[1].status = -EIO;
>  
>  		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
>  		ret = IRQ_HANDLED;
> -- 
> 2.27.0
> 
