Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A863BBA9
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2019 20:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbfFJSM1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jun 2019 14:12:27 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44684 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388309AbfFJSM0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jun 2019 14:12:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so8867192ljc.11;
        Mon, 10 Jun 2019 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m4IicXmHL+piZ9OJ4E7oQZcLcDU6vLsCg4k119cayko=;
        b=IY1+wvJKprjqmACc+45BoI+/W6BTEuaoh087ueM67xoxK1L8Av+H6QcyQHH4Xj6096
         rOoFYVhZL2Nyi4E6VpFKl6sVjALsZ7c3vFAG7mwSnVyz9sltElJI5laKvjHqdvCcd4e1
         nmkyjQRBmdQ8V9/RhX/IGWjSiEVp50SglLTUBAUNmqd+GW0QXZbCRjL9gM0Pw6ShGph5
         gGOy0bSa5dF1ShBFP3LM/+zOgh51utmJtJ/z2PrP+biQ98UW+zNzVV2uOpfAIvqSMjjp
         iZbm6r96ffqXCd12dSmqzddQI3oT5bKFnbHaeFMY0OOqNLhETYgSjlcta1ncXcEMnw+W
         B2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m4IicXmHL+piZ9OJ4E7oQZcLcDU6vLsCg4k119cayko=;
        b=mUWjUMdHsGY666L6JB+2z0nulTVmTDEPWYyIXK5mfNZORHJ5+ZhBHpWUbyRMreaoDw
         KdglErBf+T3jJT+45rHDEe4/8xwTqcgfJPDVhLU+hqCMmQgwN2sr5c5jckxc9UPSCMP8
         fYgO4OrTjh3GptVpyOCPimh5MBikHFTmlmrLS9LBLp1axTSeh19wOIiCN7Np//m9x+TC
         nbzUHZnPJ+zkOx71EYjfiZkwz7f+RJO0rWcHqNFGO0RCHE2WtvtvY6H2nuRwUrBjSr6z
         vYAEzvejtB6VeOhQSejcLrcKq/0wNCHTEDxlSdgcwKHSnD6s5fpY9iJ4yvZvjjx7fAkI
         TfSg==
X-Gm-Message-State: APjAAAX4VljPXbLx99az6OHUwUoaw2efH2VwnBZVzuL2G0CYql6scG5L
        895BagatPqcnKAenidRX/x0=
X-Google-Smtp-Source: APXvYqwaayRXWK8Ozv+7Emttxy6k6eTTEr5onHP+e5W8bGJ1iOoHAbNoR3LCbqs0pbXVL/JHhy9LDg==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr7891942ljj.31.1560190344354;
        Mon, 10 Jun 2019 11:12:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id p27sm2119121lfh.8.2019.06.10.11.12.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 11:12:23 -0700 (PDT)
Subject: Re: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
 <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <06ab30b6-bf79-c628-0a04-d0307511a06f@gmail.com>
Date:   Mon, 10 Jun 2019 21:12:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

10.06.2019 20:08, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Remove BUG() and make Rx and Tx case handling
> similar.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Looks that this is still not correct. What if it transfer-complete flag
is set and buffer is full on RX? In this case the transfer will succeed
while it was a failure.

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..30619d6 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);

Actually error should be returned here since out-of-bounds memory
accesses must be avoided, hence:

	if (WARN_ON_ONCE(buf_remaining > 3))
		return -EINVAL;

>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);

Better not to ignore this as well:

	if (WARN_ON_ONCE(rx_fifo_avail > 0 &&
			 buf_remaining > 0))
		return -EINVAL;

>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;
>  
> @@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * boundary and fault.
>  	 */
>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);

And here, cause this will corrupt stack:

		if (WARN_ON_ONCE(buf_remaining > 3))
			return -EINVAL;

>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
>  
> @@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  			if (i2c_dev->msg_buf_remaining)
>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>  			else
> -				BUG();
> +				tegra_i2c_mask_irq(i2c_dev,
> +						   I2C_INT_RX_FIFO_DATA_REQ);

Then here:

	if (WARN_ON_ONCE(!i2c_dev->msg_buf_remaining) ||
	    tegra_i2c_empty_rx_fifo(i2c_dev)) {
		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
		goto err;
	}

>  		}
>  
>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> @@ -876,7 +874,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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

