Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEB826DFFC
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgIQPpb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgIQPOw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:14:52 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9574DC06174A;
        Thu, 17 Sep 2020 08:13:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id n25so2376181ljj.4;
        Thu, 17 Sep 2020 08:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gum9DdcPqTqgI+Z4PbKKo27wTlCKipvkfDL7Z94Tv9U=;
        b=p6X4LHoOdqiI26F0qasmwGL7GizIELP6ApEIvGCI1OOoLchntoKQ741T++M2EpnhOo
         OZ2xdvrCKYi64rOCbFfpzMmI3WIAWq2yCvWu45QHlLHpxyu8JTReEZBueuVTS9Kd1k3j
         RsW7kFlqweL4iIOCnbZ8Cvwfe4QZNFyNXKgNg9uO0keKKFiN8GzEW8tTxVpPS/XrNnQJ
         z090v0UtPrXORST1Bi+Iic807qR07cdalELu0gkTEU57YGxCg7Zdm01pgkNF/uWjCkOE
         Trh3tuyWzfp5jf6KcjLO3aJ9w21dw4YJlcH7q3eQv6vq/di5o7jqmQxHwwrEE+iBsCgy
         Iv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gum9DdcPqTqgI+Z4PbKKo27wTlCKipvkfDL7Z94Tv9U=;
        b=rkCnCZB0T9NObpxYx3Q6YMoW4SdscJ2kbmfNLR3NwbLnlrHANe4f8LDIUVkIE514Zq
         RHs/PRLB88MeT08n/ZJ0jypqViLGIGwcr2hxg+4hsZMHCPw+w5W/ijnQKAKHZT7yjGPX
         neXsxA5RwIYMwoKeSJa210hTKyMhwhkxdS8rhQ4Os7mjtfHvuhy2UbDVlvWhx79yjk/8
         KFyx8JES6gB/Gx9y8HtizuZFah+LcNd74APK4emz0xtgQqQ09zgQLD1Q/HOz1r4I4xwM
         XMASkALMjJnB+EyGpUowlQaNLkK8lxg1Cr2FAAk8ys8+H6PZmfWczDQh8N2Cm0diyPcN
         0JGQ==
X-Gm-Message-State: AOAM533oAx/N50O5laQkvZuYOiAtfiTcSosxlEQfFtLLEVrZ+toRVo38
        OcyFwFJ4DX/ULrjEwn5kd7fF9gw9sFE=
X-Google-Smtp-Source: ABdhPJz9PWrXh5LmthwX9pNFwQ9PX0tq7AfXtdAakbW1J3ctyb+7jk0hpck+SbBmvVk48YmaHJM8bw==
X-Received: by 2002:a05:651c:3c3:: with SMTP id f3mr9754284ljp.90.1600355618766;
        Thu, 17 Sep 2020 08:13:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b1sm5245010lfi.264.2020.09.17.08.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:13:38 -0700 (PDT)
Subject: Re: [PATCH v7 29/34] i2c: tegra: Improve formatting of variables
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-30-digetx@gmail.com> <20200917121640.GH3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6957eafb-8be2-3323-9c55-bb6eee6ab6bf@gmail.com>
Date:   Thu, 17 Sep 2020 18:13:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917121640.GH3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 15:16, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:40:01AM +0300, Dmitry Osipenko wrote:
>> Reorder definition of variables in the code to have them sorted by length
>> and grouped logically, also replace "unsigned long" with "u32". Do this in
>> order to make code easier to read.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 97 ++++++++++++++++------------------
>>  1 file changed, 45 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index ac40c87f1c21..2376f502d299 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -259,42 +259,48 @@ struct tegra_i2c_hw_feature {
>>   */
>>  struct tegra_i2c_dev {
>>  	struct device *dev;
>> -	const struct tegra_i2c_hw_feature *hw;
>>  	struct i2c_adapter adapter;
>> -	struct clk *div_clk;
>> -	struct clk_bulk_data *clocks;
>> -	unsigned int nclocks;
>> +
>> +	const struct tegra_i2c_hw_feature *hw;
>>  	struct reset_control *rst;
>> -	void __iomem *base;
>> -	phys_addr_t base_phys;
>>  	unsigned int cont_id;
>>  	unsigned int irq;
>> -	bool is_dvc;
>> -	bool is_vi;
>> +
>> +	phys_addr_t base_phys;
>> +	void __iomem *base;
>> +
>> +	struct clk_bulk_data *clocks;
>> +	unsigned int nclocks;
>> +
>> +	struct clk *div_clk;
>> +	u32 bus_clk_rate;
>> +
>>  	struct completion msg_complete;
>> +	size_t msg_buf_remaining;
>>  	int msg_err;
>>  	u8 *msg_buf;
>> -	size_t msg_buf_remaining;
>> -	bool msg_read;
>> -	u32 bus_clk_rate;
>> -	bool is_multimaster_mode;
>> +
>> +	struct completion dma_complete;
>>  	struct dma_chan *tx_dma_chan;
>>  	struct dma_chan *rx_dma_chan;
>> +	unsigned int dma_buf_size;
>>  	dma_addr_t dma_phys;
>>  	u32 *dma_buf;
>> -	unsigned int dma_buf_size;
>> -	bool is_curr_dma_xfer;
>> -	struct completion dma_complete;
>> +
>> +	bool is_multimaster_mode;
>>  	bool is_curr_atomic_xfer;
>> +	bool is_curr_dma_xfer;
>> +	bool msg_read;
>> +	bool is_dvc;
>> +	bool is_vi;
>>  };
>>  
>> -static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
>> -		       unsigned long reg)
>> +static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
> 
> I actually prefer unsigned long/int over u32 for offsets because it
> makes it clearer that this is not in fact a 32-bit value that we're
> writing into a register. This is especially true for these register
> accessors where the "offset" is called "reg" and may be easily
> mistaken for a register value.

That is a bit questionable, at least it definitely won't save me from a
mistake :)
