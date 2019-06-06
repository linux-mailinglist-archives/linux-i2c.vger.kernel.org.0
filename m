Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27F737317
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 13:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbfFFLjP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 07:39:15 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34541 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfFFLjP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 07:39:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id j24so1699457ljg.1;
        Thu, 06 Jun 2019 04:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fAkJU08ms+SwqDvzgHFBCBahPQgVkQBQ7T8qQDxV/3k=;
        b=mTaj61plSD+ivbAkbLVyauHMjS9XXV2TPajWp7QI3ZkuZ+nqFmx3P7ksNVEdfOwG6b
         8uV34TnZhrcRr3p6fOM/A90hi3COqqB8p6vyTfCDp4p+03YIpvqZP/N7+LUXeaM+0QbM
         kIhrENAZHx7JOJ+5q0/dyS2luZHrWbRiOdvXtxzZzwBt6hPYgC9FlJaMyjfXQwNJ5h7f
         Vl6L00322pg8qBgfwtxkxD+DUSY2aGQtb1PxStyf5iGPuHZfTQF5TqTs2kXyeSE9zvNU
         K8iqKv1lqklGTG3c+2z2ARiUoy9Gmy+LJUxj1AsFnF1T4d6upQvIAbYZSKJzr03lNnBF
         0/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAkJU08ms+SwqDvzgHFBCBahPQgVkQBQ7T8qQDxV/3k=;
        b=J21dmm+pRU3XKGmzCslYP7PB2QSaaXJxxmxgL82uZvV3OaQd8NXi+jVg/ptPqvu7Hz
         9/qKLxNsdiyMLl5STEijQIGj0uzEkJIYaKDKGVW8nAZ/D5KlGHTljs2Z/b2DlIB+Nf42
         UoVpQAO0vEIkSH02QfORnJj5IXWVPmEJ+WcZEarCay2VKnK9vXJz+ubkTwmZpVqE9aJ2
         9z6Q4AomztxjMtjb+4m99Od+FOfW0BF8WyEg/JZZuo/JoqNGPmw2K+UApqci8T+or4R6
         fkHt4nUJXo7IdtGheXNI4jMaSmfXQYZqv+zpGqUCD0btaOcIpcmygiT8jpt5OQU6UHrI
         Mw/g==
X-Gm-Message-State: APjAAAVfR6gQEjabyX28fBNpLhbOCCxmLkfGRL9cWiKrYm9B0mM40Zsh
        LJQ9HXLNmN2HhVeGPyZkLswRY5ij
X-Google-Smtp-Source: APXvYqyrFTMEgoOwD9o4ETc5j5pb8Fu2wLRWmA+Zt3R7ENzMQv4NU+V11IYbY0cyoO7QP3+wC+csfA==
X-Received: by 2002:a2e:970a:: with SMTP id r10mr4644898lji.115.1559821151768;
        Thu, 06 Jun 2019 04:39:11 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id k12sm279282lfm.90.2019.06.06.04.39.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 04:39:10 -0700 (PDT)
