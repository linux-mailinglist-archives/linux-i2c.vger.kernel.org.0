Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8855F25C5EB
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728372AbgICP4p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 11:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729014AbgICP4b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 11:56:31 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548E6C06124F;
        Thu,  3 Sep 2020 08:56:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y4so4323465ljk.8;
        Thu, 03 Sep 2020 08:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kutay0Y9gemJumzTQfyc2Ti220nlbL0Ja7cyDFdaHzY=;
        b=KxzyJ4gPqH8AsNbbKWXKRhIR6R7hLYA493Tude4qe1gDD/UbdP82oMG4v9MXXRriAY
         pBRd7crNp1Fxe3cSWN1HdlZugn3ogXRPBvx6CEtawLHtvLRuq0RbzsUYGihHELfVUiBD
         MU6dsxr5y6I4ntw+yv4Aw582fDdrLGCfgp/XEqittFXTgD3ywfv/8C42nZWzuYpZfufs
         m3SaA9NaVqfHV7vFI2xUUlsFNvFDYVE241FKfZ79sBVJRNISHKx0kRJbDLuI24+fYKy3
         sXjSGyz1VKXBWVz2pjqOGbNsM/y9TPX//Bj9V+9YD1syr62IowLEEjWODhrV3ZkQzRvR
         zPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kutay0Y9gemJumzTQfyc2Ti220nlbL0Ja7cyDFdaHzY=;
        b=W1gaf76zj/PVrsV7zrfijQDLP3+QEVxkGp210VsrBY1Fh9dqwKuzVYehtgr4FDRrYA
         tcR9nq6c/IPUGiE11cwkuHaSdQuioxy2zM2de28xWHwAg1nfFHdVQvMfSusr+aZoefYm
         rIVfyEgIOKvVNLafe3iVamt4unvMMh3EhC/ywvCSCaWN1IZkSWFkppf4V+Yv5KEv4y73
         c03T9+zJfoRO06/8hy4FHxdIUzhYoNWDSI7IUQ2EPbJghaRFMQKDUcGWY0lVSV/p9+dO
         b7S5FIMVeZby8bcK5i0bQ0oqssJQhyWI/0eT1J0lMV+Xb8zgRr8gY9zk4f1DAL4C2cDK
         newg==
X-Gm-Message-State: AOAM533KxMPl5TJi810xyW6MlgM2Fz4WGOMWSfLbe0JhuQTAgbyrupZB
        GWk77tl7JRyxQyxlECNOGT0mGtpE8tA=
X-Google-Smtp-Source: ABdhPJyIKQMpbPJqysMxDujCjWMoMdKHr1ywPllPEP/Zava+ueKPpb7X+iqMG/s5yTddNb80yI8kyQ==
X-Received: by 2002:a2e:71a:: with SMTP id 26mr1654291ljh.198.1599148586155;
        Thu, 03 Sep 2020 08:56:26 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c11sm673846lff.3.2020.09.03.08.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:56:25 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] i2c: tegra: Clean up probe function
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200903005300.7894-1-digetx@gmail.com>
 <20200903005300.7894-10-digetx@gmail.com>
 <CAHp75VdPoJFNC+MntKu-CL8jFMEe85ZT3R9DF0aaNC4KjqWXyg@mail.gmail.com>
 <4bd12095-7a29-bcb4-6b49-83eca285c897@gmail.com>
 <CAHp75VerqMmyDnbxaWN0R-DYPkOosh-R9CG970Sh+EqG21oZ8w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <77562fdc-0314-b711-90b6-2fc90940f472@gmail.com>
Date:   Thu, 3 Sep 2020 18:56:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VerqMmyDnbxaWN0R-DYPkOosh-R9CG970Sh+EqG21oZ8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 17:02, Andy Shevchenko пишет:
> On Thu, Sep 3, 2020 at 4:48 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 03.09.2020 14:17, Andy Shevchenko пишет:
>>> On Thu, Sep 3, 2020 at 3:54 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
> ...
> 
>>>> +       of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
>>>> +       i2c_dev->bus_clk_rate = bus_clk_rate;
>>>
>>> Hmm... I dunno if Wolfram is going to implement a special helper
>>> exactly for this. I remember we discussed that with him during v5.8
>>> (?) times.
>>
>> I now see that there is a i2c_parse_fw_timings() which parses
>> "clock-frequency" and other common properties. I could switch to use
>> that helper, but not sure whether it would be really worthwhile because
>> only one property is needed to be parsed. I'll consider this change for
>> v4, thank you for the suggestion!
> 
> That's exactly why I was wondering about the current state of affairs
> with the discussed helper which should only parse the clock-frequency
> property.
> 

Alright, I see that many other I2C drivers are in the same position, so
perhaps should better to keep the current variant as-is until a common
solution will become available.
