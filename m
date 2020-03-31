Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4197C19A284
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 01:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731480AbgCaXcO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 19:32:14 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39647 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731331AbgCaXcO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 19:32:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id g32so5095897pgb.6
        for <linux-i2c@vger.kernel.org>; Tue, 31 Mar 2020 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1HVkfCZfA09hqCSwGr9pi3bCsfyBjCkprFJud88h6Eg=;
        b=LJS0gu5NPnfkn+N8TfYnBTTyF+DE7VO9inN7xOWsdRJ2Yf/pBLhcc3ZWWw10EODhVi
         g8rPT4+9brsADpP8MdC3CRFnnM/ozbwUqPaa1B9hGMfFsY3gyf80n3dSwiQs4+cLs93K
         glHidqby5ckbHHxSaPVuKXjN7AMOhTzSLRhftPIRQK1oB0IL3yhoOS1X+bbIJCnuI3+3
         L2TNkCrcGIB73wdVxAq0gJv5b9B/G3ZYlIR4WnOvfHXCQXCFQMdXHMNqv0u9tDSGbmS9
         WFQ/RhsBa7yo9P06SNZHiqiwU+b5TL7WdLY0P2D2QMP/l/Z1jjENWM8LJH8ZGqAQpJ0K
         Y0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1HVkfCZfA09hqCSwGr9pi3bCsfyBjCkprFJud88h6Eg=;
        b=FfTqwhOqoS/5AWhs3bdhNx6Z+cmSYXsMj/IpSws2fAex2A55BxzluQwcbsQ3yMwKpV
         9wC6LTeaMTW1M/gviG6L1q+iCssO/O5m6vsxsGXdUxgwJrWk7q+d3HXkAUVLFnD1tauG
         s3AQI7pCUYI9mYbOjmQZ1w9qjPniF84fiyEeChkH29VEBcPogy8pvgucEZV3xBWyaCQD
         hg0y5Gj5JXeEFfHpb+eTG+xTx4rRd571cvBKT9iS9JqfYGBkD5lCIwucxrBppimI1nzI
         b2GqEaq2m+1A3oFsDGfsWdcR5p2rsv4YbTsET1PiIZNus2HTlp781v0T8ckc8UWbMwmP
         2skg==
X-Gm-Message-State: ANhLgQ3ntdNjlylOhnvWNAwd97pnY8mKAfhjHkxEsHB/tDUfbKNjW1SS
        p15vtztE8B/tqg/MtjI5MF4zNw==
X-Google-Smtp-Source: ADFU+vvnkx2Csw/AMK/p49sBaVOWuY1loy/APpY6aE13XVgXhALJ7Zl0e6xhwPFi2IfS425Vh5SsQg==
X-Received: by 2002:a62:30c6:: with SMTP id w189mr20952100pfw.257.1585697532480;
        Tue, 31 Mar 2020 16:32:12 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a8sm91544pgg.79.2020.03.31.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 16:32:11 -0700 (PDT)
Date:   Tue, 31 Mar 2020 16:32:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org, wsa@the-dreams.de,
        broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org,
        georgi.djakov@linaro.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        swboyd@chromium.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mka@chromium.org, dianders@chromium.org, evgreen@chromium.org
