Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135F71A95E5
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 10:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635674AbgDOIN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 04:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2635669AbgDOINW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Apr 2020 04:13:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121A8C061A10
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:13:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k11so17357571wrp.5
        for <linux-i2c@vger.kernel.org>; Wed, 15 Apr 2020 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LkJy1QzawqhjFU7Ju2mePtspWxjtg9KAS6B4M0eMNdU=;
        b=m9HUIq5H+oLIX2WC1BdZc/+CaqnS09MKSv702r41ixSbnu6dII7McQQOZnDsxKkm8j
         5atEvh0mJi2JmQV8o6X9KZ9sY14Ei8LNscSoOLiD5uYV8Gx86FZFW4HviHRGDB+NJHPP
         +se3bh/MfXbs5bu1nS8ujaKCM1Rg8q2c+O3XOFLVL9Un5bVs4IrWLL5Iw6X4ZXSN/vKu
         KbRanE8tCncfNTQ9jFOwu6Hgtw8p5zSVHQ4+lMODAbYutEURV3PHfKhX9VgXZsWGl12G
         vwYqIBxkkvvsbjjwsc7RUSgcppwdYO2CIEI+uhY0BWFGwu1GM8nm3ioMITveHTRSlVpB
         C0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=LkJy1QzawqhjFU7Ju2mePtspWxjtg9KAS6B4M0eMNdU=;
        b=iz4N7tdS2nZLWxFOR800Fr4brfxLyBPTVOpFmEx+4NvPShJG2ejUoj7qK/VTt6esEC
         rqjph3uCgxTPh8AQ8t3Dfs8DtLpkBBdfzDA04NTx2gtmSV0PJnqXpqDlxpWaXmjvTVvS
         Gn6Pfhu0IPSyvIzm4Im2cHL2CPVRJllZU/oDiVor5nV2uPrfkNG+kIXyvHwVnWvpCAMv
         PYwT0u6ZcbwULv0gbUOMfgC1quB+ySk6ZMBNSfrSYz4N76BLEhCJYGZK0XZZGibsnelC
         AbcBqFQ9h2SXCnD1GgVvtRP3DMsZZzIv/HuwHouh8pKFv7/QJJUhmJwDIHeTXUHSpD/z
         2GlQ==
X-Gm-Message-State: AGi0PuY8T2K7NStu3ezPJ2cZ9AbdF5ZybOyu8T2WOMK3ZjaSQ98g2GeJ
        idbp5HX5fKbU2CDzl95KJlaKTw==
X-Google-Smtp-Source: APiQypLXLpjm+jS1Epc7+Y97OpuX6dRuEM1+IHfEN7ZGnv4H1zPYyEbLzHb4vQSNVrR6FJ3J1/N5Og==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr28118889wrw.307.1586938399681;
        Wed, 15 Apr 2020 01:13:19 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id v1sm17867775wrv.19.2020.04.15.01.13.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 01:13:18 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/6] i2c: of: remove superfluous parameter from
 exported function
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <24725e14-232c-49be-3b11-dc8afe685c43@bingham.xyz>
Date:   Wed, 15 Apr 2020 09:13:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200318150059.21714-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 18/03/2020 15:00, Wolfram Sang wrote:
> 'dev' is only used for printing an error message. However, that
> information is not needed because '%pOF' fully describes the location of
> the error. Drop the 'dev' and remove the superfluous parameter.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/i2c/i2c-core-of.c | 7 +++----
>  drivers/i3c/master.c      | 2 +-
>  include/linux/i2c.h       | 6 ++----
>  3 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index d8d111ad6c85..710704cd583e 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -19,8 +19,7 @@
>  
>  #include "i2c-core.h"
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info)
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info)
>  {
>  	u32 addr;
>  	int ret;
> @@ -29,7 +28,7 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
>  
>  	ret = of_property_read_u32(node, "reg", &addr);
>  	if (ret) {
> -		dev_err(dev, "of_i2c: invalid reg on %pOF\n", node);
> +		pr_err("of_i2c: invalid reg on %pOF\n", node);
>  		return ret;
>  	}
>  
> @@ -69,7 +68,7 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
>  
>  	dev_dbg(&adap->dev, "of_i2c: register %pOF\n", node);
>  
> -	ret = of_i2c_get_board_info(&adap->dev, node, &info);
> +	ret = of_i2c_get_board_info(node, &info);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 7f8f896fa0c3..cc0549a9fc64 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1943,7 +1943,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	if (!boardinfo)
>  		return -ENOMEM;
>  
> -	ret = of_i2c_get_board_info(dev, node, &boardinfo->base);
> +	ret = of_i2c_get_board_info(node, &boardinfo->base);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f834687989f7..d84aaf0d83d5 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -942,8 +942,7 @@ const struct of_device_id
>  *i2c_of_match_device(const struct of_device_id *matches,
>  		     struct i2c_client *client);
>  
> -int of_i2c_get_board_info(struct device *dev, struct device_node *node,
> -			  struct i2c_board_info *info);
> +int of_i2c_get_board_info(struct device_node *node, struct i2c_board_info *info);
>  
>  #else
>  
> @@ -969,8 +968,7 @@ static inline const struct of_device_id
>  	return NULL;
>  }
>  
> -static inline int of_i2c_get_board_info(struct device *dev,
> -					struct device_node *node,
> +static inline int of_i2c_get_board_info(struct device_node *node,
>  					struct i2c_board_info *info)
>  {
>  	return -ENOTSUPP;
> 

