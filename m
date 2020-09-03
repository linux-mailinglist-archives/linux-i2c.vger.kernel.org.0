Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D495325C270
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 16:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgICOZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 10:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729282AbgICOWV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 10:22:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 994E9C061A24;
        Thu,  3 Sep 2020 06:49:05 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so3745392lji.11;
        Thu, 03 Sep 2020 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zkLcvzjsZMsDvpRQU3jHjFP8Yr88KcRdlm2mmCx3YTk=;
        b=nY2l9IWJKgkWPxifTCBR6SEmTAlx9zKKtHunGXaNkGJtYWWcvWctiXI95wktIGXgZh
         i3qw4Fjca59HKPSlWfeeGz5xY9Ls8+yM89sO+iUQJCvaLt3N2otQCXmMPx3+LYKDbfwe
         5BspSAa6QxWFpFcuNFFE2dsupLc8ujMDEGUX+bQ2j8sJd6PyuHFiyB0UWsT0C7qYTxOP
         m9zxfeM37bL/KvphOt0S8shvC7HjzKUFwg/LtNCcEu5p34gBbFsbs2TeStr9XW+kH6PP
         fDM9ktaXPDjjHuF9KO1AjFyLqIhDUqexiAEGgBC9DCl1OstfS5pVC+j9oiH8fU2KlZkR
         Wc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zkLcvzjsZMsDvpRQU3jHjFP8Yr88KcRdlm2mmCx3YTk=;
        b=C1magXPpvXOIkULTKnTJt2gZ5+OSsx/IyPtfpjiJ4A7dNUq2maNl62B546RSSMJvnk
         KW1xIrXz0Roxt+QTHpU7ixQds7DiCrrOZPjVuUqsZvtiFyRrq3EbLpZ+pfXVlCh2Nr27
         xxN2vR5+u6cHMoiEBVdaDNB+tsosy5yg95DndhLi9Tdc5kg58fRjzHQN4DvVUblS9ANS
         trXCXOspuaKeM3i5gkcCcESu1xQ6+NMmFBQrjunrE2Ep/38tAPNm0ppsAJm9vCaqsWUE
         xxKmpcSoWDOKccB44x/CAkPjPlYva9L0rYKAWaixMmHP92INx7Nq0utSwG5I42OSdcTI
         y7lQ==
X-Gm-Message-State: AOAM5305O8UpvwShcnPIkx0LQf3iYJXoStRlUfecFqTfYvBKTyuo/SmO
        mfjmyF1fiSfX2u5ZRnz/q2R3UrGZEmo=
X-Google-Smtp-Source: ABdhPJzbWmq9RXiL6t7SlRAjbNetSCNFKOavX9x+b4Ppkhydn2ZME6yUC5TtOixwQK+1SS/vqD+hkQ==
X-Received: by 2002:a2e:9c15:: with SMTP id s21mr1324479lji.27.1599140943764;
        Thu, 03 Sep 2020 06:49:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b16sm97320ljh.139.2020.09.03.06.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 06:49:03 -0700 (PDT)
Subject: Re: [PATCH v3 01/22] i2c: tegra: Make tegra_i2c_flush_fifos() usable
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
References: <20200903005300.7894-1-digetx@gmail.com>
 <20200903005300.7894-2-digetx@gmail.com>
 <CAHp75VcLk9pVRefA7cTgVQcX3-9EgcW6c-VUSpSOut0Y1B7J5Q@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <957928b1-0b74-f263-b699-5a83db77df62@gmail.com>
Date:   Thu, 3 Sep 2020 16:49:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcLk9pVRefA7cTgVQcX3-9EgcW6c-VUSpSOut0Y1B7J5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 14:02, Andy Shevchenko пишет:
> On Thu, Sep 3, 2020 at 3:53 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The tegra_i2c_flush_fifos() shouldn't sleep in atomic transfer and jiffies
>> are not updating if interrupts are disabled. Hence let's use proper delay
>> functions and use ktime API in order not to hang atomic transfer. Note
>> that this patch doesn't fix any known problem because normally FIFO is
>> flushed at the time of starting a new transfer.
> 
>> +       /*
>> +        * ktime_get() may take up to couple milliseconds in a worst case
>> +        * and normally FIFOs are flushed, hence let's check the state before
>> +        * proceeding to polling.
>> +        */
> 
> Everything, including above can be done by using macros from iopoll.h. Why not?

Perhaps indeed it should be possible to use the common macros, at least
I can't recall why I chose not to use them. Maybe because it appeared to
me that the current variant is a bit nicer than:

if (atomic)
	read_poll_atomic()
else
	read_poll()


I'll consider to use the common iopoll macros in v4, thanks!
