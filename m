Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDC54FB4BC
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Apr 2022 09:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbiDKHaB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Apr 2022 03:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbiDKHaA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Apr 2022 03:30:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472DF3969B
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:27:46 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id p189so9285078wmp.3
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=wZSkW98SEIEbhV4Bb3TdcBneRqZQZaCTVUrWB9hDT8Y=;
        b=3Z2fp/lJWPWwBIqHvvH46BbrRC4X+hrEY4HIiAKeFD9N15+Pc3LOXwkx4z0mRgKKQQ
         CgXnBts5V8ZDutpV8FgRN864w9S4ovq/11FilejtVOsXAmKd3Btdspx7GjkuiUnkaEpo
         R454Pw4SnbuZNQJGZC4dK5Hk7dGM+bbWc2wuSSgKQXFaCQeFy3ecS7/9rrQYdK2XC8St
         q/3goMA8YgwrLBY+UnAa7f6FMeiiWGmDsmTBzcqL4uBRk2SyvbUsbxL83FLSNbQnHNbs
         wWyuWMajKX4GDhdvMBafAFkfxzk76BE4txrb4M/yPl9BEcJT4R2GK8Tyf3dKHwadSFHm
         2cRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=wZSkW98SEIEbhV4Bb3TdcBneRqZQZaCTVUrWB9hDT8Y=;
        b=bTzcVvmlzYp6/mnm0+JJejVFGp5+dbN4VvIWRd2fVWKVDgt+u5gVwEmPzvwJnHvb2d
         n8tSSizP6cBl3dY/BgO/Ybi9giVk1/etjnN2TX8zDF47zQ3hDdBomMfvCUeLVMLmR41K
         8Lv0oJpRsf1OBa1Vnx3HpT5jkWm753bzYyfhvpic5VBg7uAgdE4q342apo7V/YmILuzg
         VqJE9mnBObBz2YPtkf8rYBBVcJBF/3CXza7tM0jw/02gTrgmbblqzrKAPfqjBeNursG/
         NcEd8epPkQ9F5CKntfxF7xZCBGzpfLc3RLe45VjJdBeApDWRdZWCkUS7OQ1o9utfjF28
         5EKg==
X-Gm-Message-State: AOAM531bjf2PQERdqHpgcwdPu1MqEBxbLxs+lzeqpoTz3QAilGZyqx/O
        GChHEB9bHO3xxI+pa3QiE+g8yA==
X-Google-Smtp-Source: ABdhPJxK439eNBYeBmj50odYBDMozzwt8V7STzblGIDkD8wftNkCQ+v5AbP0Ddx/I7IqteBxuzC+aA==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id z19-20020a1cf413000000b0037bd1de5762mr27942434wma.108.1649662064710;
        Mon, 11 Apr 2022 00:27:44 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5? ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
        by smtp.gmail.com with ESMTPSA id k124-20020a1ca182000000b0038eb706c030sm4031206wme.39.2022.04.11.00.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 00:27:44 -0700 (PDT)
Message-ID: <5d5d4590-18fc-1d94-08e3-7ffde8d9146d@baylibre.com>
Date:   Mon, 11 Apr 2022 09:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register
 definitions
Content-Language: en-US
To:     Lucas Tanure <tanure@linux.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-2-tanure@linux.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/04/2022 18:43, Lucas Tanure wrote:
> Differentiate between masks and shifts
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 41 ++++++++++++++++++----------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 07eb819072c4..4b4a5b2d77ab 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -30,18 +30,21 @@
>   #define REG_TOK_RDATA1		0x1c
>   
>   /* Control register fields */
> -#define REG_CTRL_START		BIT(0)
> -#define REG_CTRL_ACK_IGNORE	BIT(1)
> -#define REG_CTRL_STATUS		BIT(2)
> -#define REG_CTRL_ERROR		BIT(3)
> -#define REG_CTRL_CLKDIV		GENMASK(21, 12)
> -#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
> -
> -#define REG_SLV_ADDR		GENMASK(7, 0)
> -#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
> -#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
> -#define REG_SLV_SCL_LOW		GENMASK(27, 16)
> -#define REG_SLV_SCL_LOW_EN	BIT(28)
> +#define REG_CTRL_START			BIT(0)
> +#define REG_CTRL_ACK_IGNORE		BIT(1)
> +#define REG_CTRL_STATUS			BIT(2)
> +#define REG_CTRL_ERROR			BIT(3)
> +#define REG_CTRL_CLKDIV_SHIFT		12
> +#define REG_CTRL_CLKDIV_MASK		GENMASK(21, REG_CTRL_CLKDIV_SHIFT)
> +#define REG_CTRL_CLKDIVEXT_SHIFT	28
> +#define REG_CTRL_CLKDIVEXT_MASK		GENMASK(29, REG_CTRL_CLKDIVEXT_SHIFT)
> +
> +#define REG_SLV_ADDR_MASK		GENMASK(7, 0)
> +#define REG_SLV_SDA_FILTER_MASK		GENMASK(10, 8)
> +#define REG_SLV_SCL_FILTER_MASK		GENMASK(13, 11)
> +#define REG_SLV_SCL_LOW_SHIFT		16
> +#define REG_SLV_SCL_LOW_MASK		GENMASK(27, REG_SLV_SCL_LOW_SHIFT)
> +#define REG_SLV_SCL_LOW_EN		BIT(28)
>   
>   #define I2C_TIMEOUT_MS		500
>   #define FILTER_DELAY		15
> @@ -149,11 +152,11 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   		div = GENMASK(11, 0);
>   	}
>   
> -	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
> -			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
>   
> -	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
> -			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
>   
>   	/* Disable HIGH/LOW mode */
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> @@ -292,8 +295,8 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
>   		TOKEN_SLAVE_ADDR_WRITE;
>   
>   
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
> -			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR_MASK,
> +			   FIELD_PREP(REG_SLV_ADDR_MASK, msg->addr << 1));
>   
>   	meson_i2c_add_token(i2c, TOKEN_START);
>   	meson_i2c_add_token(i2c, token);
> @@ -467,7 +470,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   
>   	/* Disable filtering */
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
> -			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
> +			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
>   	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
