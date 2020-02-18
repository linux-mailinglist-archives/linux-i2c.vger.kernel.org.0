Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 373F516363E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2020 23:34:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRWey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Feb 2020 17:34:54 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37806 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbgBRWey (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Feb 2020 17:34:54 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1630968pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Feb 2020 14:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2eKXLdS2SZDwMdln7XhHDX3a3+819OaM4/wB+easctg=;
        b=UdvCc28GYQs6m40ZXxJ3q6FDb0m33BsrjUc/CPdR1o9n5xyA+FAgsxOGOBAWTUdDWe
         n1SFmNeodzj4qU3RuxrvUWvAtj7oAtKcOS59IHI4M9ySisy3rZtLt4NkRXSjv7NoBYRJ
         moTU3/iM4xOtiA8zT8vT/PoO19KfiXP/2iKGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2eKXLdS2SZDwMdln7XhHDX3a3+819OaM4/wB+easctg=;
        b=bU4n7v4vVRfbrQxziNkJFzkFKRFV8gAaE7B1/RfKcadziO8oxUtVX5acAMBZe94ysp
         TIrkYyRDgHRmMh41ONS0GdTY9ENq3g+HhEk8M0cB/Z13U9IKa/RXzJxpzwaFOA4krbOq
         90+6mD2/GwBONnwQiH1Rc6fegUDjTk5uTDqo5Uo2ZJc+VNfkOrSLbf1JaLr8jSurLB3S
         TKyki0j2kk3MYesUXMaD8qbY/Gy4Ohu1nILp49xWDWrV8Jrck2DnFlxZ7xR8PY0loy5S
         dz9NspL8cXumZBN07SPSciJO37yA0bU14jPDo4AtfXLb+PqGaDWA8MWvyrWvp4lXy+6B
         V6kQ==
X-Gm-Message-State: APjAAAUdxvru4bOM9+1+u9WiOAXXwWlbdjgdAD1ppdmxpWACV+CTHwmV
        paQJx9oyBwEIK9dnmh4Nbdopjw==
X-Google-Smtp-Source: APXvYqzber3G1fDzSXxp/hMZGp+hlW3bIrQzQO+2dgbacLrctSydXRQwbTAiQI7JCjGq8z+fCcnjDQ==
X-Received: by 2002:a17:90a:d807:: with SMTP id a7mr5507545pjv.15.1582065292004;
        Tue, 18 Feb 2020 14:34:52 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id f3sm5781941pga.38.2020.02.18.14.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2020 14:34:51 -0800 (PST)
Date:   Tue, 18 Feb 2020 14:34:50 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH 2/6] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200218223450.GE15781@google.com>
References: <1581946205-27189-1-git-send-email-akashast@codeaurora.org>
 <1581946205-27189-3-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1581946205-27189-3-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 17, 2020 at 07:00:01PM +0530, Akash Asthana wrote:
> Get the interconnect paths for Uart based Serial Engine device
> and vote according to the baud rate requirement of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 84 ++++++++++++++++++++++++++++++-----
>  1 file changed, 74 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 191abb1..a8fb2b7 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -174,6 +174,35 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
>  	},
>  };
>  
> +static int geni_serial_icc_get(struct geni_se *se)
> +{
> +	if (!se)
> +		return -EINVAL;
> +
> +	se->icc_path[GENI_TO_CORE] = of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(se->icc_path[GENI_TO_CORE]))
> +		return PTR_ERR(se->icc_path[GENI_TO_CORE]);
> +
> +	se->icc_path[CPU_TO_GENI] = of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(se->icc_path[CPU_TO_GENI])) {
> +		icc_put(se->icc_path[GENI_TO_CORE]);
> +		se->icc_path[GENI_TO_CORE] = NULL;
> +		return PTR_ERR(se->icc_path[CPU_TO_GENI]);
> +	}
> +
> +	return 0;
> +}
> +
> +void geni_serial_icc_put(struct geni_se *se)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(se->icc_path); i++) {
> +		icc_put(se->icc_path[i]);
> +		se->icc_path[i] = NULL;
> +	}
> +}
> +
>  static int qcom_geni_serial_request_port(struct uart_port *uport)
>  {
>  	struct platform_device *pdev = to_platform_device(uport->dev);
> @@ -949,6 +978,12 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> +	/* Put BW vote only on CPU path as driver supports FIFO mode only */
> +	port->se.avg_bw_cpu = Bps_to_icc(baud);
> +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
> +	icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
> +			port->se.peak_bw_cpu);
> +
>  	/* parity */
>  	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>  	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> @@ -1179,11 +1214,20 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  	if (old_state == UART_PM_STATE_UNDEFINED)
>  		old_state = UART_PM_STATE_OFF;
>  
> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
> +		/* Put BW vote for core clocks and CPU */
> +		icc_set_bw(port->se.icc_path[GENI_TO_CORE],
> +			port->se.avg_bw_core, port->se.peak_bw_core);
> +		icc_set_bw(port->se.icc_path[CPU_TO_GENI], port->se.avg_bw_cpu,
> +			port->se.peak_bw_cpu);
>  		geni_se_resources_on(&port->se);
> -	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +	} else if (new_state == UART_PM_STATE_OFF &&
> +			old_state == UART_PM_STATE_ON) {
>  		geni_se_resources_off(&port->se);
> +		/* Remove BW vote from core clocks and CPU */
> +		icc_set_bw(port->se.icc_path[GENI_TO_CORE], 0, 0);
> +		icc_set_bw(port->se.icc_path[CPU_TO_GENI], 0, 0);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1274,15 +1318,30 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>  
> +	ret = geni_serial_icc_get(&port->se);
> +	if (ret)
> +		return ret;
> +	/* Set the bus quota to a reasonable value */
> +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
> +		Bps_to_icc(CORE_2X_50_MHZ);
> +	port->se.peak_bw_core = console ? Bps_to_icc(1000) :
> +		Bps_to_icc(CORE_2X_100_MHZ);
> +	port->se.avg_bw_cpu = Bps_to_icc(1000);
> +	port->se.avg_bw_cpu = Bps_to_icc(1000);

I guess you mean 'peak_bw_cpu'?
