Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA3D21CB66F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 19:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgEHR7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 13:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726885AbgEHR7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 13:59:41 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEFEEC05BD0B
        for <linux-i2c@vger.kernel.org>; Fri,  8 May 2020 10:59:40 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n11so1198778pgl.9
        for <linux-i2c@vger.kernel.org>; Fri, 08 May 2020 10:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oRpq+jLekVUTOI/QQLf26wWsNl1b7bpxHYpAdZmr4rw=;
        b=hVWURPAIPfmGWKrNxFIruXSjviWO/yuaURKHe/STcvMBAz+n6q1OPUNQVzqmJrBtX9
         tHUylZML8w4w0YaP8mcJk0ov2Zf9wDQoGLlg72Mc0q/wZuEkFv1qsjbz1FQ9s21DpXYv
         ctDfE5n4gaT2MU/IGGsQGqQzNGp+TQmTW1RgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oRpq+jLekVUTOI/QQLf26wWsNl1b7bpxHYpAdZmr4rw=;
        b=jP4oM2XT4tuPQh4JqIkaq4+e/m+N/AxwCND58fTlPgHa9bAHEaYV1s2dCZsc5aOxe0
         h8aaP+3knGYLeKtbUcSvBHybfAjJPISOerQeoKqGamV5Kdc7YzypqK2G/p0ImhL9RiMx
         sTX3TNwvtO5gElFVNfHGKycPeoDkOeggjerIfJc8bROI0fyp4+t6sAsvtcROvo6hMp6k
         vYMsVxGUPQ6u9MJyfpGm7euir4of5lnN9revQmD34bN2tbwFTP+KO6xrtMbVLmfRUj9/
         /rWBCvN1HIblKV5NMMv9FeU0TFtV4ghNc7c2Tqw5zXMJJDz3p+GuM6WxENepI+td2Rfr
         sL2w==
X-Gm-Message-State: AGi0PuZLZKQBPfzZ1/gc3cFDId4NT1rWXXxpDeGcFCKsUdwEtLpMP7yl
        0ySWpGHh6peMuyLmZmYIaiOVQA==
X-Google-Smtp-Source: APiQypIDiyjQBLF6P1/6Q1JR5HzEyUlszyQYKZhYy1RPztXY0S266u3udBIFDC3f4oI0QEMVBE3Zxw==
X-Received: by 2002:a63:4d16:: with SMTP id a22mr3122700pgb.169.1588960780090;
        Fri, 08 May 2020 10:59:40 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id m4sm2345741pfm.26.2020.05.08.10.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 10:59:39 -0700 (PDT)
Date:   Fri, 8 May 2020 10:59:38 -0700
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
Subject: Re: [PATCH V5 2/7] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200508175938.GB4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588919619-21355-3-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

overall this looks good to me, a few comments inline

On Fri, May 08, 2020 at 12:03:34PM +0530, Akash Asthana wrote:
> QUP core clock is shared among all the SE drivers present on particular
> QUP wrapper, the system will reset(unclocked access) if earlycon used after
> QUP core clock is put to 0 from other SE drivers before real console comes
> up.
> 
> As earlycon can't vote for it's QUP core need, to fix this add ICC
> support to common/QUP wrapper driver and put vote for QUP core from
> probe on behalf of earlycon and remove vote during earlycon exit call.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reported-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Change in V3:
>  - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
>    exit function to remove ICC vote for earlyconsole.
>  - Remove suspend/resume hook for geni-se driver as we are no longer
>    removing earlyconsole ICC vote from system suspend, we are removing
>    from earlycon exit.
> 
> Change in V4:
>  - As per Matthias comment make 'earlycon_wrapper' as static structure.
> 
> Changes in V5:
>  - Vote for core path only after checking whether "qcom_geni" earlycon is
>    actually present or not by traversing over structure "console_drivers".
> 
>  drivers/soc/qcom/qcom-geni-se.c       | 63 +++++++++++++++++++++++++++++++++++
>  drivers/tty/serial/qcom_geni_serial.c |  7 ++++
>  include/linux/qcom-geni-se.h          |  2 ++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 63403bf..66fe6f2 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/clk.h>
> +#include <linux/console.h>
>  #include <linux/slab.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> @@ -90,11 +91,14 @@ struct geni_wrapper {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> +	struct geni_icc_path to_core;
>  };
>  
>  static const char * const icc_path_names[] = {"qup-core", "qup-config",
>  								"qup-memory"};
>  
> +static struct geni_wrapper *earlycon_wrapper;
> +
>  #define QUP_HW_VER_REG			0x4
>  
>  /* Common SE registers */
> @@ -812,11 +816,33 @@ int geni_icc_disable(struct geni_se *se)
>  }
>  EXPORT_SYMBOL(geni_icc_disable);
>  
> +void geni_remove_earlycon_icc_vote(void)
> +{
> +	struct geni_wrapper *wrapper = earlycon_wrapper;
> +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);

Do we need to check that earlycon_wrapper != NULL before dereferencing it?
In theory this should not happen, but better be safe.

> +	struct device_node *child;
> +
> +	for_each_child_of_node(parent, child) {
> +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
> +			wrapper = platform_get_drvdata(of_find_device_by_node(
> +					child));
> +			icc_put(wrapper->to_core.path);
> +			wrapper->to_core.path = NULL;

nit: setting the path to NULL isn't really needed IIUC.

> +		}
> +	}
> +	of_node_put(parent);
> +
> +	earlycon_wrapper = NULL;
> +}
> +EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);
> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct geni_wrapper *wrapper;
> +	struct console *bcon;
> +	int earlycon_present = 0;

use bool & true/false

The variable is only used when CONFIG_SERIAL_EARLYCON is set, I think
you need to add '__maybe_unused' to avoid a compiler warning then earlycon
support is disabled.

bikeshed: 'has_earlycon' would be slightly more concise (feel free to ignore).

>  	int ret;
>  
>  	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> @@ -839,6 +865,43 @@ static int geni_se_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +#ifdef CONFIG_SERIAL_EARLYCON
> +	if (console_drivers)

The loop should have curly braces ("use braces when a loop contains more than
a single simple statement"), even though the compiler doesn't need them in
this case. This is not a loop, but I was told by a maintainer that it equally
applies, which makes sense.

You could avoid one level of indentation through:

if (!console_drivers)
	goto exit;

> +		for_each_console(bcon)

ditto (braces)

> +			if (!strcmp(bcon->name, "qcom_geni")) {
> +				earlycon_present = 1;
> +				break;
> +			}
> +	if (!earlycon_present)
> +		goto exit;
> +
> +	wrapper->to_core.path = devm_of_icc_get(dev, "qup-core");
> +	if (IS_ERR(wrapper->to_core.path))
> +		return PTR_ERR(wrapper->to_core.path);
> +	/*
> +	 * Put minmal BW request on core clocks on behalf of early console.
> +	 * The vote will be removed earlycon exit function.
> +	 *
> +	 * Note: We are putting vote on each QUP wrapper instead only to which
> +	 * earlycon is connected because QUP core clock of different wrapper
> +	 * share same voltage domain. If core1 is put to 0, then core2 will
> +	 * also run at 0, if not voted. Default ICC vote will be removed ASA
> +	 * we touch any of the core clock.
> +	 * core1 = core2 = max(core1, core2)
> +	 */
> +	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW,
> +							GENI_DEFAULT_BW);

nit: the indentation is a bit odd. Align with 'wrapper->to_core.path' or a
nearby tab stop?
