Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1646F3841A
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 08:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfFGGGp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 02:06:45 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46351 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfFGGGo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 02:06:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id m15so638398ljg.13;
        Thu, 06 Jun 2019 23:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q+G8+8MHXNvM7mUUZy451G5b9TljkJvqb80agD0tMHg=;
        b=cYlVEXqC7nSWQrsMly8VnvKaavrJXKrVhpTQrGn/t6/skXLDnVspCRrmcK3wn9gfb/
         tKWPjOHKXGdE+3ZW1C2F7y07Menie6bi+r+1GEmBcWyms7fKDz9tPLyjY/aDA26dkxrW
         YL95IMrLjQBnxEDuDPDev4+3rhSoBxqfQ1BEWSUXoyme4nNpfEVM04FO9EhRntQPIBDS
         y+C5W7zMA/dIuX46BEcNDuBHgYtez1DmLMuZj0PpX5tUoimGHCcQdaRmVANTSlZqib96
         CmU+D8AwcYoH5jAwHwuBaiI2pb30IJrUXD/sSfZRBhOBeJGIu+ZV0g6W0SgJj5CRw0+y
         +Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q+G8+8MHXNvM7mUUZy451G5b9TljkJvqb80agD0tMHg=;
        b=pQIgPt+a9zvjiZChRdeKXqBsDCEfQhIoECRSyBlkbZwxwWaf7Qi6EwQfcnHP7MVgAD
         rsdmGsQyuFet1G+ARPeq00ct8zsFNM8AtLkhShxI2O0+mM6JxCQsiSuPEDJxY0gD6w58
         110XHPBdTOCxPT0MNNKNhraOmorVDddMM2cWcY4rUwfkhM4nm00qVyt2s0pe+mqPeZiw
         YamuDFSC6xXk0y3ejPaIp3OCN5qjnU6jBmy3Xb4oj6JIyXYfTW7tWpbGt5ucz1EPwxZU
         e1+wYYKV/tOy5HudZ8uElys+gw+6iA4laH0kt+cc3IVcuAUqTQagW7i5nJrgMYzs55AV
         VwjQ==
X-Gm-Message-State: APjAAAWtpgSjCfQSN8CdP9FPazc5UPWffoCfA1fgZSQVgA4ASt8FzW/8
        JDCPEcrr2JEdutRaRrbrw/A=
X-Google-Smtp-Source: APXvYqz6m70HJPODywjUCcZPYUKDeE4t4dWD8TQefjL6mwcofEJnBT7Xsw6ht3H2e3fljskvOauRxQ==
X-Received: by 2002:a2e:3a05:: with SMTP id h5mr16450576lja.114.1559887602047;
        Thu, 06 Jun 2019 23:06:42 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id l15sm221098lfc.12.2019.06.06.23.06.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 23:06:41 -0700 (PDT)
Subject: Re: [PATCH V5] drivers: i2c: tegra: fix warning/check/error
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc8e32c7-811e-e422-816a-34cf5329856d@gmail.com>
Date:   Fri, 7 Jun 2019 09:05:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559885103-9113-1-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 8:25, Bitan Biswas пишет:
> Fix checkpatch.pl warning(s)/error(s)/check(s) in i2c-tegra.c
> 
> Ignore checkpatch WARNING for 80 character line limit at
> places where renaming fields compromises readability.
> 
> Delay of approximately 1msec in flush i2c FIFO polling loop
> achieved by usleep_range call as msleep can take 20msecs.
> 
> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
> as needed. Replace BUG() with error handling code.
> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 61 ++++++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 1dbba39..161eb28 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -67,17 +67,18 @@
>  
>  #define DVC_CTRL_REG1				0x000
>  #define DVC_CTRL_REG1_INTR_EN			BIT(10)
> -#define DVC_CTRL_REG2				0x004
> -#define DVC_CTRL_REG3				0x008
> +#define DVC_CTRL_REG2				BIT(2)
> +#define DVC_CTRL_REG3				BIT(3)

This is incorrect change, register address should be kept as a hex value
because it is not a bitmask.

I'd also recommend to just remove the DVC_CTRL_REG2 since it's not used
anywhere in the code. You may also check all of other #defines and
remove everything unused.

You can also check all of variables for a need to be initialized, like
for example "ret" doesn't need to be init'ed in tegra_i2c_xfer() and
some other places. That will be a good clean up as well.

>  #define DVC_CTRL_REG3_SW_PROG			BIT(26)
>  #define DVC_CTRL_REG3_I2C_DONE_INTR_EN		BIT(30)
>  #define DVC_STATUS				0x00c
>  #define DVC_STATUS_I2C_DONE_INTR		BIT(30)
>  
> -#define I2C_ERR_NONE				0x00
> -#define I2C_ERR_NO_ACK				0x01
> -#define I2C_ERR_ARBITRATION_LOST		0x02
> -#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
> +#define I2C_ERR_NONE				0x0
> +#define I2C_ERR_NO_ACK				BIT(0)
> +#define I2C_ERR_ARBITRATION_LOST		BIT(1)
> +#define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>  
>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
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
> +							I2C_CONFIG_LOAD_TIMEOUT);
>  		else
> -			err = readl_poll_timeout(addr, val, val == 0,
> -					1000, I2C_CONFIG_LOAD_TIMEOUT);
> +			err = readl_poll_timeout(addr, val, val == 0, 1000,
> +						 I2C_CONFIG_LOAD_TIMEOUT);
>  
>  		if (err) {
>  			dev_warn(i2c_dev->dev,
> @@ -856,10 +856,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
> @@ -885,7 +888,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>  		if (i2c_dev->is_curr_dma_xfer)
>  			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>  		complete(&i2c_dev->msg_complete);
>  	}
>  	goto done;
> @@ -1024,7 +1027,7 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
>  }
>  
>  static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
> -	struct i2c_msg *msg, enum msg_end_type end_state)
> +			      struct i2c_msg *msg, enum msg_end_type end_state)

Probably won't hurt to carry the "enum msg_end_type end_state" to a new
line.

>  {
>  	u32 packet_header;
>  	u32 int_mask;
> @@ -1161,9 +1164,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		if (err)
>  			return err;
>  
> -		time_left = wait_for_completion_timeout(
> -						&i2c_dev->dma_complete,
> -						msecs_to_jiffies(xfer_time));
> +		time_left = wait_for_completion_timeout(&i2c_dev->dma_complete,
> +							msecs_to_jiffies(xfer_time));
>  		if (time_left == 0) {
>  			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
>  			dmaengine_terminate_sync(i2c_dev->msg_read ?
> @@ -1225,7 +1227,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  }
>  
>  static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
> -	int num)
> +			  int num)
>  {
>  	struct tegra_i2c_dev *i2c_dev = i2c_get_adapdata(adap);
>  	int i;
> @@ -1273,12 +1275,12 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>  	int ret;
>  
>  	ret = of_property_read_u32(np, "clock-frequency",
> -			&i2c_dev->bus_clk_rate);
> +				   &i2c_dev->bus_clk_rate);
>  	if (ret)
>  		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
>  
>  	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
> -			"multi-master");
> +							     "multi-master");

You can avoid the line-split with something like this:

	ret = of_property_read_bool(np, "multi-master");
	i2c_dev->is_multimaster_mode = ret;

-- 
Dmitry
