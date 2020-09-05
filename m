Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF8A25EB9F
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgIEWyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbgIEWys (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 18:54:48 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E17C061244;
        Sat,  5 Sep 2020 15:54:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u4so11069376ljd.10;
        Sat, 05 Sep 2020 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vTI6J+xPk7T+lf6FCXoQeoJc/+EMWwOYFsOxBwKOilw=;
        b=RbMWzPqEGh47kflTLz4oIwEo4pE8qdrMoHpgJKf8sSy5F1MZno5s72uNrwHHVbpHwx
         HvpMhgeshQ6MpaARPgAGqZj3FxOEYtxNhqUpco/oA7rK4LIWQP2XWjQsvWLbT6WSb6p9
         oyFi41o7CfDU5F3Ce4lg2QMWkIZctqknJfbRK4UnD8Pxl5aqRZJMKNp7BjoycYlxZcf8
         +qpvL/RCpOEk+QJMS5udgQNvk0Wz9ikNONiN2cAa9TsfkHgy97g3Zm5YwtUKSTYxhjaT
         iCTDKzrMcFrvPT1wF/Cjjjvd/TgjLBRZCnD8zH5nRt9dsOfof2Y3DJGDaD0HEGM5c2lz
         zotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vTI6J+xPk7T+lf6FCXoQeoJc/+EMWwOYFsOxBwKOilw=;
        b=IbjF7vhTqyB+zlRrVaibYY4HcWW/o7TrprfdK/TTN1HlsfEKddNUoOB4xVm6gLj9/2
         BOr4+eB7bmiySsjH9/aiXGO3bOnfysHNtyQS5DppD+S6s9uXhV6JSkqXUafd0RMko4Vj
         BMaL5CI/a8XsmzkgpilbaBpDlHxdHaBGgtqqzswV6oIYs/uWInZFtREa78Fvb34VgjiJ
         2z7oGJLkML5EDGAJdDC4jpq9+ektVAHaCZJuT8BcnUy3Aly6p8XeEoteGVkUl3d3rkFs
         OKwPeTP5623ra0fO/mVkL46/8jQU0Hoez5VfpCKNgBf45qp7gstra6wULDF40WCy5fLp
         n6Tw==
X-Gm-Message-State: AOAM533s731n8BH5axjYtMRfhcLa02Tl4bv6AgDkDToZ+5v3FQQGKzEA
        oHRM2CFH/bw/Er1wpZ0tl2QN+lvmc8M=
X-Google-Smtp-Source: ABdhPJxXd82oGvwIpVEGW+XeHBhdtwdIctfN5fDTookMsDI1algHunQ+osJZVGUlH5GTNxt4arrNCA==
X-Received: by 2002:a2e:b530:: with SMTP id z16mr7258006ljm.143.1599346484550;
        Sat, 05 Sep 2020 15:54:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id f12sm3107918lfp.69.2020.09.05.15.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 15:54:44 -0700 (PDT)
Subject: Re: [PATCH v4 16/31] i2c: tegra: Remove "dma" variable from
 tegra_i2c_xfer_msg()
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-17-digetx@gmail.com>
 <20200905222323.GC18554@qmqm.qmqm.pl>
 <7587704b-7bc1-d6a9-19b4-befcbcbce26c@gmail.com>
 <20200905224928.GE18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7773ecc-f6ef-add7-b265-c95cd5089b13@gmail.com>
Date:   Sun, 6 Sep 2020 01:54:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905224928.GE18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 01:49, Michał Mirosław пишет:
> On Sun, Sep 06, 2020 at 01:36:20AM +0300, Dmitry Osipenko wrote:
>> 06.09.2020 01:23, Michał Mirosław пишет:
>>> On Sat, Sep 05, 2020 at 11:41:36PM +0300, Dmitry Osipenko wrote:
>>>> The "dma" variable of tegra_i2c_xfer_msg() function doesn't bring much in
>>>> regards to readability and generation of the code, hence let's remove it
>>>> to clean up code a tad.
>>> [...]
>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> [...]
>>>> +	if (i2c_dev->is_curr_dma_xfer) {
>>> [...]
>>>
>>> In this case I like the previous code better: just because there are
>>> less letters to read. :-)
>>
>> Besides readability, I also don't like much that the is_curr_dma_xfer is
>> initialized in tegra_i2c_xfer_msg() and then could be overridden by
>> tegra_i2c_config_fifo_trig(). In a result the "dma" variable confuses me
>> since it's not instantly obvious why it's set after
>> tegra_i2c_config_fifo_trig().
>>
>> Looking at the final result, I think it's better to have the variable
>> removed. It makes code more consistent, IMO.
> 
> If it could be changed in some callee, then indeed it is better. In this
> case I would include this information in the commit msg.

That's a good suggestion, thanks.
