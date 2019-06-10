Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5453B32E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 12:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389217AbfFJKaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 06:30:10 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:40712 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388708AbfFJKaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 06:30:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id a21so7412802ljh.7;
        Mon, 10 Jun 2019 03:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=k8dA6RtWLtudf1teyKI10V5TZyW2ANtVz5AmNzW3i/g=;
        b=R6ydAOyZW56n9eFfphJR3L864w54mjYrfJx1u/g+k8w4wrbL5Ki2c24IN3boXytA7Y
         hV5GURE68GTT3Pyke1Bc6QHNt94gUPRiSXF/HYkW6X6OTSUPCDdYREXLOBzkmUyKhn86
         FbsBCg88HuFjRewh+9Xpp8IFIHHsTERCncPmWnxi6JM7XTlmXSQih6rgKn4gSN3cOExh
         5bYqJ+4dl0x0QkxpBRsi7ublZsDrD8mAS+7WSe90nHPIkMfaQPvnHAkewM/5EeQMq0Jp
         TZXMc/tC8aYx+WYHzGjGrzeTEuW4y+3qrc7qioQyx+aHFloyQeUzjLQ3eXKW84ftAWM/
         RR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k8dA6RtWLtudf1teyKI10V5TZyW2ANtVz5AmNzW3i/g=;
        b=D+7hBImH+35GS6PnsETPx3jtVHsObuBT9Dr8hjwK0Bmgfb6nWO8ST0g6hZVrt9B+Ce
         fLUC9GW9K9tMNLmr9JyBf6k3335fNDdfBDj1hBoD1gVXHwcgWRA6i1rGyo0NNHKtUF3D
         1Ou1qeWPrmH0ebHxpgJYhYAATu3wSJ/bRduuYqpOKql4PAsMCn+conyIhzpVCmfKWFGs
         C22REHzb3vX08C5XfGPSc13otTY9J7gekizLKkZ0/n+YJYM/7KB+nkUJl0UGjW99GXBs
         cMfhj4HqYiJXrnvYJYkpuk1tOre2dqEt1atJ7JRChOL/l+kamcrkXxDImuPi7hLALcyz
         JbPg==
X-Gm-Message-State: APjAAAV0x1KoWCpo9vuy1MXRGsQa8pKxnWVcpmxEjnsYkuwUNKQfC89d
        O9Wpm3ZuWuFtnAV+PpjV0Ww=
X-Google-Smtp-Source: APXvYqznUdzN9LQp8pXPFcTmESUCywQVgS0KTkZAzwrqkOh/LVRnl5fEgB5uaBQAoytYy1dMIv28Qg==
X-Received: by 2002:a2e:89cc:: with SMTP id c12mr36047954ljk.90.1560162607864;
        Mon, 10 Jun 2019 03:30:07 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id 80sm1913515lfz.56.2019.06.10.03.30.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 03:30:06 -0700 (PDT)
Subject: Re: [PATCH V3 6/6] i2c: tegra: remove BUG, BUG_ON
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560143324-21754-1-git-send-email-bbiswas@nvidia.com>
 <1560143324-21754-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89190a56-bc79-7c07-9b21-ebdfb532df30@gmail.com>
Date:   Mon, 10 Jun 2019 13:30:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560143324-21754-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2019 8:08, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..d9e99b4 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;
>  
> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * boundary and fault.
>  	 */
>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
>  
> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  
>  	if (!i2c_dev->is_curr_dma_xfer) {
>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> -			if (i2c_dev->msg_buf_remaining)
> +			if (i2c_dev->msg_buf_remaining) {
>  				tegra_i2c_empty_rx_fifo(i2c_dev);
> -			else
> -				BUG();
> +			} else {
> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
> +				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
> +				goto err;
> +			}
>  		}
>  
>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> @@ -876,7 +877,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
> +			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
> +			goto err;
> +		}
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> 

It looks nearly ideal now, although there is still one thing that could
be improved. We're going to print a error message in a case of RX and
spew a warning on a similar case of TX, this makes code inconsistent.
Let's switch to either a error message or just a warning in both places.
