Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE394B23E0
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 12:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiBKLC2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 06:02:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346142AbiBKLC1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 06:02:27 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7866F06
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 03:02:16 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f10so15723362lfu.8
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TFAnxcFK6GnIUT33Zez6P029wq7EYjQpobBjkOwr/kU=;
        b=qJXlNFc7Uso8mlUq5GdOGW5ZLEodawZbkH7JX7kcIv9asQ18CqKzLl6DNvVpXsohXX
         nR4AW45KNe4lEaD++Gva21+xt2SVmujG+/enMbDpUKdmY05Ah9nP3kNDG776MBpVJOWD
         FxLib241JL0KBwTezLRCjtsMErzU3HgoTAvL/dtwax52cvvQAdCoQhHWuiqFanV7P4Dq
         MG7LQKi9yGi/Lsy0tFIv2O6mht7WIGoRKxILJ+be4wEc14dEDaULfkfAbv56XrdMZ9lD
         cDjJ19hKjB71K9C0RoHylFkXl3wYJPXs8ikBeSwqQdtVJvAuFgRf6+mx8iwQpsjogf19
         tEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TFAnxcFK6GnIUT33Zez6P029wq7EYjQpobBjkOwr/kU=;
        b=YsAIwpKZ385G3ek7fFE3utnK4w3veeE6awtXHxCGcKj9PINdRBy2mpZiV3OIquMQ/B
         WnK/WzEvZEHQAm72lssxUYfpsnOfQWKI0gwGwgtv14s6sdSM/Vp8VtNxBDObroaDLKte
         0nImLKSVNSf6gfLfMBn7UAY0ezVFHXXpusyIBPhRUO6J1LjsNDHYhtMQ6pLuEMN0LXoS
         fpbtSOZPBiVqMRsVNSLNbHO2zynB9VrJxvlKwtQec96zVMyfCwYlXzNTMZ8YgEz615v9
         OA7bxZ66PCsyBeX1HU4sk2q9DXunoeZdWGbMh74AB7Pni/c94vWRBzyvFwgAwtzP5Y7x
         Mu0g==
X-Gm-Message-State: AOAM530+C1dBxBqmhTEgZ22KxaN/KXoX1k1dnF2Z84GuDPufBT2pVyGe
        b2QSra6Y2/lUWLe1C2R4D7cPcA==
X-Google-Smtp-Source: ABdhPJxxSyz7Nov30n1EikEENns1+UZvtsJSvu0Lm2pl1BswzS/UiUdSqjgLnB1rjup6Aq+9jJeaZQ==
X-Received: by 2002:a05:6512:3d26:: with SMTP id d38mr832325lfv.105.1644577334537;
        Fri, 11 Feb 2022 03:02:14 -0800 (PST)
Received: from localhost (h-85-24-188-65.A463.priv.bahnhof.se. [85.24.188.65])
        by smtp.gmail.com with ESMTPSA id m9sm2276849lfp.134.2022.02.11.03.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 03:02:14 -0800 (PST)
Date:   Fri, 11 Feb 2022 12:02:13 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: don't expose function which is only used
 internally
Message-ID: <YgZCNUogNdQeywAP@oden.dyn.berto.se>
References: <20220210213341.2121-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220210213341.2121-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2022-02-10 22:33:41 +0100, Wolfram Sang wrote:
> i2c_setup_smbus_alert() is only needed within the I2C core, so no need
> to expose it to other modules.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looks good,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Based on i2c/for-mergewindow. Build bots are happy.
> 
> Change since v1:
> 
> not only remove the symbol, also move the declaration from a public
> header to the private one.
> 
>  drivers/i2c/i2c-core-smbus.c | 1 -
>  drivers/i2c/i2c-core.h       | 9 +++++++++
>  include/linux/i2c-smbus.h    | 8 --------
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index 304c2c8fee68..053b215308c4 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -716,5 +716,4 @@ int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
>  
>  	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
>  }
> -EXPORT_SYMBOL_GPL(i2c_setup_smbus_alert);
>  #endif
> diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
> index 8ce261167a2d..87e2c914f1c5 100644
> --- a/drivers/i2c/i2c-core.h
> +++ b/drivers/i2c/i2c-core.h
> @@ -86,3 +86,12 @@ void of_i2c_register_devices(struct i2c_adapter *adap);
>  static inline void of_i2c_register_devices(struct i2c_adapter *adap) { }
>  #endif
>  extern struct notifier_block i2c_of_notifier;
> +
> +#if IS_ENABLED(CONFIG_I2C_SMBUS)
> +int i2c_setup_smbus_alert(struct i2c_adapter *adap);
> +#else
> +static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
> +{
> +	return 0;
> +}
> +#endif
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index 95cf902e0bda..ced1c6ead52a 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -30,14 +30,6 @@ struct i2c_client *i2c_new_smbus_alert_device(struct i2c_adapter *adapter,
>  					      struct i2c_smbus_alert_setup *setup);
>  int i2c_handle_smbus_alert(struct i2c_client *ara);
>  
> -#if IS_ENABLED(CONFIG_I2C_SMBUS)
> -int i2c_setup_smbus_alert(struct i2c_adapter *adap);
> -#else
> -static inline int i2c_setup_smbus_alert(struct i2c_adapter *adap)
> -{
> -	return 0;
> -}
> -#endif
>  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_I2C_SLAVE)
>  struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *adapter);
>  void i2c_free_slave_host_notify_device(struct i2c_client *client);
> -- 
> 2.30.2
> 

-- 
Kind Regards,
Niklas Söderlund
