Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D271925FF30
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbgIGQ33 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 12:29:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729895AbgIGObp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:31:45 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784D5C061573;
        Mon,  7 Sep 2020 07:31:43 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a22so9976766ljp.13;
        Mon, 07 Sep 2020 07:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4HCwT5VeeawjAucidjJ8dUXtWRA7EV8ZxyXVxojBpMQ=;
        b=FPrb8tOx20gTiMwOa1l+Lg05WnDC1bSkwecWvfGM2y7U2UEE39gQMAsVlny5a5K4hG
         5pqodWmurJEU2Kk1+TFvJ3B84NyC546CuIWn7Kj7xJMjq06RNfAUdpGb24zhb7sjIvVv
         Pa+iGVJ3zN02M1fD4hCk/GgfpU6Rjn4aYQEHMNZj0LSG1fZRVmeCdcSv+ndxnSojnkWH
         ifq4/u6Ev6MD5SJ1KzNrdN5coam3vmE7TyZeB10102yN5e0JcawtuhbEvphkaVlu3kIe
         xogGUkEGMWXS8MVg9ocUgQ2vHOBcxzmH1TeO7MB+F8k4xYf4QPa2Ugyiuk2+tYzeqMVx
         Yk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4HCwT5VeeawjAucidjJ8dUXtWRA7EV8ZxyXVxojBpMQ=;
        b=OylSh2jfQ9pByJfHmMz2F//Si2pW6/1KE5jmoQu95ZeSaBV7pYLAq9+imOJCWaog5n
         ESJ71OgJWhahgjs8o+vqoILvijDLO2EDy+tCxCh1PACjsRcLvkjkztf3oap+JILaZyqC
         8yS1nCF1nu/A/xUlviBM5JlFPI4aZcDzEen93hqGrGz4g5q5BdSPmDSXSuxZ4ALD70/7
         zJSdTffLNyM0yEN3kAHLipAmXG34rWH1q7dPY1CC1xOOPFlLNfdtn7ThHJ7nN3teaNZM
         xdFuCq7ABzXxXL8W6OdMeEthfBDm1KqE8t/KauesIMDd/J5M+8jYPmsGeRA/LW76zsU+
         21IA==
X-Gm-Message-State: AOAM532pRPurNOAmGne80b6M1jLwniif1Qnx/dADZ7sitKzttSQR3AoT
        LbVecfZZn/aXb1hNb+/ngc+JCTjbehI=
X-Google-Smtp-Source: ABdhPJxsxsJOhrx//7QJF9bND1r8Dv5qiBPxCgjjLtYZSM0x0yLCl9xRNsuextXw/nXKkkx7SakCpA==
X-Received: by 2002:a2e:92cd:: with SMTP id k13mr10801560ljh.441.1599489098724;
        Mon, 07 Sep 2020 07:31:38 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 30sm7169937ljv.35.2020.09.07.07.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:31:38 -0700 (PDT)
Subject: Re: [PATCH v5 01/36] i2c: tegra: Make tegra_i2c_flush_fifos() usable
 in atomic transfer
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
 <20200906185039.22700-2-digetx@gmail.com>
 <CAHp75VfGjk-91P5ENQ4=j0F99o7uVK10NxEqCS3tPEsM1o3NAQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <272065fe-950a-24e9-ba8f-8b1a782c203f@gmail.com>
Date:   Mon, 7 Sep 2020 17:31:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfGjk-91P5ENQ4=j0F99o7uVK10NxEqCS3tPEsM1o3NAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 10:56, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
>> are not updating if interrupts are disabled. Let's switch to use iopoll
>> API helpers for register-polling. The iopoll API provides helpers for both
>> atomic and non-atomic cases.
>>
>> Note that this patch doesn't fix any known problem because normally FIFO
>> is flushed at the time of starting a new transfer.
> 
> ...
> 
>> +       if (i2c_dev->is_curr_atomic_xfer)
>> +               err = readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask),
>> +                                                       1000, 1000000);
>> +       else
>> +               err = readl_relaxed_poll_timeout(addr, val, !(val & mask),
>> +                                                1000, 1000000);
>> +
>> +       if (err) {
>> +               dev_err(i2c_dev->dev, "failed to flush FIFO\n");
> 
>> +               return err;
>>         }
>>         return 0;
> 
> return err; ?
> 

The return 0 is intentional here because returned "err" implies that
error happened and error code is returned, while 0 explicitly shows the
success status. Hence it's always cleaner and more expressive to
directly return 0 on success, IMO. I'd prefer to keep this part as-is.
