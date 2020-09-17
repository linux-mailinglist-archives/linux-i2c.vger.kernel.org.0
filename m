Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0141026E59A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727823AbgIQPCg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbgIQPCB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:02:01 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2915C06174A;
        Thu, 17 Sep 2020 08:02:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x69so2540572lff.3;
        Thu, 17 Sep 2020 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xwGDJgx+lFQSvdgwfEdU0i7+FOSzNe653Oa1GB/kRY8=;
        b=va6NgqW+DXKNYNAQk7V1Ry/9zZL3JKdhoZLQoW+9FNwkl5e1TtlSviM5/1LCayL/cu
         D89FewXm7c6QBuRV1TWKfFn1qTczDx+8SRhPiBeFBgHezGYl6nEh3z9fVX/g3xR4e+ll
         6HU/x2/WFJWPUCwPub5F/7MD1oG43w1FYIkQeZE9uY4ba6ed0Xy2mugj6sKCA+DeyK8M
         ghfpYHFTWY7GPewt6iHiRUpt4Zzy4Dc8C3qMWv7SjSGrth/CsAM8hISuUxhO60priZeO
         OjUonZnLoCXR4/deXXrdhukSPYXXl3lZyl1r5mDNysiqaOzecw+xKUYJJHyjps2kFtz8
         F7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xwGDJgx+lFQSvdgwfEdU0i7+FOSzNe653Oa1GB/kRY8=;
        b=DgwEMOYgpoWj2BoykIEJlpeutPAI26s9iW7FieZlWbmWsK7j9L2YQV2U4ZLfXN2Zsg
         YE2GW311Ok9CIv8mip9tEyFA+yyHPrbOX+ef/JIeAqMRYdKd9rTbzLE6xx5cnPNFu/oN
         DdQsYHNtjLGEk2zfCJc7LXAVN99OugZfWrhdkRCcQswMmK5tZfMgrxQzN/PVNH90KGUk
         7Us1AMfTRttOLQQrepTymfY7drKfEWnVOQc36EHw/RZVS9hTkNeuEPjl/9jJ0cFJdbdT
         flOu7tFXnEe9B5TuRmCA7peKXaOBrPE1LEYnOpS7shhEdelWWKQbRm4yrgksZMNroDCx
         tAZg==
X-Gm-Message-State: AOAM532FajKONsN+4T3vMe0ktwiahGTBrxCvUB19VxTNjSEDDsXRBGIa
        WJHhn5kPLLTjsymb+833G+R85Bon5dA=
X-Google-Smtp-Source: ABdhPJzBPB84is5w0Go0iyvCak381mSxvNeGXIbryGiy37h1ZBnJwYxvY1eI/agYib1KnXnOnwpx0Q==
X-Received: by 2002:a19:4ad8:: with SMTP id x207mr10692102lfa.73.1600354918493;
        Thu, 17 Sep 2020 08:01:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id a24sm5724111ljm.108.2020.09.17.08.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:01:57 -0700 (PDT)
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-13-digetx@gmail.com> <20200917113846.GX3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <175e7f54-36f0-32c6-35a3-14c5b5e89e95@gmail.com>
Date:   Thu, 17 Sep 2020 18:01:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917113846.GX3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:38, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:
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
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 187 ++++++++++++---------------------
>>  1 file changed, 67 insertions(+), 120 deletions(-)
> 
> This is tempting from a diffstat point of view, but the downside is that
> we can now no longer validate that all of the necessary clocks are given
> in device tree.
> 
> Previously the driver would fail to probe the I2C controller if any of
> the expected clocks were not defined in device tree, but now it's just
> going to continue without it and not give any indication as to what's
> wrong.

The clocks can't be missed randomly in a device-tree because they are a
part of the core tegra.dtsi

The tegra-i2c DT binding isn't converted to YAML, but once it will be,
then the dtbs_check will tell you about such obvious problems like a
missing mandatory property.

Even if clock is missing, then you won't miss this problem since I2C
shouldn't work in that case.

There is a Qualcomm I2C driver that already uses clk_bulk_get_all() and
doesn't worry about "accidentally" missing clocks.

It's still possible to add the clk-num checking, but it should be
unpractical. We could always add it later on if there will be a real
incident. Do you agree?
