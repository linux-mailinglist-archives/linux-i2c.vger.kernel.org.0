Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4282F7E76
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Jan 2021 15:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731420AbhAOOoh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Jan 2021 09:44:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbhAOOog (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Jan 2021 09:44:36 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0EDC0613C1
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jan 2021 06:43:56 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id j20so8705496otq.5
        for <linux-i2c@vger.kernel.org>; Fri, 15 Jan 2021 06:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x0jeRffU+yop2UeLzXkeiDQE3IGPjGYo516b3eTS6oY=;
        b=IJ+4HWXUdwcAH3GtOhYa7ypaWMxhh5MbHnIQIlibpi840ZZ02W/dhYFnc5rH20mGNY
         2j6gViUNbEwJ8P8kJktJN6VHMMlRbOMzCRMyHhNYqYfe0J2e9g1R9jDBNUVAd8YeAh/e
         UnaXRNXhH5OtAZk7GlTbSBzLDOaj7K7ylyIXBcQs47u5LmTRHKAOxoC81VPBJc7197fo
         IDbB/nAPrSO23dHFAajc+A0m8bbOKSAoauPfBo9/ALGAwmDUHct2YYpcPVFzlkC5z/KG
         qCs17nZy3BmyuqPx6F09zdIGNeJ09QzAynUqXrKN2qcmrZQ3UO7Pudaa1llDn5CGE5IR
         Fziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x0jeRffU+yop2UeLzXkeiDQE3IGPjGYo516b3eTS6oY=;
        b=j3/FHpVLTrc3lNlUGpuQj6HclHBm1khLXy11cNI9Ft2sgOmF1G/6l05zaeVFLN+4XX
         LHr1/gOok2USFq6suzCzty/5vmbEoeSH5I91IvmR1TX6qXXfgy5mZCJWKNDG2Ef5Yk/9
         CYt2rRvH842TpkzkXB4Mx3Grw74dAuKEfdDMNgKGcaYcowynFWACWSucE+9hywU3UjHU
         LpXFHpCTDFlNi4LpyNLAiPvvO73RuEdfFv32GhgW1OEQY0OtYYu/RdlB7MPRMk4db4Dv
         wefWtDjB3fW0kHEkBDWfdWaNdef0nAPy2FDy3nWJBHv6L6ylf8Vxevdh4+yDJbzMVGVW
         d4Kw==
X-Gm-Message-State: AOAM532S2LACgG81nC9/cT7L/etOR1+DOKZAnKyrV0dN1JBqKfQjzo3v
        CgDvFC/imhjBeIXr+fRGDgdA8w==
X-Google-Smtp-Source: ABdhPJxjeiUubZZgCiEeMMb59uqjChQ3EteGlfG88/A7rOidXAq3ujcrFUAaVhSD6WWTbVBchNAgXw==
X-Received: by 2002:a9d:3e0d:: with SMTP id a13mr8552934otd.194.1610721835721;
        Fri, 15 Jan 2021 06:43:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w10sm1695715oic.44.2021.01.15.06.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 06:43:55 -0800 (PST)
Date:   Fri, 15 Jan 2021 08:43:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, ulf.hansson@linaro.org,
        viresh.kumar@linaro.org
Cc:     robh+dt@kernel.org, wsa@kernel.org, swboyd@chromium.org,
        dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        rnayak@codeaurora.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
Message-ID: <YAGqKfDfB7EEuZVn@builder.lan>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-4-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201224111210.1214-4-rojay@codeaurora.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu 24 Dec 05:12 CST 2020, Roja Rani Yarubandi wrote:

> @@ -629,6 +658,16 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
>  	disable_irq(gi2c->irq);
> +
> +	/* Drop the assigned performance state */
> +	if (gi2c->assigned_pstate) {
> +		ret = dev_pm_genpd_set_performance_state(dev, 0);
> +		if (ret) {
> +			dev_err(dev, "Failed to set performance state\n");
> +			return ret;
> +		}
> +	}
> +

Ulf, Viresh, I think we discussed this at the time of introducing the
performance states.

The client's state does not affect if its performance_state should
be included in the calculation of the aggregated performance_state, so
each driver that needs to keep some minimum performance state needs to
have these two snippets.

Would it not make sense to on enable/disable re-evaluate the
performance_state and potentially reconfigure the hardware
automatically?

Regards,
Bjorn

>  	ret = geni_se_resources_off(&gi2c->se);
>  	if (ret) {
>  		enable_irq(gi2c->irq);
> @@ -654,6 +693,16 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/* Set the assigned performance state */
> +	if (gi2c->assigned_pstate) {
> +		ret = dev_pm_genpd_set_performance_state(dev,
> +							 gi2c->assigned_pstate);
> +		if (ret) {
> +			dev_err(dev, "Failed to set performance state\n");
> +			return ret;
> +		}
> +	}
> +
>  	enable_irq(gi2c->irq);
>  	gi2c->suspended = 0;
>  	return 0;
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
