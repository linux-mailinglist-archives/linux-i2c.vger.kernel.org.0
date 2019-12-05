Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17EE51142EB
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2019 15:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbfLEOpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 09:45:12 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46643 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729236AbfLEOpM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Dec 2019 09:45:12 -0500
Received: from [109.168.11.45] (port=37310 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1icsNR-008eai-1O; Thu, 05 Dec 2019 15:45:09 +0100
Subject: Re: [PATCH] i2c: avoid ifdeffery in I2C drivers with optional slave
 support
To:     Sascha Hauer <s.hauer@pengutronix.de>, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>, Biwen Li <biwen.li@nxp.com>
References: <20191204095348.9192-1-s.hauer@pengutronix.de>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <f1d9e12b-2636-5624-bfde-ac556817b697@lucaceresoli.net>
Date:   Thu, 5 Dec 2019 15:45:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204095348.9192-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sascha,

On 04/12/19 10:53, Sascha Hauer wrote:
> Always add the (un)reg_slave hooks to struct i2c_algorithm, even when
> I2C slave support is disabled. With the cost of some binary space I2C
> drivers with optional I2C slave support no longer have to #ifdef
> the hooks. For the same reason add a stub for i2c_slave_event and make
> enum i2c_slave_event present without I2C slave support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I like the idea, but I have a question below.

> ---
>  include/linux/i2c.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..74ebfcb43dd2 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -359,7 +359,6 @@ static inline void i2c_set_clientdata(struct i2c_client *dev, void *data)
>  
>  /* I2C slave support */
>  
> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  enum i2c_slave_event {
>  	I2C_SLAVE_READ_REQUESTED,
>  	I2C_SLAVE_WRITE_REQUESTED,
> @@ -368,6 +367,7 @@ enum i2c_slave_event {
>  	I2C_SLAVE_STOP,
>  };
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  extern int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
>  extern int i2c_slave_unregister(struct i2c_client *client);
>  extern bool i2c_detect_slave_mode(struct device *dev);
> @@ -379,6 +379,11 @@ static inline int i2c_slave_event(struct i2c_client *client,
>  }
>  #else
>  static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
> +static inline int i2c_slave_event(struct i2c_client *client,
> +				  enum i2c_slave_event event, u8 *val)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  /**
> @@ -553,10 +558,8 @@ struct i2c_algorithm {
>  	/* To determine what the adapter supports */
>  	u32 (*functionality)(struct i2c_adapter *adap);
>  
> -#if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	int (*reg_slave)(struct i2c_client *client);
>  	int (*unreg_slave)(struct i2c_client *client);
> -#endif

Assuming I2C slave users are a minority, would it make sense to move the
two slave-related function pointers to a new 'struct i2c_slave_ops' and
store a 'struct i2c_slave_ops*' here? This would to set a limit to the
size increase for the majority of users.

Thanks,
-- 
Luca
