Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F11F25FE39
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 18:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730315AbgIGQKQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 12:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729932AbgIGOdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:33:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5055DC061573;
        Mon,  7 Sep 2020 07:33:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so16407734ljc.3;
        Mon, 07 Sep 2020 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=62zNFkwm//4ntRqXyoEhNkr7gnf03DDFz7QWu/35PZQ=;
        b=VocdMNhTjr1eQ4qg1fl2wRIHbb+HZvmt4o+WUEpVvs7y6bpPKjoa+HsJYFjpX0hSNH
         hWqcUmXVgsFDbDOXLvQROEHE5nMX1iiaYDd6I4uVBj2xycK9KqqfOm++ygAmY9CYhpIt
         T771ZjzgJtVyJ82GR+Ny0mULHLBstcRFrQWnLY+unp671gfIgtalUupR3U42juLLtP6h
         2oE7Fh49ujqezOWYGqsCUNXvS7AYTMbdskXCWOFbFnKScOI+LxfV/w5HWoemgPB8fv+X
         EUebjBQotKv3mkSLsiTGWeEiLqzHG/les2EHHR6wDI1/duG7A15HEtjoKQoIWPKaVsf0
         f3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=62zNFkwm//4ntRqXyoEhNkr7gnf03DDFz7QWu/35PZQ=;
        b=gIvVq7VXpyIv+OF8BtYDOzSJplEUytPX7fuQ9DTdN/tBthD2lJ7HzZK0g7CcOhvhlk
         G5aodTrRDAo4QiXERgmwDHslBb6uWq2gK4ChGocyesS95CaZEnLeVsdydQFM/intM4m5
         wU5KfOQsZEkXxLPHx/pAuzWshFj68GvD9bWQhhq4+iNhHYeXWMe9E3SUixEiRhKfPVqk
         gyvM33ty0LLCnNBI7hTJhWBt6D020bA5geKTJCvxm9uzQiadXpkeNDL6TOZcJw4FgFVq
         BXoN5mH4rBgaBZmNwZHuEa4N6tkxhkOpsgavEJLgqQ090nfRJQK6GYTfwCcx3RFyexv4
         MTow==
X-Gm-Message-State: AOAM531+NWXOfiu1E/nCa7CgaYWMFdG5AIZ6mcQnMpxbmiMhx5ZmE4t7
        cr7jCQMEws0ggj+gt+hSHMytAd3gC3g=
X-Google-Smtp-Source: ABdhPJwC6KBpcYD8vM0x+aa2VAoR2OO3AIuOQ1WyISe8il59xTaXwK4vUu8B20fNP6s1lWCFHHeO1A==
X-Received: by 2002:a2e:911:: with SMTP id 17mr11317863ljj.207.1599489209563;
        Mon, 07 Sep 2020 07:33:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n2sm6243490lji.97.2020.09.07.07.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:33:29 -0700 (PDT)
Subject: Re: [PATCH v5 13/36] i2c: tegra: Clean up probe function
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
 <20200906185039.22700-14-digetx@gmail.com>
 <CAHp75Vfm24pNS_OR5m4DSuxLfH_XA+uzGhC_egk+41gCPchNjg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1477bf0e-5723-8781-05bd-0f30c0b9c3a7@gmail.com>
Date:   Mon, 7 Sep 2020 17:33:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfm24pNS_OR5m4DSuxLfH_XA+uzGhC_egk+41gCPchNjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 11:20, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The driver's probe function code is a bit difficult to read. This patch
>> reorders code of the probe function, forming groups of code that are easy
>> to work with. The reset_control_get() now may return -EPROBE_DEFER on
>> newer Tegra SoCs because they use BPMP driver that provides reset controls
>> and BPMP doesn't come up early during boot, previously rst was protected
>> by other checks error checks in the code, hence dev_err_probe() is used
>> now for the rst. The probe tear-down order now matches the driver-removal
>> order.
> 
> Seems that partially this can be done in the patches that converted to
> new/better APIs.

Okay, I'll split this patch a bit more.

> Also consider the use of a temporary variable for struct device
> pointer. It might make your life easier.

Whole driver now uses i2c_dev->dev pattern and the "dev" variable
originally was used for improving indentation of the error messages that
are now gone. Hence there is no real need to keep the temporal variable,
IMO.
