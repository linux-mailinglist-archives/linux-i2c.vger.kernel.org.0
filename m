Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B81416AD64
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 18:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbgBXR3f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 12:29:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50890 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgBXR3e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 12:29:34 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so155011wmb.0
        for <linux-i2c@vger.kernel.org>; Mon, 24 Feb 2020 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ArdtZFgIXmx3UdsHoJoRrpKxB3h4AS+Ej5l0brXLNow=;
        b=doabDm8ogPHHvQ8BUudF4bgP211pB58Zfw42qWzcnHpuss5izbB7zWSjwBhevJKnrZ
         9ca0Nt/QInOX9h+WPr9iFJThBGKg615Er7lRItL57vx+fz4r8+wCmaae75wCHtEMyNmq
         m0ZHB/Vs7XUXh3Sjnup55DWaGly/pAiiDNndY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ArdtZFgIXmx3UdsHoJoRrpKxB3h4AS+Ej5l0brXLNow=;
        b=g/KFOgAg5J+BTzZ4iteIVu7IUov6renElKxOoRLcceGgB4jY/DVAwO76zylJovQJ3H
         LFxmult7BHBr5FGtOuJu4V/q6qNTNtT0y/VvqqVdYVqsAzdYyitfYxXddSa7z8ZTMIob
         PSQeP2syoEuCt26RSDM4o0QyyYhMC8wxptpk9EurLh+ZeaJv2lzYZmxQO/p1PjrU7hq5
         /+ZZRl5KGnQkiLoMuE111FWVMr6MuUznpWOjStob3pOfiOCMY1rFJzvp4jvHEK17Jyad
         gt1Z0UWCXdX02EeO8rUoHd6rNKhBIZYIIdpFx5vu0P7U7SkyUQLrNZrB6v1RyrpwQ7pI
         ysJQ==
X-Gm-Message-State: APjAAAUM0p6Q4+LrZLZkfbojyTVtD7Tgi7KfAtdjSfPCR6Tl2mac77Je
        9xDSp79upwN1cUgxRXRcvYm4NQ==
X-Google-Smtp-Source: APXvYqzIb3bJASi7bE84GUB9DCGlqZCpqrxrXKUVL+8rX2v8bB+cmvLQBOr7pqe/aZjCvYIc6++u3A==
X-Received: by 2002:a05:600c:414e:: with SMTP id h14mr80896wmm.179.1582565373131;
        Mon, 24 Feb 2020 09:29:33 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id y139sm114758wmd.24.2020.02.24.09.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 09:29:32 -0800 (PST)
Subject: Re: [PATCH v1 09/40] i2c: bcm-kona: Use generic definitions for bus
 frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
 <20200224151530.31713-9-andriy.shevchenko@linux.intel.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <1a617e20-c3c9-51a2-5c3a-81adf2358a84@broadcom.com>
Date:   Mon, 24 Feb 2020 09:29:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224151530.31713-9-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 2020-02-24 7:14 a.m., Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/i2c/busses/i2c-bcm-kona.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
> index 4e489a9d16fb..2858639767da 100644
> --- a/drivers/i2c/busses/i2c-bcm-kona.c
> +++ b/drivers/i2c/busses/i2c-bcm-kona.c
> @@ -722,16 +722,16 @@ static int bcm_kona_i2c_assign_bus_speed(struct bcm_kona_i2c_dev *dev)
>   	}
>   
>   	switch (bus_speed) {
> -	case 100000:
> +	case I2C_STANDARD_MODE_FREQ:
>   		dev->std_cfg = &std_cfg_table[BCM_SPD_100K];
>   		break;
> -	case 400000:
> +	case I2C_FAST_MODE_FREQ:
>   		dev->std_cfg = &std_cfg_table[BCM_SPD_400K];
>   		break;
> -	case 1000000:
> +	case I2C_FAST_MODE_PLUS_FREQ:
>   		dev->std_cfg = &std_cfg_table[BCM_SPD_1MHZ];
>   		break;
> -	case 3400000:
> +	case I2C_HIGH_SPEED_MODE_FREQ:
>   		/* Send mastercode at 100k */
>   		dev->std_cfg = &std_cfg_table[BCM_SPD_100K];
>   		dev->hs_cfg = &hs_cfg_table[BCM_SPD_3P4MHZ];

