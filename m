Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2354D48FE79
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jan 2022 19:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbiAPSeq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 16 Jan 2022 13:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbiAPSeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 16 Jan 2022 13:34:46 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC61C061574;
        Sun, 16 Jan 2022 10:34:46 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id e3so46593006lfc.9;
        Sun, 16 Jan 2022 10:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6WEIrPsfwKQAU1waPBDyVpN+M9nuJKvGyQX15lAz6rk=;
        b=GZ+Hr2x/BF/hAWfuJRFk5ByRkQWqbjzbU8u1NkxuQuycmc1BFzCIWCf6ZXsLtUDtei
         IN4CoFMZRYDm9y8YtvVE7EHvvKSFEa1ZoeKB/ysYwgWsAChECTrdYHXVC9k9yYKOuQSk
         Mz1al0ubjCKxfsGW6sOpNqk60YP0CbE8KTmx5WRfE6qVAYOoG6JIDQH5shb4yqLYt1UN
         qezg1E+ifiX0ApegiQHIbSGaBvsZXGVh1rxfppubb6Wh7X324CzJiUryPwcWnv0srz8p
         gryCYyQQEHJUuXhmwD+GPg/TRwOsQBU8TtpKqQZqogDAVS3xhdvUyEG5KObk0zihztfa
         XCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6WEIrPsfwKQAU1waPBDyVpN+M9nuJKvGyQX15lAz6rk=;
        b=EI4di82PNYMFQxb0nIIIqGjhboBMhzy8LvmGm4XAMlkAV0sdtpJKfh5xvbO8fdpQ15
         9xhToQ2i3ioXdlEe1AJARJE6qWwEaTPiTM0rJ2ctBIzgvUDN27vRog26YmtdrDHbjB9a
         +pA1Uat3GLQuiHwLltUIkxQuphR5OvDwYVKBC02oVojIYlDOZbWAyj06ZRy40NWFNY8E
         W9gk2ww5bzNV80x01HroR2o85OqJdqCPs1JOHZN8glcwM2kw9BozxwrbtVqAwicklGKT
         JWmukFfN88/41qp/vQ3JQ6nYd/2gMt0DfxLa2v2y2DUNk04LtrKceeeQyygbyDYJOUB2
         S0XA==
X-Gm-Message-State: AOAM531hwuBG8uIhw8mrZ/cVGhr/iDKQKrmKOLdJhwBpXUSZ04L64kQX
        vPVMiqdCqyd7V0VEdgUuphXrmU0Y/AY=
X-Google-Smtp-Source: ABdhPJyHw9m8Lq4fHwTkuoYghyy9m0BajUOCA9U7fbAC/xuAo4E1s2ssksNc6eZGwbUBeSQ/SoyyvA==
X-Received: by 2002:a05:651c:169c:: with SMTP id bd28mr2837052ljb.453.1642358083873;
        Sun, 16 Jan 2022 10:34:43 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id g5sm1175848lfv.0.2022.01.16.10.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 10:34:43 -0800 (PST)
Subject: Re: [PATCH 0/2] i2c: tegra: allow compiling out support for Tegra's
 special constrollers
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <cover.1642348712.git.mirq-linux@rere.qmqm.pl>
 <ea9ab0b7-022b-93e2-ed7d-dccfa95bd900@gmail.com>
 <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7a9a48b-e924-9e14-a4ff-b13853c5033e@gmail.com>
Date:   Sun, 16 Jan 2022 21:34:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YeRd90gLqtsz2zVV@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

16.01.2022 21:03, Michał Mirosław пишет:
> On Sun, Jan 16, 2022 at 08:54:08PM +0300, Dmitry Osipenko wrote:
>> 16.01.2022 19:02, Michał Mirosław пишет:
>>> To patches that, combined, reduce I2C driver's code by ~2kB and a bit
>>> from runtime overhead for non-Tegra20 or non-Tegra210 builds.
>>>
>>> Michał Mirosław (2):
>>>   i2c: tegra: allow DVC support to be compiled out
>>>   i2c: tegra: allow VI support to be compiled out
>>>
>>>  drivers/i2c/busses/Kconfig     | 16 ++++++++++++++++
>>>  drivers/i2c/busses/i2c-tegra.c | 35 +++++++++++++++++++++-------------
>>>  2 files changed, 38 insertions(+), 13 deletions(-)
>>>
>>
>> 2KB is a too small difference to justify the ifdefs and Kconfig entries,
>> IMO.
> 
> Maybe I should have mentioned that it's ~20%? With my "embedded" hat on:
> I think it might be small, but sometimes it is the difference between
> bootable kernel or one too big.

10KB is a small size too. I'm very doubtful that such changes make any
real difference in practice.

Much more practical should be to modularize more kernel code. You should
be able to squeeze zImage down to 3MB without any code changes by
toggling more kernel config options to =m. Try to use grate_defconfig
[1] for the base, that is what postmarketOS kernel build uses.

[1]
https://github.com/grate-driver/linux/blob/master/arch/arm/configs/grate_defconfig
