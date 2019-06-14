Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3AB4662C
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 19:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfFNRvz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 13:51:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41801 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbfFNRvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jun 2019 13:51:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so2296946lfa.8;
        Fri, 14 Jun 2019 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yCuv01rczPA+XC8KDrSVXnnpQbUcR8Ck1R8byURdxLI=;
        b=IH3/r+63EUUnl/LG/x/NF4bYE5m5xnP3BxI/aEG1ycuppcv6fb7GUU3o90tziAwTlT
         M/Sr+/jFZH0bUKQxfk5Tt4jA/7sYFi5jYogb2XHSjmDiArpKGOkKj6CERfeNvJEEL6bs
         Fz/VNiYalCVRCKfUHwK2pt/9av7hUDv59jVhDhuQTVsfdEpUmX4rBJ7LVjVlIG6T9o/8
         1Gdm1rMgWUz4h5o5DG+lZ74IZ52+UxWhrS6zUvoG1Wjtvcga0Fn2ZX89PwMSfDV4A6RD
         bojAfIGtYeL35aWdRPfp5jx6LSA8Fg/s+2ho1QKTKUHhm4Sunsfr4Ei8QYTmFdogOdUc
         k10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yCuv01rczPA+XC8KDrSVXnnpQbUcR8Ck1R8byURdxLI=;
        b=CKcZrc21qcvCzt+kD5Y70otA8xvysgAWxoBYyouOt3Hi2/ySIiNAWzzGdU3X3ceUUK
         zR6704qnQbr5EOQMeRgOSlyQpsTIbGJpsHHZPARa1pQFSKy40Bu+8bHRo30Iq5LQ7EBI
         uqiwe6+i4V1vWKouA5nvElqgsx1vdYiMx5uialgmi+bZO70QntQ0vpAf718g6zqybRoi
         5RouPq+aVTFo7AnGVnmhcmO4bERUqoesbIPFYF6PGL+NVieXqcTVqa9p29EnV/tQUeC2
         XEtdY3l87BQMgJDu3yOKBrsMar6vQdADQgSfu2eMwpF99BJ/fU0BDMzPHaXZE6VKvDor
         6P4w==
X-Gm-Message-State: APjAAAXhV/HHT1LBJxYnyBwecDszL4B9qd4rd6M/sw27LD2WtE8ju9+t
        cQG9LhKniIPBueEbxsvpFHGaKvDl
X-Google-Smtp-Source: APXvYqxeSOdT9IX3LZSd9VN7ONle88jOuu3pVH7oAim18SJ/VAVkF5QrGyzvUxv6yv8J28lXAuZ7cw==
X-Received: by 2002:ac2:4904:: with SMTP id n4mr1075032lfi.53.1560534712950;
        Fri, 14 Jun 2019 10:51:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id e8sm641735lfc.27.2019.06.14.10.51.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 10:51:52 -0700 (PDT)
Subject: Re: [PATCH V6] i2c: tegra: remove BUG, BUG_ON
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
References: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <504e19d0-05dd-dc80-3aaf-cdab8f88002d@gmail.com>
Date:   Fri, 14 Jun 2019 20:51:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560527438-30150-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

14.06.2019 18:50, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Remove BUG() and mask Rx interrupt similar as Tx
> for message fully sent case. Add WARN_ON_ONCE check
> for non-zero rx_fifo_avail in tegra_i2c_empty_rx_fifo()
> after all processing. Error handling in tegra_i2c_empty_rx_fifo
> caller is also added.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..26a7c8c 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)

What about I2C_ERR_RX_BUFFER_OVERFLOW?

>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -515,15 +516,23 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/* buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function
> +		 */

Please start all multiline comments with an empty "/*", it should be the correct
style. There are some places in the kernel where style like yours is used, but I
assume they are not very correct. Besides, yours variant is not consistent with the
style of the rest of comments in this source file. And put a dot in the end for
completeness. Same for the other comments in this patch.

>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
>  		buf_remaining = 0;
>  		rx_fifo_avail--;
>  	}

Please add a newline here. All logical parts of the code should be separated to ease
reading and following.

> +	if (WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	/* buf_remaining > 0 at this point can only have rx_fifo_avail == 0
> +	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
> +	 * case earlier in this function
> +	 */
>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;
>  
> @@ -581,7 +590,10 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * boundary and fault.
>  	 */
>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/* buf_remaining > 3 check not needed as tx_fifo_avail == 0
> +		 * when (words_to_transfer was > tx_fifo_avail) earlier
> +		 * in this function for non-zero words_to_transfer
> +		 */
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
>  
> @@ -811,6 +823,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	u32 status;
>  	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>  	struct tegra_i2c_dev *i2c_dev = dev_id;
> +	int err_val;
>  
>  	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
>  
> @@ -847,10 +860,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  
>  	if (!i2c_dev->is_curr_dma_xfer) {
>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> -			if (i2c_dev->msg_buf_remaining)
> -				tegra_i2c_empty_rx_fifo(i2c_dev);
> -			else
> -				BUG();
> +			err_val = tegra_i2c_empty_rx_fifo(i2c_dev);
> +			if ((!(i2c_dev->msg_buf_remaining)) &&

Let's move this check into tegra_i2c_empty_rx_fifo() and return -EINVAL for that case.
This will make code to look cleaner.

> +			    (!(status & I2C_INT_PACKET_XFER_COMPLETE)) &&

It shouldn't matter that XFER_COMPLETE is set if RX FIFO isn't fully emptied because
it always shall be emptied. Hence this check is not needed and we should error out
regardless.

> +			    err_val) {
> +				/*
> +				 * Overflow error condition: message fully sent,
> +				 * with no XFER_COMPLETE interrupt but hardware
> +				 * asks to transfer more.
> +				 */
> +				tegra_i2c_mask_irq(i2c_dev,
> +						   I2C_INT_RX_FIFO_DATA_REQ);

No need to mask RX_FIFO_DATA_REQ here because all interrupts are masked on "goto
err:", hence just remove the tegra_i2c_mask_irq().

> +				i2c_dev->msg_err |=
> +					I2C_ERR_UNEXPECTED_STATUS;

No need to split this into two lines because it's less than 80 chars, write this in a
single line.

> +				goto err;
> +			}
>  		}
>  
>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> @@ -876,7 +900,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		/* Underflow error condition: XFER_COMPLETE before message
> +		 * fully sent.
> +		 */
> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
> +			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
> +			goto err;
> +		}
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> 

Please address comments in the next revision.
