Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC7D1AB4CE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 02:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404164AbgDPAbU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 20:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404157AbgDPAbP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 20:31:15 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F321C061A41
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 17:31:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so803487pgo.0
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 17:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OnTP4oD4Bcsx3BkotZcrnHZmBw2+eZRhG9uvLnsU78s=;
        b=nW/gyhjRXg8/9KsX1p83p5SaUYhOsPE36WDt6I4MjKArvFh4GKr9OOEZOsfFzSzCru
         F9wOIRTPBo0mWDxfr7naClgKm3A6JntVoclABPDwZdwTO+V9itkM1hxdMp2I79skVt0u
         QDIWFIbXePobRSCuNtHmLoUYUQrmn+Z1Vt8LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OnTP4oD4Bcsx3BkotZcrnHZmBw2+eZRhG9uvLnsU78s=;
        b=mgmzdjJgE3BILvHihOzTI2B7TyLwt7L7ZkMYFlx49CJhNOJa91vcdZ6OX3KJwOVCZ4
         skjKBR0oQ5SF8h/XinoIX3R8qZNTuL8SyuvWru9kt8/fvk9DTWqdEtAaKEnOcywfEcOC
         rpgBBB8t28+UlRz1gp4VJVU3Gh4prhxgJ2WkgpNG5HvoNDINObWjh+Qx/a32weOiJATV
         X3Wn1YumfLHzbsWUxgTq2n3NzX1JPT0yclKaUSd44s/8JhPgouU70VWxV+wOatWJQhdR
         lGjPTqH4hcSaERNsbS7HAhYxenSH2X5QG+UwIgLrDe/mTIGGeJBnrvifzNUtDmaejGNq
         xo6g==
X-Gm-Message-State: AGi0Puaz08o3zotwkhv5ugI5zABv8ZqwtHiIcWnXxnqGNWXd5Dq4wYNX
        8RIstir9wbImbPSg01l+NKNj4g==
X-Google-Smtp-Source: APiQypJuJPbBT1Ne+dMcDqvrakxLTwgs4y4LFX8rDGEPjDP/udbBZw41qlo8PnFyd1zgnqvlYFWcmQ==
X-Received: by 2002:a63:310:: with SMTP id 16mr28006470pgd.287.1586997074313;
        Wed, 15 Apr 2020 17:31:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a13sm5198298pfo.85.2020.04.15.17.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2020 17:31:13 -0700 (PDT)
Date:   Wed, 15 Apr 2020 17:31:12 -0700
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
Subject: Re: [PATCH V4 4/9] soc: qcom-geni-se: Add interconnect support to
 fix earlycon crash
Message-ID: <20200416003112.GA199755@google.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586946198-13912-5-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Wed, Apr 15, 2020 at 03:53:13PM +0530, Akash Asthana wrote:
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
>  drivers/soc/qcom/qcom-geni-se.c       | 50 +++++++++++++++++++++++++++++++++++
>  drivers/tty/serial/qcom_geni_serial.c |  7 +++++
>  include/linux/qcom-geni-se.h          |  2 ++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 1527bc4..727ad2e 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -90,8 +90,11 @@ struct geni_wrapper {
>  	struct device *dev;
>  	void __iomem *base;
>  	struct clk_bulk_data ahb_clks[NUM_AHB_CLKS];
> +	struct geni_icc_path to_core;
>  };
>  
> +static struct geni_wrapper *earlycon_wrapper;
> +
>  #define QUP_HW_VER_REG			0x4
>  
>  /* Common SE registers */
> @@ -781,6 +784,26 @@ int geni_icc_vote_off(struct geni_se *se)
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
> +
>  static int geni_se_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -808,6 +831,33 @@ static int geni_se_probe(struct platform_device *pdev)
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
> +	ret = icc_set_bw(wrapper->to_core.path, GENI_DEFAULT_BW, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ICC BW voting failed for core\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	if (of_get_compatible_child(pdev->dev.of_node, "qcom,geni-debug-uart"))
> +		earlycon_wrapper = wrapper;
> +	of_node_put(pdev->dev.of_node);
> +#endif
> +
>  	dev_set_drvdata(dev, wrapper);
>  	dev_dbg(dev, "GENI SE Driver probed\n");
>  	return devm_of_platform_populate(dev);
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 6119090..8c5d97c 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1090,6 +1090,12 @@ static void qcom_geni_serial_earlycon_write(struct console *con,
>  	__qcom_geni_serial_console_write(&dev->port, s, n);
>  }
>  
> +static int qcom_geni_serial_earlycon_exit(struct console *con)
> +{
> +	geni_remove_earlycon_icc_vote();
> +	return 0;
> +}
> +
>  static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
>  								const char *opt)
>  {
> @@ -1135,6 +1141,7 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
>  	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
>  
>  	dev->con->write = qcom_geni_serial_earlycon_write;
> +	dev->con->exit = qcom_geni_serial_earlycon_exit;

The idea of using the exit handler of the early console to remove the
votes seemed appealing at first, however it has a drawback: the bandwidth
requests in geni_se_probe() are always made when CONFIG_SERIAL_EARLYCON=y,
also when the system doesn't actually use an early console. On such a
system the votes would never be removed.

A possible alternative could seem to remove the vote at the end of
qcom_geni_serial_probe() of the 'normal' console, but it has a similar
problem: the system could not even have a normal console. One could
possibly argue that CONFIG_SERIAL_QCOM_GENI_CONSOLE shouldn't be set
on such a system, however it could be enabled to have a console for
development, and in production the same kernel config is used, but
with the console disabled through the device tree.

I don't really have a good idea at this point, maybe we just need
something as ugly as a delayed work to remove the votes. Other
suggestions are welcome :)
