Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC5F37CDEE
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 19:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245185AbhELQ6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 12:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239591AbhELQKM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 12:10:12 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888AEC061264;
        Wed, 12 May 2021 08:46:10 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so3287389wmb.3;
        Wed, 12 May 2021 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=t/meNjZ0Nht+RonvzyRGNz+Sylq/Yz/vgFjTi37bDrE=;
        b=p5H95YkRm4qypJ1VXfunFTs2qXkp3RFcPncyQHjSJbn/3m9QkH/OQu1lUj3zhLqIdW
         feakVA3m4oTBW0eOYpdDK5G83qoWpWdUFpOoow6+H1zn78zwpoNKI8sIH2YxEi4ihzdo
         F8Pj8aT+sifNO1+kh5HW9mdwQNzOloBZ3HHeX45DLJvE5WO7Z1D4oP2+y41/k2IYfKYN
         b7MreOOv9dgsFa2sXpPVWoLLpVvn/K/RmkUM5uJZErt6IyyLhyOvycvSkyk7/LlXmoB2
         DjfvXjwpvZh1j6yksb6cpBSSA5mCbeeIeYnmN8tqWW48Fa60sSz++wbjs8GnZswdM5dS
         j59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t/meNjZ0Nht+RonvzyRGNz+Sylq/Yz/vgFjTi37bDrE=;
        b=igL36UJWMIlqHcIej1u5N9f/yldqWXSwxkzgVpbRTCfmW5GP/2rICo+U35QoQUIfUP
         UlTawayGJT5KDsdXj+xTXZcvhFBc0hdc7JyeJQjW3DVc0hfM/WS7uZc5QGv7QY2z+YLO
         M3vXrrBEjkMZO3J/dcywOt5S/VyZPIk3pV1+ohJEISCq2LIk67JsbG/fbLxPPeU2y9uW
         gV/Cxl3cJ6cjCLMHM86Awik2GewIjECt2Sqw+EHKfECwMEKVbjA2+gixJiKnu8Qxl7MQ
         7gkfAeiNGLvaY6ES31SsWD2hXl9tm5U6qRsbfj+BnsHm3bVRWqbOGyeW0vy9veVGAsZF
         JEhQ==
X-Gm-Message-State: AOAM532jmlaCGJCjjshwVdMOPH1sBu+whdZRjwykQkyMJQB3n2zVJ0np
        CHidJ+DMWx3cPwQ2N6r9C/Y=
X-Google-Smtp-Source: ABdhPJwYuTCotr2sEyzdL2rZRhrQqc7oqM7Iiyowlk8hQGp59sT8OOJrmqBcqcP+2r/KwlLq3/sU4g==
X-Received: by 2002:a05:600c:322a:: with SMTP id r42mr39484143wmp.98.1620834369271;
        Wed, 12 May 2021 08:46:09 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
        by smtp.gmail.com with ESMTPSA id p1sm48270wrs.50.2021.05.12.08.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 08:46:08 -0700 (PDT)
Subject: Re: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
To:     Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
 <20210507131406.2224177-4-hsinyi@chromium.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6e971f16-a325-34cd-faaa-cfd51db86c66@gmail.com>
Date:   Wed, 12 May 2021 17:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507131406.2224177-4-hsinyi@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 07/05/2021 15:14, Hsin-Yi Wang wrote:
> Add vbus-supply which provides power to SCL/SDA. Pass this regulator
> into core so it can be turned on/off for low power mode support.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e56ee2..22d1d14b5de5 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	i2c->adap.quirks = i2c->dev_comp->quirks;
>  	i2c->adap.timeout = 2 * HZ;
>  	i2c->adap.retries = 1;
> +	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
> +	if (IS_ERR(i2c->adap.bus_regulator)) {
> +		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
> +			i2c->adap.bus_regulator = NULL;
> +		else
> +			return PTR_ERR(i2c->adap.bus_regulator);
> +	}
>  
>  	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
>  	if (ret)
> 