Subject: Re: [PATCH V3 2/8] soc: qcom: geni: Support for ICC voting
Message-ID: <20200331233209.GF254911@minitux>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585652976-17481-3-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue 31 Mar 04:09 PDT 2020, Akash Asthana wrote:

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
>  drivers/soc/qcom/qcom-geni-se.c | 98 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 36 +++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 7d622ea..9344c14 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -720,6 +720,104 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
>  }
>  EXPORT_SYMBOL(geni_se_rx_dma_unprep);
>  
> +int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
> +		const char *icc_ddr)
> +{
> +	if (icc_core) {

Afaict it's only this that might be passed as NULL, so please drop these
conditionals (keep the last one).

> +		se->to_core.path = devm_of_icc_get(se->dev, "qup-core");
> +		if (IS_ERR(se->to_core.path))

It would be useful to print an error message here (if PTR_ERR(path) !=
-EPROBE_DEFER).

> +			return PTR_ERR(se->to_core.path);
> +	}
> +
> +	if (icc_cpu) {
> +		se->from_cpu.path = devm_of_icc_get(se->dev, "qup-config");
> +		if (IS_ERR(se->from_cpu.path))
> +			return PTR_ERR(se->from_cpu.path);
> +	}
> +
> +	if (icc_ddr) {
> +		se->to_ddr.path = devm_of_icc_get(se->dev, "qup-memory");
> +		if (IS_ERR(se->to_ddr.path))
> +			return PTR_ERR(se->to_ddr.path);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(geni_icc_get);
> +
> +int geni_icc_vote_on(struct geni_se *se)
> +{
> +	int ret;
> +
> +	if (se->to_core.path) {

icc_set_bw(NULL, ...) is valid and will return 0, so these checks
doesn't add any value.

> +		ret = icc_set_bw(se->to_core.path, se->to_core.avg_bw,
> +			se->to_core.peak_bw);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for core\n",
> +						__func__);

Please drop the __func__, the message is specific enough.

> +			return ret;
> +		}
> +	}
> +
> +	if (se->from_cpu.path) {
> +		ret = icc_set_bw(se->from_cpu.path, se->from_cpu.avg_bw,
> +			se->from_cpu.peak_bw);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for cpu\n",
> +						__func__);
> +			return ret;
> +		}
> +	}
> +
> +	if (se->to_ddr.path) {
> +		ret = icc_set_bw(se->to_ddr.path, se->to_ddr.avg_bw,
> +			se->to_ddr.peak_bw);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW voting failed for ddr\n",
> +						__func__);
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
> +	int ret;
> +
> +	if (se->to_core.path) {
> +		ret = icc_set_bw(se->to_core.path, 0, 0);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for core\n",
> +						__func__);
> +			return ret;
> +		}
> +	}
> +
> +	if (se->from_cpu.path) {
> +		ret = icc_set_bw(se->from_cpu.path, 0, 0);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for cpu\n",
> +						__func__);
> +			return ret;
> +		}
> +	}
> +
> +	if (se->to_ddr.path) {
> +		ret = icc_set_bw(se->to_ddr.path, 0, 0);
> +		if (ret) {
> +			dev_err_ratelimited(se->dev, "%s: ICC BW remove failed for ddr\n",
> +						__func__);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(geni_icc_vote_off);

Given that these two functions only switch the bandwidth request between
some value and 0, I really think we should carry a "bool enabled" on the
path and replace these two functions with
icc_bulk_enable()/icc_bulk_disable().

The added benefit of this would be that you call icc_set_bw() instead of
changing the geni_icc_path->{avg_bw,peak_bw} and don't need to keep
track of them here.

Regards,
Bjorn

> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..a83c86b 100644
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
> @@ -33,6 +41,9 @@ struct clk;
>   * @clk:		Handle to the core serial engine clock
>   * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
> + * @to_core:	ICC path structure for geni to core
> + * @from_cpu:	ICC path structure for cpu to geni
> + * @to_ddr:	ICC path structure for geni to ddr
>   */
>  struct geni_se {
>  	void __iomem *base;
> @@ -41,6 +52,9 @@ struct geni_se {
>  	struct clk *clk;
>  	unsigned int num_clk_levels;
>  	unsigned long *clk_perf_tbl;
> +	struct geni_icc_path to_core;
> +	struct geni_icc_path from_cpu;
> +	struct geni_icc_path to_ddr;
>  };
>  
>  /* Common SE registers */
> @@ -229,6 +243,21 @@ struct geni_se {
>  #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
>  #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
>  
> +/*
> + * Define bandwidth thresholds that cause the underlying Core 2X interconnect
> + * clock to run at the named frequency. These baseline values are recommended
> + * by the hardware team, and are not dynamically scaled with GENI bandwidth
> + * beyond basic on/off.
> + */
> +#define CORE_2X_19_2_MHZ		960
> +#define CORE_2X_50_MHZ			2500
> +#define CORE_2X_100_MHZ			5000
> +#define CORE_2X_150_MHZ			7500
> +#define CORE_2X_200_MHZ			10000
> +#define CORE_2X_236_MHZ			16383
> +
> +#define GENI_DEFAULT_BW			Bps_to_icc(1000)
> +
>  #if IS_ENABLED(CONFIG_QCOM_GENI_SE)
>  
>  u32 geni_se_get_qup_hw_version(struct geni_se *se);
> @@ -416,5 +445,12 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
>  void geni_se_tx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
>  
>  void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
> +
> +int geni_icc_get(struct geni_se *se, const char *icc_core, const char *icc_cpu,
> +		const char *icc_ddr);
> +
> +int geni_icc_vote_on(struct geni_se *se);
> +
> +int geni_icc_vote_off(struct geni_se *se);
>  #endif
>  #endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
