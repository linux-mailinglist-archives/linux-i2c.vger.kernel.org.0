Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69F8A7089E
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 20:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfGVSaI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 14:30:08 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41533 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728934AbfGVSaI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jul 2019 14:30:08 -0400
Received: by mail-pl1-f194.google.com with SMTP id m9so19452772pls.8;
        Mon, 22 Jul 2019 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6Fzk71LNruyVJOHAIeh7BkqFWyiYQ59QlSCVLT+fsNA=;
        b=MKgJOdusXQP0ZsRCepxrRGOtPW2Ge6aebl80NhRU/jNCDPjD+u2cVvYTSbCbuikg2J
         pXtJBkW3JAtvNk9CeY/g8ZeaEtmJ4WNtPawH1WWMTTtNH6eJrx1jIYluNc2vaT0tvec+
         ddXMkfpS10h0GRWeL94/KMI3DZRDqVcYGBabU/zWg/W6JMlZYsxQ64V3LFPsbSrV8grY
         vTJd0EnP0lhgWgGW3Z6lbi2x/AYNJZbpHLlHcGJl8/T1uEAZ6jJ7VLN+gLYPxK7t+axR
         W0MCNkOlsnWOuXOHuYZKpP3LKf5kMEhfBAfHYEW1XunYulNuuFdTcNPOR4iMPayMxtfx
         imuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6Fzk71LNruyVJOHAIeh7BkqFWyiYQ59QlSCVLT+fsNA=;
        b=rz82m+hYsK5VU+1+gxfULBcRy6ZUB8qxbPImXUbRaOcR54sOjUTZFMl7QTwrjDHPa2
         5Br979KlXGr59dl5Y6MswbufxJUOFvpNbDDjwt6uQkMMT8yEALqOejeODRtDW3SQLdrD
         4/oEYgjENEoc5MMbHldfX3YR2TMbyc1hfvOEQE+TUSxSVsDWlZ0pn3URLjIWHQkyBmIy
         ghuVfRra00z6+ECQ9XolDVikX8VCUwvNkxiu9sOJoK9rHNyYXi5+j8l/3nO6gQ2K97uu
         Q2e0wKtNjYtVIyFTcx9loBpPW1+mMcv1PXKUIgdM7xQGzUwRaMLBMKUaKuppBWxULZdX
         XrNw==
X-Gm-Message-State: APjAAAWl+DGs3ngkzBqvCmVyP1MEyCWtkW0nEG9YFB2MmDVYmeK1YtAP
        0B8rP9qwMNoMfnYyXrW0bLrkxtHW
X-Google-Smtp-Source: APXvYqyNEhkXXMSvHBEXK2arEDckcIF9ItV+P+YSbNUz1DptSnfT9hQa1buRMMKMUJjbEGyGzXonaA==
X-Received: by 2002:a17:902:2de4:: with SMTP id p91mr45716027plb.28.1563820207777;
        Mon, 22 Jul 2019 11:30:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p15sm38150807pjf.27.2019.07.22.11.30.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:30:07 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:30:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: w83781d: convert to i2c_new_dummy_device
Message-ID: <20190722183006.GA16898@roeck-us.net>
References: <20190722172611.3797-1-wsa+renesas@sang-engineering.com>
 <20190722172611.3797-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722172611.3797-4-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jul 22, 2019 at 07:26:10PM +0200, Wolfram Sang wrote:
> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/hwmon/w83781d.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
> index d2c04b6a3f2b..015f1ea31966 100644
> --- a/drivers/hwmon/w83781d.c
> +++ b/drivers/hwmon/w83781d.c
> @@ -894,12 +894,12 @@ w83781d_detect_subclients(struct i2c_client *new_client)
>  	}
>  
>  	for (i = 0; i < num_sc; i++) {
> -		data->lm75[i] = i2c_new_dummy(adapter, sc_addr[i]);
> -		if (!data->lm75[i]) {
> +		data->lm75[i] = i2c_new_dummy_device(adapter, sc_addr[i]);
> +		if (IS_ERR(data->lm75[i])) {
>  			dev_err(&new_client->dev,
>  				"Subclient %d registration at address 0x%x failed.\n",
>  				i, sc_addr[i]);
> -			err = -ENOMEM;
> +			err = PTR_ERR(data->lm75[i]);
>  			if (i == 1)
>  				goto ERROR_SC_3;
>  			goto ERROR_SC_2;
