Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E71D1DD251
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 17:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbgEUPuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 11:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbgEUPuP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 11:50:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D80C08C5C0
        for <linux-i2c@vger.kernel.org>; Thu, 21 May 2020 08:50:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so3487369pfw.13
        for <linux-i2c@vger.kernel.org>; Thu, 21 May 2020 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sA0g0lvUpDIAD2lv16TTki6eZ5ObFWThT5hUTpKEaZM=;
        b=SxHSttAbNR9u1pBK/vE9U0EvP6k3sUDZ9euViRsxBhKQwtZZDJ+9Slcp75EnC7zjV5
         3QlU+9wjPe1kXPzohm590bPeD+ilHSPRnU3z+uxzqm9U8JGHzSUzIAXM/O6kuQ2PDsOe
         dD74tuoLkEfq0G1fPZmGd+xbLTMEkayphxpyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sA0g0lvUpDIAD2lv16TTki6eZ5ObFWThT5hUTpKEaZM=;
        b=gPFPpK7/rE+ifnP+I8uGZJlp5PRiFkskREuaMEd5+bxFZe+g4HpgX1AwCxNDX7JpyH
         +v87GzqtqRVwWAGnSapuMOqKQOepcxZtyF3AeFYNzZzbjUPCFtj2BcDy/RWTS1yym7Ti
         9JbtGy+OeSFISqOTLo/J/U7e0DqIHo0zYJNiGrDEOe2xyQ7ir1Gy/+/fEZhUpMk36RI+
         5bsyfgM1GxZyJ5cxfwJgjl7rQpBvwfXQwNx40E0L+VJOAZwq+N/LKimbc7KuXnaSvoPj
         uX4qbRRlNI9wFCvdZSqSUcI7qbroboq2R6KapcPKLLQGyQE65Yb7S7+KVAa9v806Hb6A
         YzTg==
X-Gm-Message-State: AOAM533MMbY5mgYG5ohIqj54E5erKW97JUjfzPCqKwTe+0J6RfIt8tuK
        qgeD+ioTwZ698XbiJz3TmdAsQQ==
X-Google-Smtp-Source: ABdhPJxkbbtArxWaeGThhTrUz55mXsi5ObGXQZbuxg7+tuo7TBShdw6VKuYjcKrRM+3WbVWaoAbFxQ==
X-Received: by 2002:a62:3642:: with SMTP id d63mr2097232pfa.8.1590076213954;
        Thu, 21 May 2020 08:50:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id s94sm4983713pjb.20.2020.05.21.08.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 08:50:12 -0700 (PDT)
Date:   Thu, 21 May 2020 08:50:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        msavaliy@codeaurora.org, evgreen@chromium.org
Subject: Re: [PATCH V6 1/7] soc: qcom: geni: Support for ICC voting
Message-ID: <20200521155009.GA4525@google.com>
References: <1590049764-20912-1-git-send-email-akashast@codeaurora.org>
 <1590049764-20912-2-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590049764-20912-2-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Thu, May 21, 2020 at 01:59:18PM +0530, Akash Asthana wrote:
> Add necessary macros and structure variables to support ICC BW
> voting from individual SE drivers.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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
> Changes in V5:
>  - As per Matthias's comment defined enums for ICC paths.
>  - Integrate icc_enable/disable with power on/off call for driver.
>  - As per Matthias's comment added icc_path_names array to print icc path name
>    in failure case.
>  - As per Georgi's suggestion assume peak_bw = avg_bw if not mentioned.
> 
> Changes in V6:
>  - Addressed nitpicks from Matthias.
> 
> Note: I have ignored below check patch suggestion because it was throwing
>       compilation error as 'icc_ddr' is not compile time comstant.
> 
> WARNING: char * array declaration might be better as static const
>  - FILE: drivers/soc/qcom/qcom-geni-se.c:726:
>  - const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> 
>  drivers/soc/qcom/qcom-geni-se.c | 92 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h    | 42 +++++++++++++++++++
>  2 files changed, 134 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 7d622ea..0b2526d 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -92,6 +92,9 @@ struct geni_wrapper {
>  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
>  };
>  
> +static const char * const icc_path_names[] = {"qup-core", "qup-config",
> +						"qup-memory"};
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
> +	int i, err;
> +	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
> +		if (!icc_names[i])
> +			continue;
> +
> +		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
> +		if (IS_ERR(se->icc_paths[i].path))
> +			goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	err = PTR_ERR(se->icc_paths[i].path);
> +	if (err != -EPROBE_DEFER)
> +		dev_err_ratelimited(se->dev, "Failed to get ICC path:%s :%d\n",

That's still an odd format, especially the colon before the error code. My
suggestion was "... path 'qup-core': 42" i.e. "... path '%s': %d".

I don't want to stall the series on nits though, if there is no need for
a respin for other reasons this can be also fixed with a patch after this
has landed.

I'm still not overly convinced about having two bandwidth values for what
might happen in the future (or not). Typically unused functions or struct
members that are added just in case tend to be rejected, since they can be
added when the need actually arises. Anyway, as long as maintainers are
happy with it I won't object.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>




