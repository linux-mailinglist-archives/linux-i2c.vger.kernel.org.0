Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604D14F3095
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 14:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242547AbiDEKcm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 06:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346139AbiDEJob (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 05:44:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B9AC8BFD
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 02:30:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id w21so18383211wra.2
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8lDLVrPOsnw4Mz9TQAfirGfK7fTb+NPu+8OdJjj0wJw=;
        b=D/fsFEMj3S1FwbkgaUGI9wGYM8PgxuWJnZ9/rvLsnwppX42bfgnlEmILL5uEyrb1Dx
         TDVq3xjNDRJFTeu1j6W3yPiFKrnjH7tJmNNXbo9FS2bGC5cAf7ApBrM2BS3D++hK6RZs
         YNjS3TC3lzp85hnBWn7yFlJykUSRgjrEXpzcdVoJcKyYVGifGEBZUoPZ9N8q28grjk35
         ZArcz7KbC9iCeY0Q3Er/pxq1lwUxyenW+Pu/ybiH0ZBZ5vU15SgAt3LdZmGHovo7WiY7
         H7VMXvwnfUWWS1R4d6zDG+aE5yzSwu0NrwUc3doSMxJ2nygQ5aK3WmWgNbsHwGIxltJR
         mmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8lDLVrPOsnw4Mz9TQAfirGfK7fTb+NPu+8OdJjj0wJw=;
        b=lcSuuoyc5kUOsF3uB26ElJxK7EmszRGuEUJRJxg8qyo446py5EY3/sQOeuV35O223K
         yad9IotwPY4y/sjwSYfyqK97sLfV68MzB/uSUqyn+FS9qpVCzDwvrb4nFUXZcPGFvAMR
         Edsg485unDYfs5FOjaU61mGDkuYYi0OVt4GCMF1yG40rW/WkCc6Sfg/dIMDkezbjjsZf
         4pehC8NRIY6ujSwPXBBXAN+NmkHvr2HhcyXay+7lzIroDcg0kIXL+MTFok9ezVTHDpQ7
         8lWgIlijZdGCd4GLmvg2+xc2LZTnNwEOMUg9fBgL8H87XsifsnlmDMd42CaD9RKjEkfP
         l57g==
X-Gm-Message-State: AOAM533NC/FYvFTZkGhSXi92yvBk4jvhkEvgBM37cgM0k6XESWEmIYGd
        jchW51SkYEqsx2ymAV5XYb6FgQ==
X-Google-Smtp-Source: ABdhPJxWxh23GMVPd0s31x6hl+V46TL89GpDJ9HP9Iw71kYriB2IoNBqOfQ1QwndSJF4td2CBI0L3w==
X-Received: by 2002:a05:6000:137c:b0:206:17dd:d67d with SMTP id q28-20020a056000137c00b0020617ddd67dmr1854632wrz.288.1649151008526;
        Tue, 05 Apr 2022 02:30:08 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed? ([2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed])
        by smtp.gmail.com with ESMTPSA id bg20-20020a05600c3c9400b0037fa5c422c8sm1716169wmb.48.2022.04.05.02.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 02:30:07 -0700 (PDT)
Message-ID: <29b899b0-5c3e-b1af-c8a7-361419673cfd@baylibre.com>
Date:   Tue, 5 Apr 2022 11:30:06 +0200
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
>   
> -	/* Disable HIGH/LOW mode */
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);


While reading registers documentation, it's written:
```
SCL Low delay. This is a new feature in M8baby. In the previous M8baby design, the SCL low time was controlled
by bits[21:12] of the register above. In this design, the SCL delay is controlled independently by these bits.
```

Could you keep the previous calculation for Meson6, with DIV_FACTOR fixed to 4, and use the new calculation only for GXBB & AXG ?

To ease this, replace the div_factor with a clock calculation function pointer in meson_i2c_data, and pass the old
one for Meson6 and the new one for GXBB & AXG.
This only slightly changes patch 2 and changes patch 3 from a removal to a variable replace.

>   
> -	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> -		clk_rate, freq, div);
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
>   }
>   
>   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)


Thanks,
Neil
