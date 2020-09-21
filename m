Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C81C2726B5
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 16:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbgIUONi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 10:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIUONi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 10:13:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A60C061755;
        Mon, 21 Sep 2020 07:13:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id k25so11259798ljk.0;
        Mon, 21 Sep 2020 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kqlqPe/fb61SSxp8f9o9nnoXD7w7sRkaVS4vymkermI=;
        b=jBd4gHIdTGYs7BTU8rLAql5VGdosr3TRYY2FWaJGP2LQzNCEqo8L3x6i/W8d/7Zzm0
         woBmanK+2+xbUlheBhAbBU17Gfvi967i64QpVgYRm5O0iuNcQUwDJlHHeO0hK1FF4KFQ
         anChkKZjOgX8wUMl00Xrzlvw5a0A3GUMvHXR1mewlOd/aN+ecdbDz0uys00PDab2yrAs
         yMnC0W1JlIafbL95OxErlncjN+FiSL8mP+AlXWhZc2FtZHUmtJwPN40n3WJgjVWVymn/
         O9uhaZNrCDsPj8OGzvVqAWlUPMxUdT06/jpJPlQpwMn9cUSS7Dejg57m5BhtDjGP0CN1
         urAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kqlqPe/fb61SSxp8f9o9nnoXD7w7sRkaVS4vymkermI=;
        b=VVRJ41xcWjCJGU34t1UKJZ9mYlfRxgNCc6UaZPnfwaAf86fL2Sx3E/3RbsDpkTiUwk
         mT0YUGWvL4GMqOMxBAucY8hsVim6x3ndWTjYXcWrfPKCrOtOiiDGKmJu+nSoIayNZ/4H
         i5IY8QOKsRH4oh4mxF5/DBooKeFlXUc/REme1wP/vS8l34LbLnk6ojxz70Z32FV6JKKr
         TBnqYGs5XJSLL55pwf0TKyj7aEFWZ1WPYHglcMnnsUq5UYA03drZhTWfgf+kYYdnk3Xc
         72NTN903rEOCY7nlrw2/dZw5/cMqiqPfC4TJr+xMOtfyHp9IuCuYppQyEdhkKr+E3QR0
         6jrg==
X-Gm-Message-State: AOAM532yvLq/jzDK+X6u3B0FqBSSgSkkMRXHTjWPGGPLzS7NPxARSdJ/
        lC6AnCRlDG7PlyanCypQGfbtIbFmHlQ=
X-Google-Smtp-Source: ABdhPJyEOqOeo6raTKAL4JtBj7IRO7ygCzc3PbfNok4Uk7iaFeVk0diV0iARQp9cqcoryOi+AnT8iw==
X-Received: by 2002:a2e:8782:: with SMTP id n2mr17411851lji.262.1600697615712;
        Mon, 21 Sep 2020 07:13:35 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c3sm2617374lfg.15.2020.09.21.07.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 07:13:35 -0700 (PDT)
Subject: Re: [PATCH v7 27/34] i2c: tegra: Check errors for both positive and
 negative values
To:     Thierry Reding <thierry.reding@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-28-digetx@gmail.com> <20200917120955.GF3515672@ulmo>
 <CAHp75VdEoLAMvQWb1_p8ydROmY9p7KCqFGarRsgM8p8nDhyY7g@mail.gmail.com>
 <20200921112425.GK3950626@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0d18c64c-8765-a840-f963-ba6a205f0e6a@gmail.com>
Date:   Mon, 21 Sep 2020 17:13:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921112425.GK3950626@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.09.2020 14:24, Thierry Reding пишет:
> On Thu, Sep 17, 2020 at 04:50:06PM +0300, Andy Shevchenko wrote:
>> On Thu, Sep 17, 2020 at 3:09 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>>> On Wed, Sep 09, 2020 at 01:39:59AM +0300, Dmitry Osipenko wrote:
>>
>>> Why? All of these functions "return 0 on success or a negative error
>>> code on failure", don't they?
>>
>> And what is the point of having ' < 0' in all those cases?
> 
> It's explicitly checking for the documented error cases. And you'll
> occasionally have a function that can return non-zero on success.
> Testing for < 0 is the safest way to check for failure in the majority
> of cases.

If you're testing only for negative errors, then it means that you will
miss wrong positive errors, potentially setting machine on fire :) This
is not an often problem for kernel, but this is a problem that I
experienced with userspace more than one time.

Anyways, this patch also makes the errors checking consistent across the
whole driver and it makes the code look cleaner, so I'll prefer to keep
this patch as-is.
