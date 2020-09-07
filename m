Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8855125FC34
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 16:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgIGOlC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 10:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgIGOjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:39:11 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E821FC061575;
        Mon,  7 Sep 2020 07:36:33 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z19so7611951lfr.4;
        Mon, 07 Sep 2020 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LbYatuVWRGYewGcDmiye1sSegUENy4SIbsUeZ7U/qG4=;
        b=JpZGZSLNqRaE0exdU8CU465eqriG0RqHm2s6LczbPE71uOTMNdEZz2JGG4y3tK/LN6
         y9z23DLcygyjqprpVkOT06L6PCQk7ujXbG2vpwyayBtKAx6x4S/N9Fz8Fo+RkcgBOxew
         SsIrCfAsYkObkThkDYUhnCHbE21CoRRqUfeqtmKedhHMwRNy+nkcdNnpJpEBxmD8wG95
         o3WDxGmVPtu4+n7pi1LD0AS3B3M/MTOub3vyAsO2IUZrHXIgToj4MI3m9COtHplDVFtN
         sqjJs1GtnnWxbyO0ZtijkeJRWgOt+OqHYwHKJcMtmbVvZTIUubGSiJv7Fw6urR21wEsb
         cumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LbYatuVWRGYewGcDmiye1sSegUENy4SIbsUeZ7U/qG4=;
        b=G2zU1TzviXkEobesClo7cgXQjKm9EN7+foJrfYhkSlHrexEm9Ckc2N+Ld/5csytyiS
         zD2LdINMHgAutuKR+DStS0vI2yB+VQGETxX06tWUoN8qDNNsdZkDynJfcBo72UPZQzq3
         LWNqCaCL0Y/x74GhBdpb3HWKLccQDvt3s4Z6/3G/1PIzwe9N/xkhSioeQD7E8qQMbEgr
         164TTwSktVAzXTBxrjfoXCLgzAmV5LTgkp8l76MZeiTc1mp8bp5HS98d4fFRTGJdBdqG
         x4sN2NhxMGP5Zh3gnO0dgANenylkaPMp7oEt+34VBuy83SDDpnadaysQWYgAF6nAPppt
         1z4g==
X-Gm-Message-State: AOAM533DgXf7SpsdEQUNUWY56Hgxc3p5zprsbH3nmeXSmBmHF8JC1XkY
        lmmtkF1RDiz8obN4PkhbkYQTAggXp50=
X-Google-Smtp-Source: ABdhPJz9601EdKos+ms9H/SphtscTtUQmKponvS3+EYjzKvYmMOrE5RHyzgfpE/oiJUjRRrNVcr5nQ==
X-Received: by 2002:a19:82c3:: with SMTP id e186mr10075422lfd.144.1599489391997;
        Mon, 07 Sep 2020 07:36:31 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t13sm7639481lfg.53.2020.09.07.07.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:36:31 -0700 (PDT)
Subject: Re: [PATCH v5 27/36] i2c: tegra: Reorder location of functions in the
 code
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
 <20200906185039.22700-28-digetx@gmail.com>
 <CAHp75VfSyfJoEbFGEH32=841_2h4_8r+vVYO2BPHgSVvuatOag@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <61845513-bf41-1c15-126d-8470a23b178e@gmail.com>
Date:   Mon, 7 Sep 2020 17:36:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfSyfJoEbFGEH32=841_2h4_8r+vVYO2BPHgSVvuatOag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 11:27, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Reorder location of functions in the code in order to have definition
>> of functions closer to the place of the invocation. This change makes
>> easier to navigate around the code and removes the need to have a
>> prototype for tegra_i2c_init().
>>
> 
> This patch as 25th and one I commented before have a ping-pong style
> of programming (you touch a lot of LOCs which you introduced in
> previous patches). Please try to reorder series in a way that you
> minimize the churn of shuffling the code.

Okay, I'll improve the ordering in v6. Thanks!
