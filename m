Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89256AA435
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 15:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732041AbfIENVL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 09:21:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38420 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731556AbfIENVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 09:21:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id w11so1308452plp.5;
        Thu, 05 Sep 2019 06:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aaqIxHqXkj1uuSVMqAJQpWwcsWGZCUWACOB9sZn+42g=;
        b=EVdVxDGJkvE83ZF9G3b7iMdrMC7FWZM6C6Ij0T9kXBJfoS0nJ3+T2x59jTN6RcanQq
         G5Bi/ZlJFn9PIt5bFoR1hBD8vZzdUZWJcFCJgd2foS/LZNmDRasKbB345QQjaBNo+gl/
         YNVHx5rUp1t6pZF2ZtDtrGybUpU8pwsN5g48iGih630zad17TnzASg10TAEypNDFGnmq
         abTreFtzCIaZ8zasoArSatJvc9kVulIoJIi/J3+UQNlJyl+Ubuh/8uz8LFkEwgARrZtJ
         DyNbkIm+SRT2T9n+z3qg4JSFcLu36R8siXehSoLXBQ2QBt5OWtS/thMSAJyKnhYfaJs5
         rcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aaqIxHqXkj1uuSVMqAJQpWwcsWGZCUWACOB9sZn+42g=;
        b=Sx0PyzUQ/VYIOlRuzMa6HR0vHbCvWRZ5Y0ijBabM3edkQizQnjjviLirR/yHd5zTqB
         +HxEAXr5GuhOt7m0y0OQ0uyWf8CpwaXosULcoadzZcqRMj4lnPrwpNHyx9+EismGSoIO
         pWmeaUVTuv27iUIzdEtftoZ10vuDFHA62mBxh1BmFZHVgIyV11KuquDMFwcyWSzE4QUG
         NQPa0lVdp03+SudpkazQbjCSEfTd8mE0bmNQ6mv5c3DevZPmKMEsJ4TS+Q7kvEU2tq2G
         UV+gWeGXGkNuYhtPFiYYuK5moZg+I9yKe8Y+L33y5kAALPbpbJ35rkfgj9N2xZZZLoeT
         D6+w==
X-Gm-Message-State: APjAAAXvp0Dx+ia8bFOE80P+y55vI4IA2RXcusifzNGmarMmdJrwOepl
        4EhhkdxOb9p2cZwThgC3/DBQbLZy
X-Google-Smtp-Source: APXvYqzDMXOush2DRGxOdIyzhIMX1w4EktiiEO6YxugC7cY2TPTX016yrqFI6ZH/6sxJvvA510uJsA==
X-Received: by 2002:a17:902:343:: with SMTP id 61mr3460800pld.215.1567689669743;
        Thu, 05 Sep 2019 06:21:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o19sm1957841pjr.23.2019.09.05.06.21.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 06:21:08 -0700 (PDT)
Subject: Re: [PATCH] i2c: muxes: pca9541: use BIT() macro
To:     Saiyam Doshi <saiyamdoshi.in@gmail.com>, peda@axentia.se
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190905131318.GA21280@SD.eic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <1d248333-abe9-cff8-ad29-d3b618643dc6@roeck-us.net>
Date:   Thu, 5 Sep 2019 06:21:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905131318.GA21280@SD.eic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/5/19 6:13 AM, Saiyam Doshi wrote:
> Use bit mask macro BIT() for definition where appropriate.
> 
> Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>

linux/bitops.h should be included when using BIT().

Guenter

> ---
>   drivers/i2c/muxes/i2c-mux-pca9541.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
> index 9e75d6b9140b..bd4cf8341a06 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -43,20 +43,20 @@
>   #define PCA9541_CONTROL		0x01
>   #define PCA9541_ISTAT		0x02
>   
> -#define PCA9541_CTL_MYBUS	(1 << 0)
> -#define PCA9541_CTL_NMYBUS	(1 << 1)
> -#define PCA9541_CTL_BUSON	(1 << 2)
> -#define PCA9541_CTL_NBUSON	(1 << 3)
> -#define PCA9541_CTL_BUSINIT	(1 << 4)
> -#define PCA9541_CTL_TESTON	(1 << 6)
> -#define PCA9541_CTL_NTESTON	(1 << 7)
> -
> -#define PCA9541_ISTAT_INTIN	(1 << 0)
> -#define PCA9541_ISTAT_BUSINIT	(1 << 1)
> -#define PCA9541_ISTAT_BUSOK	(1 << 2)
> -#define PCA9541_ISTAT_BUSLOST	(1 << 3)
> -#define PCA9541_ISTAT_MYTEST	(1 << 6)
> -#define PCA9541_ISTAT_NMYTEST	(1 << 7)
> +#define PCA9541_CTL_MYBUS	BIT(0)
> +#define PCA9541_CTL_NMYBUS	BIT(1)
> +#define PCA9541_CTL_BUSON	BIT(2)
> +#define PCA9541_CTL_NBUSON	BIT(3)
> +#define PCA9541_CTL_BUSINIT	BIT(4)
> +#define PCA9541_CTL_TESTON	BIT(6)
> +#define PCA9541_CTL_NTESTON	BIT(7)
> +
> +#define PCA9541_ISTAT_INTIN	BIT(0)
> +#define PCA9541_ISTAT_BUSINIT	BIT(1)
> +#define PCA9541_ISTAT_BUSOK	BIT(2)
> +#define PCA9541_ISTAT_BUSLOST	BIT(3)
> +#define PCA9541_ISTAT_MYTEST	BIT(6)
> +#define PCA9541_ISTAT_NMYTEST	BIT(7)
>   
>   #define BUSON		(PCA9541_CTL_BUSON | PCA9541_CTL_NBUSON)
>   #define MYBUS		(PCA9541_CTL_MYBUS | PCA9541_CTL_NMYBUS)
> 

