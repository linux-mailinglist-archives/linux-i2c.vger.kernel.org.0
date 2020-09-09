Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3402634C9
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 19:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgIIRjY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 13:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIIRjX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 13:39:23 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE963C061573;
        Wed,  9 Sep 2020 10:39:22 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id q8so2049537lfb.6;
        Wed, 09 Sep 2020 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=wJ7AD2/0apSNq4BNZ5BqSlm+lNAtw2qPg5r1WqAx3mk=;
        b=Cr6m9MJHxCltV3nifhUbaQFHRLf2OhP4i4BF/IW38Ny14u6U7hSVDvih7OGEK9I3kY
         1c2eKx1YcHZUbp2ZIeeiZ5qSC0o98V0GiaRNuVMpu7zlhXsOqOX1nbNbK6ufePUqyP/+
         jIzcaIukw7OwuC5CzgB5HO4kx3Ws5/8A03/z2kqYRMl1aJqu3P9yuVDN90ZhhDoIg9vj
         wtJpK36NrFJkOzFWR8niGIzIOTkbjmabQeRKcI3ki+knsoC73+lGHPNbsbspr42Q3mim
         Cl3VhnjxiVWUX0Dc1hIcGV1wyr2GEnMyFkbnDDfCa5C4u63IAIAonviOfVjtUgqxhSoe
         Sg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wJ7AD2/0apSNq4BNZ5BqSlm+lNAtw2qPg5r1WqAx3mk=;
        b=sbf78EH+hqA48vJSViOoBMj969ImhlJirTvgFDffvGGKx1xxDAZ1eO17rHE0QVrMYW
         VQLA7bujxT48VnB55mnYW5512FazSKmKY04CLcRB0aGvCRUZvj18SApW7b8H9qiRMePK
         qHoFQ8w0e6wZ5BCcpYXLQbgnqWZhRG5+7RWKgPRidIannxQSw4rpCUrvf8WZXuIZY0Ih
         DTDZm4d4PaHBW6VgpPh/NapBRAv7695lmmZAQFYnRTXckggzBw2LSDBBF/oHaAdQmYmg
         bc2NPJq6t9ZFxl3fFDn+GbVjw50AdVlGuww1JqFvPZWnuxdL+oyMoe8y06BWGMNqiIIv
         +sFg==
X-Gm-Message-State: AOAM5308AWLyB1C53l5XueTCtyORAMGfuFvbgZzgy8MsJyIzd1IIpgZl
        hVhqka+KnICaLVVSQMDE6uW32ibcPQ4=
X-Google-Smtp-Source: ABdhPJyiotiHC1n0q0b4xrsMxdqsFRVd0JTajIfEkfdX7fgRjdauDJ8heFaU7/xysBBfxxYePKy+vg==
X-Received: by 2002:a19:4402:: with SMTP id r2mr2324395lfa.111.1599673160958;
        Wed, 09 Sep 2020 10:39:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j127sm718232lfd.6.2020.09.09.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 10:39:20 -0700 (PDT)
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
To:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908224006.25636-1-digetx@gmail.com>
 <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
 <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com> <20200909154902.GA916@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0f912266-1727-c18a-69e6-e978af2a18c9@gmail.com>
Date:   Wed, 9 Sep 2020 20:39:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200909154902.GA916@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.09.2020 18:49, Wolfram Sang пишет:
> On Wed, Sep 09, 2020 at 06:36:50PM +0300, Dmitry Osipenko wrote:
>> 09.09.2020 12:11, Andy Shevchenko пишет:
>>> On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> Hello!
>>>>
>>>> This series performs refactoring of the Tegra I2C driver code and hardens
>>>> the atomic-transfer mode.
>>>
>>> I think there is still room for improvement, but let not block it, FWIW,
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>
>> Thank you and Michał for helping with the review! Very appreciate this!
> 
> Yes, thanks everyone so far!
> 
> Is there some internal testfarm where this should be regression tested?
> Otherwise, I'd trust Dmitry, Andy, and Michał here and would apply it
> this week after some generic high-level review.
> 

Thierry and Jon, would be awesome if you could give this series a test
on T210+. Thanks in advance!
