Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C181025FE18
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730302AbgIGQGc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 12:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730347AbgIGQGU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 12:06:20 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C19FC061573;
        Mon,  7 Sep 2020 09:06:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z17so7703997lfi.12;
        Mon, 07 Sep 2020 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b1+lqTbzXCDJRAp/ruU26MIXNrJc2/BgXo5jum89rCE=;
        b=NNl46OGl6PhQGGixOp2jOdYPjqCWx88Jp17Da7yw8BOAg2WNsEA+C5V5ETguyN8tyC
         mo7ynOSA0ucLQKTKtRbrjq1xZ0nqNscY0zSZno8EcIQj8Ve6WMbEw317SIXndNxurxl8
         QAK6znToaSSQWLk5j98NcRi/g/hi63CCZCryUI2iIZ7RpHZIZjYJrZNY81BiWp5R/Au0
         VQ2Edk8j+A3PmGtrwGcxZxus/+lTvRLAWDVoE5fbtja1kPzxgbf6u1oFKgA8/LxCueyx
         bPvnvqAew/5AURTzalY5djAYwmNR43xjIZVUs2sTd8dpquvsV4EsEeI8nApOXFUDkxUW
         UJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b1+lqTbzXCDJRAp/ruU26MIXNrJc2/BgXo5jum89rCE=;
        b=X3y6pPfQo3mDiLrS/MTKsBiNVMt1eKYj6IRqqobnXxS/NpBKKFnl4Kc6duZm1wPrlF
         uTjR8GtyjmgLvjhjZ7y0rRQWZgw9l8eCkfhsK4127icl8U5PJZrSefDjUNQsbWEc0XjV
         4PFsf3BerxlSCKkkhRKzeORk2wFjrxM69/AkIZU7zjcXVt67P81uB6wUimjVIitgDo3g
         0U2tQrCZRnmCMBJTFVEVdIE6haxtBhSXqokT8h1N8w2lxFWimu4OWzD2FirDM8I95LwJ
         9R25V1a7U8i+/3d36OreQxMiDbV+RM2+QAGdL/MkLM8k/r5yEKBwQ+eqrXzchm1KomFN
         Biiw==
X-Gm-Message-State: AOAM531Lj7ktEyCsRaK1+vS4QooPe5UxVtzpXdgo0OMPLg92RRd4qCEj
        KeYxgHLBuSYsRRLYVueu3G70xiC7DT8=
X-Google-Smtp-Source: ABdhPJxDQwSwFIo2VnvbeCGcJmEWfv8Mbl83QhfSqs5L7jjcb+JENRWuM2OM04QUUwEGWc6RH4NRTQ==
X-Received: by 2002:a05:6512:403:: with SMTP id u3mr10469177lfk.10.1599494776140;
        Mon, 07 Sep 2020 09:06:16 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t4sm7458077ljh.122.2020.09.07.09.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 09:06:15 -0700 (PDT)
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200906185039.22700-1-digetx@gmail.com>
 <20200906185039.22700-7-digetx@gmail.com>
 <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
 <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com>
 <CAHp75Vdj7HYN0SWt9StqB8K6JrUCk7dtDhAUwYDkkBXc1R8ueg@mail.gmail.com>
 <c76f64c8-bd46-36f0-edb4-3ddca281a72b@gmail.com>
 <CAHp75Vf3BirttCnW5KarsL0_MqofpWnEN5K5z+TY2YZV-R9fhQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aa58d225-f1f1-2b7e-0c66-c853a8ffd4e0@gmail.com>
Date:   Mon, 7 Sep 2020 19:06:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf3BirttCnW5KarsL0_MqofpWnEN5K5z+TY2YZV-R9fhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 18:34, Andy Shevchenko пишет:
> On Mon, Sep 7, 2020 at 6:25 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 07.09.2020 18:05, Andy Shevchenko пишет:
>>> On Mon, Sep 7, 2020 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>> 07.09.2020 11:10, Andy Shevchenko пишет:
> 
> ...
> 
>>>> Would be great if anyone could put effort into changing the default
>>>> get_sync() behaviour and add get_sync_nofail(). Otherwise this will be a
>>>> never ending problem.
>>>
>>> I didn't get this. For time being the API (yes, with its all cons) has
>>> the clear usage:
>>> a) don't check for errors -- you are fine
>>> b) if you start checking errors, keep in mind refcounting.
>>>
>>> So, I don't see how nofail() can fix b) case.
>>>
>>
>> It's a very unintuitive behaviour which none of other APIs have. I would
>> never expect the refcount to be bumped in a case of error, this is a
>> clear drawback of the API, IMO.
> 
> I agree.
> 
>> Perhaps this is not seen as a problem by
>> people who have excellent memory and can easily remember about existence
>> of such non-standard quirks, or by people who're touching the RPM code
>> frequently.
> 
> ...or by running coccinelle script.
> 

Technically it shouldn't be a big problem to change the code, but I
could imagine the amount of effort it will take to get the changes
merged. IIRC, there was also a push back to a such change from the RPM
maintainer, so there could be difficulties beyond the code changes.
