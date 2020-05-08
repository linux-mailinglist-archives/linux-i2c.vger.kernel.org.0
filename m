Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0B01CB7DD
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 21:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgEHTDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 15:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726922AbgEHTDF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 15:03:05 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF0FC05BD0B
        for <linux-i2c@vger.kernel.org>; Fri,  8 May 2020 12:03:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t9so4738431pjw.0
        for <linux-i2c@vger.kernel.org>; Fri, 08 May 2020 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HmDf2i2KESXfyfZqBgVUXuoXosgZ5LwL/gvkhTXF/E0=;
        b=Z5/sCkA2lUpsmU6DwE23/ZwZRvYhJmLY4VGnuxXnJZawTDmiLvcUxWDdhG/EpvsI7+
         PwqJ/+ucUsoEc4B/IMoIJmxnSXsDqOhqEhdNlMGOy21HJ/9MVwh8FhSLMH2QPkEbmpZN
         ftshZB0IQCA9YS7AkxmtbLfyyYu0ZpeQ7k+TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HmDf2i2KESXfyfZqBgVUXuoXosgZ5LwL/gvkhTXF/E0=;
        b=XY7Gqtv0bT/YPYoxFMYqIqb+H1sWzwTMw1Q52y0Hd4+41TLCl6EXO/QnBILU93Jmdq
         T2x9VOcfGDtdhQOiVtlQzrodq0MyBKiVzIkSxT6irgbgp1t9FX1oxmAl/2fYjBwgh1n1
         tTwePK6O80POFKq8dJcDTQT+UoI+pVGHk7kGFHW9kanoQpXc5xV0jEhav8rrDOOJkqMw
         yzIF9X9ZUb8sHvyI4BjghlXt4HB7o7kpCMybRH4nfgJ+L7Lh3JKzlEhRi2QM0VxZ9s2e
         oL0TyN7Lz8i0izAxVu0XQ4xOt5M5gztk3rrK1VKkcae2AqKryVNT4ZQveyL0Tw1qy5Zn
         JmKw==
X-Gm-Message-State: AGi0PuaYd5VRtOo6RFdBouVKVrw7vauozIzBLmXSlJOJyb1N96gXKtl4
        1NPvL7pjqXpe2coxwq53Rl0IzA==
X-Google-Smtp-Source: APiQypI1Y+6v8efVKW8oF8O0/yGro6rJKbF0OoidUbBbVucSIFNWrHNPt96+oWAD/806sC8HvwUvVQ==
X-Received: by 2002:a17:90a:ba84:: with SMTP id t4mr6965747pjr.81.1588964583825;
        Fri, 08 May 2020 12:03:03 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h64sm2631168pfe.42.2020.05.08.12.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 12:03:03 -0700 (PDT)
Date:   Fri, 8 May 2020 12:03:01 -0700
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
Subject: Re: [PATCH V5 1/7] soc: qcom: geni: Support for ICC voting
Message-ID: <20200508190301.GG4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588919619-21355-2-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 08, 2020 at 12:03:33PM +0530, Akash Asthana wrote:
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
> Changes in V5:
>  - As per Matthias's comment defined enums for ICC paths.
>  - Integrate icc_enable/disable with power on/off call for driver.
>  - As per Matthias's comment added icc_path_names array to print icc path name
>    in failure case.
>  - As per Georgi's suggestion assume peak_bw = avg_bw if not mentioned.
> 
>  drivers/soc/qcom/qcom-geni-se.c | 92 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 42 +++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 7d622ea..63403bf 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -92,6 +92,9 @@ struct geni_wrapper {
>  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>  };
>  
> +static const char * const icc_path_names[] = {"qup-core", "qup-config",
> +								"qup-memory"};
> +
>  #define QUP_HW_VER_REG			0x4
>  
>  /* Common SE registers */
> @@ -720,6 +723,95 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len)
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
> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s, ret:%d\n",
> +					icc_names[i], icc_err);
> +	return icc_err;
> +
> +}
> +EXPORT_SYMBOL(geni_icc_get);
> +
> +void geni_icc_bw_init(struct geni_icc_path *icc_paths, unsigned int avg_bw,
> +			unsigned int peak_bw)

I noticed that all callers of geni_icc_bw_init() pass 0 as
'peak_pw' (aka peak == avg). Unless there are plans to use other
values for the peak bandwidth in the future it is pointless to
track the bandwidth(s) in two variables. And if the bandwidth is
tracked in a single variable this function is not needed.

> +{
> +	if (!peak_bw)
> +		peak_bw = avg_bw;
> +	icc_paths->avg_bw = avg_bw;
> +	icc_paths->peak_bw = peak_bw;
> +}
> +EXPORT_SYMBOL(geni_icc_bw_init);
