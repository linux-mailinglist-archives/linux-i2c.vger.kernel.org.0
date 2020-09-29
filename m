Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C4A27D991
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Sep 2020 23:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgI2VBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 17:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728729AbgI2VBp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 17:01:45 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F395C061755;
        Tue, 29 Sep 2020 14:01:45 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b19so5180995lji.11;
        Tue, 29 Sep 2020 14:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NVWX+zwiCPryT0qo0SIT3Pvy2V1BWdv7vtEIJd/B+MU=;
        b=IqP6WQ/bnQu8ZDWxiTRl0ugiQZYQ3sHAj7dCzwd4SXwSgj6HkYOspJ7GahIpvzsGFg
         OPjsMBZYx5NA4p0P52zzYbVplZnv0zD5VVAbH0KquVP73oNH3YvCd7+Ii5xWLepFPLWF
         ZPOphHEYedw6RiUPMB05n9C+/dVnphcHDZnkXgsR/H/kPhw5MUUGfgpM/ECYYWrbGZr0
         i4IjZlcs9jx9+nhi0lQA7r6J8+fRm+2UDF6O8JmMIutrkyjlwXhGwQhqTaNtHfchNkQq
         JwnxPFO43YgbRBY8r7Jpuhl74qV4i8M8wFd+QL688qXCHG2IM+5nH+bl1oBa9bhcjK/E
         kneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NVWX+zwiCPryT0qo0SIT3Pvy2V1BWdv7vtEIJd/B+MU=;
        b=L261y7YLzmnqZ2fi5T78cUmurObhmMkPl9y6cBf3zMsl2KJM65FG0LIpuE45zXqVBk
         dXBUNKMOQl1lt6KxL0y7hSchscjvtvwefeRIOKwXNWS3ok/+OUL9Vjs0ZH3Xu0GHVlPG
         /SVi6J7JbGZAy/WOxo5bS87+/Kb7Jyb0EQXUVg80kL3aUL42RjwvVsi5zPbwVhKuwQ92
         w94WGm4sk2uch+e5zn/01hgtIdXpZa0on7kRnOG4OybYpeWKtLMAnU0N7L1yXI5tBsDt
         UIT3H2ZmvYyE4ER5PTzEKmF5jFxzydFsvlzJYrAsoazjiBoGAc/ESFZxjzP3jlrusI6U
         t45Q==
X-Gm-Message-State: AOAM531rvblKd+Dr72017I7DrnjPSG5rGaMNS3by/P8nLRxe+sltOohc
        GhAoj8+Waiwqzmi7iX7IqlvFhprk+00=
X-Google-Smtp-Source: ABdhPJxws/711DRVR1s+AQgsvT2K0HIOKKsFrN8MU09mwj35q6jmGvu6606SWbK/od/NoK8p5a+OPg==
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr1940865ljh.44.1601413303175;
        Tue, 29 Sep 2020 14:01:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id q6sm473526lji.0.2020.09.29.14.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2020 14:01:42 -0700 (PDT)
Subject: Re: [PATCH v8 12/32] i2c: tegra: Use clk-bulk helpers
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922225155.10798-1-digetx@gmail.com>
 <20200922225155.10798-13-digetx@gmail.com> <20200929193322.GA2010@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fc8704c2-85bc-98ce-4765-c28ce8ac6be9@gmail.com>
Date:   Wed, 30 Sep 2020 00:01:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929193322.GA2010@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.09.2020 22:33, Wolfram Sang пишет:
> On Wed, Sep 23, 2020 at 01:51:35AM +0300, Dmitry Osipenko wrote:
>> Use clk-bulk helpers and factor out clocks initialization into separate
>> function in order to make code cleaner.
>>
>> The clocks initialization now performed after reset-control initialization
>> in order to avoid a noisy -PROBE_DEFER errors on T186+ from the clk-bulk
>> helper which doesn't silence this error code. Hence reset_control_get()
>> now may return -EPROBE_DEFER on newer Tegra SoCs because they use BPMP
>> driver that provides reset controls and BPMP doesn't come up early during
>> boot. Previously rst was protected by the clocks retrieval and now this
>> patch makes dev_err_probe() to be used for the rst error handling.
>>
>> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Any comments here? I'll apply this series later this week if there are
> no objections coming up.
> 

Please hold on, I just spotted a serious problem in patch 23 and v9
needs to be done.
