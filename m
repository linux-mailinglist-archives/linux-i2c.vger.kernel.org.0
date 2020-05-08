Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1E11CB772
	for <lists+linux-i2c@lfdr.de>; Fri,  8 May 2020 20:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgEHSiM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 May 2020 14:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726636AbgEHSiK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 May 2020 14:38:10 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7603AC05BD43
        for <linux-i2c@vger.kernel.org>; Fri,  8 May 2020 11:38:09 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s10so1119127plr.1
        for <linux-i2c@vger.kernel.org>; Fri, 08 May 2020 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ws7ldR16MNM6mOMbD4L23WPec8fzXSI9QeuWBJlWUuc=;
        b=KcHnRVg/b6jmrJZQkBFDhWz5xf6D/bqN5Fc5pP5/XoFfJBpmHhQPEJ4GghwJWpbpPh
         3OIb7B4npB1dAcr6M+ByfNFlduxaH6frbTvtpSuxIpEHxchNf0fmI/Yg4Tfv55lKY11V
         zpKb6nDlTgHjQ+1PXFei25kRdxq0MeT7TLC6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ws7ldR16MNM6mOMbD4L23WPec8fzXSI9QeuWBJlWUuc=;
        b=fl3FgzS5numahDz2pzp6WMR4fes1f/wGrrlmL0kZe1Wbvyut8EPqQ7oH16ojBNFgil
         LQkKTEsIEgCsaoNPSBjOe20KiG6C+AIqMj5tsSqS+q0pHLd94QxuvaAi2ZPiXQRYbOkq
         mQ0pYkQTVRNqONkddLMcYSSrnS26jTINCpKfeUJ3rr5qwp4lqYSKosNQlmGb6UejBfi1
         eK7E0K17HomCzOepywx0+7qToskn+YIZQLc17g7rOWzA0GKA8AE47TaCyi8W8kWKS9ls
         Nl390veZyUlIFMKceJZHMTLH673Mdx3zCJfkqff4zwafMzItlhYVH2w2xWBLmpHISLQ0
         RRig==
X-Gm-Message-State: AGi0PuYW3kH2iq27OgRDNQ73upv9lYtSLq5ak9HsK0qnKtsLy8RECyjg
        AUay+qXStOK2bvmpz0CHXwQVdg==
X-Google-Smtp-Source: APiQypIyZQDCtyw4+QXWiMgTGVJtQMhFL+Lnm7Ew/IK8cGdricQk2z0nez9p1ug61H/ltcz8br/DKA==
X-Received: by 2002:a17:902:c194:: with SMTP id d20mr3748959pld.256.1588963088876;
        Fri, 08 May 2020 11:38:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i128sm2460589pfc.149.2020.05.08.11.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 11:38:08 -0700 (PDT)
Date:   Fri, 8 May 2020 11:38:07 -0700
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
Subject: Re: [PATCH V5 5/7] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200508183807.GE4525@google.com>
References: <1588919619-21355-1-git-send-email-akashast@codeaurora.org>
 <1588919619-21355-6-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588919619-21355-6-git-send-email-akashast@codeaurora.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, May 08, 2020 at 12:03:37PM +0530, Akash Asthana wrote:
> Get the interconnect paths for Uart based Serial Engine device
> and vote according to the baud rate requirement of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_serial_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
> Changes in V3:
>  - As per Matthias comment, use common library APIs defined in geni-se
>    driver for ICC functionality.
> 
> Changes in V4:
>  - As per Mark's comment move peak_bw guess as twice of avg_bw if
>    nothing mentioned explicitly to ICC core.
>  - As per Matthias's comment select core clock BW based on baud rate.
>    If it's less than 115200 go for GENI_DEFAULT_BW else CORE_2X_50_MHZ
> 
> Changes in V5:
>  - Add icc_enable/disable to power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value. No need to call icc_disable after BW vote because
>    console devices are expected to be in active state from the probe itself
>    and qcom_geni_serial_pm(STATE_OFF) will be called for non-console ones.
> 
>  drivers/tty/serial/qcom_geni_serial.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 8c5d97c..2a1da36 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -944,6 +944,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>  	unsigned long clk_rate;
>  	u32 ver, sampling_rate;
> +	unsigned int avg_bw_core;
>  
>  	qcom_geni_serial_stop_rx(uport);
>  	/* baud rate */
> @@ -965,6 +966,16 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> +	/*
> +	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
> +	 * only.
> +	 */
> +	avg_bw_core = (baud > 115200) ? Bps_to_icc(CORE_2X_50_MHZ)
> +						: GENI_DEFAULT_BW;
> +	geni_icc_bw_init(&port->se.icc_paths[GENI_TO_CORE], avg_bw_core, 0);
> +	geni_icc_bw_init(&port->se.icc_paths[CPU_TO_GENI], Bps_to_icc(baud), 0);
> +	geni_icc_set_bw(&port->se);
> +
>  	/* parity */
>  	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>  	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> @@ -1202,11 +1213,14 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  	if (old_state == UART_PM_STATE_UNDEFINED)
>  		old_state = UART_PM_STATE_OFF;
>  
> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
> +		geni_icc_enable(&port->se);
>  		geni_se_resources_on(&port->se);
> -	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +	} else if (new_state == UART_PM_STATE_OFF &&
> +			old_state == UART_PM_STATE_ON) {
>  		geni_se_resources_off(&port->se);
> +		geni_icc_disable(&port->se);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1304,6 +1318,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  			return -ENOMEM;
>  	}
>  
> +	ret = geni_icc_get(&port->se, NULL);
> +	if (ret)
> +		return ret;
> +	geni_icc_bw_init(&port->se.icc_paths[GENI_TO_CORE], GENI_DEFAULT_BW, 0);
> +	geni_icc_bw_init(&port->se.icc_paths[CPU_TO_GENI], GENI_DEFAULT_BW, 0);
> +
> +	/* Set BW for register access */
> +	ret = geni_icc_set_bw(&port->se);
> +	if (ret)
> +		return ret;
> +
>  	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
>  			"qcom_geni_serial_%s%d",
>  			uart_console(uport) ? "console" : "uart", uport->line);

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
