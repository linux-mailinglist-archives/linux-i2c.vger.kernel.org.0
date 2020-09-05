Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6560825EB4B
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgIEWIo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgIEWIn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 18:08:43 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF265C061244;
        Sat,  5 Sep 2020 15:08:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id u27so5629859lfm.13;
        Sat, 05 Sep 2020 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8MoLpRkBfSBRX/tGugQ+DszGpTDOMxPXdZr3qQMsksg=;
        b=Dcwm1rE6sy/AQgDcUMWsBXrmBU1E+t1K3CGdxIDOyyn13yLOZYeNlBWljrWE3KW11+
         ADtRvVNAq2oGO+ttYkTeUsIB0q+cUJZ1mW2nLqsgjIY8LWM8WWys6ED+nFzYqm9u2KGt
         Rb1LJ1kR514fvxT9EfLlIcPf203AK5074hGT0vocAEZrPi/f/ngCMkgtEkbBt5tBo08h
         08syr6svVSKKZc3D1NjZMDVmiUjbAYq2zaEO9CGuiIBd0lBpQItQ74SYfYGPeI6TdXlL
         U5O+bek1ky6Wgmuq5B1O/unVqdDtrnxmjOXDOAPLRBWJZLPPVSPII6foKPtZmr8l7dRJ
         UeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8MoLpRkBfSBRX/tGugQ+DszGpTDOMxPXdZr3qQMsksg=;
        b=KA3BzOw1n8xoQqtgE1kQ1/Y3c9DeWvJfCKnTQgru3O5W68+NBdaN4uR3w/uv804ZUB
         ZDysDaK+0AOmd/H3FQjXnNtLEpcM80MBNMqOgPUtybgd3d+VX64E6HyPfO/SEDdP1o4L
         nYnkBlKDSap2p4eO2zF8McnDD3uy3Kh5tWpGkyDLrPBnh9KEknS2yMrrU8OqqP6F9M74
         iLbNKeWT/63iH45M2hgwTdUjioSZ5+ScOj2wFmJXP1VsonQ2SPkjTUEKEPHUSGVsCtRZ
         j2+uN/QwzsI/MkN7YkkLAI3bk8SXAyEZBPS09gWGY7R3o7Jaj1GJk0E3HRpEBlTJXVqR
         64Cg==
X-Gm-Message-State: AOAM532fruyLNg2L9lHRzMUIuvy5zYCaFd178p9ZsMvbNNfurMA9QN3U
        7U+SO0El8LjRPHIZzMJlh1guQIha/9o=
X-Google-Smtp-Source: ABdhPJxou3N3a4bySh1u+0/phGPIwz21KA9EbhpfkV53yGkEfvdfdxRvar55KWcpxMt8LdNWD3agZw==
X-Received: by 2002:ac2:5de8:: with SMTP id z8mr6817344lfq.204.1599343720193;
        Sat, 05 Sep 2020 15:08:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j23sm2441730ljh.96.2020.09.05.15.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 15:08:39 -0700 (PDT)
Subject: Re: [PATCH v4 10/31] i2c: tegra: Use clk-bulk helpers
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-11-digetx@gmail.com>
 <20200905215608.GA18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fe15f155-becf-5e8e-ce92-962e193c9b14@gmail.com>
Date:   Sun, 6 Sep 2020 01:08:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905215608.GA18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 00:56, Michał Mirosław пишет:
> On Sat, Sep 05, 2020 at 11:41:30PM +0300, Dmitry Osipenko wrote:
>> Use clk-bulk helpers and factor out clocks initialization into separate
>> function in order to make code cleaner.
> [...]
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
> [...]
>>  static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
>>  	.has_continue_xfer_support = true,
>>  	.has_per_pkt_xfer_complete_irq = true,
>> -	.has_single_clk_source = true,
>>  	.clk_divisor_hs_mode = 1,
>>  	.clk_divisor_std_mode = 0x4f,
>>  	.clk_divisor_fast_mode = 0x3c,
> [...]
>> +static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
>> +{
>> +	unsigned int i;
>> +	int err;
>> +
>> +	err = devm_clk_bulk_get_all(i2c_dev->dev, &i2c_dev->clocks);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	i2c_dev->nclocks = err
> [...]
> 
> You loose checking whether number of clocks matches the device version.
> Is this intended?

Yes, it's not needed. The check wasn't really needed in the first place.
