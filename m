Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC0261F00
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 21:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732545AbgIHT57 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 15:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730223AbgIHPfq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 11:35:46 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8372C0612EF;
        Tue,  8 Sep 2020 05:55:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u21so9639277ljl.6;
        Tue, 08 Sep 2020 05:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2ehLwXNK3WBwCU+2CN9jFbvN8+npPBE1XX1ZSoVrUTA=;
        b=ohS68j1Qosw8sk+DbiaADlMklzrZcqzn+IrJkLUf5OKRiKa6DdhU0QJxMHJV2Xu4d1
         3YEV8DE5gN07uNXvfX+YuIigPks3hFtW5ZFFVB8w0ZpiIQqHxI3Q8xbbXrorA8zVp58m
         XpDpv9QTXT3XEeyLDikG1rG4DzZ9sJHbR+zzkfiehV1WRjfuDu3/UypVIMIpK3+OrPAO
         jNqQPdRbatlNKaUvClzx5+aSFofLgubH8Bidc0fAVZJpQ4K8PmU2n2vh16AFKW9uXSbB
         Qvnk79kTMAmkNbl6jdABjNXLGdmZleuoS11k5CoE7bXVxO0fhxGISkiNnw1PBHRRjs20
         3Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ehLwXNK3WBwCU+2CN9jFbvN8+npPBE1XX1ZSoVrUTA=;
        b=Wh4Pq1TZvJY1QWZih8YDpO4q+cHdex90CVkXO5wjlpYo3wG81O2sofGcFCdSYB4ZYj
         1rKYzqLB2sa8lAN4OH7CM1ssjlje4Qeejs7jMLK1pKVgArdqF4VRXp82LEstertX+fLL
         jQjBPNsBE/P1MRW8m0jstX5Gtto+MswutXkiJ8p1eOzdT02EiFaV/EGrhDihLURQMlaF
         XMk3JhzvE713nIl6IVo/N2sJio0bPIg95rgvD4wAkffBR6DUX4lyjM2wlEobJp11B0Ko
         MKk5MMfi4TZwItilFoN4lyMQa25ZGwRjJI6bs2i+/pRKCIkr3mxxnj4PFq9FUVkkR5f5
         g0CA==
X-Gm-Message-State: AOAM531ECdHdIRIR/aEXpCkDWMtJmNcnMxa23lPzS2J1PSvThz1R1Aib
        nFpLcqOaErKHxl1uwh5VyuopN7y4g9w=
X-Google-Smtp-Source: ABdhPJy25Zmvv8ZSp1nEAFAtHswk2JSRcw6OzDPS5ICaqEVMzyPELa9Qi30aAs4QWFaZHKS3aReLxw==
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr13415557ljb.283.1599569732057;
        Tue, 08 Sep 2020 05:55:32 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id n20sm10553687lfh.1.2020.09.08.05.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 05:55:31 -0700 (PDT)
Subject: Re: [PATCH v6 16/35] i2c: tegra: Reorder location of functions in the
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
References: <20200908021021.9123-1-digetx@gmail.com>
 <20200908021021.9123-17-digetx@gmail.com>
 <CAHp75VefU+iXpngPnzQRBfrg3OgLUBqhOCJpPo8natfCBr6Q5w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3fce58d0-eac6-bbea-74e3-098cb079e9b5@gmail.com>
Date:   Tue, 8 Sep 2020 15:55:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VefU+iXpngPnzQRBfrg3OgLUBqhOCJpPo8natfCBr6Q5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.09.2020 11:43, Andy Shevchenko пишет:
> On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Reorder location of functions in the code in order to have definition
>> of functions closer to the place of the invocation. This change makes
>> easier to navigate around the code and removes the need to have a
>> prototype for tegra_i2c_init().
> 
> Still seems to have ordering issues (it moves pieces you actually
> change in the next patches).

It's unavoidable that this patch either touches previous or next
changes. You actually had an opposite complaint to v5.

This diver has a long overdue for the refactoring. I think it's a good
time to do it right now because driver works stable and it's quite
unlikely that there will ever be fixes for the older code. Hence it
should be good to have the code reordered now, so that we could have a
nicer code base for the future changes.

> Have you considered which one looks neat this variant or if you move
> it closer to the end of the series?
> 

This variant should be more logical because changes have this order:

1. fixes
2. features
3. code reorder
4. more important cleanups
5. less important cleanups

The 3 merely shuffles code around without any changes to the code, hence
it's a safe change.

The 4 has a potential danger since there are cleanups of the outdated
features and some changes may change semantic in a case of a bug. Hence,
if in the future we'll happen to find a problem in one of the 4 patches,
then there is a better chance that the problem could be fixed with a
simple revert. If 3 is placed after 4, then the chance is completely gone.
