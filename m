Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA3A25EBC4
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 01:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgIEXfk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 19:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728828AbgIEXfj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 19:35:39 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE1DC061244;
        Sat,  5 Sep 2020 16:35:39 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a22so5606363ljp.13;
        Sat, 05 Sep 2020 16:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y1pIlSrGTn5ZDpLvpkfGwdcqQFtt1c+b+IXrwdEm6i0=;
        b=YkU1vZddrsgHPRtBqEKHWR6xR18SxEnyMwtjhaY+tFYuA+0CoD0wztJvA38WJ1sFFM
         YBQJUnfn1GXX2R4LxS5Txh9U8DqPGN4Kv9FZs/RXHGEDcdlUfCEbrWmWsshURdUyUCG8
         f8Z9BOMB1kFNLXVT8kF7iaub2VaTx1wkwFeMgDg0Cbg/zYBXYdVE6ReiDjhwCVG7uGSr
         H9EknIes0/OjzV4cPADgK6atQJ0+69oXBeEqJcXkodonSqR8k7nMUgrPW2EP9iT/cOAq
         Qjs61hcA+XZrrrL3ZzjUCUpvo2vr4ecRGqmjq+GdvmdTIStZrkFQEkpO2B3Hlb9V6Ul/
         8Yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y1pIlSrGTn5ZDpLvpkfGwdcqQFtt1c+b+IXrwdEm6i0=;
        b=KQUrEC7FQCcqQLar3ANAfMYwp/T/H5OvMIZFkMziV9IhiOlWuwaNc4zkfSgIZReZh9
         vxSFrftDV1ivJbEa2bG83bsOyDA3WoKJ9VZ56luE0UGB53WpSka73l1lE4RmjQlv/MBf
         EevcN4bTsE3dkFZAvn3V7XdaVF3Nqv7FnGhPewg/8u9q+hZYB0DKSfOZedZzpDiDRkVq
         kK0svdb/CzTKhcwXvbL+C76PRsP1Q7ACYvDASDcF2Sn6baz842ohK3Ol1y8XWsVdeftF
         lWHImCbFn2n7Ry8amfyJFz+zTWoueX4it5BGKRdpSX3KyvQod0pdZf6PA4gtKGWH2FWt
         8fjg==
X-Gm-Message-State: AOAM530kyVdeunTlin5+LmKIONwiCFD2RACgmsWylH0TTyUfMPua+Tl9
        ktts9BgXjsH3drChtFD5XggpJCDV4eM=
X-Google-Smtp-Source: ABdhPJyO1aRBX72BVHozg/FWZOmcWIUUe1HQYh8IxoUDfHuj/KE7zFo5oI8Nm2YX5nJKeuZ9BTdhvQ==
X-Received: by 2002:a2e:9988:: with SMTP id w8mr7409663lji.286.1599348937860;
        Sat, 05 Sep 2020 16:35:37 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id f12sm3174906lfp.69.2020.09.05.16.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 16:35:37 -0700 (PDT)
Subject: Re: [PATCH v4 00/31] Improvements for Tegra I2C driver
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905231625.GH18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <81e6606c-f7fd-aa2f-1f8a-5bed83d7d94f@gmail.com>
Date:   Sun, 6 Sep 2020 02:35:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905231625.GH18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 02:16, Michał Mirosław пишет:
> On Sat, Sep 05, 2020 at 11:41:20PM +0300, Dmitry Osipenko wrote:
>> Hello!
>>
>> This series performs refactoring of the Tegra I2C driver code and hardens
>> the atomic-transfer mode.
> [...]
> 
> Pending comments, all LGTM.

Thank you!
