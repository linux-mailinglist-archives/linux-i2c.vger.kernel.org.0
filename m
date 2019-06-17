Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B5F4819B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 14:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfFQMNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 08:13:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40977 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfFQMNL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jun 2019 08:13:11 -0400
Received: by mail-lf1-f66.google.com with SMTP id 136so6309702lfa.8;
        Mon, 17 Jun 2019 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v8xl5FGOCSkcD2QoMw/AQ+uejhm6gYRlLjIBKV4yJrs=;
        b=FBFvQR/wRMLc+J9WDSadXShi5AiG9AtyAUkcJMO8yCx7lCyNAZkjoOLIoEf8IRRb60
         hiQS+C5nRppZFwNZPEkHMz0OCiqeU6GW5K7TBikWUXG3p2hLyRkl5BtNzzjwZ4+WQXU+
         hEt0HSzK1ApY6FDo4fm5/6D4KQkFajsxwYrbxRXcbkxlrMAlljfI/ghuolJqi0Z8hECv
         meS4hzDGk9FaQGwtCay0OkBJ0MKFYvcsL2J1OV0+c9tSlMCQ3omcXdk2FaurethzW4Ux
         RAebywuQEE276skNXgVT6T8cEKyhaHyTyCnuYw5zTUbWGZLZnDJr0eI6J/RMBNIXCb45
         C8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v8xl5FGOCSkcD2QoMw/AQ+uejhm6gYRlLjIBKV4yJrs=;
        b=C1gD36ntuQ5Mm4qX/nws+dL0EzITO8k39hjMJ9A9lpV5vEEFM7QYtmF90FxMi7W4/o
         +Z63QYr1IGvwOlt0dwAhIYR8yzan/BTDeyQHaCxo3iLa7tcsVmtJUhNQjpWu7EaY5eHk
         /9PC91BUhJ13JS+Lcn+QPc2UDx2pGx6HG1Y4dCrnXoVR3gve96FWpb0lItlqcxgb8+dl
         SmGUPKwq/he1g6iUmLgm8NGU59b8nzrNSjGydgFdJ5dTOWhFjCoBEV6BVOqQvq5ACBL+
         z/N/LodeEY/S12E05WzPl2ZLlIQMoLnGSLTPDKARNkaHprpBX/rqacGKpqggLltODkTl
         z/+w==
X-Gm-Message-State: APjAAAXd7HBV/8R35QruAVm7nwhzFbAhnzBmBhYOvWwcgeKzP+AnBoN9
        /H3XRxZ0gQhyslJ2d5Cb4+I=
X-Google-Smtp-Source: APXvYqz5x03Co/1PbMmLiFwuKlWURo0Fboj+OU+Dr1c/F4hnwrjPemNBvAUUIL3kUFM4iGdG3XxCdQ==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr20583634lfq.136.1560773588894;
        Mon, 17 Jun 2019 05:13:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-197.pppoe.mtu-net.ru. [91.79.162.197])
        by smtp.googlemail.com with ESMTPSA id o21sm2125582ljg.82.2019.06.17.05.13.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:13:08 -0700 (PDT)
Subject: Re: [PATCH V7] i2c: tegra: remove BUG, BUG_ON
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
References: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5a8ad23f-33c8-5140-cef8-f9cef70764b1@gmail.com>
Date:   Mon, 17 Jun 2019 15:13:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.06.2019 8:09, Bitan Biswas пишет:
> Remove BUG, BUG_ON as it makes system usable:
>  - Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>    as needed.
>  - Remove BUG() and mask Rx interrupt similar as Tx
>    for message fully sent case.
>  - Add caller error handling and WARN_ON_ONCE check for non-zero
>    rx_fifo_avail in tegra_i2c_empty_rx_fifo() after all processing.

The commit message should describe motivation of the change and not the change itself,
unless it's some additional information which is required for better understanding of
the code.

In yours case it could be something like that:

    The usage of BUG() macro is generally discouraged in kernel, unless
    it's a problem that results in a physical damage or loss of data.
    This patch removes unnecessary BUG() macros and replaces the rest
    with a warnings.

> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 45 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..b155b61 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>  #define I2C_ERR_NO_ACK				BIT(0)
>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -515,7 +516,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/*
> +		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function.
> +		 */
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +528,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	if ((!(i2c_dev->msg_buf_remaining)) &&

The RX FIFO shall be drained completely no matter what.

Hence why the "i2c_dev->msg_buf_remaining" checking is needed here?

Secondly, in the future please don't add parens where they are not needed. In this
case parens around !i2c_dev->msg_buf_remaining are not needed at all.

> +	    WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
> +
> +	/*
> +	 * buf_remaining > 0 at this point can only have rx_fifo_avail == 0

The rx_fifo_avail is always 0 at this point, including the case of buf_remaining == 0.
It will be better if you'll add a comment for the WARN_ON_ONCE(rx_fifo_avail) above,
saying that RX FIFO must be fully drained, and then just drop this comment.

> +	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
> +	 * case earlier in this function.
> +	 */
>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;

[snip]
