Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE441CB6ED
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 20:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgEHSQs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 14:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727792AbgEHSQr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 14:16:47 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2AAC061A0C
        for <linux-i2c@vger.kernel.org>; Fri,  8 May 2020 11:16:46 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 18so1358980pfv.8
        for <linux-i2c@vger.kernel.org>; Fri, 08 May 2020 11:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+GOH5CMg7TvSS6YmTrREiB8ZfgmAvE4FrlRLVno4k3I=;
        b=g9JK9p2CwrlaLOL8A569zbG2FhvCXA0Yr6GrjYIjREdGi8LSk7LZwvUosKYkCdmE9Y
         jMjDNlHDG4AIH2M0p5xhbfoLAfJ6oycHeyUoCO6sPPXJ9WYlK594DZll1NwBW6Mo8wTw
         Cs4gmZxDkrNqI12zR/cOcGpVqskqvqXRs6zY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+GOH5CMg7TvSS6YmTrREiB8ZfgmAvE4FrlRLVno4k3I=;
        b=n0Rm5w1vID2fPpp6bxtxMO9BV2HloqFpi+gEQQRET0e6ieLoSqzjYQ+B/XO2ddkgb5
         qBV1IZ+qXEH1UJHSH3VcJRz7s9vGaTPRzrbGszpjk/5zIQPT5qstAUEFCVQUqcDsSKur
         hfRJ8VIeKcFKgbiA2+t3EQaviG6y8kJScFFM59vnAVJQllKTu+86vfcHQNzMGtHwiZao
         mCvyz1DD1ucIqO+ZW0BIrPxACoFnYrpZRVx86ggMovqc1+MEilfbRjZ4Hd4vC9L/NVsc
         aLWN8+z+x+jVHUjiKDzaNW+zF3mYxq+asSlD6DnTWmkSWdxlYWYJapKq/sEKVrX4t0dc
         l28g==
X-Gm-Message-State: AGi0PuagW2Mjy+CktJaWJVOU1r78wlowuzX+e4gFXCZ0fkfxGorztqS/
        19Atb5Fqw+yWypAhvDpd3yiJ2w==
X-Google-Smtp-Source: APiQypKTdb8iFKBow7shDIzD5hpaZSYnHSE35O6SgM6uO8zUROwHLZrsgE/x3ND5myPlWgtEE9ekrg==
X-Received: by 2002:a65:6652:: with SMTP id z18mr3191808pgv.76.1588961806473;
        Fri, 08 May 2020 11:16:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id gn20sm2993706pjb.24.2020.05.08.11.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 11:16:45 -0700 (PDT)
Date:   Fri, 8 May 2020 11:16:44 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org, georgi.djakov@linaro.org
Subject: Re: [PATCH V5 3/7] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200508181644.GC4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588919619-21355-4-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 08, 2020 at 12:03:35PM +0530, Akash Asthana wrote:
> Get the interconnect paths for I2C based Serial Engine device
> and vote according to the bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_i2c_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - As per Matthias comment, use common library APIs defined in geni-se
>    driver for ICC functionality.
> 
> Changes in V4:
>  - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>    to ICC core.
> 
> Changes in V5:
>  - Use icc_enable/disable in power on/off call.
> 
>  drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 18d1e4f..f2e786d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -557,6 +557,25 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	gi2c->adap.dev.of_node = dev->of_node;
>  	strlcpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
>  
> +	ret = geni_icc_get(&gi2c->se, "qup-memory");
> +	if (ret)
> +		return ret;
> +	/*
> +	 * Set the bus quota for core and cpu to a reasonable value for
> +	 * register access.
> +	 * Set quota for DDR based on bus speed.
> +	 */
> +	geni_icc_bw_init(&gi2c->se.icc_paths[GENI_TO_CORE], GENI_DEFAULT_BW,
> +				0);
> +	geni_icc_bw_init(&gi2c->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW,
> +				0);
> +	geni_icc_bw_init(&gi2c->se.icc_paths[GENI_TO_DDR],
> +				Bps_to_icc(gi2c->clk_freq_out), 0);
> +
> +	ret = geni_icc_set_bw(&gi2c->se);
> +	if (ret)
> +		return ret;
> +
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret) {
>  		dev_err(dev, "Error turning on resources %d\n", ret);
> @@ -579,6 +598,10 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ret = geni_icc_disable(&gi2c->se);
> +	if (ret)
> +		return ret;
> +
>  	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>  
>  	gi2c->suspended = 1;
> @@ -623,7 +646,7 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  		gi2c->suspended = 1;
>  	}
>  
> -	return 0;
> +	return geni_icc_disable(&gi2c->se);
>  }
>  
>  static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
> @@ -631,6 +654,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
>  	int ret;
>  	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
>  
> +	ret = geni_icc_enable(&gi2c->se);
> +	if (ret)
> +		return ret;
> +
>  	ret = geni_se_resources_on(&gi2c->se);
>  	if (ret)
>  		return ret;

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
