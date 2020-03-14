Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F6C185363
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Mar 2020 01:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgCNAlK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 20:41:10 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43285 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgCNAlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 20:41:09 -0400
Received: by mail-pg1-f196.google.com with SMTP id u12so5974128pgb.10
        for <linux-i2c@vger.kernel.org>; Fri, 13 Mar 2020 17:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+YSW3mt80z9CCjuJH3Ji36iqGwKRMrlrk+wnvIOhyhk=;
        b=J19NXz25semJfpPmXTe2dsLok9m4rW42I1oyw5NHxb0O2a6Vjl62K+sZ9w/SQORQO9
         L1Rbe1NFtubgURSHIWzm5RxqISGjxGR4aJkxCdsPpHwp8ezEA3nD9X8jjMILcriSbUgm
         f771O4qHMnRMrjejAFe65UCv5+yRetWPts7QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+YSW3mt80z9CCjuJH3Ji36iqGwKRMrlrk+wnvIOhyhk=;
        b=Sg+bseDnRWSsJAe1te8Fqf3SitVZc94RYGvTLrjsD/02BazoI5W41K9EqndyK03y/V
         27skUYSgcWwyBWyiSGYeCGp9mhjaPDZN2EQiABxGBTqbNTJv7QKmb2t5ODpAHAPe76QO
         6Uws9IQXel284fxCgLbNF2dFVw5BzVWYazjeTTXbLxLMWm2UMIWTvvt6qTJWSbN9EcFv
         LUADxfLYj9VqLaZLVF5+6KMuSV/Sdmq01n2sNpeDdR3XNl5Dl0HgXn+QKgbINqR3HHeN
         voSJPTd/AnSGlMD0RzHQRqXD3Ss2Te3ZIEzVJnmRgoqf+LTTV7C6bxaY85bSb8RfnM/C
         m6Nw==
X-Gm-Message-State: ANhLgQ1ZRrgKL0K8uE1QFwL8KdT19cNYeqqnec0JNovL+eiOWZsI3ihR
        vi0v2kz3mjppye4jeiVXLGQ2pg==
X-Google-Smtp-Source: ADFU+vuslQLGf4xcYGRQe1z6Yvr3ZzcUBM4XSOaWv9bdeBRUPS3wI9MzredWsYK1bA8n9Q8+YpIbDg==
X-Received: by 2002:aa7:914b:: with SMTP id 11mr16871749pfi.69.1584146468392;
        Fri, 13 Mar 2020 17:41:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q30sm13469970pjh.5.2020.03.13.17.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 17:41:07 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:41:06 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 6/8] spi: spi-geni-qcom: Add interconnect support
Message-ID: <20200314004106.GM144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-7-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-7-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Fri, Mar 13, 2020 at 06:42:12PM +0530, Akash Asthana wrote:
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
>  drivers/spi/spi-geni-qcom.c | 74 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..09c4709 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -118,6 +118,19 @@ static int get_spi_clk_cfg(unsigned int speed_hz,
>  	return ret;
>  }
>  
> +static int geni_spi_icc_get(struct geni_se *se)
> +{
> +	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(se->icc_path_geni_to_core))
> +		return PTR_ERR(se->icc_path_geni_to_core);
> +
> +	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(se->icc_path_cpu_to_geni))
> +		return PTR_ERR(se->icc_path_cpu_to_geni);
> +
> +	return 0;
> +}

As per my comments on (https://patchwork.kernel.org/patch/11436895/#23222713),
the above function could be replaced by calling a 'geni_icc_get()' (or so, to
be created) provided by the geni SE driver.

> +
>  static void handle_fifo_timeout(struct spi_master *spi,
>  				struct spi_message *msg)
>  {
> @@ -234,6 +247,20 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>  		return ret;
>  	}
>  
> +	/*
> +	 * Set BW quota for CPU as driver supports FIFO mode only.
> +	 * Assume peak bw as twice of avg bw.
> +	 */
> +	se->avg_bw_cpu = Bps_to_icc(mas->cur_speed_hz);
> +	se->peak_bw_cpu = Bps_to_icc(2 * mas->cur_speed_hz);
> +	ret = icc_set_bw(se->icc_path_cpu_to_geni, se->avg_bw_cpu,
> +			se->peak_bw_cpu);
> +	if (ret) {
> +		dev_err(mas->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}
> +
>  	clk_sel = idx & CLK_SEL_MSK;
>  	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
>  	spi_setup_word_len(mas, spi_slv->mode, spi_slv->bits_per_word);
> @@ -578,6 +605,15 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	spin_lock_init(&mas->lock);
>  	pm_runtime_enable(dev);
>  
> +	ret = geni_spi_icc_get(&mas->se);
> +	if (ret)
> +		goto spi_geni_probe_runtime_disable;
> +	/* Set the bus quota to a reasonable value for register access */
> +	mas->se.avg_bw_core = Bps_to_icc(CORE_2X_50_MHZ);
> +	mas->se.peak_bw_core = Bps_to_icc(CORE_2X_100_MHZ);
> +	mas->se.avg_bw_cpu = Bps_to_icc(1000);
> +	mas->se.peak_bw_cpu = Bps_to_icc(1000);
> +
>  	ret = spi_geni_init(mas);
>  	if (ret)
>  		goto spi_geni_probe_runtime_disable;
> @@ -616,14 +652,50 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
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
> +	ret = icc_set_bw(mas->se.icc_path_geni_to_core, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(mas->dev, "%s: ICC BW remove failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(mas->se.icc_path_cpu_to_geni, 0, 0);
> +	if (ret) {
> +		dev_err_ratelimited(mas->dev, "%s: ICC BW remove failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}

the ICC stuff above would become:

	ret = geni_icc_vote_off(&mas->se);
	if (ret)
		return ret;

with the consolidated code in geni SE.

> +
> +	return 0;
>  }
>  
>  static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
>  {
>  	struct spi_master *spi = dev_get_drvdata(dev);
>  	struct spi_geni_master *mas = spi_master_get_devdata(spi);
> +	int ret;
> +
> +	ret = icc_set_bw(mas->se.icc_path_geni_to_core, mas->se.avg_bw_core,
> +		mas->se.peak_bw_core);
> +	if (ret) {
> +		dev_err_ratelimited(mas->dev, "%s: ICC BW voting failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	ret = icc_set_bw(mas->se.icc_path_cpu_to_geni, mas->se.avg_bw_cpu,
> +		mas->se.peak_bw_cpu);
> +	if (ret) {
> +		dev_err_ratelimited(mas->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);
> +		return ret;
> +	}

and this:

	ret = geni_icc_vote_on(&mas->se);
	if (ret)
		return ret;

>  	return geni_se_resources_on(&mas->se);

possibly you could even do the ICC voting from geni_se_resources_on/off()
it seems the two are always done together for UART, I2C and SPI.
