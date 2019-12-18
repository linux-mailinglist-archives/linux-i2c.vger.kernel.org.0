Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F8312437B
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 10:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbfLRJk6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 04:40:58 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:46386 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfLRJk6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Dec 2019 04:40:58 -0500
Received: from [10.10.222.226] (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D98CA281DD0;
        Wed, 18 Dec 2019 09:34:30 +0000 (UTC)
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
 transceivers
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org>
 <c3885b01-e6ec-1b67-6e48-69e3fc40bb62@linux.intel.com>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <96d1182a-d9ba-78ce-c483-6be5389e3aba@zonque.org>
Date:   Wed, 18 Dec 2019 10:40:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <c3885b01-e6ec-1b67-6e48-69e3fc40bb62@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Pierre,

Thanks for looking into this!

On 12/17/19 8:16 PM, Pierre-Louis Bossart wrote:
> is the datasheet public? I thought it was only available under NDA.

It was until recently, but it is now public:


https://www.analog.com/media/en/technical-documentation/user-guides/AD242x_TRM_Rev1.1.pdf

>> +    master->sync_clk = devm_clk_get(dev, "sync");
>> +    if (IS_ERR(master->sync_clk)) {
>> +        ret = PTR_ERR(master->sync_clk);
>> +        if (ret != -EPROBE_DEFER)
>> +            dev_err(dev, "failed to get sync clk: %d\n", ret);
>> +
>> +        return ret;
>> +    }
>> +
>> +    if (of_property_read_u32(dev->of_node, "clock-frequency",
>> +                 &master->sync_clk_rate)) {
>> +        ret = clk_set_rate(master->sync_clk, master->sync_clk_rate);
> 
> shouldn't you check the rate before setting it?
>
>> +        if (ret < 0) {
>> +            dev_err(dev, "Cannot set sync clock rate: %d\n", ret);
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    master->sync_clk_rate = clk_get_rate(master->sync_clk);
>> +    if (master->sync_clk_rate != 44100 && master->sync_clk_rate !=
>> 48000) {
>> +        dev_err(dev, "SYNC clock rate %d is invalid\n",
>> +            master->sync_clk_rate);
>> +        return -EINVAL;
>> +    }
> 
> this is a bit odd, you set the rate in case there is a property but get
> it anyways. the last block could be an else?

The idea is: if 'clock-frequency' is given, we use it to set the clock,
otherwise we rely on the clock having one of the two allowed rates. This
way, we also catch setups where the clock provider cannot generated the
desired frequency, or where the value of 'clock-frequency' is illegal.

>> +    ret = clk_prepare_enable(master->sync_clk);
>> +    if (ret < 0) {
>> +        dev_err(dev, "failed to enable sync clk: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Master node setup */
>> +
>> +    ret = regmap_write(regmap, AD242X_CONTROL,
>> +               AD242X_CONTROL_MSTR | AD242X_CONTROL_SOFTRST);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = ad242x_wait_for_irq(master, &master->run_completion, 10);
> 
> what is 10?

Milliseconds. The parameter needs to get a better name I figure.


Thanks,
Daniel
