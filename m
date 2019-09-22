Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18528BA2C7
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Sep 2019 15:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbfIVNZG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Sep 2019 09:25:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46706 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728549AbfIVNZF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Sep 2019 09:25:05 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so5213178plr.13
        for <linux-i2c@vger.kernel.org>; Sun, 22 Sep 2019 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=199rW2yr2edDoi0PelZ+dIOADFRTUQdJWW+K5OQCuAo=;
        b=mFE4LGJGiWDZen9HoqMSSSr7YvivQA4wJ7yvN6a9Q/m0rSlwNhS1m3J3r52R4BeUiE
         gC2Kzz7HyAVIP+7oPaifiEpHWWvvEVXK4/5w9t4o5UYPjkWr+i2q+WRUCkl4ryy4DrgE
         QkbQrKOUu/8WoFwCWPsK6L24kvhg1W/41fNse71xKg440Df7x3G8W201Xevd8RB7mm5+
         f+pruZ9uQcjvWvNIXLWrLKldgprAI19tYvkOgX6eIEt807TTWQ+pc7AwguJB3+6ouGXH
         Q7bzOdOF76CypRKkf8kZDlr4cdL5SOG4HoYP8Gy6D4Pm9ZMLA1bWedY+cYRQaJcJvSiG
         S9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=199rW2yr2edDoi0PelZ+dIOADFRTUQdJWW+K5OQCuAo=;
        b=l5tuhh9YSFt274EK+GEnv6AfCX8PIMuDorWzTzUerbXFIRqK4X83YS+5+jphqhSfUW
         APj58Q9AcfZBiQGKWJnf6EyAfOcjbfY8cSuS63l3ZzIvXxJVYpBHaFbUVAKmFGU+ITmq
         YjBUUeZFTvzFoTphMondnxt9MaELHgKVL5UOujD2dYA0Wrb8zC/Nc1JZ53fI40J5j2Yu
         KtXB7kNT1CUNxKKCqUfapBrVsYyJyMKYvlIF7HI4MGKACFnil9TrhdyEnTuXLKFbB4sl
         9KB9Rj9IOr41jDbVytBGaxX4JGy7Q4tbZ08WwELYBLgxE0Mo6xogcHYLDkX8XpHWkSQ7
         HSvw==
X-Gm-Message-State: APjAAAXpRkIDYqxr4GZJcnTPLomCLTDY1DYT4sLi15ze2z1DEfD4AFZE
        Y74thlINT8b0R9TNRdBtkbpYS4Qd
X-Google-Smtp-Source: APXvYqwB17dUVnR95ZU2n+yjz7Ekp/dHMutDMZ/ALq/mBN3w+gLEPPraynjT7sonuSGwwqNLtr8Vmg==
X-Received: by 2002:a17:902:bd97:: with SMTP id q23mr28272113pls.259.1569158705206;
        Sun, 22 Sep 2019 06:25:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q204sm8591139pfc.11.2019.09.22.06.25.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 06:25:03 -0700 (PDT)
Date:   Sun, 22 Sep 2019 06:25:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Adam Zerella <adam.zerella@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Convert parameter to __le32
Message-ID: <20190922132502.GA18273@roeck-us.net>
References: <20190921125804.GA10910@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190921125804.GA10910@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Sep 21, 2019 at 10:58:04PM +1000, Adam Zerella wrote:
> The assignment of `serial` is using le32_to_cpu() without
> first converting the parameter `dev->ibuffer` to __le32.
> 
> This produces a Sparse warning of:
> 
> `warning: cast to restricted __le32`
> 
> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
> ---
>  drivers/i2c/busses/i2c-diolan-u2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-diolan-u2c.c b/drivers/i2c/busses/i2c-diolan-u2c.c
> index 382f105e0fe3..32de47eda950 100644
> --- a/drivers/i2c/busses/i2c-diolan-u2c.c
> +++ b/drivers/i2c/busses/i2c-diolan-u2c.c
> @@ -289,7 +289,7 @@ static void diolan_get_serial(struct i2c_diolan_u2c *dev)
>  
>  	ret = diolan_usb_cmd(dev, CMD_GET_SERIAL, true);
>  	if (ret >= 4) {
> -		serial = le32_to_cpu(*(u32 *)dev->ibuffer);
> +		serial = le32_to_cpu(cpu_to_le32(*(u32 *)dev->ibuffer));

This doesn't make sense. Converting the data from cpu to le32 and
then back to le32 would be a no-op, not a conversion, and the code
would then be wrong on big-endian systems.

Not that it matters much here - it would just display a wrong serial
number. However, if you are making that kind of changes elsewhere to
the kernel, you are trying to mess it up really badly.

Guenter

>  		dev_info(&dev->interface->dev,
>  			 "Diolan U2C serial number %u\n", serial);
>  	}
> -- 
> 2.21.0
> 
