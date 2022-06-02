Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0EF53BDB7
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jun 2022 20:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236114AbiFBSDi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jun 2022 14:03:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbiFBSDh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jun 2022 14:03:37 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69862265631
        for <linux-i2c@vger.kernel.org>; Thu,  2 Jun 2022 11:03:36 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 15so5387665pfy.3
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jun 2022 11:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWYFc/gJo3faTJA9/EBkThaSJQ5LBS1fd/hXnAxH3ec=;
        b=eUpZzMaqDscu3aV2RG5ElqjbR8o89AIC8YeZu/UX1W6PhfLK8YZNcPgYkG3aHJh4ZI
         uSlGjlOhEBlJdH9e95bh4F59lLYXwekbxXYe0psNeUkV8Rbx3MvQixexLAxgiX/5ZhL6
         Mg28Ds1GfuWgf7AqCy4fXMzxKpKec32Okyb+h0XGpUYd/ulB7VSOLs1WZ/RM6i6Yb0fV
         tmxO93zgZ44fAa95BN5PoiRktav5QfQNIdNJCQOINoT8fqdrj2Z6eeNcI8tDrTIwDyer
         TbbsSYA0X2UkgyPIw6L5P/YUOkxDBz+5ByLuO/NRblzEY81p+SsfZF99Nw5oDygONEXS
         OBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWYFc/gJo3faTJA9/EBkThaSJQ5LBS1fd/hXnAxH3ec=;
        b=i8l+Rnp67BLsboKOtLvVigQFpk9wZMWlK/6Slh0W5y3HR3kufSUrzPg5s48ySstcsT
         K6uAUCakxispWvJu1BJke3be4d6f9z09w4/mwuQk4Vvh44scLW1XlACfjPGXP26clAFb
         RGf2+cBIZTIuqgo9kdR/BBXaxJhpF1KCJ/XnNIjmfvNVE3pYfoMUFlk/KsyzOkcKFLh5
         FSY7u08nFxwcraaizOq0ybPrVmXE4mZg8DxWVRA2c9sSyN2yfQnXC07ax1N6Pz1674VC
         rQYFOvgzZwco/qww8JLYN3pRO+7xm1vVgZdBfRTeAviRIKWaV6kzCPtxTuRbog6tnBzJ
         Ltyw==
X-Gm-Message-State: AOAM533J9UaIeAQPvEDgVgUUtLkS9ko3YwIeJ/QdmNYD/UUqmTw5+rBx
        RZ22OEy0wBnexPbVeetxNBw7mQZTkNYIixBtfd03IAqDnq8=
X-Google-Smtp-Source: ABdhPJz6zPujh/OhQyjE72kLq3MqYFCoeqfjAsPVxOteI44BYWvoUBjLDkquC3hgElR/KiiSKLQVqXjIbXaBEOL87uw=
X-Received: by 2002:a63:dd4c:0:b0:3fa:a80e:8ba0 with SMTP id
 g12-20020a63dd4c000000b003faa80e8ba0mr5351781pgj.167.1654193015647; Thu, 02
 Jun 2022 11:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220602165258.2247056-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220602165258.2247056-1-vladimir.zapolskiy@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 2 Jun 2022 20:02:59 +0200
Message-ID: <CAMZdPi_Yw-QVJV5O5qqYsDwi=GWXTV_wfTgXnpFOX7mkEGNJeA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: qcom-cci: simplify access to bus data structure
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 2 Jun 2022 at 18:53, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Trivial non-functional change, which adds an alias to an extensively
> used data location.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>


> ---
> Changes from v1 to v2:
> * removed a wrapped line, thanks to review by Loic.
>
>  drivers/i2c/busses/i2c-qcom-cci.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 8d078bdb5c1b..f6a1de575c5a 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -541,6 +541,7 @@ static int cci_probe(struct platform_device *pdev)
>                 return -ENOENT;
>
>         for_each_available_child_of_node(dev->of_node, child) {
> +               struct cci_master *master;
>                 u32 idx;
>
>                 ret = of_property_read_u32(child, "reg", &idx);
> @@ -555,27 +556,27 @@ static int cci_probe(struct platform_device *pdev)
>                         continue;
>                 }
>
> -               cci->master[idx].adap.quirks = &cci->data->quirks;
> -               cci->master[idx].adap.algo = &cci_algo;
> -               cci->master[idx].adap.dev.parent = dev;
> -               cci->master[idx].adap.dev.of_node = of_node_get(child);
> -               cci->master[idx].master = idx;
> -               cci->master[idx].cci = cci;
> +               master = &cci->master[idx];
> +               master->adap.quirks = &cci->data->quirks;
> +               master->adap.algo = &cci_algo;
> +               master->adap.dev.parent = dev;
> +               master->adap.dev.of_node = of_node_get(child);
> +               master->master = idx;
> +               master->cci = cci;
>
> -               i2c_set_adapdata(&cci->master[idx].adap, &cci->master[idx]);
> -               snprintf(cci->master[idx].adap.name,
> -                        sizeof(cci->master[idx].adap.name), "Qualcomm-CCI");
> +               i2c_set_adapdata(&master->adap, master);
> +               snprintf(master->adap.name, sizeof(master->adap.name), "Qualcomm-CCI");
>
> -               cci->master[idx].mode = I2C_MODE_STANDARD;
> +               master->mode = I2C_MODE_STANDARD;
>                 ret = of_property_read_u32(child, "clock-frequency", &val);
>                 if (!ret) {
>                         if (val == I2C_MAX_FAST_MODE_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST;
> +                               master->mode = I2C_MODE_FAST;
>                         else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
> -                               cci->master[idx].mode = I2C_MODE_FAST_PLUS;
> +                               master->mode = I2C_MODE_FAST_PLUS;
>                 }
>
> -               init_completion(&cci->master[idx].irq_complete);
> +               init_completion(&master->irq_complete);
>         }
>
>         /* Memory */
> --
> 2.33.0
>
