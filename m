Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31A829F4C4
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 23:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbfH0VKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 17:10:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43368 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbfH0VKu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 27 Aug 2019 17:10:50 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so137554pgb.10
        for <linux-i2c@vger.kernel.org>; Tue, 27 Aug 2019 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jpomdVGA5p42umi8ubetJR56dC18fC/oAubbOu5Ilsk=;
        b=HJgdekOb2c8f3gRbcDRpDs+Zps9PfGWBN0q5BSa5IWsYs7UZzQmy/1kzHlZGnLWypG
         hWL8mwrqa+wNOxLTGPakFK7jHz9TkN/ioDOg3TA0Iec6/138y09IySwjKSnRIQGqHyaU
         drM/0Bfphi2hYMWGltcph1ovE1eVAutqoWQHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jpomdVGA5p42umi8ubetJR56dC18fC/oAubbOu5Ilsk=;
        b=auk8K6Lagyyh9UqOxdFT6vAPfFL4utdpld8ILJT0r8wM5y5D/rJyA1KPdzXA0fthOZ
         T8t2ktUCiZSFNTWEcOoqv9B/lIypfzTheRv2KN5e3Q/4Sg+juiRaSRHKql6mT4ePqoOr
         AmcDUMy+V7zqLZZewsHBLEoTtO9iaeDJAXmNr1t8AYAUF/+b/ClYwATFAU7jWCU8un4Y
         VFelw0i8KxHiuhuKlIlJktQZdJFQCZ0TFkDShqB418ktvAyXKhNeb5gxbHpEZ1UPWHfV
         N3xWh4u12QSEk/aHiITy/hsNwlabiqvISyLJV9nvRbp5KHMD85zhrHnqJtKKAgajrwct
         HBRQ==
X-Gm-Message-State: APjAAAU49idqJpgskGS9Gy4iLHagUbtxGVC5YxymrKxF7EL7W5MHW7eR
        +NqzoR5SiQP2RmWd9gqI69fyAA==
X-Google-Smtp-Source: APXvYqzT2kvVrSL+W5x9nHvalWE8UntFAd6GPW9EiqI9/PPoYTtDOeGyI7rRTJ1KlgCTVSH3vfWTZQ==
X-Received: by 2002:a65:6547:: with SMTP id a7mr385824pgw.65.1566940249162;
        Tue, 27 Aug 2019 14:10:49 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id a128sm223417pfb.185.2019.08.27.14.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 14:10:48 -0700 (PDT)
Subject: Re: [PATCH 3/3] i2c: bcm2835: Add full name of devicetree node to
 adapter name
To:     Stefan Wahren <wahrenst@gmx.net>, Wolfram Sang <wsa@the-dreams.de>,
        Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
 <1566925456-5928-4-git-send-email-wahrenst@gmx.net>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <1c42daa2-f7f7-baac-2d44-f9d86848d331@broadcom.com>
Date:   Tue, 27 Aug 2019 14:10:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566925456-5928-4-git-send-email-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2019-08-27 10:04 a.m., Stefan Wahren wrote:
> Inspired by Lori Hikichi's patch for iproc, this adds the full name of
> the devicetree node to the adapter name. With the introduction of
> BCM2711 it's very difficult to distinguish between the multiple instances.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> =2D--
>   drivers/i2c/busses/i2c-bcm2835.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm=
> 2835.c
> index ab5502f..e01b2b5 100644
> =2D-- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -472,7 +472,8 @@ static int bcm2835_i2c_probe(struct platform_device *p=
> dev)
>   	i2c_set_adapdata(adap, i2c_dev);
>   	adap->owner =3D THIS_MODULE;
>   	adap->class =3D I2C_CLASS_DEPRECATED;
> -	strlcpy(adap->name, "bcm2835 I2C adapter", sizeof(adap->name));
> +	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
> +		 of_node_full_name(pdev->dev.of_node));
>   	adap->algo =3D &bcm2835_i2c_algo;
>   	adap->dev.parent =3D &pdev->dev;
>   	adap->dev.of_node =3D pdev->dev.of_node;
> =2D-
> 2.7.4
>

