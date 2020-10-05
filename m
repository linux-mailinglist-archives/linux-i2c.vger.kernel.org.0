Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A662842E4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 01:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgJEXQ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Oct 2020 19:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgJEXQ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Oct 2020 19:16:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8DDC0613CE;
        Mon,  5 Oct 2020 16:16:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id v23so9015096ljd.1;
        Mon, 05 Oct 2020 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/y1V2ecGBf9QUrE1DUxCojq7CebMo4/29DZgpz0CqIc=;
        b=q8oWwtIr0n+bGp6hi5u5/QwztpijlrnKhlg4zjiqNnCztVBvbZk9dddJV1qzpyAaa1
         kxQlyj020HlMvFzIA82i+IvfLFbN2y3yfBCuPo3ZeLApj0REXHk7Mshk2vVOJvD46fMs
         x0DZoC5ZRdkP+aWZj9mwGhT0JkV/76p75wdZuX1ksYPb3kuSqBTmc/XbzpDkHR+yOHtP
         GfxY/C8xpSjPR7uqVEkz/eowKpQtS5LSiBPHexYJVGaoslqvlk4C/c1wivj/CD2wh3j3
         dbe4m/Mu1ksaQYwNQJKbp6gMroPvlUpe/1FvDUetKsKs+WQdmWiyu3E5oEbk7acm73WA
         VPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/y1V2ecGBf9QUrE1DUxCojq7CebMo4/29DZgpz0CqIc=;
        b=iU5WaBeLMnTd2bRlG6y/fmFKXilYVzep+T4QD8CwZXXffmeGwQRVGHVyGULQ7ONCX/
         3AMelOIoqcozs6sq9SVer30BHvkqJ4bo1M3sPaeCCoMz8mJDUcLF4xq1n2DA8KnGDEAZ
         +xfVMBEuF0/mKCzu4AQg3mOGPGvMjjLyIFliWefbNGIIXRVpLHDPX7AYW8G9SBzLGqNY
         WHyN0Wy1/P01QT8B5Nk+SmCCCCu8lj2kDpq8Z5zNxRw3s/2SI6WVjvFRy32KQ2XPhWhh
         KQqOFHRSDhXAdzc6b9uIXk+DmAP4nzZS3KJ//qD5YbKGOqQNsmVf1nm7tPopvyERs0kw
         kg4g==
X-Gm-Message-State: AOAM5339xszE3GuXl1AvL3OBPDwIi7C1bCGX3eXX9SZ3OQ6/tjGCQWG4
        f5U2SpcVD9g9zBldlBxWnBhOGeoapVM=
X-Google-Smtp-Source: ABdhPJwp4vHlmg7PM1+KoUFLLsLH0vbNcBJsVSIUG8JvbOi2f0jOdajZcUSlCSgzB0NrAxP4rHVq+w==
X-Received: by 2002:a2e:6e12:: with SMTP id j18mr690906ljc.430.1601939815406;
        Mon, 05 Oct 2020 16:16:55 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id 73sm338889lff.125.2020.10.05.16.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 16:16:54 -0700 (PDT)
Subject: Re: [PATCH v9 00/32] Improvements for Tegra I2C driver
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200929221915.10979-1-digetx@gmail.com>
 <20201005205258.GB1397@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60ff95a4-2466-a41f-5496-2474f5a256a8@gmail.com>
Date:   Tue, 6 Oct 2020 02:16:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005205258.GB1397@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.10.2020 23:52, Wolfram Sang пишет:
> On Wed, Sep 30, 2020 at 01:18:43AM +0300, Dmitry Osipenko wrote:
>> Hello!
>>
>> This series performs refactoring of the Tegra I2C driver code and hardens
>> the atomic-transfer mode.
> 
> Applied to for-next, thanks to everyone! Please send incremental patches
> from now on.

Hello, Wolfram! Thank you! This series started with 10 small patches and
then was growing with every new review round because more ideas were
suggested and I needed to rebase/redo majority of the patches, hence it
was a bit difficult to split it up into a smaller parts that could be
applied incrementally. But I'll try to improve this in the future, thanks!

> Also, there is this unreviewed series:
> 
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=191802
> 
> Is it obsolete by now?
> 

To be honest, I don't know. The author never answered, guess he may
reappear sometime in the future with a v2. Those patches need to be
corrected and rebased.
