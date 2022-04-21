Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 023B7509D20
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Apr 2022 12:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388095AbiDUKHq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Apr 2022 06:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388097AbiDUKHo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Apr 2022 06:07:44 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74492111E
        for <linux-i2c@vger.kernel.org>; Thu, 21 Apr 2022 03:04:54 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id b19so5898397wrh.11
        for <linux-i2c@vger.kernel.org>; Thu, 21 Apr 2022 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3F324L+2J98n+Lan1RyT/eWUeM6GkGX/RXQR6LB0/4k=;
        b=oZScCh8tKhUHn5IqyR7GetNckEnYLsAay36jS+dQX5N4WkKbSHqHnAUndORk3Wdv21
         c0tVl1PkJXKqOwZJYB6taoPSsfczNdpWaRAUKLP5jTWp0kLb7jpPHwje5iZSLWVQ78Wa
         aUETFfwp2F58i5av3tKbzNeF14/0N04ld0d/IEgEANj3DWimHAasAU2Mab1fm9WL/RvY
         g4uSoxn4RwesXTnD6Dd2wicyrLmQViYv5zU/11EeXnJjbwCw9QkmlESsvKTRkZ5hh/gm
         gwL8AYVVYMUlnlX0mXVn6Fz1bABeGyyr31dYdeVy9SQPLHdbO7acyEqccGtX7seQAspK
         kdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=3F324L+2J98n+Lan1RyT/eWUeM6GkGX/RXQR6LB0/4k=;
        b=vvWS3RpZNnFpvQUNp0mLooR0wqp96c8fS9t8eSJ2mLofNEg4E7k/nDBLUyoAeWojWQ
         i96914ecR7SX1/wsFwDQ/ll64OWG5peAtZJCaRYsBkKhFQxksMQ8tmSLJ3gpHvNR/42m
         lbgD4bhi/MroVyDxtc0+JbIkFxVn4l2eTooWUI3K0/cr6bMoEGoldaNyrCn0R0c0wfW5
         2R8f/fB+BsGW2RnrMhOhcodEX+TpSTfWfT21pUoiATN5MdTzuxAS/zc3kgh8hKa0ua89
         H4k8Wr7Aq0ud1u0JnTKSKoJBMQSSR6zDGgqxusWVTlshiNK7zZ3Z7MbJgMaZLm2swsJQ
         cDYg==
X-Gm-Message-State: AOAM533e9jKrE/qreeEqrfFc3PbbQ9jnn6Gk+hPl9uWcEneageiE1b2H
        Ch9XhOqjuANABNU/TcUuloHADQ==
X-Google-Smtp-Source: ABdhPJzPcTNEggQIdZUTB+ITMSuLWsBKyApCBNUoQNpjDvesu8eXr2DyijjlfhOx5peSt7JVHgLyQA==
X-Received: by 2002:a05:6000:178a:b0:20a:b841:e245 with SMTP id e10-20020a056000178a00b0020ab841e245mr2445214wrg.480.1650535492968;
        Thu, 21 Apr 2022 03:04:52 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d? ([2001:861:44c0:66c0:35ba:2677:956:980d])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c19d400b003929c4bf23asm1770295wmq.44.2022.04.21.03.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Apr 2022 03:04:52 -0700 (PDT)
Message-ID: <e524328e-5e91-a550-45a6-053ac73cc8e5@baylibre.com>
Date:   Thu, 21 Apr 2022 12:04:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH -next] i2c: meson: fix missing clk_disable_unprepare() on
 error in meson_i2c_probe()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     wsa@kernel.org, tanure@linux.com
References: <20220421090042.2278081-1-yangyingliang@huawei.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220421090042.2278081-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21/04/2022 11:00, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from meson_i2c_probe() in the error handling case.
> 
> Fixes: a57f9b4dd6f5 ("i2c: meson: Use 50% duty cycle for I2C clock")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 50dab123380a..195a9716da31 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -520,8 +520,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
>   			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
> -	if (!i2c->data->set_clk_div)
> +	if (!i2c->data->set_clk_div) {
> +		clk_disable_unprepare(i2c->clk);
>   		return -EINVAL;
> +	}
>   	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
>   
>   	ret = i2c_add_adapter(&i2c->adap);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
