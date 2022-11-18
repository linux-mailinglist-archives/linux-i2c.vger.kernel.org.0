Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BEB6302DE
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiKRXVO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:21:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbiKRXU4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:20:56 -0500
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5A9210E4
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:11:13 -0800 (PST)
Received: from [10.0.0.163] (_gateway [10.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id BB27723094;
        Sat, 19 Nov 2022 00:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1668812735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FUkjlDNArKjjQ8kJZjGwzF/3HUFx7XOdaVbyxfCWcUE=;
        b=b1swgfixVG0FdjL+U8GaKKbsNZMUrJWDHjsK/Rd2P3cz8KUyn/0pnKUrjBI0SXjYmdYrR0
        2V+F79kEOoejoa6HrzAYl6/NKzo9gM7FkNlDMBo+Mmo62KzWCavXK/xDSaYZYotmG5MGqY
        Rb/FwxzNF/ZFkzIl8/uwNGQIXOoDtTo=
Message-ID: <0ff119d8-958b-4978-83c7-e066b8e0cab9@ixit.cz>
Date:   Sat, 19 Nov 2022 00:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH 114/606] iio: light: al3010: Convert to i2c's .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-115-uwe@kleine-koenig.org>
Content-Language: en-US
From:   David Heidelberg <david@ixit.cz>
In-Reply-To: <20221118224540.619276-115-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thank you!

Reviewed-by: David Heidelberg <david@ixit.cz>

On 18/11/2022 23:37, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/iio/light/al3010.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iio/light/al3010.c b/drivers/iio/light/al3010.c
> index ce5363845b22..69cc723e2ac4 100644
> --- a/drivers/iio/light/al3010.c
> +++ b/drivers/iio/light/al3010.c
> @@ -164,8 +164,7 @@ static const struct iio_info al3010_info = {
>   	.attrs		= &al3010_attribute_group,
>   };
>   
> -static int al3010_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int al3010_probe(struct i2c_client *client)
>   {
>   	struct al3010_data *data;
>   	struct iio_dev *indio_dev;
> @@ -230,7 +229,7 @@ static struct i2c_driver al3010_driver = {
>   		.of_match_table = al3010_of_match,
>   		.pm = pm_sleep_ptr(&al3010_pm_ops),
>   	},
> -	.probe		= al3010_probe,
> +	.probe_new	= al3010_probe,
>   	.id_table	= al3010_id,
>   };
>   module_i2c_driver(al3010_driver);

-- 
David Heidelberg
Consultant Software Engineer

