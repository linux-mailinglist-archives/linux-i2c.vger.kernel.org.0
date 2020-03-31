Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B5F199DF4
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Mar 2020 20:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgCaSZC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Mar 2020 14:25:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43386 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgCaSZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Mar 2020 14:25:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id g20so1242403pgk.10
        for <linux-i2c@vger.kernel.org>; Tue, 31 Mar 2020 11:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OD4APimgEZMGsgSh2+kf2nEhlo5tym5G5xyWPxzhCFU=;
        b=cni/Y2VVfTEbC+1+JW9g4Pq7M9qQKO0873cdLiP6lzNX05tOqejyE9L7bRz81oVjqF
         spmPg4yqW+e+X+BcUzgEpr7F7v9No1oxIyjSapvnXJYoXwgQ2yLTPm+BUrBQZSoCSOUl
         AKCctgm1lWAEd9zuMEaC49/K/CTSOTfyd5GjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OD4APimgEZMGsgSh2+kf2nEhlo5tym5G5xyWPxzhCFU=;
        b=XH7WV84+7mbBr+kTK6L/3uuTs1HkjG/cyfWky+S7opdh+pKwo57dG3AqFxTeWnsPuC
         1qhrunaedQ73MucM9p6gyu9cPyGNtV9bsUPAZWWKv5aKEQbc1h2cOSm1kXAbXCzbV0An
         PIdlPznOLhg7CAiFe13UCWrMkYGYw55r5eZQkCBuqkySCNUYh1mPMzKwoGEa6jTMS2yj
         2viPvrxYTIEh/t5CyUfEuFo2f0A0eGQfpM6AnhsAcaYeNWLwmnqx2O+zTSheyxyEfYEN
         idWi3w6ke5Ln7Co6Ipry/SWi/WAKkptSv6FqQnY8uA5mc3nDjPoV0z+B9GSMrxJxgwRw
         yx7Q==
X-Gm-Message-State: ANhLgQ0EuyuJpYmVuZrpLYtZnMNHDlmeUwoRpK4KZrbUuCKhbRPFLrfJ
        yPEvSNVeGgt8myGfxwQvFHXhIg==
X-Google-Smtp-Source: ADFU+vvkTEocDVBgyI1pOMqmc7wnzKXhmUi3tdwPEyjL7Pj2+Kw4PlEZ3jjHUgkibnILpfJkUubkxA==
X-Received: by 2002:a65:6805:: with SMTP id l5mr18470841pgt.256.1585679099890;
        Tue, 31 Mar 2020 11:24:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h15sm12963919pfq.10.2020.03.31.11.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 11:24:59 -0700 (PDT)
Date:   Tue, 31 Mar 2020 11:24:57 -0700
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
Subject: Re: [PATCH V3 3/8] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200331182457.GH199755@google.com>
References: <1585652976-17481-1-git-send-email-akashast@codeaurora.org>
 <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1585652976-17481-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Tue, Mar 31, 2020 at 04:39:31PM +0530, Akash Asthana wrote:
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
> Change is V3:
>  - Add geni_remove_earlycon_icc_vote API that will be used by earlycon
>    exit function to remove ICC vote for earlyconsole.
>  - Remove suspend/resume hook for geni-se driver as we are no longer
>    removing earlyconsole ICC vote from system suspend, we are removing
>    from earlycon exit.
> 
>  drivers/soc/qcom/qcom-geni-se.c       | 51 +++++++++++++++++++++++++++++++++++
>  drivers/tty/serial/qcom_geni_serial.c |  7 +++++
>  include/linux/qcom-geni-se.h          |  2 ++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 9344c14..d30c282 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -90,8 +90,11 @@ struct geni_wrapper {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> +	struct geni_icc_path to_core;
>  };
>  
> +struct geni_wrapper *earlycon_wrapper;

should be static

> +
>  #define QUP_HW_VER_REG			0x4
>  
>  /* Common SE registers */
> @@ -818,6 +821,26 @@ int geni_icc_vote_off(struct geni_se *se)
>  }
>  EXPORT_SYMBOL(geni_icc_vote_off);
>  
> +void geni_remove_earlycon_icc_vote(void)
> +{
> +	struct geni_wrapper *wrapper = earlycon_wrapper;
> +	struct device_node *parent = of_get_next_parent(wrapper->dev->of_node);
> +	struct device_node *child;
> +
> +	for_each_child_of_node(parent, child) {
> +		if (of_device_is_compatible(child, "qcom,geni-se-qup")) {
> +			wrapper = platform_get_drvdata(of_find_device_by_node(
> +					child));
> +			icc_put(wrapper->to_core.path);
> +			wrapper->to_core.path = NULL;
> +		}
> +	}
> +	of_node_put(parent);
> +
> +	earlycon_wrapper = NULL;
> +}
> +EXPORT_SYMBOL(geni_remove_earlycon_icc_vote);

I didn't know that consoles have an exit handler, this is way nicer than
the miscellaneous triggers we discussed earlier :)

> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -845,6 +868,34 @@ static int geni_se_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +#ifdef CONFIG_SERIAL_EARLYCON
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

I don't really understand this part. According to the comment if we vote
(let's say) for core2 but not for core1 then:

core1: 0
core2: GENI_DEFAULT_BW

core1 = core2 = max(core1, core2)
  or
core1 = core2 = max(0, GENI_DEFAULT_BW)

hence

core1 = core2 = GENI_DEFAULT_BW

What am I missing, why is it necessary to vote for both/all?
