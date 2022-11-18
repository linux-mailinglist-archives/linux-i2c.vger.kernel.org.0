Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A936302A3
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234050AbiKRXMv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:12:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbiKRXMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:12:32 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C30CB949;
        Fri, 18 Nov 2022 14:57:24 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id l127so6922289oia.8;
        Fri, 18 Nov 2022 14:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zM15C/kwGjQe5y+gsAuYgO5BdHO1bcoXYdP69DIdTnA=;
        b=GyPVm34oFL7bQ8AeBfolKO/5YPoSFG5dMB7nBouFWRSuVzcyLk1w/i3iLLM6l1OQOx
         wQK0vvykgKQgrAmuCqS8ipe3AhIWsPeqNquFyg0tZfFnaWvDe/j/mectYnNo+xp5v/zN
         NvqKj0xhTK6akJzgaQRwdf8i5FBHjJ13e4IeoGqSIHwktzF5ijDlnbFg78tT5hN6lai7
         Iww3Gz3VE+nN36Wm7OT3oO1hHtQC5jE+1Wuv3/IzlxEfdvuovK696VZSdYuNg9VCd0da
         OG2+3PCfZqH5NnIYrWZ5lMv1Sct1JKsrylCHxUNLFhGQLbIKpoB55KBOp/LVBEaxyg8O
         i8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zM15C/kwGjQe5y+gsAuYgO5BdHO1bcoXYdP69DIdTnA=;
        b=6cLZaMr9xYKmF9zYyspIqJuE23a57eKWIrKusfmI3irfpvSCA6Gsff4g0+k45/dMJS
         Xc58/Z2GOlwUE6nT1Jj78SkFJxlFxhncAtSUqaoy+bXY9HZKeh4j3f50uSzMoov+geRx
         8gHo7ac9qtxbBzAf7nIPgWVBALYFr9XLIFfti+wPH0USonblTq3rXWRpnnrKadO59cjp
         PtLj5QPeYVeIOWlU75+2XSXmputxoCyKUqwzMZD5ku6LJcc6oeGvyoWHXu2c/TcrJpH5
         Rl/sN6eB0uHg8JzRMr85zkmMvOGf40P+O/S1hDkMIU0YkdfS4t4FlbHCxWYKjgIyvuN/
         q7+g==
X-Gm-Message-State: ANoB5pleRjRMdNm6k9DsFhnUHtX2NcUBNs7dV33F+C0SnidD4c0RCmOk
        UjeeagQ3/Zo9TGq4iJxqHqb8igY5sys=
X-Google-Smtp-Source: AA0mqf51ZdYjn0gdNAIqKzvNl/+Oib3Le7jJUR3GqPliDneBbq+Blkq7c/LdTQehQ1c/okUtFACDaw==
X-Received: by 2002:a05:6808:2229:b0:35b:2b17:af81 with SMTP id bd41-20020a056808222900b0035b2b17af81mr4369407oib.199.1668812212906;
        Fri, 18 Nov 2022 14:56:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d36-20020a056870962400b00141e56210b2sm2729655oaq.57.2022.11.18.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 14:56:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 18 Nov 2022 14:56:51 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 579/606] usb: typec: tcpm/fusb302: Convert to i2c's
 .probe_new()
Message-ID: <20221118225651.GB686528@roeck-us.net>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-580-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-580-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:45:13PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 721b2a548084..1ffce00d94b4 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1677,8 +1677,7 @@ static struct fwnode_handle *fusb302_fwnode_get(struct device *dev)
>  	return fwnode;
>  }
>  
> -static int fusb302_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int fusb302_probe(struct i2c_client *client)
>  {
>  	struct fusb302_chip *chip;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -1837,7 +1836,7 @@ static struct i2c_driver fusb302_driver = {
>  		   .pm = &fusb302_pm_ops,
>  		   .of_match_table = of_match_ptr(fusb302_dt_match),
>  		   },
> -	.probe = fusb302_probe,
> +	.probe_new = fusb302_probe,
>  	.remove = fusb302_remove,
>  	.id_table = fusb302_i2c_device_id,
>  };
> -- 
> 2.38.1
> 
