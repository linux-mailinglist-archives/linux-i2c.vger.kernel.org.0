Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E36C4F6243
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 16:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbiDFOzF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 10:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235318AbiDFOy2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 10:54:28 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BE1542778
        for <linux-i2c@vger.kernel.org>; Wed,  6 Apr 2022 04:31:25 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l7-20020a05600c1d0700b0038c99618859so3434949wms.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Apr 2022 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5XbRU+VxgtJAsYJu2rQYo8tuqHFMuZ1T/xaK9fUrdH0=;
        b=eR5rUlVSnTFQlvGrccqjvN39M+LeViWxotz7T8MGCPbprNA8KYhbn/yw6G+dwvbAyK
         mxXLeQggdQLJvCfjEdJz1V45cbfp1g3qf2mP6hTjQ0jauNDwJw/0skDi7X4qzk70kShg
         xTWeyaXzLpEhIappmAnDK8gVxdrAaQxznxoLwhp1xkZM/wCBTQE+2EW1jX+i85riQPyl
         WxogHEwc5ZehS7LFL8tJMaR7hBZmSxT9d7+2y+6IIE5Gg/Hh11kb01LTUTO5FUVUUzu0
         zZEXGR5B7R/AO+i1J3O7BWkkqCV0AY00roN3cmRkjgq1laaz+jiP+NkI21eF0pWV6/fm
         A20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5XbRU+VxgtJAsYJu2rQYo8tuqHFMuZ1T/xaK9fUrdH0=;
        b=RlMvSPSQ7APMVKf4X6AiZ1AOVX1UhHJ9JF31POgOuC13uK3wkgzDghUzL+Y0Aoag0f
         tBABA5GG0+yRygv0vH+4WhdR6e03sBjMoF7xg1OQ1gsP3GvakXd91eb+A7lQ9PBsC/uW
         Q5Fjq25KFfPbAaEnymRJ6RdtlcV1aiwyNzG20izpcCRrICqOXsbQ9x0FTKOgL6w4BJyt
         z/agjekYC0hUei8R+NCDqcX0/m10HMFyDPuUBTEtHUEmSGzvW2lMChU1qqMFGzFJqDTg
         VeHG/Yto0elzuOYCFt5T2P1XIZYBfoJI24h6eU3mDxuav0Y/lDdj4h1F7fDtU9IbSnZu
         eR9A==
X-Gm-Message-State: AOAM5312CA6yViB1PCg+0CHrqMBYSnOgmZ19plo1mxa3O4NgUvGy1vwE
        pBnnbxHytyBmLx81YBgNa3ipOA==
X-Google-Smtp-Source: ABdhPJz5ePGx/VXESvKKA0BSxhKgDc52BTcCoXDqPlrAPdNxYzxZyJaRj9rQ1myoM+kbqb4a3CQTqQ==
X-Received: by 2002:a05:600c:2652:b0:38e:72da:7992 with SMTP id 18-20020a05600c265200b0038e72da7992mr7034652wmy.111.1649244683953;
        Wed, 06 Apr 2022 04:31:23 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d960:ec5e:e421:9c9e? ([2001:861:44c0:66c0:d960:ec5e:e421:9c9e])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d53c2000000b0020604b2667asm16014136wrw.81.2022.04.06.04.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 04:31:23 -0700 (PDT)
Message-ID: <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
Date:   Wed, 6 Apr 2022 13:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
Content-Language: en-US
To:     Lucas Tanure <tanure@linux.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <20220326102229.421718-3-tanure@linux.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220326102229.421718-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 26/03/2022 11:22, Lucas Tanure wrote:
> The duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL
> clock.
> 
> Move the duty cyle to 50% for 100Khz or lower
> clocks, and (40% High SCL / 60% Low SCL) duty
> cycle for clocks above 100Khz.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
>   1 file changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 4b4a5b2d77ab..b913ba20f06e 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
>   static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   {
>   	unsigned long clk_rate = clk_get_rate(i2c->clk);
> -	unsigned int div;
> +	unsigned int div_h, div_l;
>   
> -	div = DIV_ROUND_UP(clk_rate, freq);
> -	div -= FILTER_DELAY;
> -	div = DIV_ROUND_UP(div, i2c->data->div_factor);
> +	if (freq <= 100000) {

You should use I2C_MAX_STANDARD_MODE_FREQ instead here

> +		div_h = DIV_ROUND_UP(clk_rate, freq);
> +		div_l = DIV_ROUND_UP(div_h, 4);
> +		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> +	} else {
> +	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> +	 * minimum HIGH is least 0.6us.
> +	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> +	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> +	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> +	 * Duty = H/(H + L) = 2/5
> +	 */

Please move the comment before the if()

> +		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> +		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> +	}
>   
>   	/* clock divider has 12 bits */
> -	if (div > GENMASK(11, 0)) {
> +	if (div_h > GENMASK(11, 0)) {
>   		dev_err(i2c->dev, "requested bus frequency too low\n");
> -		div = GENMASK(11, 0);
> +		div_h = GENMASK(11, 0);
> +	}
> +	if (div_l > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_l = GENMASK(11, 0);
>   	}
>   
>   	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> -			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
>   
>   	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> -			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> +
> +
> +	/* set SCL low delay */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> +			   (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);

You could use FIELD_PREP() here

>   
> -	/* Disable HIGH/LOW mode */
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
>   
> -	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> -		clk_rate, freq, div);
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
>   }
>   
>   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)

I looked at different amlogic downstream sources, and those match the recommended
calculations.

So with the legacy back for Meson6, it will be OK.

Neil

