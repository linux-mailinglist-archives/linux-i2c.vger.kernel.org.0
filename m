Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4318C1CD3E0
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 10:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgEKI2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 04:28:23 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:62830 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728344AbgEKI2X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 04:28:23 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04B8S0Bg010988;
        Mon, 11 May 2020 10:28:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ARKtW82Ju4foRRG5jzp6GKL8UxrRXVO/KxZ4yej17EA=;
 b=YFyWS89NgLXHX4OBgXe4bdHZ0ZrWu3Se8fTc63Y7Y7DZ1QCCq3Hd6g+I9JYmYYTEmEcY
 oMDyhNRAzcGcsj4jrNNcl5qEQy/W4P0iBT84tCCw894FoqHhLIHhDIRgoeCOLz/jMwOa
 xdIXW8pRnV/jgNccj3k6tzeSOlvLjCCn3FDmVpcu6DYota4vSFCdOHMfZVviRLnYONC9
 uXwtKcj+BW8RSD/0e733l81RcgUU1B4R8EuolGkDqpLbsJZ8yjTXzHcWfGaaoQ0LW2hC
 mn/9z3mAQ86o5V+xQgSZmyAFm/nNwJXG6aJ7ygfyA3RrRhk7tZNSYmxOcAwFJAC9DWsU jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30wj01sa7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 May 2020 10:28:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D58A10002A;
        Mon, 11 May 2020 10:28:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B1482B27B5;
        Mon, 11 May 2020 10:28:06 +0200 (CEST)
Received: from [10.131.226.156] (10.75.127.47) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 10:28:04 +0200
Subject: Re: [PATCH 2/4] i2c: addition of client reg/unreg callbacks
To:     Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-3-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <a68f47ca-47e1-a293-f4ad-a5104c9ee620@st.com>
Date:   Mon, 11 May 2020 10:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-3-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-11_03:2020-05-11,2020-05-11 signatures=0
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi all,

Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Thanks

On 5/5/20 7:51 AM, Alain Volmat wrote:
> Addition of two callbacks reg_client and unreg_client that can be
> implemented by adapter drivers in order to take action whenever a
> client is being registered to it.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/i2c-core-base.c | 11 +++++++++++
>  include/linux/i2c.h         |  6 ++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 2e4560671183..4c84c6264314 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -319,6 +319,12 @@ static int i2c_device_probe(struct device *dev)
>  	if (!client)
>  		return 0;
>  
> +	if (client->adapter->algo->reg_client) {
> +		status = client->adapter->algo->reg_client(client);
> +		if (status)
> +			return status;
> +	}
> +
>  	driver = to_i2c_driver(dev->driver);
>  
>  	client->irq = client->init_irq;
> @@ -417,6 +423,8 @@ static int i2c_device_probe(struct device *dev)
>  put_sync_adapter:
>  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
>  		pm_runtime_put_sync(&client->adapter->dev);
> +	if (client->adapter->algo->reg_client)
> +		client->adapter->algo->unreg_client(client);
>  
>  	return status;
>  }
> @@ -445,6 +453,9 @@ static int i2c_device_remove(struct device *dev)
>  	if (client->flags & I2C_CLIENT_HOST_NOTIFY)
>  		pm_runtime_put(&client->adapter->dev);
>  
> +	if (client->adapter->algo->unreg_client)
> +		client->adapter->algo->unreg_client(client);
> +
>  	return status;
>  }
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 45d36ba4826b..61b838caf454 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -509,6 +509,8 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
>   *   so e.g. PMICs can be accessed very late before shutdown. Optional.
>   * @functionality: Return the flags that this algorithm/adapter pair supports
>   *   from the ``I2C_FUNC_*`` flags.
> + * @reg_client: Callback informing that a new client is being registered
> + * @unreg_client: Callback informing that a client is being removed
>   * @reg_slave: Register given client to I2C slave mode of this adapter
>   * @unreg_slave: Unregister given client from I2C slave mode of this adapter
>   *
> @@ -545,6 +547,10 @@ struct i2c_algorithm {
>  	/* To determine what the adapter supports */
>  	u32 (*functionality)(struct i2c_adapter *adap);
>  
> +	/* To inform the adapter of the probe/remove of a client */
> +	int (*reg_client)(struct i2c_client *client);
> +	void (*unreg_client)(struct i2c_client *client);
> +
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	int (*reg_slave)(struct i2c_client *client);
>  	int (*unreg_slave)(struct i2c_client *client);
> 
