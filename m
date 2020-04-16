Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A8B1ACE89
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Apr 2020 19:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732092AbgDPRRt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Apr 2020 13:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728863AbgDPRRr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Apr 2020 13:17:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70947C061A10
        for <linux-i2c@vger.kernel.org>; Thu, 16 Apr 2020 10:17:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b8so1941823pfp.8
        for <linux-i2c@vger.kernel.org>; Thu, 16 Apr 2020 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lSVN9q3kewDOwkDaspBABCKY2/Z6ZVUcbqo9W3/29XA=;
        b=SYFVPFdnR6QrLfSH3STBSVwNueZTK34xisDXvKIC5+mlnFhUXa8c34PTOM/+mKQx7Z
         KjXBpOoU33j4Olj4UxNSXHm3YvVyNFeOfrx0oOVDpsKSUWQ+n/v+Mah/Nej0qD0CCRdI
         jLErVM8oxVPYzEzmg4t/lPAm168YlMQQzs/HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lSVN9q3kewDOwkDaspBABCKY2/Z6ZVUcbqo9W3/29XA=;
        b=AThBWJ0nacdugUDAkh7Y2+UoRgAk0ITjqwyy286OIpBkueK0RH09CoZWlVsfV06e4/
         wie2HUwu4pfZNkaD1/KLD7LiXCJ2WkT+gcMJDNsN44BfwiN7HXps5BpgJKnrUYVNAwBY
         x2aLazh6ay2BORqPFy+r57jEKmuDN3YrcnJOMXy/q8iURwQtpSl/XU+HI6N6Z8yxMy3Q
         YhGZDBHC/5S7Fnn8K729bqKtxf1zt92XKhPCb811WCGsb5N2owtdy0qiiL4ongW+LGA6
         pb1jsrdQ2XHnPOJMyrvB8IU1X7UCI+BQXI8Bo0TgZ7lksS94G17oyQbt0g6jh3HYFfb/
         vyNQ==
X-Gm-Message-State: AGi0PuaDN3Vcx0XARsS3SepuI1+FQuzitg4UHl0jZys16FpVvFoQzzQE
        QQHoDN9oeBmBdClre3ICwuVdsw==
X-Google-Smtp-Source: APiQypJJH5+xkeCHF0lQwkilT+l9hOfYH89U285tBYg1QODotEruJXQkNKm/uBf6ul/OpdGf5BgEhw==
X-Received: by 2002:a63:b447:: with SMTP id n7mr31518295pgu.278.1587057465930;
        Thu, 16 Apr 2020 10:17:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id f21sm3477755pfn.71.2020.04.16.10.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 10:17:44 -0700 (PDT)
Date:   Thu, 16 Apr 2020 10:17:43 -0700
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
Subject: Re: [PATCH V4 7/9] tty: serial: qcom_geni_serial: Add interconnect
 support
Message-ID: <20200416171743.GC199755@google.com>
References: <1586946198-13912-1-git-send-email-akashast@codeaurora.org>
 <1586946198-13912-8-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1586946198-13912-8-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 03:53:16PM +0530, Akash Asthana wrote:
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
>  drivers/tty/serial/qcom_geni_serial.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 8c5d97c..a5b2f1c 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -965,6 +965,15 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
>  	ser_clk_cfg = SER_CLK_EN;
>  	ser_clk_cfg |= clk_div << CLK_DIV_SHFT;
>  
> +	/*
> +	 * Bump up BW vote on CPU and CORE path as driver supports FIFO mode
> +	 * only.
> +	 */
> +	port->se.icc_paths[0].avg_bw = (baud > 115200) ?
> +				Bps_to_icc(CORE_2X_50_MHZ) : GENI_DEFAULT_BW;
> +	port->se.icc_paths[1].avg_bw = Bps_to_icc(baud);

use enums to index the paths

> +	geni_icc_vote_on(&port->se);
> +
>  	/* parity */
>  	tx_trans_cfg = readl(uport->membase + SE_UART_TX_TRANS_CFG);
>  	tx_parity_cfg = readl(uport->membase + SE_UART_TX_PARITY_CFG);
> @@ -1202,11 +1211,14 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
>  	if (old_state == UART_PM_STATE_UNDEFINED)
>  		old_state = UART_PM_STATE_OFF;
>  
> -	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> +	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF) {
> +		geni_icc_vote_on(&port->se);
>  		geni_se_resources_on(&port->se);
> -	else if (new_state == UART_PM_STATE_OFF &&
> -			old_state == UART_PM_STATE_ON)
> +	} else if (new_state == UART_PM_STATE_OFF &&
> +			old_state == UART_PM_STATE_ON) {
>  		geni_se_resources_off(&port->se);
> +		geni_icc_vote_off(&port->se);
> +	}
>  }
>  
>  static const struct uart_ops qcom_geni_console_pops = {
> @@ -1304,6 +1316,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  			return -ENOMEM;
>  	}
>  
> +	ret = geni_icc_get(&port->se, NULL);
> +	if (ret)
> +		return ret;
> +	/* Set the bus quota to a reasonable value for register access */
> +	port->se.icc_paths[0].avg_bw = GENI_DEFAULT_BW;
> +	port->se.icc_paths[1].avg_bw = GENI_DEFAULT_BW;

The comment isn't very useful, the use of GENI_DEFAULT_BW essentially
implies "a reasonable value". I suggest to drop it.
