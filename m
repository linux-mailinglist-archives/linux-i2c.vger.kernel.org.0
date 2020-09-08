Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F7A26150B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 18:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbgIHQmq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 12:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731977AbgIHQmO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 12:42:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D92DC06121A;
        Tue,  8 Sep 2020 06:26:12 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w3so20009263ljo.5;
        Tue, 08 Sep 2020 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wicnMiUF8IEAES1mOlASJ6pW21feYULj1hQyoGrNJ8o=;
        b=GiZ9PzKVv0xGowTjcuBelk0nGAZ8CNmZN/XNDian8GYz4cI/nhyIrzfg5djb3hrXdz
         7PHWVVB+jqmk8PCgYa6B6KraG2PWOYMx/cMRuj/EUQ+4uFfEwUZ9PK1wGRFN7+Ef6xr+
         4p3doArdXHjHfRfs9E4UM1Xjxi4qDH31CQL4BOrB+YFyQ4ueEmgWLOsEHscdiwkhOs/h
         8aGKHHtueftJ3VdvIFmKxKUGbF3bn2fb7yh3aPQPYePP/7G2cpB+ESP0vziXunwo9rZH
         mwhp+aCvv10iIFtnuXcBozQr6E/wiRKekyR20WtaKBx9PeJ/be57LpV0L9kDeYT3l0XV
         7hlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wicnMiUF8IEAES1mOlASJ6pW21feYULj1hQyoGrNJ8o=;
        b=ALlzctXCaLClZETmR0rHrbqeAw1lMwg6hmsuSQyXBCTLbT8k9wB2jO5QXjZSra9IkU
         WqRJ37SK/iMgDhuyF2CRkOuFU1PYeklbQSMW9L6d+PWnozAq+tzAqgNb7bKxjJF9mZ9r
         1o1T6fXQRt5dCgKGcCFkrF6o57xXsTDliCcka3a5hGBf4hLUUz6uoQyiVrLNqI4H7xnh
         pTdK5qG5Cx+77P9Vy4YqdGJvGlYbUPdd6iRjh17YPTFTy0pmrC2kh/MMpAuOuMdn+OfX
         W0F+Zcgto1Qp+/6AxXOsYA5GoV3q1rE0X18pGGghcZzx99167NqOBnUs4YD9LETy3HKn
         NdSA==
X-Gm-Message-State: AOAM530pkyRkhOLTqfP3v2jmD3EJCD5v1cuooO3g4brOUE4Lzln2nHww
        alZjhOCDVkGMbYAR1QNYgq+RTVHNdeo=
X-Google-Smtp-Source: ABdhPJwjRn28tbrlSjSLqpSujxV7U3nOFGzuTsHVr0VCdjEwgObVmN3TH0rgRnEnaZVM9uFZ/tb30A==
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr9789853ljh.55.1599571570543;
        Tue, 08 Sep 2020 06:26:10 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id l15sm10196755lje.16.2020.09.08.06.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:26:09 -0700 (PDT)
Subject: Re: [PATCH v6 24/35] i2c: tegra: Rename wait/poll functions
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908021021.9123-1-digetx@gmail.com>
 <20200908021021.9123-25-digetx@gmail.com>
 <CAHp75VeVckiwqDpu8Qt+7Zh+YGiD2q4C6RrANTf5uF4gE99hPA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <29a288f6-3a78-8006-b457-a6ce766d1358@gmail.com>
Date:   Tue, 8 Sep 2020 16:26:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeVckiwqDpu8Qt+7Zh+YGiD2q4C6RrANTf5uF4gE99hPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.09.2020 11:45, Andy Shevchenko пишет:
> On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Drop '_timeout' postfix from the wait/poll completion function names in
>> order to make the names shorter, making code cleaner a tad.
> 
> ...
> 
>> +       time_left = tegra_i2c_wait_completion(i2c_dev, &i2c_dev->msg_complete,
>> +                                             50);
> 
> Why not one line?
> 

It goes over 80 chars, which is still a preferred max-length, although
it's not a mandatory limit anymore. For example I have a code editor
setup that is tuned for 80 chars, allowing to have multiple files viewed
and edited simultaneously.

But I think in the case of this particular hunk of the code, the
indentation improvement would indeed overweight the code-length. I'll
change it in v6, thanks!
