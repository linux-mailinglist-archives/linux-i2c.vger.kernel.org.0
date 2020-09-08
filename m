Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A652613F8
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 17:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730989AbgIHP5X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 11:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730820AbgIHPzo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 11:55:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5FBC0611E9;
        Tue,  8 Sep 2020 06:33:58 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a15so20138001ljk.2;
        Tue, 08 Sep 2020 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QZWTB3VoqxONYeg+u/6O0/g9cj96hp9jdyxHkms9hEo=;
        b=J8NaJgMDwnJ3iwEeoWg6wr/bSGJKwvn5Fzl2g1HdMx97jMD+CXaJd+doxMKq/2xQU/
         0kIVbHvICiG/YxCdoWxmaiZ/w6gb5YHj21+j5CxudImmkRg5Sau6kVPtFsRULoVtxYLb
         8mKeIF+fft+ga2We20/0q8K33CathTa+odSpHttuJQwf2N+oMTMOEoO2VQDBHrxKrbY5
         b9+z8xXICn15ZjGrf/I31gVHqMKPFwsDEHZwBczpRL9jZF1P0pZ7h+6K+q4VBJ8z72Ss
         kxl7gB2G2YrrOWSu30wdkxHs+bw9ZxXVi+QupPItqFMKwas6jrxsbVnrDODRBcIkIDK3
         1UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QZWTB3VoqxONYeg+u/6O0/g9cj96hp9jdyxHkms9hEo=;
        b=GaIiffcLi0KE47D1q0mgitGaTS2Se2rU2OJw++7g/PneKRVegK50ALpd1+0VbD3qpL
         oxztcsHYTtVy/Gc7gwyAv5day/oZtUWND/rjIjvPz30ubjGANzIKjbEn+4vC0O0sKKCY
         HjhvDuyhOMMMr7hGlzmtWxOn7SfomjHijyAX/uImlC09wugqsdEM8RCGfh6Khwgwx4cp
         w2Mqwj+Mb00Cy40dWsHtP/cXFvUtpObZEDuMaCPMIemHdU0jZeQMVO7wZHHsCZP7XDGw
         d071edCRdbBWsxUOUojD+nf25nI//0mn/QxghED2rnyd68W9LqhhoU80qBns1s8ERLDw
         D+pg==
X-Gm-Message-State: AOAM531sD5uEe9Xnh9Z8PBqCJv8Wezk8BORcXgT9DKlDME9nla/ZZDoi
        Dxd38Rt2mA6pgvA52XG+s1r7k1YhOkY=
X-Google-Smtp-Source: ABdhPJy+Mwl0COSdXYkiXrRrTna4fxanXVeyC3dD9okOxhZk5nXlGIS5LjH+7jAHHExHuSaQmK+a/g==
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr11905021ljh.195.1599572036669;
        Tue, 08 Sep 2020 06:33:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id d10sm10063287ljg.87.2020.09.08.06.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:33:56 -0700 (PDT)
Subject: Re: [PATCH v6 27/35] i2c: tegra: Factor out register polling into
 separate function
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
 <20200908021021.9123-28-digetx@gmail.com>
 <CAHp75VeMZhVvysVHZawutvPpO4MPeTit5OqOJQxqRW3RL_iE-Q@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8b1db9d5-2b4c-97ae-f7f6-c750e76491d0@gmail.com>
Date:   Tue, 8 Sep 2020 16:33:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeMZhVvysVHZawutvPpO4MPeTit5OqOJQxqRW3RL_iE-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.09.2020 11:51, Andy Shevchenko пишет:
> On Tue, Sep 8, 2020 at 5:12 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Factor out register polling into a separate function in order to remove
>> boilerplate code and make code cleaner.
> 
> I'm wondering if you can make it before the patch that touches one of
> these conditionals.
> 

I guess you're meaning the "Improve coding style of
tegra_i2c_wait_for_config_load()" patch.

If yes, then it should be fine to swap the order. Although, I'm not sure
what's benefit.
