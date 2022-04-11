Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9801D4FB4CD
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Apr 2022 09:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245416AbiDKHba (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Apr 2022 03:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245398AbiDKHbW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Apr 2022 03:31:22 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5938026DF
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:29:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id r64so9289151wmr.4
        for <linux-i2c@vger.kernel.org>; Mon, 11 Apr 2022 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BjIUIVHFRbARmdqJRe7JFcL0nh+4wGOuv41+r40fWdI=;
        b=MuLfQOFk/KAOARiT/isjKEZQH3RO9g/f2PwC4L1MEy1HX5VN2i+1JchNxj/7//NHDI
         5FZjHGf5bAGnHqpBIlpYlxF0Tsaa6xrD7BqcpF+WLnes4Mwjioohb2J+nbj2r5221gHi
         CnLYsVA3qKZz+Rl5IprSZPYiygSlElE8OWzgBcrOJubleRMgITm2vtSthqHwoXc0PWIJ
         dxbxUQlRplARqIyVNT8nnNtzPTNRdhR2eS6pE3N/xa8exOwcKl4rQ+mZ/rhFx2zA8yrT
         NNSINcsWrnVYOp2du2V2SVaPCKoKzgTnZpgvuJBZGFfmYNWMyEdwx7Ra8dFl1z1X3tWX
         Ts6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=BjIUIVHFRbARmdqJRe7JFcL0nh+4wGOuv41+r40fWdI=;
        b=oJ25ooUKxVOQoOAUzmTnINIxjCS5ewfU9XIU8O+oK8X4t/wNANGfEFdkw3319NRaU8
         YfzLEzoQ+qRA0/PZymXGqgwIduYvkIoM1fZbSgpJy0Grr0u0P/78/LpaH7+qetv6m1Xt
         LmHFzdGIlgJWG+S8Irkm9ybHZF/KJJzjpiinO70XLzGMW/Zi8n/JXKJznuugIBL+lNep
         2XNsdpk4JKYJuw/tEHKmt3PxPht3/nh6lJGzuo/RhEaze29hKjmyz+YWCDZv09Hu2REd
         fSJFFbYCFzfF0nBozwkvU3LyNUZPoDnFK/NtSV+t+9l42NHwpNb5xodrqlWuPaqo94Fu
         iNtQ==
X-Gm-Message-State: AOAM5324F/ETS7KSGuKnrkvwwuyzvyEI/+qus2KtgqfBCnkp3zp2nCYV
        +Y2WKsnEtg2/32jj2A4zmJVwtw==
X-Google-Smtp-Source: ABdhPJzmfll2qXYcZqhlizr+zOKwVsn5I9nhVKuGkB89gKjHT4X7JIp8cZT8MNzxRKbCeRL3pocFww==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id s2-20020a7bc382000000b003882e7649edmr27994701wmj.195.1649662147772;
        Mon, 11 Apr 2022 00:29:07 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5? ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
        by smtp.gmail.com with ESMTPSA id v5-20020adfe4c5000000b001edc1e5053esm25261851wrm.82.2022.04.11.00.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 00:29:07 -0700 (PDT)
Message-ID: <d6fabb26-8a29-fd5a-c03e-c059b28c9407@baylibre.com>
Date:   Mon, 11 Apr 2022 09:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] i2c: meson: Use 50% duty cycle for I2C clock
Content-Language: en-US
To:     Lucas Tanure <tanure@linux.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-3-tanure@linux.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/04/2022 18:43, Lucas Tanure wrote:
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
>   drivers/i2c/busses/i2c-meson.c | 70 +++++++++++++++++++++++++++++-----
>   1 file changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 4b4a5b2d77ab..50dab123380a 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -65,10 +65,6 @@ enum {
>   	STATE_WRITE,
>   };
>   
> -struct meson_i2c_data {
> -	unsigned char div_factor;
> -};
> -
>   /**
>    * struct meson_i2c - Meson I2C device private data
>    *
> @@ -109,6 +105,10 @@ struct meson_i2c {
>   	const struct meson_i2c_data *data;
>   };
>   
> +struct meson_i2c_data {
> +	void (*set_clk_div)(struct meson_i2c *i2c, unsigned int freq);
> +};
> +
>   static void meson_i2c_set_mask(struct meson_i2c *i2c, int reg, u32 mask,
>   			       u32 val)
>   {
> @@ -137,14 +137,62 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
>   	i2c->num_tokens++;
>   }
>   
> -static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> +static void meson_gxbb_axg_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> +{
> +	unsigned long clk_rate = clk_get_rate(i2c->clk);
> +	unsigned int div_h, div_l;
> +
> +	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> +	 * minimum HIGH is least 0.6us.
> +	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> +	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> +	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> +	 * Duty = H/(H + L) = 2/5
> +	 */
> +	if (freq <= I2C_MAX_STANDARD_MODE_FREQ) {
> +		div_h = DIV_ROUND_UP(clk_rate, freq);
> +		div_l = DIV_ROUND_UP(div_h, 4);
> +		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> +	} else {
> +		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> +		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> +	}
> +
> +	/* clock divider has 12 bits */
> +	if (div_h > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_h = GENMASK(11, 0);
> +	}
> +	if (div_l > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_l = GENMASK(11, 0);
> +	}
> +
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
> +
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> +
> +	/* set SCL low delay */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> +			   FIELD_PREP(REG_SLV_SCL_LOW_MASK, div_l));
> +
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
> +
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
> +}
> +
> +static void meson6_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   {
>   	unsigned long clk_rate = clk_get_rate(i2c->clk);
>   	unsigned int div;
>   
>   	div = DIV_ROUND_UP(clk_rate, freq);
>   	div -= FILTER_DELAY;
> -	div = DIV_ROUND_UP(div, i2c->data->div_factor);
> +	div = DIV_ROUND_UP(div, 4);
>   
>   	/* clock divider has 12 bits */
>   	if (div > GENMASK(11, 0)) {
> @@ -472,7 +520,9 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
>   			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
> -	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
> +	if (!i2c->data->set_clk_div)
> +		return -EINVAL;
> +	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
>   
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret < 0) {
> @@ -494,15 +544,15 @@ static int meson_i2c_remove(struct platform_device *pdev)
>   }
>   
>   static const struct meson_i2c_data i2c_meson6_data = {
> -	.div_factor = 4,
> +	.set_clk_div = meson6_i2c_set_clk_div,
>   };
>   
>   static const struct meson_i2c_data i2c_gxbb_data = {
> -	.div_factor = 4,
> +	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
>   };
>   
>   static const struct meson_i2c_data i2c_axg_data = {
> -	.div_factor = 3,
> +	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
>   };
>   
>   static const struct of_device_id meson_i2c_match[] = {

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