Subject: Re: [PATCH V4] drivers: i2c: tegra: fix checkpatch defects
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bbe8ef0e-fdef-613c-9758-6525b60e5992@gmail.com>
Date:   Thu, 6 Jun 2019 14:39:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559806523-1352-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.06.2019 10:35, Bitan Biswas пишет:
> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
> 
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 67 +++++++++++++++++++++++-------------------
>  1 file changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 76b7926..55a5d87 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -78,6 +78,7 @@
>  #define I2C_ERR_NO_ACK				0x01
>  #define I2C_ERR_ARBITRATION_LOST		0x02
>  #define I2C_ERR_UNKNOWN_INTERRUPT		0x04
> +#define I2C_ERR_UNEXPECTED_STATUS               0x08
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -112,7 +113,7 @@
>  #define I2C_CLKEN_OVERRIDE			0x090
>  #define I2C_MST_CORE_CLKEN_OVR			BIT(0)
>  
> -#define I2C_CONFIG_LOAD_TIMEOUT			1000000
> +#define I2C_CONFIG_LOAD_TMOUT			1000000
>  
>  #define I2C_MST_FIFO_CONTROL			0x0b4
>  #define I2C_MST_FIFO_CONTROL_RX_FLUSH		BIT(0)
> @@ -280,6 +281,7 @@ struct tegra_i2c_dev {
>  	u32 bus_clk_rate;
>  	u16 clk_divisor_non_hs_mode;
>  	bool is_multimaster_mode;
> +	/* xfer_lock: lock to serialize transfer submission and processing */
>  	spinlock_t xfer_lock;
>  	struct dma_chan *tx_dma_chan;
>  	struct dma_chan *rx_dma_chan;
> @@ -306,7 +308,7 @@ static u32 dvc_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
>   * to the I2C block inside the DVC block
>   */
>  static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
> -	unsigned long reg)
> +					unsigned long reg)
>  {
>  	if (i2c_dev->is_dvc)
>  		reg += (reg >= I2C_TX_FIFO) ? 0x10 : 0x40;
> @@ -314,7 +316,7 @@ static unsigned long tegra_i2c_reg_addr(struct tegra_i2c_dev *i2c_dev,
>  }
>  
>  static void i2c_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> -	unsigned long reg)
> +		       unsigned long reg)
>  {
>  	writel(val, i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg));
>  
> @@ -329,13 +331,13 @@ static u32 i2c_readl(struct tegra_i2c_dev *i2c_dev, unsigned long reg)
>  }
>  
>  static void i2c_writesl(struct tegra_i2c_dev *i2c_dev, void *data,
> -	unsigned long reg, int len)
> +			unsigned long reg, int len)
>  {
>  	writesl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
>  
>  static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
> -	unsigned long reg, int len)
> +		       unsigned long reg, int len)
>  {
>  	readsl(i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg), data, len);
>  }
> @@ -486,7 +488,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
>  			return -ETIMEDOUT;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  	return 0;
>  }
> @@ -525,7 +527,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * prevent overwriting past the end of buf
>  	 */
>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>  		val = cpu_to_le32(val);
>  		memcpy(buf, &val, buf_remaining);
> @@ -533,7 +534,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		rx_fifo_avail--;
>  	}
>  
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>  	i2c_dev->msg_buf_remaining = buf_remaining;
>  	i2c_dev->msg_buf = buf;
>  
> @@ -591,7 +591,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  	 * boundary and fault.
>  	 */
>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
>  		memcpy(&val, buf, buf_remaining);
>  		val = le32_to_cpu(val);
>  
> @@ -680,10 +679,11 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>  		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>  		if (in_interrupt())
>  			err = readl_poll_timeout_atomic(addr, val, val == 0,
> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
> +							1000,
> +							I2C_CONFIG_LOAD_TMOUT);
>  		else
> -			err = readl_poll_timeout(addr, val, val == 0,
> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
> +			err = readl_poll_timeout(addr, val, val == 0, 1000,
> +						 I2C_CONFIG_LOAD_TMOUT);
>  
>  		if (err) {
>  			dev_warn(i2c_dev->dev,
> @@ -858,16 +858,21 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>  			if (i2c_dev->msg_buf_remaining)
>  				tegra_i2c_empty_rx_fifo(i2c_dev);
> -			else
> -				BUG();
> +			else {
> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
> +				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
> +				goto err;
> +			}
>  		}
>  
>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> -			if (i2c_dev->msg_buf_remaining)
> -				tegra_i2c_fill_tx_fifo(i2c_dev);
> -			else
> +			if (i2c_dev->msg_buf_remaining) {
> +				if (tegra_i2c_fill_tx_fifo(i2c_dev))
> +					goto err;
> +			} else {
>  				tegra_i2c_mask_irq(i2c_dev,
>  						   I2C_INT_TX_FIFO_DATA_REQ);
> +			}
>  		}
>  	}
>  
> @@ -885,7 +890,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> @@ -1024,7 +1029,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>  }
>  
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> -	struct i2c_msg *msg, enum msg_end_type end_state)
> +			      struct i2c_msg *msg, enum msg_end_type end_state)
>  {
>  	u32 packet_header;
>  	u32 int_mask;
> @@ -1034,7 +1039,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  	u32 *buffer = NULL;
>  	int err = 0;
>  	bool dma;
> -	u16 xfer_time = 100;
> +	u16 xfer_tm = 100;

Why xfer_time is renamed? It is much more important to keep code
readable rather than to satisfy checkpatch. You should *not* follow
checkpatch recommendations where they do not make much sense. The
xfer_tm is a less intuitive naming and hence it harms readability of the
code. Hence it is better to have "lines over 80 chars" in this
particular case.

Also, please don't skip review comments. I already pointed out the above
in the answer to previous version of the patch.
