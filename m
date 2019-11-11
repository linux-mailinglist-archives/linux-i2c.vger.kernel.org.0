Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5FCF71D6
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 11:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKK1d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 05:27:33 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43501 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfKKK1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 05:27:33 -0500
Received: by mail-lj1-f194.google.com with SMTP id y23so13144829ljh.10
        for <linux-i2c@vger.kernel.org>; Mon, 11 Nov 2019 02:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LmDGe9nbcft4FfiC7VIPeLGhuJNW2Ho/gKIE1PaBIMA=;
        b=pbYmS+sj9/Xg+7ygHJVkcwG3oGaI6xvEK6pqHKXVilldcg8RhYL++hW4UcEGOkgi3p
         naFdSam+osJp3j3+k5kpCH7NDhuKUGSJD3WxAxb7bXKITg3ZzHrlfzcnHtnmRx9rBKr9
         AgRgmwtTxgONi09FwKLX4FoPpir/In2HHlxUSfr2hWFfL/18fkEQP3mTkO5s3XtH389D
         xS82ENU156O2lG4d7w0gOXua4jXYaJTOUpF52WK1OI2Dl4evobrRvYoR+ihQzxLYcKKy
         HDwq+SiStMhXGrC39ckB2pi92kHK76a7500BRdvjXy5o80BkEUlrJVxmHGmXBiw2cAQD
         4tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LmDGe9nbcft4FfiC7VIPeLGhuJNW2Ho/gKIE1PaBIMA=;
        b=sX1/yq7GK9pdAuR2fcT6vzloC6hGlfn0dCmjUEWyz4DNDZLKKB5vLq02MvSbAA5Vwu
         gliVltXzx/guaq+ZwtC8+wol3Gpxea7GrIljYNqMbTxqCmGQuSyk8+pfLPxaw9i1nZ0d
         xwZuLgePonLlgQWpk0KHgapA77SjQsuHVQ+stNtgO1W/gC7xWbIj5Mn6lbECzhJXPVuX
         jfeRhdu0nQQeIOzi7hzlnE7zvEJMOUF5TOg8lsLVtbEr06tZaxqnBWfVno18QBLCh00s
         sPfKcdP8syeXa6Y5UDxxQgZqn/Z8auN3CE9AZ17Htiiiu6g2DwfpXODKKIGb+YGtv+yi
         wIxA==
X-Gm-Message-State: APjAAAVKSLrq1BCAPkDZwmIyirxj5iIa0dEVzhOfVT6HW3V4Q0+/BdEd
        KcOtg12m9zmwcjm+rkuOt846pg==
X-Google-Smtp-Source: APXvYqwrAfWdClrHsOovnWIo78k9n+aSyR28Ot4/nVq05+jBIEmotXV5NGxizzM6V8YJ1+vpvGmeiQ==
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr13959899ljj.85.1573468051139;
        Mon, 11 Nov 2019 02:27:31 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id 4sm7272360lfa.95.2019.11.11.02.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 02:27:30 -0800 (PST)
Date:   Mon, 11 Nov 2019 11:27:30 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: remove helpers for ref-counting clients
Message-ID: <20191111102730.GA30651@bigcity.dyn.berto.se>
References: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191109212615.9254-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2019-11-09 22:26:15 +0100, Wolfram Sang wrote:
> There are no in-tree users of these helpers anymore, and there
> shouldn't. Most use cases went away once the driver model started to
> refcount for us. There have been users like the media subsystem, but
> they all switched to better refcounting methods meanwhile. Media did
> this in 2008. Last user (IPMI) left 2018. Remove this cruft.

Nice to clean out some old stuff :-)

> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/i2c/i2c-core-base.c | 32 --------------------------------
>  include/linux/i2c.h         |  3 ---
>  2 files changed, 35 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 9c55d24c7a30..5a44a92ed1fb 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1743,38 +1743,6 @@ EXPORT_SYMBOL(i2c_del_driver);
>  
>  /* ------------------------------------------------------------------------- */
>  
> -/**
> - * i2c_use_client - increments the reference count of the i2c client structure
> - * @client: the client being referenced
> - *
> - * Each live reference to a client should be refcounted. The driver model does
> - * that automatically as part of driver binding, so that most drivers don't
> - * need to do this explicitly: they hold a reference until they're unbound
> - * from the device.
> - *
> - * A pointer to the client with the incremented reference counter is returned.
> - */
> -struct i2c_client *i2c_use_client(struct i2c_client *client)
> -{
> -	if (client && get_device(&client->dev))
> -		return client;
> -	return NULL;
> -}
> -EXPORT_SYMBOL(i2c_use_client);
> -
> -/**
> - * i2c_release_client - release a use of the i2c client structure
> - * @client: the client being no longer referenced
> - *
> - * Must be called when a user of a client is finished with it.
> - */
> -void i2c_release_client(struct i2c_client *client)
> -{
> -	if (client)
> -		put_device(&client->dev);
> -}
> -EXPORT_SYMBOL(i2c_release_client);
> -
>  struct i2c_cmd_arg {
>  	unsigned	cmd;
>  	void		*arg;
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 8f512b992acd..23583f76c6dc 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -861,9 +861,6 @@ static inline bool i2c_client_has_driver(struct i2c_client *client)
>  	return !IS_ERR_OR_NULL(client) && client->dev.driver;
>  }
>  
> -extern struct i2c_client *i2c_use_client(struct i2c_client *client);
> -extern void i2c_release_client(struct i2c_client *client);
> -
>  /* call the i2c_client->command() of all attached clients with
>   * the given arguments */
>  extern void i2c_clients_command(struct i2c_adapter *adap,
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
