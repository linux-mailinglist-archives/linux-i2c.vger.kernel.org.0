Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246FB437398
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 10:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhJVIXG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 04:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhJVIXF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 04:23:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B72BC061764;
        Fri, 22 Oct 2021 01:20:48 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 145so4481364ljj.1;
        Fri, 22 Oct 2021 01:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pt60zDjN6THwEE/JqGNoiMn+u2eQUWBJqEwtNaiQzBA=;
        b=Qv+NFNL/DLLiXqW83gFfBRjr5d8bBCrrviWAwmzowfdRz8Jr4GXxusoY72W9pqanM1
         WeqtvhOgvvbEyy2JmDY7gDBAW9At1nOYpeh3V2tsE2MauXwatwRN29wuNWTZ25GMlyXR
         PkqxDLosyPBJg5jaLPBd/EO6inMbGy5zLhqvNj3NLPNLOyTUejckRw0EBS7E1PUmn0zN
         dKBiAPpPoqEi+XlSLZMMDUW38SDFyDlVZx/5rzgVEW0BtfmZ8batFkgeh64xsGfOByoI
         dVyYjUaXKP2JWql6Zlp8gEZT3t5tRJFheLpuemAfXXrIpDfvrc/V0kjP5dqIcgLr9TP4
         ywSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pt60zDjN6THwEE/JqGNoiMn+u2eQUWBJqEwtNaiQzBA=;
        b=H12AgJThdr19MYwBiiMC7bkhNB7tnZLc6s2CsEZesUv6CqOamSalMDDO2iBe+lafRj
         kPkKN8LUs37oADuRgs5uHfFuXh1+HHV2W89Ie3BITIXejQ1yh1aQKC1v6imTv37C487H
         S7taYbteuGrBotGg0F+Fn5SnwD4TGGV/ipcelbYWeONmfNdFfFcWTf/FonyZ8Tz+gzSB
         hAeE9uLUrjGTXoBWSk+um0iSh8pH059YJAVsgEUrsNDNjTb8n34uMaRoJxxG0F0C14HU
         /2l/nLKJEoJ4E1FbPfQVpZqYeZyq5WIaAn75SDGyb0VsleUuhTlTxeihj925mptfEXcQ
         NWZg==
X-Gm-Message-State: AOAM532q9MiX2SeV4AElqqUfcAe0s/udvaz2W0jw+I2sjzQndD3EsaZ6
        Dy+S1UXm0QYfzVs2Pc4uRJMFyqwSX2o=
X-Google-Smtp-Source: ABdhPJx4OR9AzGZF4cnkKaKaq8yP7tX1/1mAhv0nSUbU0uzzcugcncHbeBtmQ0k56H48Sh/Lt/7+0g==
X-Received: by 2002:a2e:a888:: with SMTP id m8mr11643091ljq.465.1634890846474;
        Fri, 22 Oct 2021 01:20:46 -0700 (PDT)
Received: from [192.168.2.145] (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.googlemail.com with ESMTPSA id 195sm825477ljf.13.2021.10.22.01.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 01:20:46 -0700 (PDT)
Subject: Re: [PATCH v1 3/3] mfd: tps80031: Remove driver
To:     Lee Jones <lee.jones@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211021192258.21968-1-digetx@gmail.com>
 <20211021192258.21968-4-digetx@gmail.com> <YXJw2fX42REHylOy@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b8f6dffb-ec7b-c105-51f1-7b761e331a89@gmail.com>
Date:   Fri, 22 Oct 2021 11:20:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXJw2fX42REHylOy@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.10.2021 11:05, Lee Jones пишет:
> On Thu, 21 Oct 2021, Dmitry Osipenko wrote:
> 
>> Driver was upstreamed in 2013 and never got a user, remove it.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/mfd/Kconfig          |  14 -
>>  drivers/mfd/Makefile         |   1 -
>>  drivers/mfd/tps80031.c       | 526 -----------------------------
>>  include/linux/mfd/tps80031.h | 637 -----------------------------------
>>  4 files changed, 1178 deletions(-)
>>  delete mode 100644 drivers/mfd/tps80031.c
>>  delete mode 100644 include/linux/mfd/tps80031.h
> 
>> -static const struct i2c_device_id tps80031_id_table[] = {
>> -	{ "tps80031", TPS80031 },
>> -	{ "tps80032", TPS80032 },
>> -	{ }
>> -};
> 
> This is an I2C driver, right?
> 
> I was under the impression that Linux could do auto-probing on I2C
> devices?  Such that they do not require platform code or DT in order
> to bind?
> 

It's I2C driver. I'm not sure about auto-probing because something
should provide information about device to Linux. It's possible to
detect/scan whether there is device sitting on I2C address, but there is
no auto-discovery mechanism, AFAIK.

TPS80031 device will fail to bind to this driver because it explicitly
requires platform data which should be NULL if device is probed solely
by I2C ID.
