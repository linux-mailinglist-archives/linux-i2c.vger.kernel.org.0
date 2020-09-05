Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87CBB25EB6D
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 00:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgIEWYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 18:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbgIEWYR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 18:24:17 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D25EC061244;
        Sat,  5 Sep 2020 15:24:17 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so5638269lfi.12;
        Sat, 05 Sep 2020 15:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dJM2JSIPxt70hZICwP3ZHl2GgQVGWzpQ2xZTA1Io9ak=;
        b=YEeHurpzJYZlUbvLnj6d/whuQFtRkTJCZcIsN7nPUx2aCtr8kaWaAnB0Di1pcYmTKS
         e6pdSXgFdriudXZKiiMnXEAXSwGU/UExcoLlxywWMz5ndmfW8s9S9cQknUAndQrf/Iox
         9M/mCs8Yvy+UjCHyuFr/odjYUErVs0FWZ1aMR931iOq5zbc9IqEoRSAQ8uHMDzv3HG05
         xJi5u+qEvZIKVciC+N+6cc5DslHutfe8VfNBPBtVgn3W0EWXdgI/0w1x0JpiaMkHHAod
         yyEsN46ggT1gK7oRYdoUy0lVrCNPCsI+v8Hg5XIwN0i27kPxxhCwC6KFRX+3qM9VRpAG
         vVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dJM2JSIPxt70hZICwP3ZHl2GgQVGWzpQ2xZTA1Io9ak=;
        b=mJ78dJlZC6BG1e+U4mHsxEp4UB0S5TeC0523KtNoF1akgEo4IYNBf7lOOObIX+B1sM
         9+ger0kFs1o+qTy2lzcr8Ds1jJ8Q/9IJ64mEtUufEUwyI2kNStJzFfkTl8eEcLNu6PYe
         iPt2XzuG8pDwAGiBy6Pknn2Zw/q2CPaIkSeKBhoFTzHzqqfk/clsrflams02kht79Y/F
         JTUwx4IvImbDKM7/X055orlVi4Hritc74iqxX3lIQAg0KI9enhmKeeuMKSWmbev/jIqk
         Cmg3DqWinjVUTwXnIE4Dx9Lh53kmCRQCCDAB42e6nXNWf208kuWa+NTVAgOtKv5877p5
         2ivA==
X-Gm-Message-State: AOAM531uaBC4PFl8IJjpCcvryLb6XZTX6Fvn2Yx094u1oGY26GOjbTGe
        9k+LcC0h1ItTG7kCq2lg7hCyy5hdkoo=
X-Google-Smtp-Source: ABdhPJyybwLGizwQ9BOusBV2V9qQfSBNY2dbepTk3yQTSBPotFFjy/O59aGldpfeQjxyaUHgFNZKcg==
X-Received: by 2002:a19:6411:: with SMTP id y17mr6947238lfb.199.1599344655196;
        Sat, 05 Sep 2020 15:24:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l15sm2137185lfk.71.2020.09.05.15.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 15:24:14 -0700 (PDT)
Subject: Re: [PATCH v4 11/31] i2c: tegra: Factor out runtime PM and hardware
 initialization
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-12-digetx@gmail.com>
 <20200905221042.GB18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <350949de-00ee-a664-d979-fd47803a80e4@gmail.com>
Date:   Sun, 6 Sep 2020 01:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905221042.GB18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 01:10, Michał Mirosław пишет:
> On Sat, Sep 05, 2020 at 11:41:31PM +0300, Dmitry Osipenko wrote:
>> Factor out runtime PM and hardware initialization into separate function
>> in order have a cleaner error unwinding in the probe function.
> [...]
>> +	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
> [...]
> 
> This one doesn't improve the code for me. The problems are: 1) putting two
> unrelated parts in one function, 2) silently reordered initialization.

The hardware initialization depends on the resumed RPM and the rest of
the probe function doesn't care about the RPM. I don't quite understand
why you're saying that they are unrelated, could you please explain?

The DMA/RPM initialization is intentionally reordered in order to clean
up the error handling, like the commit message says. To me it's a clear
improvement :)
