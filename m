Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B9E1E2928
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 19:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389467AbgEZRgS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 13:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389452AbgEZRgR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 13:36:17 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A296CC03E96D
        for <linux-i2c@vger.kernel.org>; Tue, 26 May 2020 10:36:16 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cx22so88919pjb.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 May 2020 10:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Bl//2pYHj3csa8N7S/mTuxuIBaa/b+phWcHwiPQzkOw=;
        b=BkNpRVV/r0N3GqR1VZDQH7oKI+aSLYpW+DUKMWD8EO9crlNX+d6/gzNWbQUMRCUbrv
         SvhMa7XoTvfvnOIdJqBGdbQSnBg0Vb2yOi4erDEQqgCj3ifVWq6VHG5GY/0MN1h8Fj7j
         M3qZRyHRctXoZITEL6GOVvZs5fmtLKWtZikc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Bl//2pYHj3csa8N7S/mTuxuIBaa/b+phWcHwiPQzkOw=;
        b=c3TbRCOWvLN4chzSYf76aVp9kKzZEZCvIr7a0jxUFdbq4Qn8DMblfQMpocFI+dfffl
         LoIrydy40TLZED4eGXajBgTBoy7afShjINLjen+k9XFaS0/2/G4cSw4JwtlhvLV/XNhQ
         t1u69CFWlqfvxEjI0M6eAb0Xbdf0fXTbcGE0xWyI8ytkprm8I5Y4VphO/3MDD3cuphIh
         tdeZfvCilOkpHI+bEalZjOu/JBaSI1nBUd92+DspnVPZrP9quVU46PgPt+By7QAQpViF
         wII8kdNxI63vMdBP2AFQR5NrC3RPmUogrPRUZhVCAz4DAPuL1jyss8NNvjaUhJeeXvYA
         b0Vw==
X-Gm-Message-State: AOAM530/7Zvs7ispI8e3idLfyf2OUUNgummsr54b4m6sJYr19Ls4uzpK
        9p6/6RHdHc2t/+89n/9UySXE7A==
X-Google-Smtp-Source: ABdhPJyzUgvTne5XzQDrFY8l1KASpKHwXP04J+NhScYWwbDrv+H8LoktzSM90MIjDWKJ7/+vEh9tmg==
X-Received: by 2002:a17:90a:c78f:: with SMTP id gn15mr335118pjb.103.1590514576158;
        Tue, 26 May 2020 10:36:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u45sm112166pjb.7.2020.05.26.10.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 10:36:15 -0700 (PDT)
Date:   Tue, 26 May 2020 10:36:13 -0700
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
Subject: Re: [PATCH V7 6/7] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200526173613.GF4525@google.com>
References: <1590497690-29035-1-git-send-email-akashast@codeaurora.org>
 <1590497690-29035-7-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590497690-29035-7-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 26, 2020 at 06:24:49PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - No Change.
> 
> Changes in V4:
>  - As per Mark's comment move peak_bw guess as twice of avg_bw if
>    nothing mentioned explicitly to ICC core.
> 
> Changes in V5:
>  - Add icc_enable/disable to power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value.
> 
> Changes in V6:
>  - As per Matthias's comment made print statement consistent across driver
> 
> Changes in V7:
>  - As per Matthias's comment removed usage of peak_bw variable because we don't
>    have explicit peak requirement, we were voting peak = avg and this can be
>    tracked using single variable for avg bw.
>  - As per Matthias's comment improved print log.
> 
>  drivers/spi/spi-qcom-qspi.c | 57 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3c4f83b..092ac27 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>  
>  #include <linux/clk.h>
> +#include <linux/interconnect.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -139,7 +140,9 @@ struct qcom_qspi {
>  	struct device *dev;
>  	struct clk_bulk_data *clks;
>  	struct qspi_xfer xfer;
> -	/* Lock to protect xfer and IRQ accessed registers */
> +	struct icc_path *icc_path_cpu_to_qspi;
> +	unsigned int avg_bw_cpu;

I should have noticed this earlier, but the field isn't needed now that
we have icc_enable/disable(). The bandwidth is set in
qcom_qspi_transfer_one() and that's it.

From my side it would be fine to remove the field in a follow up patch,
to avoid respinning the series yet another time just for this.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
