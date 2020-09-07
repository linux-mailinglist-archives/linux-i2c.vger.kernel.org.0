Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0857F25FC26
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 16:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgIGOdY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 10:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729918AbgIGOdO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 10:33:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5694C061573;
        Mon,  7 Sep 2020 07:33:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id s205so16400419lja.7;
        Mon, 07 Sep 2020 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lUQpXpLMt/FfIsve0Z/AjL25/ErGBH8a8QJCnz6gjNc=;
        b=btvDDsrdmdXdBWVnmAhgIwtbV6pyKmlyLgK2DtORZFq0suuB+M76jw58SA4eET14vH
         QaB7NmCFWUSFc1Biei4XkUWl4a9F4OrQPjf54iGJBQnyCpaOosQUPlAaxagKv33Iucok
         ppeDAVYZqoAzdgm4Ht4AKa0n6X41yzmR+0hXXlEsKeTkzLgKdzrXbBI3NEA+cHAyLAKE
         /IvNIdw2a7wbjpVdOSCMFrDYMdbGGz5u/oijbxVFf3GxIWPRVXBGCMbwOu2Tfi1NaS0n
         SiBHcGxjThJtsMLwSdcTZNu5CNfsxUL1sZQXbNonBGtPly+RYriIzaDwVYEG49eTOWpT
         v/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lUQpXpLMt/FfIsve0Z/AjL25/ErGBH8a8QJCnz6gjNc=;
        b=DY3Gv4bwLYpDTjZiCsXwLH2SI8TpgcVZySdRvH8+iQ2OZaKNjK/SIreAerVs4mbx9Y
         tYJj/ZeDJ4qVAbXQ4sCNgt69SCIQMSmf6lYfEfuOLH3f38YhO4a8Uo05LA3QHhc7cmWH
         bmg7ZwVyS9VUuTiTw1PpWlqZAODcCYiNqW2qTqLQgi7Digmfy9fwfZVMbnuL1g1wNzxY
         bJVNL7Pp5NRCwUMLi3WSdElZjymJy8vhvogdFuj6Uq5Opht2Z/Aq6LEnbsoAE+5l6GNC
         tBzKY7uyS6CHrd3ef5mydKklor+gVdgCkRy8z2/PbK0ZGaw1w2z/NRrCBeyWDTmWR2TW
         JG4w==
X-Gm-Message-State: AOAM5334QQjk+Uoh2Tc/N3tYi30iSltjn+/Z6hg8sJsd+GT47O5ggoAh
        6DUAzPq1W2G2PANWStPgGHAdaY24JkE=
X-Google-Smtp-Source: ABdhPJy6Er6ce5XMN3wq8bqyhUi+n3uMvyXIhzCQSp+ZIJ6L/bAgmvBLN+6ZCdtec6FkjwhZGSh6Jw==
X-Received: by 2002:a2e:b008:: with SMTP id y8mr9423150ljk.421.1599489186582;
        Mon, 07 Sep 2020 07:33:06 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id r4sm6285876ljg.123.2020.09.07.07.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:33:06 -0700 (PDT)
Subject: Re: [PATCH v5 08/36] i2c: tegra: Use reset_control_reset()
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
 <20200906185039.22700-9-digetx@gmail.com>
 <CAHp75VfeXqmc-YVk1tTHEPPXBPOZfDy9pKvW9QXom50dibkg8g@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <302ef1e3-30c3-68f8-7957-90c68be9d343@gmail.com>
Date:   Mon, 7 Sep 2020 17:33:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfeXqmc-YVk1tTHEPPXBPOZfDy9pKvW9QXom50dibkg8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 11:13, Andy Shevchenko пишет:
> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Use a single reset_control_reset() instead of assert/deasset couple in
>> order to make code cleaner a tad. Note that the reset_control_reset()
>> uses 1 microsecond delay instead of 2 that was used previously, but this
>> shouldn't matter. In addition don't ignore potential error of the reset
>> control by emitting a noisy warning if it fails, which shouldn't ever
>> happen in practice.
> 
> Still it's not clear if you check the datasheet or not. Some
> elaboration would be good to have.

I'll update the commit message with more details. Thanks!

> ...
> 
>> +       WARN_ON_ONCE(err);
> 
> Why screaming here? Wouldn't be dev_warn() enough?

The error condition is an indicator of a severe problem because the
reset shouldn't ever fail in practice, hence screaming is a preferred
behavour. I'll a add a comment to the code, telling this.
