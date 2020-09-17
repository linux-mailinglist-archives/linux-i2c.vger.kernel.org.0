Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A964A26DF12
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgIQPGY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727925AbgIQPFo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:05:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD55C06174A;
        Thu, 17 Sep 2020 08:05:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so2350761ljj.4;
        Thu, 17 Sep 2020 08:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hAPIgTCNPdgjHFBv2CJySB1bapj6l2cyVcd7Nd46x9c=;
        b=We896UH9CB7ZvM0RZZ++V0Il75fD9sNrmA2tNljgonyhX/UpH79G6pwEzuQ4MXOw2T
         Jcs/VYM6s4LvascGFAFKQ7QZ70GSnXZGD/Z9S2YJP3tiDDn3gRCHcQie1e7vdibUxsX+
         MPfiFVB48U/HKHe8QQg8tD4J8ik65C8ipGWQa7b0InGLhSa8D2uH6twEtJA/5GqIAXfg
         SM+NC+TpLyMgAQb2K9A/wSh9NFw6/cfnMpfVs0Ko9sqCZloLX2OWrPXbUok18u8knwQs
         kFFu9IVoNRGbEUX8ESF7Nkl7tG6NZZQOReV3u1XC8fAwm03qKhaweGc/f66BE4OhxWGS
         kQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hAPIgTCNPdgjHFBv2CJySB1bapj6l2cyVcd7Nd46x9c=;
        b=bEaiOdBmHiSigvtgG4WwI8wOOepFZpEBOHaq3VRbgCJCRuDsQSKlwbyGLXw+CAXlcd
         1proiu9Uh4KEXCiqg02r0dh0zwWAAM571/u1iwqv5fHBHeI5OoF4aRIU4jptXm/s+cuX
         TEGmLS8tOq9ZmSMPchTRmbKwFGZ+Ll4sPzg3GQHWMrcCrvdr+eXKlZ80PaAyz8/mSfyx
         BkTOua/+AxM6NDVabcK+7DVksiCP3CHFIs0LHjBwFPnWXQ4fy8Sd8b6TNOvHqcjvfJyu
         bhVCcEMr0rT0Vbg39HhxN5QgWowwBxa7WL7KKNgwuHDIXP9w7erJ6mb4RPg/756QFc5d
         2HNg==
X-Gm-Message-State: AOAM532qt2dLpPEDbgP2NrSsWBf7JL6stqXhFheryZZ80vaU1nC7DAI2
        BDSUpvGIaD3V+q9YvzqZkAfn5vxp6B0=
X-Google-Smtp-Source: ABdhPJzms7HiYjaYBDvlZrZsToHUa4rL7emD9/dHH4LZsS3ORuF91/txkL1pcBocN6eIyJ5xjnfa+Q==
X-Received: by 2002:a2e:7806:: with SMTP id t6mr10938187ljc.48.1600355142482;
        Thu, 17 Sep 2020 08:05:42 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m186sm5203409lfd.166.2020.09.17.08.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:05:41 -0700 (PDT)
Subject: Re: [PATCH v7 25/34] i2c: tegra: Factor out register polling into
 separate function
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-26-digetx@gmail.com> <20200917115802.GD3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de0bb416-b5c4-1f8a-d703-ef2e5466ac53@gmail.com>
Date:   Thu, 17 Sep 2020 18:05:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917115802.GD3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:58, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:57AM +0300, Dmitry Osipenko wrote:
>> Factor out register polling into a separate function in order to remove
>> boilerplate code and make code cleaner.
>>
>> Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 57 +++++++++++++++-------------------
>>  1 file changed, 25 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 405b87e28a98..e071de9ce106 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -514,10 +514,24 @@ static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
>>  	i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
>>  }
>>  
>> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
>> +				   u32 reg, u32 mask, u32 delay_us,
>> +				   u32 timeout_us)
>> +{
>> +	void __iomem *addr = i2c_dev->base + tegra_i2c_reg_addr(i2c_dev, reg);
>> +	u32 val;
>> +
>> +	if (!i2c_dev->is_curr_atomic_xfer)
>> +		return readl_relaxed_poll_timeout(addr, val, !(val & mask),
>> +						  delay_us, timeout_us);
>> +
>> +	return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
>> +						 delay_us, timeout_us);
>> +}
>> +
>>  static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  {
>> -	u32 mask, val, offset, reg_offset;
>> -	void __iomem *addr;
>> +	u32 mask, val, offset;
>>  	int err;
>>  
>>  	if (i2c_dev->hw->has_mst_fifo) {
>> @@ -534,16 +548,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  	val |= mask;
>>  	i2c_writel(i2c_dev, val, offset);
>>  
>> -	reg_offset = tegra_i2c_reg_addr(i2c_dev, offset);
>> -	addr = i2c_dev->base + reg_offset;
>> -
>> -	if (i2c_dev->is_curr_atomic_xfer)
>> -		err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
>> -							1000, 1000000);
>> -	else
>> -		err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
>> -						 1000, 1000000);
>> -
>> +	err = tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000000);
>>  	if (err) {
>>  		dev_err(i2c_dev->dev, "failed to flush FIFO\n");
>>  		return err;
>> @@ -553,30 +558,18 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>>  
>>  static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
>>  {
>> -	unsigned long reg_offset;
>> -	void __iomem *addr;
>> -	u32 val;
>>  	int err;
>>  
>> -	if (i2c_dev->hw->has_config_load_reg) {
>> -		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
>> -		addr = i2c_dev->base + reg_offset;
>> -		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>> +	if (!i2c_dev->hw->has_config_load_reg)
>> +		return 0;
>>  
>> -		if (i2c_dev->is_curr_atomic_xfer)
>> -			err = readl_relaxed_poll_timeout_atomic(
>> -						addr, val, val == 0, 1000,
>> -						I2C_CONFIG_LOAD_TIMEOUT);
>> -		else
>> -			err = readl_relaxed_poll_timeout(
>> -						addr, val, val == 0, 1000,
>> -						I2C_CONFIG_LOAD_TIMEOUT);
>> +	i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
>>  
>> -		if (err) {
>> -			dev_warn(i2c_dev->dev,
>> -				 "timeout waiting for config load\n");
>> -			return err;
>> -		}
>> +	err = tegra_i2c_poll_register(i2c_dev, I2C_CONFIG_LOAD, 0xffffffff,
>> +				      1000, I2C_CONFIG_LOAD_TIMEOUT);
>> +	if (err) {
>> +		dev_warn(i2c_dev->dev, "timeout waiting for config load\n");
>> +		return err;
>>  	}
> 
> The deindentation in this hunk is messing up the diffstat in my opinion.
> It would probably be worth splitting that into a separate patch to make
> it more evident that this patch actually removes boilerplate.

This is intentional and it's mentioned in the v7 changelog.

Previously there was another patch that did what you're suggesting, but
Andy Shevchenko objected that it was causing a "ping-pong" code changes
where one patch did a change and then next patch changes the changed
code again.
