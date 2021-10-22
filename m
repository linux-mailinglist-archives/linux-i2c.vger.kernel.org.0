Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299574373EC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 10:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbhJVIw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 04:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbhJVIw1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 04:52:27 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62684C061764;
        Fri, 22 Oct 2021 01:50:10 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id r6so140769ljg.6;
        Fri, 22 Oct 2021 01:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=w8xT8kqR2Us6cqF+0gmHgXMoFly/BZcmh/dKfp7jsRA=;
        b=crIvFQEuCpkjiNchWEgbCdHGbhJlERTKUY01C+LeuvwIliHW6CnzxXLPNfpkbFh++G
         EovVaTTQXjql5RpdNkBTKYb7cFdCylL14I0EsOS9Np4Fznu2OD3AyG6WJtcSogbpKlJR
         7gtY1Qzk45QlKUDoWHsg/P1TluO+3TicXw8OfoWWesDJIVA+A64yih7GM6Yg34E8zmZc
         aLDYq8gPkI0yiuHhXEBnFizGOkqfIl4thFoEu8AvkGEmZVsl0ZRHjdZrBGYA2XxaMZ0h
         BTcSgU2ky1QGGt78PGEF+tUDk6wImcixOmODVORCkpbveMa08e4ShZguho3h4dI/4gVd
         N39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w8xT8kqR2Us6cqF+0gmHgXMoFly/BZcmh/dKfp7jsRA=;
        b=w/lVtngICFAjFxFEhhgScjLsejH3gs7fjc8vbhDPvVbKaxdzX+8MrjMPSzhoqjbt2x
         THVj7HY5Mr6d9sUc3gWcK0RfwKoiBDYhvmblk0wnjxiD1Mfys9AsjR34BoPHZDBaqqEs
         WyRtf7/ipEbJc+diWbwyxjlHGVR7nRiV/s9N1SYZuV5sGvmfeCCRlvafjXyGYquLvNP8
         mMkAoVn3WM61xhtxMcA77V/hRuyaBfWBeg3yigoXPIETf7+637tRdGc2IiRs60izLdJ/
         xLtURVHLwzQGLCEvgmiJbvb0EwdY1ATCMpiFEBphHhVdYawb48OoHrP0KnFM1G8YPHcx
         JeHQ==
X-Gm-Message-State: AOAM531snDHUkSvFH/74vfDfqiSKGEORWjRhnMO6SUmmrx6mUt5G8frZ
        Po+q8KhC3Ejs6tEBmrM9kADyi5JXThs=
X-Google-Smtp-Source: ABdhPJz2+8uW9Hma9Fg82wnviyp/dRKoU8LhkxDb5vgE8L2NpswtiyAReQNn8pVgl0A4zl8O8tHXog==
X-Received: by 2002:a2e:9945:: with SMTP id r5mr11898005ljj.249.1634892607922;
        Fri, 22 Oct 2021 01:50:07 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id w19sm669872lfk.305.2021.10.22.01.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:50:07 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] mfd: tps80031: Remove driver
To:     Wolfram Sang <wsa@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211021192258.21968-1-digetx@gmail.com>
 <20211021192258.21968-4-digetx@gmail.com> <YXJw2fX42REHylOy@google.com>
 <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com> <YXJ6deXN7vWrSc++@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5c379d93-6940-f68b-2469-03fde8f39702@gmail.com>
Date:   Fri, 22 Oct 2021 11:50:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXJ6deXN7vWrSc++@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.10.2021 11:46, Wolfram Sang пишет:
> 
>> It's I2C driver. I'm not sure about auto-probing because something
>> should provide information about device to Linux. It's possible to
>> detect/scan whether there is device sitting on I2C address, but there is
>> no auto-discovery mechanism, AFAIK.
> 
> Well, in general, it could be manually instantiated from userspace...
> 
>>
>> TPS80031 device will fail to bind to this driver because it explicitly
>> requires platform data which should be NULL if device is probed solely
>> by I2C ID.
> 
> ..but I agree in this case. The driver has this code:
> 
>         if (!pdata) {
>                 dev_err(&client->dev, "tps80031 requires platform data\n");
>                 return -EINVAL;
>         }
> 
> and git grep shows no user having platform data.
> 
> Shouldn't 'drivers/regulator/tps80031-regulator.c' and
> './rtc/rtc-tps80031.c' be removed as well?
> 

They are removed by the other 2 patches of this series [1].

[1] https://lore.kernel.org/all/20211021192258.21968-1-digetx@gmail.com/
