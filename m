Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F2A199E9D
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 21:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgCaTCw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 15:02:52 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43762 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgCaTCw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 15:02:52 -0400
Received: by mail-pf1-f195.google.com with SMTP id f206so10754023pfa.10
        for <linux-i2c@vger.kernel.org>; Tue, 31 Mar 2020 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d1LmGPhqBC+telzxxHCYYCJr0o/OklpDtR/S04mCOLk=;
        b=PkgN2UpEF3TrcleSh7YdT45Okdxgiwr9ejjvJizmqTkOoNiwV4hWx5oZtkL68c5vH4
         MErl6fXZJ82uBijd1OWx9HDM9AaMJr3Otq+OeSOMjWipR24tihd88qVQ9Fa/PIRFvApm
         c2Y2C/COvPIK7AkF2DJDO3YmLFELKshrT2MdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d1LmGPhqBC+telzxxHCYYCJr0o/OklpDtR/S04mCOLk=;
        b=FchL0rSYAMZuqN/opgEZEBTzjc4P/avaA1muHKqAX2xbLUC0SeVzcv1tynTO3PD5J+
         V2qB5kAQMwpY0fSYCxV/dkxDpM7XJ1b4rD4lL6lCm7wnZ0V8eFor8fTFTWgBzazKI7Fj
         ZmO0d17mFidTRMlFYXvoXtfqt/10Aci47lcrH2nDdTzeX5c4dqA7VVgH3H/RK+fSC+do
         agRq5yWf2hjBqpkHQLkQVu8vsohTwksUghM/0UFPTuyyecOJjqs3JgB4NKWW+jKkKiRI
         gO/ALI7n64ydrtR+7XNXlLeEvpsZG9SQh89fD27l4dxLvNrc+QhseQDY8grT3eJ/VJ7T
         zJLw==
X-Gm-Message-State: ANhLgQ0FEn2iEDBjlJQHBZQXGclGnbilvgl+bjMNL4/Z7EVy9bZ9kNqd
        9QQ8JeMbqnFLinwyQc42qboROQ==
X-Google-Smtp-Source: ADFU+vvmLRz4EHQPhZ0SlT09JrBh6GgqlFUFiuDkErP9QHjc3FTfQL92d4jawtd0w1WVvSgp7UZt2w==
X-Received: by 2002:a63:b52:: with SMTP id a18mr19261293pgl.130.1585681371319;
        Tue, 31 Mar 2020 12:02:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 1sm2606317pjc.32.2020.03.31.12.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 12:02:50 -0700 (PDT)
Date:   Tue, 31 Mar 2020 12:02:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, georgi.djakov@linaro.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V3 5/8] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200331190249.GJ199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585652976-17481-6-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Mar 31, 2020 at 04:39:33PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - As per Matthias's comment, use helper ICC function from geni-se driver.
> 
>  drivers/spi/spi-geni-qcom.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..f1dae2d 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -234,6 +234,16 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Set BW quota for CPU as driver supports FIFO mode only.
> +	 * Assume peak bw as twice of avg bw.
> +	 */
> +	se->from_cpu.avg_bw = Bps_to_icc(mas->cur_speed_hz);
> +	se->from_cpu.peak_bw = Bps_to_icc(2 * mas->cur_speed_hz);
> +	ret = geni_icc_vote_on(se);
> +	if (ret)
> +		return ret;
> +
>  	clk_sel = idx & CLK_SEL_MSK;
>  	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
>  	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
> @@ -578,6 +588,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	spin_lock_init(&mas->lock);
>  	pm_runtime_enable(dev);
>  
> +	ret = geni_icc_get(&mas->se, "qup-core", "qup-config", NULL);
> +	if (ret)
> +		goto spi_geni_probe_runtime_disable;

This fails without providing any hints why, besides the error code.
It might be worth to add error logging to geni_icc_get().

> +	/* Set the bus quota to a reasonable value for register access */
> +	mas->se.to_core.avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
> +	mas->se.to_core.peak_bw = Bps_to_icc(CORE_2X_100_MHZ);
> +	mas->se.from_cpu.avg_bw = GENI_DEFAULT_BW;
> +	mas->se.from_cpu.peak_bw = GENI_DEFAULT_BW;
> +
>  	ret = spi_geni_init(mas);
>  	if (ret)
>  		goto spi_geni_probe_runtime_disable;
> @@ -616,14 +635,24 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
>  {
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	int ret;
> +
> +	ret = geni_se_resources_off(&mas->se);
> +	if (ret)
> +		return ret;
>  
> -	return geni_se_resources_off(&mas->se);
> +	return geni_icc_vote_off(&mas->se);
>  }
>  
>  static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
>  {
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	int ret;
> +
> +	ret = geni_icc_vote_on(&mas->se);
> +	if (ret)
> +		return ret;
>  
>  	return geni_se_resources_on(&mas->se);
>  }

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
