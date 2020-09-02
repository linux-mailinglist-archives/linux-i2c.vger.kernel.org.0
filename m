Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFC125B61D
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Sep 2020 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbgIBVrS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 17:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgIBVrS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 17:47:18 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F36C061244;
        Wed,  2 Sep 2020 14:47:16 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 12so615737lfb.11;
        Wed, 02 Sep 2020 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aUUaHl/COZyZ4MmMHf9ceCNdidMcQ0s4jCCYIv5+oJo=;
        b=qVf/0GSSCfmckQ8NGlEfyLcvfVkAvNY1TqrPUpxmznHv7Phw0lbZvesCItHeMa5TIx
         oarCfw2MHQXPGBKorcUhm7qvT0EZh2Tl03Y3Jo/fqAJZWsMyz+zpbQzAMBflgk3Eao9K
         Y2qqU1faSZS0oggbVY7eVwZU3GK76T+FP+jEF9l55tTzVsQmsyjBQCkJwzL+YTXVAgFx
         M/ggimnWniEvyzc7vdXCr/T7QgdUAaVKJlsqfHwQnLQ5vDG7jxQjJC69kC6P2aQyIi+z
         DR5mO8IxzYKZtHCioeCMYy+ZYKwAdA4oz8MtN1LVIQpAqLkIYJqMx4g+O0fH150MBrJ+
         1OUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aUUaHl/COZyZ4MmMHf9ceCNdidMcQ0s4jCCYIv5+oJo=;
        b=dPmZSLj6jmwU4FdFxhoRy0UZag7//q2GpKhHDRZuP0P9BMSF6kcpgLG1cXPPxXStgY
         fHktn3k8TXTe0bDxRH6beHHvo+TO4m7UnAfMT0agFQ5AFCV2MnG8/DLz02it3Mc6fKPt
         37x8XZkYDzaOvWUQIl1hRKRFAOWOz80K0Tykl5ptYUnWfUlVTycSqQ7IApR7eRD9j3x4
         H0OE3loqCHo7kS2qNNLgXGvHUUl19nfuxKiCH2ZirbbKDjhn0jAJB/iHN5XDFiuYPp6j
         EPYU9YMyo2Pk3hlqdABVffYfBy5ha6ddAccndRtPQ0MubSyYQ8Mdfwm2wgSsvT7i3KGP
         nzVA==
X-Gm-Message-State: AOAM530YioCI5078AriYSc1LCRcGwZG0g0nEXwP12YmXz+71S5SuMk/I
        tOClOGn+YEfgts9CSlIwmKTLWAaFzQI=
X-Google-Smtp-Source: ABdhPJwMgIUczJFGKnpyGhQXBEl6zV4n22jatTM6p+zXhiZagscvb0jJ0zT6Z5D73fyzCyN3dt4CzQ==
X-Received: by 2002:a19:4e:: with SMTP id 75mr4299237lfa.159.1599083234242;
        Wed, 02 Sep 2020 14:47:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x73sm114582lfa.94.2020.09.02.14.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 14:47:13 -0700 (PDT)
Subject: Re: [PATCH v1 09/12] i2c: tegra: Clean up probe function
From:   Dmitry Osipenko <digetx@gmail.com>
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200831202303.15391-1-digetx@gmail.com>
 <20200831202303.15391-10-digetx@gmail.com>
 <20200902210611.GC1624@qmqm.qmqm.pl>
 <47d8b629-708f-de82-1118-054200331ef9@gmail.com>
Message-ID: <85cc4e0c-e085-18a1-7cb5-a24b653cbb86@gmail.com>
Date:   Thu, 3 Sep 2020 00:47:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <47d8b629-708f-de82-1118-054200331ef9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 00:17, Dmitry Osipenko пишет:
> 03.09.2020 00:06, Michał Mirosław пишет:
>> On Mon, Aug 31, 2020 at 11:23:00PM +0300, Dmitry Osipenko wrote:
>>> The driver's probe function code is difficult to read and follow. This
>>> patch splits probe function into several logical parts that are easy to
>>> work with.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 398 ++++++++++++++++++++-------------
>>>  1 file changed, 240 insertions(+), 158 deletions(-)
>> [...]
>>
>> I can see why you want to extract clock setup and combine DT-parsing parts,
>> but the rest is not that clear. At least the clock setup split should be
>> a separate patch, as it seems to require massive code motion.
>> For eg. runtime PM setup/disable or interrupt setup, I would actually suggest
>> to drop the parts as they make the code harder to follow (you have
>> a function doing nothing but calling another one).
> 
> Okay, I guess indeed it will be better to squash couple functions back,
> but excluding functions that help to make error unwinding cleaner. Thank
> you for the suggestion!
> 

Actually, looks like it will be fine to do exactly what you're
suggesting. I also noticed few more things to improve in the probe
function and other places.

BTW, you're looking at v1, but there is a v2 on the list already.
