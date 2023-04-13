Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E09066E0A63
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Apr 2023 11:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjDMJkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Apr 2023 05:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjDMJkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Apr 2023 05:40:18 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD9A10C2;
        Thu, 13 Apr 2023 02:40:15 -0700 (PDT)
Received: from [192.168.2.164] (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5D8F86603207;
        Thu, 13 Apr 2023 10:40:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1681378814;
        bh=j0PvH5Ogecj9RSBYwtl96lu2V0fvpKZWcVehXb8syVI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=a/abK8QMsJFVk8AOi1GfbnJq5Ma+VVmWJCm8AKtmO7CxiX0E/3ofrm42er5ShhHpx
         HRHgGMjbjzbWBq6N3KfPjx9IP7KhOdQ0WCWj2C/5L9R3JUzkMJRTPZbhgjomEQ80Bj
         v0wrAIjBj4AGFNPuXlJbaDQyKlZgzFuYnW9tTA/0j27K8YcZSYxNXCX5EAalsN1QRy
         Rv9HpvUhL+Vun4Ox7S53tZBDx+YjgHfxr6W24pG1AqyD1aCgREj/0S9kOfzOvN3yP7
         VX2Kr4aqMxRGwIrRuUF7HZ/dktizKhMiJzvZwQQIYRcSSyNg6pYP3xtmBG4g6nrRwZ
         HodAM8Bry7qRQ==
Message-ID: <e4343807-60ad-3f40-7cd5-4acf8bc52bd9@collabora.com>
Date:   Thu, 13 Apr 2023 12:40:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/2] i2c: tegra: Fix PEC support for SMBUS block read
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>, christian.koenig@amd.com,
        digetx@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, sumit.semwal@linaro.org,
        thierry.reding@gmail.com, wsa@kernel.org
References: <20230324115924.64218-1-akhilrajeev@nvidia.com>
 <20230324115924.64218-2-akhilrajeev@nvidia.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230324115924.64218-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SORTED_RECIPS,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/24/23 14:59, Akhil R wrote:
...
> @@ -279,6 +280,7 @@ struct tegra_i2c_dev {
>  	size_t msg_buf_remaining;
>  	int msg_err;
>  	u8 *msg_buf;
> +	__u16 msg_len;

__u16 is for UAPI headers, please use unsigned int. Also keep variables
sorted by string length.

>  	struct completion dma_complete;
>  	struct dma_chan *tx_dma_chan;
> @@ -1169,7 +1171,7 @@ static void tegra_i2c_push_packet_header(struct tegra_i2c_dev *i2c_dev,
>  	else
>  		i2c_writel(i2c_dev, packet_header, I2C_TX_FIFO);
>  
> -	packet_header = msg->len - 1;
> +	packet_header = i2c_dev->msg_len - 1;
>  
>  	if (i2c_dev->dma_mode && !i2c_dev->msg_read)
>  		*dma_buf++ = packet_header;
> @@ -1242,20 +1244,32 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>  		return err;
>  
>  	i2c_dev->msg_buf = msg->buf;
> +	i2c_dev->msg_len = msg->len;
>  
> -	/* The condition true implies smbus block read and len is already read */
> -	if (msg->flags & I2C_M_RECV_LEN && end_state != MSG_END_CONTINUE)
> -		i2c_dev->msg_buf = msg->buf + 1;
> -
> -	i2c_dev->msg_buf_remaining = msg->len;
>  	i2c_dev->msg_err = I2C_ERR_NONE;
>  	i2c_dev->msg_read = !!(msg->flags & I2C_M_RD);
>  	reinit_completion(&i2c_dev->msg_complete);
>  
> +	/* *

Please correct the comment style

> +	 * For SMBUS block read command, read only 1 byte in the first transfer.
> +	 * Adjust that 1 byte for the next transfer in the msg buffer and msg
> +	 * length.
> +	 */


-- 
Best regards,
Dmitry

