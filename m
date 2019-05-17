Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F10421A1D
	for <lists+linux-i2c@lfdr.de>; Fri, 17 May 2019 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfEQO4t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 May 2019 10:56:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33646 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbfEQO4t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 May 2019 10:56:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id d9so7523508wrx.0
        for <linux-i2c@vger.kernel.org>; Fri, 17 May 2019 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ksquared.org.uk; s=google;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+sJVXm9SImJ08xFrWmb5EfTw6u6Nt9tKk7+9b29uPs=;
        b=CTrgowjimgSrEhms+SEcvV74V1vWt9dq4fJ0LYxvcVPa9OX4RJeWtS0fTO6c3TlZ9T
         S+h72woSGJKLgbbgyFyzWJhDNc7cxAfFBteYLBKICeWGfQnRbpz0wqRcJvb9URmpGBoS
         AzDdgS/TsvqNOhxmOSorwVdmcX6maBLE0HcrU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D+sJVXm9SImJ08xFrWmb5EfTw6u6Nt9tKk7+9b29uPs=;
        b=l3wltdaBOteDu4/vO0On7tDdaZRV+5WwR8Xm1tNQxa3aI9ilpTy1I2RaFmEqFFVOl2
         gPRt9wFa5XZSqTPX9TZG2TjnO1SdqRof0wDOKSKUwbexX4vxCmyBTufS3N3ZCM3z9zEc
         aGEtx6WrwtL1iIWSFZZ/MvNT8CgltcjpnghDPzpEF7qss+s+c72EGvPeIvCoR4FWaSiO
         tJPzOWzte/MM+TU1ixopgh8eMPfgUQpTamYPID2NBbydZer1gO5kHYQRpwYXpDG9aZNX
         jTVOVzqCF3zldOyebWL5AE3RPpYurGcHslWr9EY18dl9BpaBxtU0upkE9FFXNz7WMp05
         841Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D+sJVXm9SImJ08xFrWmb5EfTw6u6Nt9tKk7+9b29uPs=;
        b=W8uN9qlNfHMuaZAYhi5jLBcsz1XTG4Y475JXd7SXM5KAXkxNI8Pgn2jJOsWtLmdhhC
         X6ZnRXiLLwmJcxD3BA9Y5SjCF/QLCamYxgxglWB5ZTRnBp8lFNd8jniB1zCP6hC1Q+sq
         fX9zMo5ivE/5fw3TCNfzvubyFFTvzVoOoaC7NLP6VZVCcuqa0FXj1ec51qkU1MvPRzAu
         XWOYZ5PHSTymdAS3dtLRjI+lfz/q6fmyG/IDVIEJc9zToEfMQAlwQ7snru7NWD/dmtNk
         QxrEZnp2R4vL7b95xMtmL+B1gs/+E3MjZEUwhzp1xbbFNGvZjknAz6WUa11a7TsSc7/x
         18Cg==
X-Gm-Message-State: APjAAAW/mrf9PQzg5THJUCoZ/ettqZF2Odz0SWT3oSHYXy1joWGfAZLk
        9jui8kpuDIP7RpwGMLkk7CHvQw==
X-Google-Smtp-Source: APXvYqyffqkyG4dGWjw2UDZxzZ+QDKTwk1QCTHoFnfHhQwOPmieKLDP17C1jouWqSm+mFvJ4WXQmig==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr25279625wrj.182.1558105006719;
        Fri, 17 May 2019 07:56:46 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id k184sm15580336wmk.0.2019.05.17.07.56.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 07:56:45 -0700 (PDT)
Subject: Re: [PATCH v8 3/3] mfd: da9063: occupy second I2C address, too
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Peter Rosin <peda@axentia.se>
References: <20190516211310.22277-1-wsa+renesas@sang-engineering.com>
 <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
Message-ID: <76842ba5-4f33-0234-b64f-3a9260a826d6@bingham.xyz>
Date:   Fri, 17 May 2019 15:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516211310.22277-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 16/05/2019 22:13, Wolfram Sang wrote:
> Even though we don't use it yet, we should mark the second I2C address
> this device is listening to as used.
> 
> Not yet for upstream until all dependencies are merged!
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

As I reviewed the other two anyway, it seems silly not to add this here :D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/mfd/da9063-i2c.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> index 455de74c0dd2..2133b09f6e7a 100644
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
> @@ -221,6 +221,8 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
>  		return ret;
>  	}
>  
> +	devm_i2c_new_dummy_device(&i2c->dev, i2c->adapter, i2c->addr + 1);
> +
>  	return da9063_device_init(da9063, i2c->irq);
>  }
>  
> 

