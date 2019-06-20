Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 087BF4C665
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2019 07:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfFTFBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jun 2019 01:01:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:1709 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfFTFBB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jun 2019 01:01:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d0b130a0000>; Wed, 19 Jun 2019 22:00:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 19 Jun 2019 22:00:58 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 19 Jun 2019 22:00:58 -0700
Received: from [10.19.65.14] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 05:00:54 +0000
Subject: Re: [PATCH V9] i2c: tegra: remove BUG() macro
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>,
        "Thierry Reding" <thierry.reding@gmail.com>
References: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <a2a94eb5-c3c3-24bb-e7a6-0d02f2546f94@nvidia.com>
Date:   Wed, 19 Jun 2019 22:00:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560856182-26072-1-git-send-email-bbiswas@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1561006858; bh=fYK1YbOLXLOtJfuwb+ssRvSQx1QHtpEJNfYKlLvob5Y=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=k/I4WdmDTLwcuyLc2eosg3rscAeySxlTqFn8VH3dri5WOfRnKe7DoPeh9vKvVkD0Q
         XWeUcSdPPSJ9hUk0xC6+y9qGpWqJaomL5IcQ7Se8qao/+W1mnrHZ9ouS1WaraMABda
         NElV4FpAB7faFin8e1HqoP7S0/ZpX6gEB4hJUwcZBZq9o7bFyWnU6jNE+bLOc4CgST
         cCMj4s5OFbwogdZkAhhwPRlin9FxiIzIFm4MeXD3uIKZ1Bh4P+8uqHtNzjo/jeeUjL
         ik/7t60MhV2YFAl+txpRbgpfANDlzwc5hazdpWK9X6Cz/7FIlUVYBLwAYOon4SsXrI
         tULrs5g0TZyLw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/18/19 4:09 AM, Bitan Biswas wrote:
> The usage of BUG() macro is generally discouraged in kernel, unless
> it's a problem that results in a physical damage or loss of data.
> This patch removes unnecessary BUG() macros and replaces the rest
> with warning.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>   drivers/i2c/busses/i2c-tegra.c | 47 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 39 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 4dfb4c1..e9ff96d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -73,6 +73,7 @@
>   #define I2C_ERR_NO_ACK				BIT(0)
>   #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>   #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
> +#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
>   
>   #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>   #define PACKET_HEADER0_PACKET_ID_SHIFT		16
> @@ -489,6 +490,13 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>   	size_t buf_remaining = i2c_dev->msg_buf_remaining;
>   	int words_to_transfer;
>   
> +	/*
> +	 * Catch overflow due to message fully sent
> +	 * before the check for RX FIFO availability.
> +	 */
> +	if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
> +		return -EINVAL;
> +
>   	if (i2c_dev->hw->has_mst_fifo) {
>   		val = i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
>   		rx_fifo_avail = (val & I2C_MST_FIFO_STATUS_RX_MASK) >>
> @@ -515,7 +523,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>   	 * prevent overwriting past the end of buf
>   	 */
>   	if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/*
> +		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
> +		 * when (words_to_transfer was > rx_fifo_avail) earlier
> +		 * in this function.
> +		 */
>   		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>   		val = cpu_to_le32(val);
>   		memcpy(buf, &val, buf_remaining);
> @@ -523,7 +535,10 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>   		rx_fifo_avail--;
>   	}
>   
> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
> +	/* RX FIFO must be drained, otherwise it's an Overflow case. */
> +	if (WARN_ON_ONCE(rx_fifo_avail))
> +		return -EINVAL;
> +
>   	i2c_dev->msg_buf_remaining = buf_remaining;
>   	i2c_dev->msg_buf = buf;
>   
> @@ -581,7 +596,11 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>   	 * boundary and fault.
>   	 */
>   	if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -		BUG_ON(buf_remaining > 3);
> +		/*
> +		 * buf_remaining > 3 check not needed as tx_fifo_avail == 0
> +		 * when (words_to_transfer was > tx_fifo_avail) earlier
> +		 * in this function for non-zero words_to_transfer.
> +		 */
>   		memcpy(&val, buf, buf_remaining);
>   		val = le32_to_cpu(val);
>   
> @@ -847,10 +866,15 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>   
>   	if (!i2c_dev->is_curr_dma_xfer) {
>   		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
> -			if (i2c_dev->msg_buf_remaining)
> -				tegra_i2c_empty_rx_fifo(i2c_dev);
> -			else
> -				BUG();
> +			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
> +				/*
> +				 * Overflow error condition: message fully sent,
> +				 * with no XFER_COMPLETE interrupt but hardware
> +				 * asks to transfer more.
> +				 */
> +				i2c_dev->msg_err |= I2C_ERR_RX_BUFFER_OVERFLOW;
> +				goto err;
> +			}
>   		}
>   
>   		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
> @@ -876,7 +900,14 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>   	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>   		if (i2c_dev->is_curr_dma_xfer)
>   			i2c_dev->msg_buf_remaining = 0;
> -		BUG_ON(i2c_dev->msg_buf_remaining);
> +		/*
> +		 * Underflow error condition: XFER_COMPLETE before message
> +		 * fully sent.
> +		 */
> +		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
> +			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
> +			goto err;
> +		}
>   		complete(&i2c_dev->msg_complete);
>   	}
>   	goto done;
> 

Please get back if there are any further comments regarding this patch.

-regards,
  Bitan

