Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DDD1AB44E
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 01:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389757AbgDOXgV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 19:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730210AbgDOXgJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 19:36:09 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772E5C061A0F
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 16:36:06 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id c23so728249pgj.3
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 16:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pLjmFUxaieQynkusHT7IMDQLKA4E8pgAQuweixOhPLU=;
        b=Zwp7XwFBj5VZpmB/uQX+ayKhgNqPAR3ukctYPc7aJSydfS5PlYkI9urJjWfCvuubNa
         cUGITFcmdiodmMaVIEbd026rBY+LxHuEJjw+aYrgzJIC7fGOstQBsrGjHZp5sWi+A464
         Nzv7dMURASFrPu4WfgpU2cRUfiV+xrAB9lCEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pLjmFUxaieQynkusHT7IMDQLKA4E8pgAQuweixOhPLU=;
        b=d2YWO970mPEU7FuvnsIFh3vaLf/HSQxW2T1OEE7L+Yn1pe3nEFMAN1TTwRq/eJ9AV4
         hv1H4xBcyiqtlZjmH7qWg5yeFL1QFCaQI04z+PmOaEsfDx5X4rBHvs2BqZs3Gm8wMDm9
         VncfoBUtAjCrj8KT7Gl/q4IBx4pPMhzOGt8KLPZczdhRbVyeh4BO9xtxPG0RZsJNqwsS
         pQwF/r4eIyJyeWpQWc4iY275A72KxaA03LeJwy6ugZwNVdG0cFO+67gQgP2Jf7jQP2JV
         o7LUFvPPkhxxusCgiArHKswWMGvuZvK+vfpOJt+JO2BozmHPd6DXO7CjhtnuewGCZ+XJ
         2Vyw==
X-Gm-Message-State: AGi0PuY1mvDecM6zktKzf1Ls0BcZFDj29D3ioR+F6b1q9Kf76XTpzBhQ
        w4W7l+2187cxNSNX6KexFTjYyT6lDbs=
X-Google-Smtp-Source: APiQypIz0P34pX0cfRwpAGteLEaBkV7qIW1T8EDzWdODd8jN+J4tKi3ktG87JgbXvbXeDOzsfRcVZw==
X-Received: by 2002:a63:c443:: with SMTP id m3mr3027788pgg.262.1586993765853;
        Wed, 15 Apr 2020 16:36:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id l190sm14983095pfl.212.2020.04.15.16.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:36:05 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:36:03 -0700
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
Subject: Re: [PATCH V4 3/9] soc: qcom: geni: Support for ICC voting
Message-ID: <20200415233603.GZ199755@google.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586946198-13912-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Wed, Apr 15, 2020 at 03:53:12PM +0530, Akash Asthana wrote:
> Add necessary macros and structure variables to support ICC BW
> voting from individual SE drivers.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment dropped enums for ICC paths, given the three
>    paths individual members
> 
> Changes in V3:
>  - Add geni_icc_get, geni_icc_vote_on and geni_icc_vote_off as helper API.
>  - Add geni_icc_path structure in common header
> 
> Changes in V4:
>  - As per Bjorn's comment print error message in geni_icc_get if return
>    value is not -EPROBE_DEFER.
>  - As per Bjorn's comment remove NULL on path before calling icc_set_bw
>    API.
>  - As per Bjorn's comment drop __func__ print.
>  - As per Matthias's comment, make ICC path a array instead of individual
>    member entry in geni_se struct.
> 
> Note: I have ignored below check patch suggestion because it was throwing
>       compilation error as 'icc_ddr' is not compile time comstant.
> 
> WARNING: char * array declaration might be better as static const
>  - FILE: drivers/soc/qcom/qcom-geni-se.c:726:
>  - const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> 
> 
>  drivers/soc/qcom/qcom-geni-se.c | 61 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 31 +++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 7d622ea..1527bc4 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -720,6 +720,67 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>  }
>  EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>  
> +int geni_icc_get(struct geni_se *se, const char *icc_ddr)
> +{
> +	int i, icc_err;
> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> +		if (!icc_names[i])
> +			continue;
> +
> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
> +		if (IS_ERR(se->icc_paths[i].path))
> +			goto icc_get_failure;
> +	}
> +
> +	return 0;
> +
> +icc_get_failure:
> +	icc_err = PTR_ERR(se->icc_paths[i].path);
> +	if (icc_err != -EPROBE_DEFER)
> +		dev_err_ratelimited(se->dev, "Failed to get path:%d, ret:%d\n",

Better be explicit that it's an ICC path and log icc_names[i] instead of i.

> +					i, icc_err);
> +	return icc_err;
> +
> +}
> +EXPORT_SYMBOL(geni_icc_get);
> +
> +int geni_icc_vote_on(struct geni_se *se)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> +		ret = icc_set_bw(se->icc_paths[i].path,
> +			se->icc_paths[i].avg_bw, se->icc_paths[i].peak_bw);

I'll leave it to others to decide whether it's ok to leave the
implementation of the icc_enable/disable() APIs suggested on
https://patchwork.kernel.org/patch/11467511/#23269555 for later.

> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "ICC BW voting failed on path:%d, ret:%d\n",
> +					i, ret);

Instead of logging the index, which isn't very expressive, you could have
a static string array of the path names ({"core", "config", "ddr"} or
similar) that is used when logging errors in _vote_on/off().

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(geni_icc_vote_on);
> +
> +int geni_icc_vote_off(struct geni_se *se)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> +		ret = icc_set_bw(se->icc_paths[i].path, 0, 0);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "ICC BW remove failed on path:%d, ret:%d\n",
> +					i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(geni_icc_vote_off);
> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..b5b9316 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -6,6 +6,8 @@
>  #ifndef _LINUX_QCOM_GENI_SE
>  #define _LINUX_QCOM_GENI_SE
>  
> +#include <linux/interconnect.h>
> +
>  /* Transfer mode supported by GENI Serial Engines */
>  enum geni_se_xfer_mode {
>  	GENI_SE_INVALID,
> @@ -25,6 +27,12 @@ enum geni_se_protocol_type {
>  struct geni_wrapper;
>  struct clk;
>  
> +struct geni_icc_path {
> +	struct icc_path *path;
> +	unsigned int avg_bw;
> +	unsigned int peak_bw;
> +};
> +
>  /**
>   * struct geni_se - GENI Serial Engine
>   * @base:		Base Address of the Serial Engine's register block
> @@ -33,6 +41,7 @@ struct clk;
>   * @clk:		Handle to the core serial engine clock
>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
> + * @icc_paths:		Array of ICC paths for SE
>   */
>  struct geni_se {
>  	void __iomem *base;
> @@ -41,6 +50,7 @@ struct geni_se {
>  	struct clk *clk;
>  	unsigned int num_clk_levels;
>  	unsigned long *clk_perf_tbl;
> +	struct geni_icc_path icc_paths[3];

You also need enums for the paths, otherwise you end up with code like
this, which isn't really self-explanatory:

  gi2c->se.icc_paths[0].avg_bw = GENI_DEFAULT_BW;
  gi2c->se.icc_paths[1].avg_bw = GENI_DEFAULT_BW;
  gi2c->se.icc_paths[2].avg_bw = Bps_to_icc(gi2c->clk_freq_out);

  (from "[V4,5/9] i2c: i2c-qcom-geni: Add interconnect support")

I know Bjorn asked in v1 to remove the enums you had, however it was
a slightly different context. If we are sticking to use an array of
'struct geni_icc_path' (which reduces redundant code) the enums are
'needed'.
