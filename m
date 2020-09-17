Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F2E26DFAB
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgIQPax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgIQP3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:29:51 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E546FC06174A;
        Thu, 17 Sep 2020 08:27:31 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r24so2412398ljm.3;
        Thu, 17 Sep 2020 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ayxZ/apLrEsT1wotEfQehRQnLkINjTczpn8uLHl9SZs=;
        b=DJpJIBCp+9h8BU3cFFtUV53GeJ1YpgZyucs9afKIg9xFPsx0DlCXdV932Np4NZFmK3
         gXfukvFcrdbhALcvHA+QnWEYJYgqvj1L7ID3W6omqTkSPJqWfCmtKhUdfR6qSfKwNBgG
         2Khy3ine7vO4vT62jVIV7SY7vJvGf7rs4ZVPukmiaZJBCpSN54a0gIHtxpAlKc92kkr1
         EwRiq3yWmy3l/hBHtOIhkt0kDPETCJsDKEE4LqfbnmFqRDZcZ4/83sJULzEd31ZouAk8
         tKyv0e/3rLkEnXYG1RyHC/yHnWOalPkl4Dw4vECb+JkkRBnjIJIjLWvLDmQjMf/yKERS
         G2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ayxZ/apLrEsT1wotEfQehRQnLkINjTczpn8uLHl9SZs=;
        b=sdfY67Yq3A+vJeQAs8epBPuLqMc0KBNsEpdh+eCf6Sr+qff8cbfgxol1PtHZIMZtnW
         a4gaYlRnDr1202LyBNLLecfvr4cxXZTX/wdH7tqeGBu0B8eBf3w6ZOylSfDiLEkVGyWz
         mUUU995h/mQl3yJ8UWqmkXZzDv0Ga+dKK0PHQI8SFx19ozZcMYJep1xRX6rNh1pCSyYT
         UWYECKnGJBZCBRF9Sk9DokqA2XKDSye0WxqfxoPnSu4gp+hqhWbYsEWy3tl5tof1Xdhz
         UwM2uL7ajvQkOcqg26ecwLhPJ3lDoUbN5HZcecKZnAmq5wwNKVY6Oae79bs8sjUL8wDK
         Jllg==
X-Gm-Message-State: AOAM531oADnpq9B/GWNK6vbS+XcULuiR0907/iluSZsGhhV0j0Y+rSF1
        UBT9CVM+Oo/E3yrdi5sZ+AztsTPpnvc=
X-Google-Smtp-Source: ABdhPJy8d99/Pbv+6/CzgFnGRxlv4uWxZuQ7RuLtQMhsj3Rb+/ghDu8lW3+99++S72u7C/wjlae9QQ==
X-Received: by 2002:a2e:8619:: with SMTP id a25mr10922980lji.390.1600356450050;
        Thu, 17 Sep 2020 08:27:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y21sm6119219ljk.110.2020.09.17.08.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:27:29 -0700 (PDT)
Subject: Re: [PATCH v7 06/34] i2c: tegra: Remove
 i2c_dev.clk_divisor_non_hs_mode member
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-7-digetx@gmail.com> <20200917112541.GR3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <716583f1-60df-f576-16d3-dbb72d12fa54@gmail.com>
Date:   Thu, 17 Sep 2020 18:27:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917112541.GR3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:25, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:38AM +0300, Dmitry Osipenko wrote:
>> The "non_hs_mode" divisor value is fixed, thus there is no need to have
>> the variable i2c_dev.clk_divisor_non_hs_mode struct member. Let's remove
>> it and move the mode selection into tegra_i2c_init() where it can be
>> united with the timing selection.
>>
>> Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++------------------
>>  1 file changed, 21 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 720a75439e91..85ed0e02d48c 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -250,7 +250,6 @@ struct tegra_i2c_hw_feature {
>>   * @msg_buf_remaining: size of unsent data in the message buffer
>>   * @msg_read: identifies read transfers
>>   * @bus_clk_rate: current I2C bus clock rate
>> - * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
>>   * @is_multimaster_mode: track if I2C controller is in multi-master mode
>>   * @tx_dma_chan: DMA transmit channel
>>   * @rx_dma_chan: DMA receive channel
>> @@ -281,7 +280,6 @@ struct tegra_i2c_dev {
>>  	size_t msg_buf_remaining;
>>  	int msg_read;
>>  	u32 bus_clk_rate;
>> -	u16 clk_divisor_non_hs_mode;
>>  	bool is_multimaster_mode;
>>  	struct dma_chan *tx_dma_chan;
>>  	struct dma_chan *rx_dma_chan;
>> @@ -783,6 +781,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>  	u32 val;
>>  	int err;
>>  	u32 clk_divisor, clk_multiplier;
>> +	u32 non_hs_mode;
>>  	u32 tsu_thd;
>>  	u8 tlow, thigh;
>>  
>> @@ -805,24 +804,33 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>>  	if (i2c_dev->is_vi)
>>  		tegra_i2c_vi_init(i2c_dev);
>>  
>> -	/* Make sure clock divisor programmed correctly */
>> -	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
>> -				 i2c_dev->hw->clk_divisor_hs_mode) |
>> -		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE,
>> -				 i2c_dev->clk_divisor_non_hs_mode);
>> -	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
>> -
>> -	if (i2c_dev->bus_clk_rate > I2C_MAX_STANDARD_MODE_FREQ &&
>> -	    i2c_dev->bus_clk_rate <= I2C_MAX_FAST_MODE_PLUS_FREQ) {
>> +	switch (i2c_dev->bus_clk_rate) {
>> +	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
> 
> Is there are particular reason for switching the simple conditional to a
> switch here? The old variant looks much easier to understand to me.

The reason is make it readable :) For me it's too difficult to read > <=
&& { } + no proper indentation.

The switches are more suitable for ranges, IMO. Especially when there
are multiple ranges, and there could be more ranges in the future in
this code.
