Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9887153930F
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 16:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345209AbiEaOVX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 10:21:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343829AbiEaOVW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 10:21:22 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6E070374;
        Tue, 31 May 2022 07:21:21 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so2416034pjt.4;
        Tue, 31 May 2022 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e+YRi5ZOr2MLW+Tle96gopRdE1XvQCieBzraMEv4iPs=;
        b=qlzQcOrv+u1a2hYZ//w1+tZ6Dy4cC31GyL8IosNVbXW3FXt+tv4J3gZxP+pCTBOxDI
         aFwGTKaeONPspS7qVC9m+lIAxmbIJqiYhNgoSIuvFGsSj6ql7OgJADCNbI6UH6zSAxrP
         aJWqXmBPIYppJk5Vk1kqehP1d2ktTejHFM56usOroY2Xg4RUO0ukFGyCKOjXThBasFla
         RQ+BnNx98JpUHvyGbotdlTKgnOTnScMPGGPlVaakWuZiJcOfzVDRmdFbL/e6OrcP1c17
         lC73pLugdu7dcgwGvpLf/roMGgqxsFmNNAEfqES7rztep0NQg4yQJcocBM6uPnEEKco0
         R6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e+YRi5ZOr2MLW+Tle96gopRdE1XvQCieBzraMEv4iPs=;
        b=4ffr9vNGC2xQ7Vv0x+0gRtyN4YbhFO41k77Qs4W1jWAV32n9ZFEKT7s8EsKXITnBPm
         EjgCexfJtxyMbXCrvBIY5Wt+4r9uYa0bx4JJRmKfpZ+a8MqPTzXywG93bJbBUHf9vEmm
         L0dsdKtsAehG9oRmzkSYU2EGdy6rv05GpcTphmkt7y11d1TKJhg0f25tNyc1WxKUtR2E
         A8O0AfdlVKsUhiBGfpds97YM/XeYX6dLPBUphVt+Siq23iI9jk8t2UkwEOFulmEEYCwT
         iuk5lvWkc22nR7DnWVwoCG28VrqZJgxbFnNCUjddkE/y/HtmfUlnfEqI9zgOstvgekiW
         VuLA==
X-Gm-Message-State: AOAM533QJ4HmgNOiJRQyoItXocxSh4DHe6lsW1UUlXgQ8LqufhKlh03I
        J1Uu/8ywkIgFLYA+p/rMSUs=
X-Google-Smtp-Source: ABdhPJyS06IKdXhLxyEuL4sj0D6SwuYAGcAfDbedySLbvp8lIxmkfRHP6apMloK9eqlIHW1ubhXiSA==
X-Received: by 2002:a17:90a:9318:b0:1e0:b957:ffda with SMTP id p24-20020a17090a931800b001e0b957ffdamr29338637pjo.199.1654006880917;
        Tue, 31 May 2022 07:21:20 -0700 (PDT)
Received: from [192.168.1.24] (1-162-164-147.dynamic-ip.hinet.net. [1.162.164.147])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b0016156e0c3cbsm11378039plr.156.2022.05.31.07.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 07:21:20 -0700 (PDT)
Message-ID: <a38b1409-f248-e059-0f99-fc76a82c840c@gmail.com>
Date:   Tue, 31 May 2022 22:21:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/1] aspeed: i2c: add manual clock setup feature
Content-Language: en-US
To:     Patrick Williams <patrick@stwcx.xyz>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Porin Lai <potin.lai@quantatw.com>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220530114056.8722-1-potin.lai.pt@gmail.com>
 <YpYcZn+Zsz3g7xl+@heinlein.stwcx.org.github.beta.tailscale.net>
From:   Potin Lai <potin.lai.pt@gmail.com>
In-Reply-To: <YpYcZn+Zsz3g7xl+@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Patrick Williams 於 31/05/2022 9:47 pm 寫道:
> On Mon, May 30, 2022 at 07:40:56PM +0800, Potin Lai wrote:
>> From: Porin Lai <potin.lai.pt@gmail.com>
>>
>> Add properties for manual tuning i2c clock timing register.
>>
>> * aspeed,i2c-manual-clk: Enable aspeed i2c clock manual setup
>> * aspeed,i2c-base-clk-div: Base Clock divisor (tBaseClk)
>> * aspeed,i2c-clk-high-cycle: Cycles of clock-high pulse (tClkHigh)
>> * aspeed,i2c-clk-low-cycle: Cycles of clock-low pulse (tClkLow)
> Do we need to add these to
> Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml ?

Sorry, I wasn't notice the yaml file, I will update the documentation in next version.

Potin

>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-aspeed.c | 55 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 67e8b97c0c95..1f4b5c4b5bf4 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -898,6 +898,56 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>>  	return 0;
>>  }
>>  
>> +/* precondition: bus.lock has been acquired. */
>> +static int aspeed_i2c_manual_clk_setup(struct aspeed_i2c_bus *bus)
>> +{
>> +	u32 divisor, clk_high, clk_low, clk_reg_val;
>> +
>> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-base-clk-div",
>> +				     &divisor) != 0) {
>> +		dev_err(bus->dev, "Could not read aspeed,i2c-base-clk-div\n");
>> +		return -EINVAL;
>> +	} else if (divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
>> +		dev_err(bus->dev, "Invalid aspeed,i2c-base-clk-div: %u\n",
>> +			divisor);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-high-cycle",
>> +				     &clk_high) != 0) {
>> +		dev_err(bus->dev, "Could not read aspeed,i2c-clk-high-cycle\n");
>> +		return -EINVAL;
>> +	} else if (clk_high > ASPEED_I2CD_TIME_SCL_REG_MAX) {
>> +		dev_err(bus->dev, "Invalid aspeed,i2c-clk-high-cycle: %u\n",
>> +			clk_high);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (device_property_read_u32(bus->dev, "aspeed,i2c-clk-low-cycle",
>> +				     &clk_low) != 0) {
>> +		dev_err(bus->dev, "Could not read aspeed,i2c-clk-low-cycle\n");
>> +		return -EINVAL;
>> +	} else if (clk_low > ASPEED_I2CD_TIME_SCL_REG_MAX) {
>> +		dev_err(bus->dev, "Invalid aspeed,i2c-clk-low-cycle: %u\n",
>> +			clk_low);
>> +		return -EINVAL;
>> +	}
>> +
>> +	clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
>> +	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
>> +			ASPEED_I2CD_TIME_THDSTA_MASK |
>> +			ASPEED_I2CD_TIME_TACST_MASK);
>> +	clk_reg_val |= (divisor & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK)
>> +			| ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
>> +			   & ASPEED_I2CD_TIME_SCL_HIGH_MASK)
>> +			| ((clk_low << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
>> +			   & ASPEED_I2CD_TIME_SCL_LOW_MASK);
>> +	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
>> +	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
>> +
>> +	return 0;
>> +}
>> +
>>  /* precondition: bus.lock has been acquired. */
>>  static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>>  			     struct platform_device *pdev)
>> @@ -908,7 +958,10 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>>  	/* Disable everything. */
>>  	writel(0, bus->base + ASPEED_I2C_FUN_CTRL_REG);
>>  
>> -	ret = aspeed_i2c_init_clk(bus);
>> +	if (of_property_read_bool(pdev->dev.of_node, "aspeed,i2c-manual-clk"))
>> +		ret = aspeed_i2c_manual_clk_setup(bus);
>> +	else
>> +		ret = aspeed_i2c_init_clk(bus);
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -- 
>> 2.17.1
>>
