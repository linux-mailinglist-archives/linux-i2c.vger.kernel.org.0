Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01E2275CF7
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 18:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgIWQK2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 12:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIWQK2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 12:10:28 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4169C0613CE;
        Wed, 23 Sep 2020 09:10:27 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z17so453365lfi.12;
        Wed, 23 Sep 2020 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bI8sGUd07yekmtXhn87aJi5sdTf29Cu/7Shv0YfuyII=;
        b=m3vfhPsSyV3/KgTN2dm7vrQBpASGQu+AB9gZuwlUKkm7rZMNHFgAdxDIpy4JXU5b8d
         3Fuy1VVdl4XvjNyhGvPy5eHIjFJXEsJuu1+wj/BF/l19b/OcuH8Z++lDMepDI1lCzOM/
         wbBz3DJVFnvelkwBe4NJE3g4AQV9nn0i+JAMeMrdAkonWnX8acQQLEK5RP5oHuEuXK/1
         cbnVgZC1vmwdP5TwY4uslfdQx4DKpUIeFWFuOSRli2pS3WaEKk6ec69fjf663o6vGBbb
         1ZKZq482qGPodZCUsPBBDHSIpCp+wGjdaVSS7InlUloJCr/nSzovNyUcfpuqOxj3raUo
         Y6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bI8sGUd07yekmtXhn87aJi5sdTf29Cu/7Shv0YfuyII=;
        b=FLBhmvlF/yzJSjBQWyNiBy+RnUz3ic96XX/uGeVZJWWiTRWH6SGBRIiAOepj96mxog
         JaLQeK6KVkw77elD7Gk6RUYw9innnpezhRLS4kcdY2Syd41wUo5bAXeYr0Kb0qcknd8K
         A2rXa2Egs7P/UJUDekmjbtss5wCpWAky4LxpDUBx55L/F0ywKCN1hzTElWp6X07Plf5h
         c+5kUTyB1o7N41MStBl++edg93M/X5MVbUIECMwBAoQl0seBxjno+XfCOFmxqVH0AHsk
         o3El68Rb+l+evEbH4yznGB3fys0kyDqyIcEDB8FFEfaXyiOlBUm50H2f4/mZQCjvZ9QG
         6FyQ==
X-Gm-Message-State: AOAM532VUhc6deAmn8nP1qtp5u2JkogHrwJ1hsllPgl/2MlqiloNtts/
        Km6Pg0KaEbfRWXZiuWesPwE=
X-Google-Smtp-Source: ABdhPJwg+J1tPxl0Bf6fEDA6KrKkJNIiYE7X62FO60cGPAwkjM1R83c/QjysWqqlNuWN/+gfnwa3YQ==
X-Received: by 2002:ac2:522e:: with SMTP id i14mr212371lfl.82.1600877426148;
        Wed, 23 Sep 2020 09:10:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 10sm148379lfq.64.2020.09.23.09.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:10:25 -0700 (PDT)
Subject: Re: [PATCH v8 29/32] i2c: tegra: Clean up printk messages
To:     Markus Elfring <Markus.Elfring@web.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
References: <550a2820-e3bd-7752-f86e-74598def8c62@web.de>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5e5d4592-7ff4-2de2-eff1-ad5e006861b0@gmail.com>
Date:   Wed, 23 Sep 2020 19:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <550a2820-e3bd-7752-f86e-74598def8c62@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.09.2020 14:43, Markus Elfring пишет:
>> This patch unifies style of all messages in the driver by starting them
>> with a lowercase letter and using consistent capitalization and wording
>> for all messages.
> 
> * Does this change description express a contradiction?

no

> * How does the proposed deletion of two error messages fit to such information?

If you'll read the code carefully, then you may notice that they are not
removed, but squashed and moved out to tegra_i2c_dma_submit().
