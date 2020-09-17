Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D37E26DFE5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgIQPl5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgIQPSZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:18:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BED69C06174A;
        Thu, 17 Sep 2020 08:17:42 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b22so2557010lfs.13;
        Thu, 17 Sep 2020 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MagsWtsrQG2iYKorfnFgcvU1x5uC2zMNpUa9N45omGQ=;
        b=bUrQlO4/w2WR9Fm0VsKYr1Nq+Y+iO521B1yAcz5YZn+3cSqOAGpd7Yx8ugg/SyHZ0+
         gzjBt9f6Y7+SWRyAmRJJUSRxw/dmmyeLkfCvqPr5BUwrVzI6tFpUKVsaNHfVpskHm2dp
         vN+hh5LQCEyY740iJ0gkC6PfbRTCSSOGVmpvQpMg44JSIJYFZ71rSBMuCUv8B64LE7gD
         BBoaWPuIf6dm6xrK1GX7urNqINYSQjlbiKkPwUjDxjKKIJPp4Jkkt0zPG0LXGz2YSkIL
         2xN+jlK+ACA0yh236MGYwxnJIahWTnVe9cutfGP4dOGDExttDLY1Ikc1emQxJPwEIt+4
         dfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MagsWtsrQG2iYKorfnFgcvU1x5uC2zMNpUa9N45omGQ=;
        b=EX/AoLHIyaKM7VkvqKssUgnY7P6nCzqIrS4WUaQfOB9FhoO3KOCV8cq1TazXrV9jC9
         wCsRT71phSohuZ63qTqwOCV5rKuVnF4bDm78bPYEfMnS9W6qgR2Vxr37/ofsMhr2TIM1
         HsCQlg8LRZcNPysxdChRr8mKZYFkcl9F1C9dlP3Y1W3xkX0VeKEO3gf2wtjiJfQSewx5
         Rzz5JQdcZJSkMd8eQP1TqMngLScPIX7oZYWZUOqK2yIqMkXlsJ2FQhspyXNN+TZHwQdj
         dYzmqP5ZdH4KoRbYhLll3pq6YR4jJracQJr5ginHUeVhdiFOOWEJ/LDZxiQ7y/7F7ipb
         HIlQ==
X-Gm-Message-State: AOAM5304BBAH7RzypTyXVVIQSK4rRNkZ1rU/i8Su/tfutvDlU6QEuflV
        thsQi1pt4h2MScfJDnz96s/FgMbI5zk=
X-Google-Smtp-Source: ABdhPJwleL0Oo/s+aADVbHa4zBzGcBCADQQM/+u8lBPt9K7MC26gYzxTptievtPNhr95WCqgPvFErg==
X-Received: by 2002:ac2:4a73:: with SMTP id q19mr9034176lfp.532.1600355860930;
        Thu, 17 Sep 2020 08:17:40 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x5sm5259816lfd.119.2020.09.17.08.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:17:40 -0700 (PDT)
Subject: Re: [PATCH v7 32/34] i2c: tegra: Clean up and improve comments
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-33-digetx@gmail.com> <20200917123208.GK3515672@ulmo>
 <11a29706-0870-792e-d5d5-7c0d1f402281@gmail.com>
Message-ID: <cbf6f8da-0e9e-3249-2173-bdccbf368bcb@gmail.com>
Date:   Thu, 17 Sep 2020 18:17:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <11a29706-0870-792e-d5d5-7c0d1f402281@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 18:02, Dmitry Osipenko пишет:
> 17.09.2020 15:32, Thierry Reding пишет:
> ...
>>>  /**
>>> - * struct tegra_i2c_hw_feature : Different HW support on Tegra
>>> - * @has_continue_xfer_support: Continue transfer supports.
>>> + * struct tegra_i2c_hw_feature : per hardware generation features
>>
>> I think that space before ':' can go away. Although that's preexisting,
>> so could also be a separate patch, I guess.
> 
> I haven't even noticed that!
> 

Wait, that ':' is used only for the struct description, hence it
actually looks natural in the code.
