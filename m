Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9252425B5C2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIBVRM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbgIBVRJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 17:17:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F12CC061244;
        Wed,  2 Sep 2020 14:17:09 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so842251ljj.12;
        Wed, 02 Sep 2020 14:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kJwdaciwlzmHxgPhtXBhgo/SewTY8c1fcNKes/1opk8=;
        b=e69T9ONaUGjzJ6MKYlr8VKRezvw6wJxhvusIEdkssmNYSdMlEeo1OXmn18DEORwG1S
         CxyaYYDUv/k6jEaZfQ9SOINFjbLnK0/cL+22brwI0MZIWUVlhjqX8+WWM6rQ6X/9UvUn
         77wePZau1jp9zAosH0ODfqaVqmJ3g98Ngn9y5XYEI8C3KLR9Zb7FclSV3hAfyG9waLZ0
         l1qQX9EzfHGVEg9QXi/rSfZfJ4cRBtEzv9bKAT+NKNMFGJiAHV+34G9d4foDyDy34XrA
         plxCMHAo8rfaX88O2EV466r/jm1+jb3cYpHkRRPKIzJejNJHZhJwoBwsWeSYnRJNBmyl
         PLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kJwdaciwlzmHxgPhtXBhgo/SewTY8c1fcNKes/1opk8=;
        b=CsT/pNJKeXPxDDcoE2wdc8SmhhY4i7E9d9U7rYVQ+GhJ9juw9c/QKqk76jfeNGD3Qb
         iPDwN7k1O2KkXe4t2jFg9h4f4lOpyO33gtG2I/N7PWptGfrLzQkI+/z2zkm49fQHtvmu
         5tnyIfZ+GdJHSF4bmzGePcvLya+R2cSPko9kiuj/KOz9vv3sesczmlbFBlmSgagBY+6L
         wLF2tl04NQBdyABb8fwocJuGvefdblhYJyCm01ETVRvlAAc3QER4TWArIG5yVNGodMqN
         O94m1ylp+g7x8ekL0iEVlgXwLmehmsJsHy4jNByLxcD83ltVNkDSB7/YdUVwp9rx8/N0
         c/wA==
X-Gm-Message-State: AOAM531uSIRG7jhj3LbFiewJ3nCY4E7t+m5DWtBDsTh8PM481iH9uomO
        DhV1VDtXb0WnI/mPhd1WNBo6q6I4Oec=
X-Google-Smtp-Source: ABdhPJwDoCVaVtrrRbpS6jg+XoX3itcd78Sy7aCO5GG8dmFoPlynpvFnsdDn8WzZFJvCIoABlrzb9g==
X-Received: by 2002:a2e:5857:: with SMTP id x23mr4300713ljd.360.1599081427360;
        Wed, 02 Sep 2020 14:17:07 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y5sm104174lff.60.2020.09.02.14.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 14:17:06 -0700 (PDT)
Subject: Re: [PATCH v1 09/12] i2c: tegra: Clean up probe function
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200831202303.15391-10-digetx@gmail.com>
 <20200902210611.GC1624@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47d8b629-708f-de82-1118-054200331ef9@gmail.com>
Date:   Thu, 3 Sep 2020 00:17:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902210611.GC1624@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 00:06, Michał Mirosław пишет:
> On Mon, Aug 31, 2020 at 11:23:00PM +0300, Dmitry Osipenko wrote:
>> The driver's probe function code is difficult to read and follow. This
>> patch splits probe function into several logical parts that are easy to
>> work with.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 398 ++++++++++++++++++++-------------
>>  1 file changed, 240 insertions(+), 158 deletions(-)
> [...]
> 
> I can see why you want to extract clock setup and combine DT-parsing parts,
> but the rest is not that clear. At least the clock setup split should be
> a separate patch, as it seems to require massive code motion.
> For eg. runtime PM setup/disable or interrupt setup, I would actually suggest
> to drop the parts as they make the code harder to follow (you have
> a function doing nothing but calling another one).

Okay, I guess indeed it will be better to squash couple functions back,
but excluding functions that help to make error unwinding cleaner. Thank
you for the suggestion!
