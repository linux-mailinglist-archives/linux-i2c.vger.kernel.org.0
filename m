Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9E389B5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbfFGMFS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 08:05:18 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:38052 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbfFGMFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Jun 2019 08:05:18 -0400
Received: by mail-it1-f196.google.com with SMTP id h9so2299941itk.3;
        Fri, 07 Jun 2019 05:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R8rMF4NWM+gzqhc/7f61HD6J6BbSZEmC6+MWbS8+98A=;
        b=bQKgYamV2OFaRohxqeSIbRSvlQ0B8HVePGCC8vVqLW4uWXC73sRvpxhqkHe1nfoim/
         nESzvwWqYyvbP6SgT95FhPsBM2CujVWr9vnJy84UnhvyU2Zhpf650+S/16QP2Dy+utg5
         wIVFUDrF4JMrP1QfMnu9spPYiNXy1f24niUTACYfGT+pLxIgRgZGJNKYfHFGFi7jktwm
         MmNv6GrSGfSpWK+zYNLirf/ff1OFqfdFQHE6mDg0c1qMZeyJJrvpKX8AbvdzxDcrlX9I
         7eUjQv2Op5wgYjbUfwGto2Wu08ZlEEE2vU444eqn5IsJfQxxiSySa6HFK97N2VsPV+mI
         UGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R8rMF4NWM+gzqhc/7f61HD6J6BbSZEmC6+MWbS8+98A=;
        b=SswXiSDw/2skdQurSCXtTmze2LXqaaHmGM4EstPntNkANtniluhPkJGys1UpXvMImr
         rwIYw+m9Eu9Mruru+SHfgK3Ent/SWhqiZRvEwbFKDeR44xsi7uQxl9J5AnTtrTYqTPU5
         oDYSNvCvSlXybFiHPo0PpSYS3JrUHh244LKzOlRotGreaVu6fy+8yct9eZd33pPVGO5y
         D08XgXUjOdTzIWE5cvTv4d4tRS7g0Ub8+OSQ0ioPlHfi20tuyA+G62TCFB3d2BYb+6K/
         L7REXcNQYEIMClK82Lb5ES0xpdNn5WbayYpQV4xEkXkYkt4t6kaxyJvw03wWnRJ/+pZh
         1n7w==
X-Gm-Message-State: APjAAAU7Ew2wgf0Re5mPq9mvMj5DEImxXA7/5padvloW68SsVVBMm8lU
        U4z4+/DSB3kOc94bsJ9Z2bk=
X-Google-Smtp-Source: APXvYqx6apaSio+tXoZqMjCxHF09HchzVgKLXDGGluH5LjKvwTq/Sxjo2wNkDgZqS1YR0ieomcqK2g==
X-Received: by 2002:a02:ce37:: with SMTP id v23mr34491633jar.2.1559909117716;
        Fri, 07 Jun 2019 05:05:17 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-76-170-54.pppoe.mtu-net.ru. [91.76.170.54])
        by smtp.googlemail.com with ESMTPSA id g21sm699271ita.43.2019.06.07.05.05.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 05:05:17 -0700 (PDT)
Subject: Re: [PATCH V1 5/6] i2c: tegra: fix msleep warning
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559908507-31192-1-git-send-email-bbiswas@nvidia.com>
 <1559908507-31192-5-git-send-email-bbiswas@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8751e121-d329-20fd-e302-79654519c87b@gmail.com>
Date:   Fri, 7 Jun 2019 15:05:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559908507-31192-5-git-send-email-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.06.2019 14:55, Bitan Biswas пишет:
> Fix checkpatch.pl WARNING for delay of approximately 1msec
> in flush i2c FIFO polling loop by using usleep_range(1000, 2000):
> WARNING: msleep < 20ms can sleep for up to 20ms; see ...
> Documentation/timers/timers-howto.txt
> +               msleep(1);
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index bececa6..4dfb4c1 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -476,7 +476,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  			dev_warn(i2c_dev->dev, "timeout waiting for fifo flush\n");
>  			return -ETIMEDOUT;
>  		}
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  	return 0;
>  }
> 

Awesome!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
