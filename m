Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61C625EBC1
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 01:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728400AbgIEXfI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 19:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgIEXfH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 19:35:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C76FC061244;
        Sat,  5 Sep 2020 16:35:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u4so11115864ljd.10;
        Sat, 05 Sep 2020 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kGgU1b5RQOsf0Zia5xIA7MAoWf3tsLf1dwu/anlUuvQ=;
        b=dUYXgZmAsshlZMmTs8921NbWtgPZMwp1N2DFkPJVGgX3DRafiTOMS+yBag48UHJkNu
         QpHba3Fy0Sr5rb6XoUXKe7xSi3kIDXdgr30q2cNwLqstuDxx9ankzuSxjC6LAQCQYLie
         Wsq8ckx5SHgQtqx1gzaSCv11GJTTyD7GJzpxTxTu6bewo6OtO3XRa1+Z2ui2gZH6RVd1
         9P45dKdBhe2017W70ju5Isah6Rv26alXmr2vyBxM+MWAGjpOokywdZ+ovY5CjIzuNpNF
         /HCZ4onvxlOQSWmx2wKB5ZMmAvHPyRFT5poMBRtEC45v+jvZ9OcnTt4jacvs49+PI/9l
         28ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kGgU1b5RQOsf0Zia5xIA7MAoWf3tsLf1dwu/anlUuvQ=;
        b=UVNxa82Kkx/28/GGk2QmKdBxlIq2PyS2p660FrKdoMynNJQZZ7F8Jn+9hbRDnQxcoI
         QY/fcOhVeDwJMJcgn05M9F7rmitQGgTzBwFVsMVUMXW0IAZqudMAs9lKAUgWXJey/pFM
         qpf9KFKuF2lnrxUPvC993tQyViT1GirDr779XP15ku/AS196sZ3TZyBpuCMR26Mms6FS
         38BiNt7NL3JhoFBArTH39YWwmstVJNGgWShx9Xdk7aWjBIJwyuaA0En66rw/Y+qZzhML
         cF6KgoFjkwV6jb4IpISBnCTzdmDfvabzHmtKjZdOnRTK1O1BSOPcgiJk0LCWgpazXXe0
         Z+Pw==
X-Gm-Message-State: AOAM533c91ED6CRC6DB7TjlUMolWPylI7VEt7IMU3a4WYxHvGH8CmqjE
        2gtM2hEjajyfQqeq33UqXpwjZzP3UkY=
X-Google-Smtp-Source: ABdhPJzqNKB85lvQnwM6LD990/+UGRsu0dQl7ME0z5fhDDMYry/lZxawTDJUrL+BGPKIUmzfxivZsA==
X-Received: by 2002:a2e:7f1d:: with SMTP id a29mr7325041ljd.424.1599348903311;
        Sat, 05 Sep 2020 16:35:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id u2sm2913787ljo.48.2020.09.05.16.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 16:35:02 -0700 (PDT)
Subject: Re: [PATCH v4 15/31] i2c: tegra: Remove bogus barrier()
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-16-digetx@gmail.com>
Message-ID: <a7061967-51b2-79f1-a8bb-b149da306c48@gmail.com>
Date:   Sun, 6 Sep 2020 02:35:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905204151.25343-16-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.09.2020 23:41, Dmitry Osipenko пишет:
> Apparently barrier() was intended to reduce possibility of racing
> with the interrupt handler, but driver's code evolved significantly
> and today's driver enables interrupt only when it waits for completion
> notification. Hence barrier() has no good use anymore, let's remove it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 33d37a40fa83..f69587ca163b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -600,7 +600,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		i2c_dev->msg_buf_remaining = buf_remaining;
>  		i2c_dev->msg_buf = buf +
>  			words_to_transfer * BYTES_PER_FIFO_WORD;
> -		barrier();
>  
>  		i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer);
>  
> @@ -624,7 +623,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
>  		/* Again update before writing to FIFO to make sure isr sees. */
>  		i2c_dev->msg_buf_remaining = 0;
>  		i2c_dev->msg_buf = NULL;
> -		barrier();
>  
>  		i2c_writel(i2c_dev, val, I2C_TX_FIFO);
>  	}
> 

It just caught my eye that there is actually a comment there saying that
barrier() was intended to mitigate the racing with the ISR. Hence that
comment is outdated now and needs to be removed. I'll correct it in v5.
