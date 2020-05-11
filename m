Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0ACE1CD3D1
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 10:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbgEKI0h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 04:26:37 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46632 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728556AbgEKI0h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 04:26:37 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04B8IcDZ000838;
        Mon, 11 May 2020 10:26:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Ru+Sn0FTJTVqbWOdslDA8U6LFzVoFwyVpPARpJGF2gA=;
 b=FGeCx4LV77IswcaXp29EjbpT4kc5n3OE65604Q8NzAiZPXfAmmq4GGxc9FAmwjtGPrRv
 fj2fI99u2SxUBkeVvPcItTSSsRoaTBG3JeodKJGvNzbenjkCQgjAaPkOXPWb2aAv2BlZ
 cQzDZAazTU92bMS1906+iMgipZNIpXh0t9R8wKrlpOsPGuoH4a8zmlN2Do6X9//E2reb
 0GpHCg0Dlsa99yszPvYx6orte5fgz+IrjKETPaEFtBGImV275y/ASaYMLO7Oafxnbzls
 yNiva4uSqU+nR8unYu/f9nf+VQ2HsnFOHRUlbUg3lQtlTTDwHWwTz8+A3i2yzTH+/lIk wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 30wkdgrtx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 May 2020 10:26:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A7CA100034;
        Mon, 11 May 2020 10:26:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2650A2B27B0;
        Mon, 11 May 2020 10:26:22 +0200 (CEST)
Received: from [10.131.226.156] (10.75.127.46) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 10:26:20 +0200
Subject: Re: [PATCH 1/4] i2c: smbus: add core function handling SMBus
 host-notify
To:     Alain Volmat <alain.volmat@st.com>, <wsa@kernel.org>,
        <robh+dt@kernel.org>
CC:     <mark.rutland@arm.com>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@st.com>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <fabrice.gasnier@st.com>
References: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
 <1588657871-14747-2-git-send-email-alain.volmat@st.com>
From:   Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <c80936d4-2905-096c-9848-3f16444eaedc@st.com>
Date:   Mon, 11 May 2020 10:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1588657871-14747-2-git-send-email-alain.volmat@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG5NODE2.st.com
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
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
> 
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
> 
> This commit introduces two new core functions
>   * i2c_new_smbus_host_notify_device
>   * i2c_free_smbus_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
> 
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  drivers/i2c/i2c-core-smbus.c | 105 +++++++++++++++++++++++++++++++++++
>  include/linux/i2c-smbus.h    |   2 +
>  2 files changed, 107 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index b34d2ff06931..0c7e135c73e1 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -708,3 +708,108 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
>  }
>  EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
>  #endif
> +
> +struct i2c_smbus_host_notify_status {
> +	bool notify_start;
> +	u8 addr;
> +};
> +
> +static int i2c_smbus_host_notify_cb(struct i2c_client *client,
> +				    enum i2c_slave_event event, u8 *val)
> +{
> +	struct i2c_smbus_host_notify_status *status = client->dev.platform_data;
> +	int ret;
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		status->notify_start = true;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/* We only retrieve the first byte received (addr)
> +		 * since there is currently no way to retrieve the data
> +		 * parameter from the client.
> +		 */
> +		if (!status->notify_start)
> +			break;
> +		status->addr = *val;
> +		status->notify_start = false;
> +		break;
> +	case I2C_SLAVE_STOP:
> +		ret = i2c_handle_smbus_host_notify(client->adapter,
> +						   status->addr);
> +		if (ret < 0) {
> +			dev_warn(&client->adapter->dev, "failed to handle host_notify (%d)\n",
> +				ret);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		/* Only handle necessary events */
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * i2c_new_smbus_host_notify_device - get a client for SMBus host-notify support
> + * @adapter: the target adapter
> + * Context: can sleep
> + *
> + * Setup handling of the SMBus host-notify protocol on a given I2C bus segment.
> + *
> + * Handling is done by creating a device and its callback and handling data
> + * received via the SMBus host-notify address (0x8)
> + *
> + * This returns the client, which should be ultimately freed using
> + * i2c_free_smbus_host_notify_device(); or an ERRPTR to indicate an error.
> + */
> +struct i2c_client *i2c_new_smbus_host_notify_device(struct i2c_adapter *adapter)
> +{
> +	struct i2c_board_info host_notify_board_info = {
> +		I2C_BOARD_INFO("smbus_host_notify", 0x08),
> +		.flags  = I2C_CLIENT_SLAVE,
> +	};
> +	struct i2c_smbus_host_notify_status *status;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	status = kzalloc(sizeof(struct i2c_smbus_host_notify_status),
> +			 GFP_KERNEL);
> +	if (!status)
> +		return ERR_PTR(-ENOMEM);
> +
> +	host_notify_board_info.platform_data = status;
> +
> +	client = i2c_new_client_device(adapter, &host_notify_board_info);
> +	if (IS_ERR(client)) {
> +		kfree(status);
> +		return client;
> +	}
> +
> +	ret = i2c_slave_register(client, i2c_smbus_host_notify_cb);
> +	if (ret) {
> +		i2c_unregister_device(client);
> +		kfree(status);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return client;
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_smbus_host_notify_device);
> +
> +/**
> + * i2c_free_smbus_host_notify_device - free the client for SMBus host-notify
> + * support
> + * @client: the client to free
> + * Context: can sleep
> + *
> + * Free the i2c_client allocated via i2c_new_smbus_host_notify_device
> + */
> +void i2c_free_smbus_host_notify_device(struct i2c_client *client)
> +{
> +	i2c_slave_unregister(client);
> +	kfree(client->dev.platform_data);
> +	i2c_unregister_device(client);
> +}
> +EXPORT_SYMBOL_GPL(i2c_free_smbus_host_notify_device);
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index 8c5459034f92..926f6d8ae30d 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -38,5 +38,7 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_adapter *adap)
>  	return 0;
>  }
>  #endif
> +struct i2c_client *i2c_new_smbus_host_notify_device(struct i2c_adapter *adapter);
> +void i2c_free_smbus_host_notify_device(struct i2c_client *client);
>  
>  #endif /* _LINUX_I2C_SMBUS_H */
> 
