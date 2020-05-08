Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE45B1CB587
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 19:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgEHROA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 13:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbgEHRNz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 13:13:55 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9D8C05BD0B
        for <linux-i2c@vger.kernel.org>; Fri,  8 May 2020 10:13:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 207so1155822pgc.6
        for <linux-i2c@vger.kernel.org>; Fri, 08 May 2020 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Nb47I82/IxA2gle1iw0XqnYNPtNXoYXnaPYNxEi54LA=;
        b=KEeH6BFZU9eraiCcEwOrrHoh1rqTJnlfgwHucNffiqawEYszvUgBxksGXmTs1Tq8DG
         pRBC0CkKC9G1MB5LyfkiyVONeMJMKW0LahPEfZm7lB6WftSVKGQ0mZPspkCVtVxzRDHv
         UbzQ7XGzVWDVB+h7SKnxQU6UxfLrXGdHGIUqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Nb47I82/IxA2gle1iw0XqnYNPtNXoYXnaPYNxEi54LA=;
        b=OZ4Z0ghnjeeXnFJFzq21D9wbz9jLnbUHNrl9mpZxw+YgRybj52vWyTKOGECCp3PgwX
         ygxnd5dd7oKxzbbgjOFyiF4TkmVxcXTa8rttlUqW/V8xt3s8KY6s6P+h7gkc42Yi6xRN
         Hmt6XCf5zz6JZBWJsfpFd2MiSrSHiI5fKfcSg8MN1CbGFEptcDqQFdoUgSoaQwe/1OEB
         IW9Bhx2+Y6iHEVwakt6Kr9Sg5T1adJKqhfpEjGf8vgCEMQ5KDKWN6V1etYqLNBsQMIvb
         8g8bFI+eBQdbI+nZjHUegE6kjq4W3e2+xeLSDzFjT0nHKJvZKdDNu57K7D3UVmfuRGFT
         p4+Q==
X-Gm-Message-State: AGi0PuZROlK/B5rpui/EejGTpE4GM+S7dOkDcwKyxcaG1nJO9GagQdT0
        +alEZEuKOsrtcrsmUzb4TVEuZg==
X-Google-Smtp-Source: APiQypJqUtILU9Di1LjiTI4FCIAn9705PSxM0Ut708GH64qmbLmlmtgLcjT6tKrSg02YtLlyIOrcKA==
X-Received: by 2002:aa7:8bc5:: with SMTP id s5mr4040633pfd.19.1588958034462;
        Fri, 08 May 2020 10:13:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a2sm1709593pgh.57.2020.05.08.10.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 10:13:53 -0700 (PDT)
Date:   Fri, 8 May 2020 10:13:52 -0700
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
Message-ID: <20200508171352.GA4525@google.com>
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

Hi Akash,

note: my comments below are clearly entering bikeshed territory. Please
take what you agree with and feel free to ignore the rest.

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

nit: the indentation is a bit odd. I would align it either with "qup-core" or
at a tab stop nearby.

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

nit: the 'icc_' prefix doesn't add value here, just 'err' would be less
'noisy' IMO.

> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};

nit: you could avoid repeating the first to strings by referencing
icc_path_names[GENI_TO_CORE] and icc_path_names[CPU_TO_GENI]. Not sure
if it's really better, it avoids the redundant names, but is slightly
less readable.

> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> +		if (!icc_names[i])
> +			continue;
> +
> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
> +		if (IS_ERR(se->icc_paths[i].path))
> +			goto icc_get_failure;

nit: since there is only a single label it isn't really necessary to be so
precise. 'goto err' is very common in the kernel, 'err_icc_get' would be
another alternative.

> +	}
> +
> +	return 0;
> +
> +icc_get_failure:
> +	icc_err = PTR_ERR(se->icc_paths[i].path);
> +	if (icc_err != -EPROBE_DEFER)
> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s, ret:%d\n",

All the logs in this patch result in something like "... path:qup-core, ret:42".
For humans I think it is more intuitive to parse "... path 'qup-core': 42".

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
