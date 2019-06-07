Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D94D389EB
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfFGMMo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:12:44 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:54318 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGMMo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:12:44 -0400
Received: by mail-it1-f196.google.com with SMTP id m138so684624ita.4;
        Fri, 07 Jun 2019 05:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t/Yzpyhe0lIY0ZvNZIHH9Qq5sh9pCp4H8G9Hd8cxDhI=;
        b=nW5jAgWB1sx1YZmfU0tsCeWJgIEQJMqOjIlZhqV2rQnjWjahJrQqKqBSmScAtogxUi
         XComFFssBR2dJ2kVOLPLxT/EycLlMos1PFNqs9/cJrUJwpXbpIHEsPjLEVcRvztKFsQi
         G0JjI+CAvPCa6PYDv9y9sCqFp5K+tmor5BynFEz5TFGNd72hS8WVGxzrohe0MWrLwKTM
         FIe968RzW+iWDgRKb6Vpoitrw3GWqq44bU4VHArurJOyWEQKJz2xzxRlJNVjrQFigSmR
         8Iss5qbJ+L83LIkjkRLESHg4zCjtfiAsqlZbEizP4/RDiI7E8W6oPBQdGXAYBqQ5dAoy
         5E4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t/Yzpyhe0lIY0ZvNZIHH9Qq5sh9pCp4H8G9Hd8cxDhI=;
        b=K4xYPpbX67sAprwAZUiSALQ4Dd9cm06gm4pJmPzrcSDhK64Vt6WKPkaJ7d5gKBzIgT
         p5ow3lbGvwCauCJNuOScEW3lZGErnxUh51/Iypa3wbA5mZ7A1t7FQwnKPAHiQ6m4X/YY
         gxys4L18RmSP1NhfcE8DLJx2MZNNPbTtO31z2dPu8XJIO+4nCgrPLgYHA/qurRhXsHxk
         /iNKNprciaP4UJoFCndivWinNzTKu7jqLBrYCPOF/bZIKs3NvR8KrJbvuKitO++cTpS4
         ffhG+KuHTpkGJ4azeHcLlnX0BXNVzyWt9x8nZn3OylD7AAzO4ACJSHGofcykVk0sHA1C
         nY6w==
X-Gm-Message-State: APjAAAVFfPI1IlscGbrRO1jdy7n8PDmIbBMD+QTQjjImD58jkWYeO4NK
        layxiZMefxLe8pomHY5iJt4=
X-Google-Smtp-Source: APXvYqwAmpdLsCkfzboHMDsKjDkEK4IJDG6lZIzOURapJzI2Im7Digf4erao2kzL/TneFsFscDI6lQ==
X-Received: by 2002:a02:9a0f:: with SMTP id b15mr1686288jal.32.1559909563311;
        Fri, 07 Jun 2019 05:12:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id j185sm4707394itj.3.2019.06.07.05.12.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:12:42 -0700 (PDT)
Subject: Re: [PATCH V1 6/6] i2c: tegra: remove BUG, BUG_ON
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
Message-ID: <2281ef29-6e69-78e7-4d07-77f33c2f2d5a@gmail.com>
Date:   Fri, 7 Jun 2019 15:12:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4aec6d7a-0dea-18c9-efde-96cc1a54b945@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 15:08, Dmitry Osipenko пишет:
> 07.06.2019 14:55, Bitan Biswas пишет:
>> Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
>> as needed. Replace BUG() with error handling code.
>> Define I2C_ERR_UNEXPECTED_STATUS for error handling.
>>
>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 4dfb4c1..c407bd7 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -73,6 +73,7 @@
>>  #define I2C_ERR_NO_ACK				BIT(0)
>>  #define I2C_ERR_ARBITRATION_LOST		BIT(1)
>>  #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
>> +#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
>>  
>>  #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
>>  #define PACKET_HEADER0_PACKET_ID_SHIFT		16
>> @@ -515,7 +516,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * prevent overwriting past the end of buf
>>  	 */
>>  	if (rx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>  		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
>>  		val = cpu_to_le32(val);
>>  		memcpy(buf, &val, buf_remaining);
>> @@ -523,7 +523,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  		rx_fifo_avail--;
>>  	}
>>  
>> -	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
>>  	i2c_dev->msg_buf_remaining = buf_remaining;
>>  	i2c_dev->msg_buf = buf;
>>  
>> @@ -581,7 +580,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>>  	 * boundary and fault.
>>  	 */
>>  	if (tx_fifo_avail > 0 && buf_remaining > 0) {
>> -		BUG_ON(buf_remaining > 3);
>>  		memcpy(&val, buf, buf_remaining);
>>  		val = le32_to_cpu(val);
>>  
>> @@ -847,10 +845,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  
>>  	if (!i2c_dev->is_curr_dma_xfer) {
>>  		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
>> -			if (i2c_dev->msg_buf_remaining)
>> +			if (i2c_dev->msg_buf_remaining) {
>>  				tegra_i2c_empty_rx_fifo(i2c_dev);
>> -			else
>> -				BUG();
>> +			} else {
>> +				dev_err(i2c_dev->dev, "unexpected rx data request\n");
>> +				i2c_dev->msg_err |= I2C_ERR_UNEXPECTED_STATUS;
>> +				goto err;
>> +			}
>>  		}
>>  
>>  		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
>> @@ -876,7 +877,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>>  	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
>>  		if (i2c_dev->is_curr_dma_xfer)
>>  			i2c_dev->msg_buf_remaining = 0;
>> -		BUG_ON(i2c_dev->msg_buf_remaining);
>> +		WARN_ON_ONCE(i2c_dev->msg_buf_remaining);
>>  		complete(&i2c_dev->msg_complete);
>>  	}
>>  	goto done;
>>
> 
> Very nice, thank you very much! BTW, I think it may worth to add another
> patch that will reset hardware state in a case of the warning since we
> know that something gone wrong.
> 
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> 

Something like that:

 	complete(&i2c_dev->msg_complete);

	if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining))
		goto err;
