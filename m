Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3BF8185125
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Mar 2020 22:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbgCMV2g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Mar 2020 17:28:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36952 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCMV2g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Mar 2020 17:28:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id p14so6035209pfn.4
        for <linux-i2c@vger.kernel.org>; Fri, 13 Mar 2020 14:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ry88+WJ8l0zWh9VRcHO/WsgTmwawfbzUY5Sw04fN+Yo=;
        b=ggDjeYlGjr6G0AJm0Zxysz575eO62jPbvdaICQoeCJ5IGHTMeQzePj2ysK0BS6LCqs
         SC647aPJJqcGyGBZBw6pUVQvAJtoiEC46JBlSlDO+610X0NKreH+BLpUqvtIY60mS45f
         ocVCeNv/bGgOluQS1qH4cHDDpbZKucXC2R8iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ry88+WJ8l0zWh9VRcHO/WsgTmwawfbzUY5Sw04fN+Yo=;
        b=fT1UCf488lcKmqW5EAZelKVH/4MGInPMglBnwb9l3Tjc/2EUbee78qdK5T3ln12i+f
         mWuyjGf586BDlesWkE6SL/bu4VKeYCrKyK/pjJtnOGHrTCExJjgvUuJ43zkW7In/NM3O
         6XE8j3/UWWmgF8OlG+AmxZGhPfMQMzrCdOk7BE0l8IndLCKxN9Y9yTY5mzfPXLai+tiC
         RUzMRveqDxVoFMmtpfJJlyXWprHWMWuwjULm+cfGExzKQYDh8xAxGHqn0aG9/KX+e9nv
         +oBb32Nf7t7Tlg6MSy7QxlNchoHUmCeunKGKvvwjZ2YXbV0uCo7PLaWZnzy6Xk+zA+Nc
         tq4A==
X-Gm-Message-State: ANhLgQ2BkAAH7djTioQ3dhBc5x+lmYF6ikPhKaH+J5Ol87mWjcGSTXKR
        Inx1viDEz2Up6FO5VjtIQcrfLw==
X-Google-Smtp-Source: ADFU+vucKwFZgC8dkfJ9UvKffgEL6ZoV8n8BdGBDjTsqiUyK9EqnqQYB/EWe1+STtFklrWlFl90CNQ==
X-Received: by 2002:aa7:83cb:: with SMTP id j11mr13454955pfn.241.1584134915113;
        Fri, 13 Mar 2020 14:28:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id z3sm59387463pfz.155.2020.03.13.14.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 14:28:34 -0700 (PDT)
Date:   Fri, 13 Mar 2020 14:28:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 4/8] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200313212833.GK144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-5-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-5-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akash,

On Fri, Mar 13, 2020 at 06:42:10PM +0530, Akash Asthana wrote:
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
>  drivers/tty/serial/qcom_geni_serial.c | 69 +++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 272bae0..c8ad7e9 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -184,6 +184,19 @@ static struct qcom_geni_serial_port qcom_geni_console_port = {
>  	},
>  };
>  
> +static int geni_serial_icc_get(struct geni_se *se)
> +{
> +	se->icc_path_geni_to_core = devm_of_icc_get(se->dev, "qup-core");
> +	if (IS_ERR(se->icc_path_geni_to_core))
> +		return PTR_ERR(se->icc_path_geni_to_core);
> +
> +	se->icc_path_cpu_to_geni = devm_of_icc_get(se->dev, "qup-config");
> +	if (IS_ERR(se->icc_path_cpu_to_geni))
> +		return PTR_ERR(se->icc_path_cpu_to_geni);
> +
> +	return 0;
> +}
> +
>  static int qcom_geni_serial_request_port(struct uart_port *uport)
>  {
>  	struct platform_device *pdev = to_platform_device(uport->dev);
> @@ -962,6 +975,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
>  	unsigned long clk_rate;
>  	u32 ver, sampling_rate;
> +	int ret;
>  
>  	qcom_geni_serial_stop_rx(uport);
>  	/* baud rate */
> @@ -983,6 +997,18 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> +	/*
> +	 * Put BW vote only on CPU path as driver supports FIFO mode only.
> +	 * Assume peak_bw as twice of avg_bw.
> +	 */
> +	port->se.avg_bw_cpu = Bps_to_icc(baud);
> +	port->se.peak_bw_cpu = Bps_to_icc(2 * baud);
> +	ret = icc_set_bw(port->se.icc_path_cpu_to_geni, port->se.avg_bw_cpu,
> +			port->se.peak_bw_cpu);
> +	if (ret)
> +		dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
> +			__func__);

Should this return an error? The port might not operate properly if the ICC
bandwidth couldn't be configured


> +
>  	/* parity */
>  	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>  	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> @@ -1208,16 +1234,40 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  		unsigned int new_state, unsigned int old_state)
>  {
>  	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
> -
> +	int ret;
>  	/* If we've never been called, treat it as off */
>  	if (old_state == UART_PM_STATE_UNDEFINED)
>  		old_state = UART_PM_STATE_OFF;
>  
> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
> +		/* Put BW vote for core clocks and CPU */
> +		ret = icc_set_bw(port->se.icc_path_geni_to_core,
> +			port->se.avg_bw_core, port->se.peak_bw_core);
> +		if (ret)
> +			dev_err(uport->dev, "%s: ICC BW voting failed for core\n",
> +				__func__);
> +
> +		ret = icc_set_bw(port->se.icc_path_cpu_to_geni,
> +			port->se.avg_bw_cpu, port->se.peak_bw_cpu);
> +		if (ret)
> +			dev_err(uport->dev, "%s: ICC BW voting failed for cpu\n",
> +				__func__);
> +
>  		geni_se_resources_on(&port->se);
> -	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +	} else if (new_state == UART_PM_STATE_OFF &&
> +			old_state == UART_PM_STATE_ON) {
>  		geni_se_resources_off(&port->se);
> +		/* Remove BW vote from core clocks and CPU */
> +		ret = icc_set_bw(port->se.icc_path_geni_to_core, 0, 0);
> +		if (ret)
> +			dev_err(uport->dev, "%s: ICC BW remove failed for core\n",
> +				__func__);
> +
> +		ret = icc_set_bw(port->se.icc_path_cpu_to_geni, 0, 0);
> +		if (ret)
> +			dev_err(uport->dev, "%s: ICC BW remove failed for cpu\n",
> +				__func__);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1308,6 +1358,17 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
>  	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
>  
> +	ret = geni_serial_icc_get(&port->se);
> +	if (ret)
> +		return ret;
> +	/* Set the bus quota to a reasonable value */
> +	port->se.avg_bw_core = console ? Bps_to_icc(1000) :
> +		Bps_to_icc(CORE_2X_50_MHZ);

Why different settings for console vs. non-console?

> +	port->se.peak_bw_core = console ? Bps_to_icc(1000) :
> +		Bps_to_icc(CORE_2X_100_MHZ);
> +	port->se.avg_bw_cpu = Bps_to_icc(1000);
> +	port->se.peak_bw_cpu = Bps_to_icc(1000);

'Bps_to_icc(1000)' is a recurring theme in this series, could it be worth
to have a constant for that? Could be GENI_DEFAULT_BW or similar.
