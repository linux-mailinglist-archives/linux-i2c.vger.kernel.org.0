Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A1D2614D7
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 18:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbgIHQik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 12:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732077AbgIHQhb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 12:37:31 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12151C06123C;
        Tue,  8 Sep 2020 06:29:43 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a15so20117945ljk.2;
        Tue, 08 Sep 2020 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Cq1prsdRfOht5c05daVafBXnW9LTyhWABmk1e7DFMIM=;
        b=Oqb+Elphm0C2XxnZ9roaes0ld62J43TA45pqI7VsaHTAJ+AQ56X1jVAcE4hejh+V7D
         x/pabrk7aD2myGe7XhaiRF6lRUpol3RpZlWzio7FPgLTWGphNd+nmHihC5FjM/HwcUmz
         9xIWUMJ0FHG6lc/clAQa1WH8XXXjb/+QElA2InDqxdy9E4XNWuHLSnatBA7x3GFCsw4R
         lZqH14bh83SeEVAQ4GpOZscGxrjOb9CPbPCtuUHQJ2WFum9WprPa/yFxCXQzR+IKavX/
         K+1TojMS1JgGhD8QC7y0GZAaGjhyGtIyUKu4El9vUIDNo1yNnB57LlJlJkfveif+sDZ9
         IoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cq1prsdRfOht5c05daVafBXnW9LTyhWABmk1e7DFMIM=;
        b=Q8rxzUWnNslIZd8RRvfmiJQtAfb2P4aNhB5sBW+TOGOaKA2B+1V9IS3eacZKG8hoK5
         kRfg0ET1irvLuFnoNrqCdSQgZU28KZuEhSfRoEAGyby6XNgIRfA2GdY0RvxqN5Ll569J
         l8yWPKQaujf3YMecTbaD5M7fVOZOrGAirP/I4c2ExAJByYtv9pYI8WsYuCDKwHUxusbP
         dD512BB2Fc68xnEsk8Br1uKQb7Jz+zGHgjfLF0YR5PMhlM/1dqE3sVkGgzFdsAvVhM6L
         ut/kRaiTk768BaHHVl3ZWEiTiygKRLzv/18JSaxCxhzvCWJ7KFUzmDOHKidptuKoSAL4
         mhlA==
X-Gm-Message-State: AOAM531Zm3vCnwpTSCEFr0TVAyw8rTfkwJn0JXlfK1YzPB8mCe9VtsNA
        uDK7mEf7VwoJEuG1LkwtYG4cN3UIopk=
X-Google-Smtp-Source: ABdhPJy4vXFbbvEAcQndwdyrgn+ypU1IspP4I4QXUV1yNMXljRxJ+3oDr7pn8zcrYWvgXKdn7tlNzw==
X-Received: by 2002:a2e:9b02:: with SMTP id u2mr4559039lji.303.1599571781360;
        Tue, 08 Sep 2020 06:29:41 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id w4sm10392751lfq.75.2020.09.08.06.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 06:29:40 -0700 (PDT)
Subject: Re: [PATCH v6 25/35] i2c: tegra: Factor out error recovery from
 tegra_i2c_xfer_msg()
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
 <20200908021021.9123-26-digetx@gmail.com>
 <CAHp75Vehn_19KA3DyshXd8ASWZN2CbyFdDiUHLMnB=qd7YpTaA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7aba3e7c-e641-acbd-07e9-e4d02c7ecf8b@gmail.com>
Date:   Tue, 8 Sep 2020 16:29:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vehn_19KA3DyshXd8ASWZN2CbyFdDiUHLMnB=qd7YpTaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

08.09.2020 11:49, Andy Shevchenko пишет:
> On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Factor out error recovery code from tegra_i2c_xfer_msg() in order to
>> make this function easier to read and follow.
> 
> Ordering issue.
> You have a patch that replaces int -> unsigned int or so, which
> obviously has less impact (severity) than this one.

I guess you meant s/less/more/.

> Can you revisit the entire series and rethink ordering one more time?
> 

I'll try to improve the ordering a bit more, thanks.
