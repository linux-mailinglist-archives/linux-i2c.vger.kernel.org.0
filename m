Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0EA39624
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 21:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbfFGTsE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 15:48:04 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35610 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729715AbfFGTsD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 15:48:03 -0400
Received: by mail-lj1-f195.google.com with SMTP id h11so2767271ljb.2;
        Fri, 07 Jun 2019 12:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PpZq5RJ/LWjQRCgCN2YVuXvSgVVFGXCds2RhKiuW0mc=;
        b=JEl5SaP0bubHCTxgJBaqOlOxwv9QyTBzupqmxosqN0HiBmOkk3gL0axQxItZgtePPT
         acYWEZVXOTDeEEpP3IwdQG0I9Fv66PlEXzs/BFpqlOtz49S1pVHbGjeltblHvppHoN6g
         0YZ738rjj8Rl7KuvExeholTXvuwoPLWopHMO/++AADReWNkWknIhwjFng0ZYXhoWrh1F
         Fgq2L6qeya56OHbKfSsZVU448aU5J6jcLTXXmwQCA1YV+C6p6o/ARXA8BSFJoFDKmzM4
         FZsxshtGov/rwv6LtPCfPQbqQpWEuc3JidjMjt1uMmUxUoDyOAbAkwxZwla9X9j0Gn0W
         e9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PpZq5RJ/LWjQRCgCN2YVuXvSgVVFGXCds2RhKiuW0mc=;
        b=MmeJ2F2I3KZDtYkbP+WQFUuFuyLEkaAja1lIdWwzD7Voa7E7qjNAx1vNSuWHQv3T9K
         gWBQl1o/QvuTaXs317wqmPM5r50z5ACrOvpsP7vIZmHBP/BXcX6jqQSj8scRqtBZZiG1
         EE8HxO/p3QJX/F/1MsXbG4N5F+Sar2c1IRLMBpKdqWT+MshBQluw33EFYnLheF0ooUof
         2Scjm4uovqrFlm6Zj9n7nCWAGlJmeB1u0wsowjAQSuV8yhoVg9adpiwktVfG6ZctPgAy
         DvKVRaYCI1WExZXN7ZKY8SzXPMxsSCDb7MbFMsY/OZv719yhYjil5XXmf7cgP3vY5xBE
         e2UQ==
X-Gm-Message-State: APjAAAW8aa9Dfq4+gba8lINEmjpMLEa7u8trySMvdG6OflTD6c+6ZXNZ
        DWKfjZu7JYuv5U0CdMJEnz58OJrh
X-Google-Smtp-Source: APXvYqzP6DkjQwsNKLu7woaOf3JyeEEgfD/zfZV6ZxOFupmpZAKZCBcLBiBsRXmE6XY19qPM9c/afw==
X-Received: by 2002:a2e:25a:: with SMTP id 87mr9285761ljc.183.1559936881229;
        Fri, 07 Jun 2019 12:48:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id e8sm656086lfc.27.2019.06.07.12.47.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 12:48:00 -0700 (PDT)
Subject: Re: [PATCH V2 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1559935826-25812-1-git-send-email-bbiswas@nvidia.com>
 <1559935826-25812-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dfe5e3a7-a761-0633-8da6-32f94aae171f@gmail.com>
Date:   Fri, 7 Jun 2019 22:47:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559935826-25812-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 22:30, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..c89d0ee 100644
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
> @@ -876,7 +877,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
> +			goto err;
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> 

Unfortunately that's not enough because the indicator of the error is
the i2c_dev->msg_err and no error is set in yours case, hence no
hardware reset will be performed. It should be at least somewhat like this:

	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
		goto err;
	}
