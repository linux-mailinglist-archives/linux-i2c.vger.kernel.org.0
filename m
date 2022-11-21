Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7614F63183B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 02:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbiKUBoE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Nov 2022 20:44:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKUBoD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Nov 2022 20:44:03 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DEF2FFEA;
        Sun, 20 Nov 2022 17:44:02 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id c7so7655622iof.13;
        Sun, 20 Nov 2022 17:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFSUSUvql41qJvu1hJqhxXyZujdKOKcgnu8Xx4MuSSY=;
        b=W+a/jKkCnPVewjZySzzR/OX2eDM5AwxfTIA9UvbYpm49r7I2wSxkHiMHQCv7xdA55C
         BSoCATS65/5t6OuigpXiuDa5RStBOpuNlcQkJsL8RAIzPzSSDa7YPwsPJSqR9GUvnikD
         9muxWIG9uhZio5ahF14QzZtNJsnTlRqPewwAzc5xt2BojuU5ncA8hDWu5lWKVT4FS/s+
         o+dIYeuoQH94OtG85/aUzSroAWu8M3MZpErUUY8PNTFIW2tw4q10GOKN9GdCJO9p0ZuV
         odXfNVmJlQV8bQcu7uyoxRs17Fr3YZe/XEwwy97FfKrRSUPvgT5Uk/uI5SEvXOfkSysy
         8vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFSUSUvql41qJvu1hJqhxXyZujdKOKcgnu8Xx4MuSSY=;
        b=ccxcUTZwUQdHfFsMZ2vMhQVG/Auwfx9t/QlWEeK+fkmpFYWw9Iexj9dQ+L8ZC+AV8k
         9mClUDhtc9Epcj00gnpDvB9o0bcL8ZOO7kqYVHWWNGu0Jb4g5+R2McKa2Pfmdv+eyI50
         saFn6RgDZdaw1q9A0VEzf4zpqNPFZ0Ini9g2fYgVxnA0YgaizTuMrEOX2y2wxNx2E3q2
         Lb2b9rUq9DRCQBDE6o1KPlYelAklbthJdxUkeWguPRqvR7wjNg5G36aOBcH0xwCdjgH6
         YeOF7cLdYNhspwuYSHhqruLtt68B6rUskVm4nqEoq4o6T+2F8i3crVQGtJ0VSjQB1M7e
         oWGA==
X-Gm-Message-State: ANoB5plmCygGnsU9wHiTojuEa0OUXc9Rl65vn/fRkAoSb4Ti9zrmX2DQ
        O3CH8DMCJ8g5+19g9AMiw60=
X-Google-Smtp-Source: AA0mqf4CAtsM+grA5DdNz1sLp5AyX//l7sdL8+uoMBfI2Sx3W5Moeyuz9LiSCIE4JF9D/sb6LNKEmw==
X-Received: by 2002:a05:6638:60f:b0:373:6578:f8c4 with SMTP id g15-20020a056638060f00b003736578f8c4mr348972jar.242.1668995041760;
        Sun, 20 Nov 2022 17:44:01 -0800 (PST)
Received: from ?IPV6:2600:1700:2442:6db0:799e:a547:4c2f:ec44? ([2600:1700:2442:6db0:799e:a547:4c2f:ec44])
        by smtp.gmail.com with ESMTPSA id m11-20020a0566022e8b00b0068869b84b02sm3866524iow.21.2022.11.20.17.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 17:44:01 -0800 (PST)
Message-ID: <bc312919-26ca-7c15-4a67-6dabd59fe458@gmail.com>
Date:   Sun, 20 Nov 2022 19:44:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 509/606] of: unittest: Convert to i2c's .probe_new()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-510-uwe@kleine-koenig.org>
From:   Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20221118224540.619276-510-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/18/22 16:44, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Add a prefix to the existing patch comment:

In struct i2c_driver, field new_probe replaces the soon to be deprecated
field probe.  Update unittest for this change.

> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Rob,

In patch 000/606 Uwe asks maintainers to pick up the individual patches
in their tree, so please pick up 509/606.

>  drivers/of/unittest.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 1d810c0e18f8..bc0f1e50a4be 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2508,8 +2508,7 @@ static struct platform_driver unittest_i2c_bus_driver = {
>  	},
>  };
>  
> -static int unittest_i2c_dev_probe(struct i2c_client *client,
> -		const struct i2c_device_id *id)
> +static int unittest_i2c_dev_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct device_node *np = client->dev.of_node;
> @@ -2541,7 +2540,7 @@ static struct i2c_driver unittest_i2c_dev_driver = {
>  	.driver = {
>  		.name = "unittest-i2c-dev",
>  	},
> -	.probe = unittest_i2c_dev_probe,
> +	.probe_new = unittest_i2c_dev_probe,
>  	.remove = unittest_i2c_dev_remove,
>  	.id_table = unittest_i2c_dev_id,
>  };
> @@ -2553,8 +2552,7 @@ static int unittest_i2c_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  	return 0;
>  }
>  
> -static int unittest_i2c_mux_probe(struct i2c_client *client,
> -		const struct i2c_device_id *id)
> +static int unittest_i2c_mux_probe(struct i2c_client *client)
>  {
>  	int i, nchans;
>  	struct device *dev = &client->dev;
> @@ -2619,7 +2617,7 @@ static struct i2c_driver unittest_i2c_mux_driver = {
>  	.driver = {
>  		.name = "unittest-i2c-mux",
>  	},
> -	.probe = unittest_i2c_mux_probe,
> +	.probe_new = unittest_i2c_mux_probe,
>  	.remove = unittest_i2c_mux_remove,
>  	.id_table = unittest_i2c_mux_id,
>  };

Reviewed by visual inspection.  Did not do my normal build, test, check for
warnings.

Reviewed-by: Frank Rowand <frowand.list@gmail.com>
