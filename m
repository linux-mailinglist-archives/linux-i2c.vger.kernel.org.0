Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2AFD389C8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfFGMI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:08:29 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34167 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGMI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:08:29 -0400
Received: by mail-io1-f66.google.com with SMTP id k8so1216558iot.1;
        Fri, 07 Jun 2019 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9Jt/byb9nrWN493RX0emzJG/99YlfQT5TXBjwjLl2N4=;
        b=Job7TbfOu9s088soz/nsa2sgbToNs00hR89VRmIuZRIqNtJQQEh+Q3S6X88Ry4ijPT
         28Yal5waNO2LxU86T3tUeQ5JFydaMLnrtgrPg23JGfHWvYJXi4XrWq0H3BBtLYFeWPI2
         +h7T5JTq8XyaGuBwYIq+bt7gXq3oTjk/Cx0emnHpl50UPJC4Q3Da4qZLLS+i/52UtQOU
         BrrRfuVW3eh4/mR3uLEpqZ8H8A8uSPJnsY8btmoWko1Tz3uB7ElTLSIL7T2/Qn0/ctJ1
         F3Ld5/DXM1H+MkdOfFcdvolEvrHlHTlcT4o1PuMkIEo+9ffaucCMc8iTGAye3snpPVLv
         xXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9Jt/byb9nrWN493RX0emzJG/99YlfQT5TXBjwjLl2N4=;
        b=adKhDAVZbWojln5Ki9sdHOwpPrhvXbqwF5BgjKvWlw7FYGy+DRwVhFtAye7Yfdp8qS
         W8lXptORhNd4VZJdf0I+Ky/mSivwo5bXrvWRkq+Y/ed/fxfpBwqWI6XqjwSSgSn5EgRn
         VcmAtnUH77VShuskab1d8xxpnoi+QGDL76C86EXUuEyNvJ+amWGHT5YML6GF9sbKGGfe
         k80JvwIkUfXbxlMyhxtZx1GsvNE66M0S6AQzeytqQRMubBUStEmAqnXbFGt4K2CgFaTZ
         30KGX2LyoqchIoTtbiT9bEodqsaG++dftjFKRZ/qqT81w0DbWuPyQqfeiz36gFITBlhP
         yXrA==
X-Gm-Message-State: APjAAAU7VkAlzQ7Wn4QYWpwTvurKTYKVnyZlz4J4eoTQTXp7H6WA9Rys
        hpxqaujVkX0S9yUdW0eN5gk=
X-Google-Smtp-Source: APXvYqw3bKY9W1oEVOwpnvqB4F4RM1/VoD6twJgvgAgqMSlp9qSxqx383gdyYlN192OnYZZHzExHsg==
X-Received: by 2002:a5d:9550:: with SMTP id a16mr2468747ios.106.1559909308461;
        Fri, 07 Jun 2019 05:08:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id c91sm4692772itd.4.2019.06.07.05.08.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:08:28 -0700 (PDT)
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
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
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
Date:   Fri, 7 Jun 2019 15:08:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-6-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..c407bd7 100644
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
> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> 

Very nice, thank you very much! BTW, I think it may worth to add another
patch that will reset hardware state in a case of the warning since we
know that something gone wrong.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
