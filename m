Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3F0275CF5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 18:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgIWQKR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 12:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIWQKR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Sep 2020 12:10:17 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3981C0613CE;
        Wed, 23 Sep 2020 09:10:16 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c2so72790ljj.12;
        Wed, 23 Sep 2020 09:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=fLmbb9U9bqHqilaK4385mcuNv91EOtpVFkgBOfJ5G/o=;
        b=p2evDSCa2EcEE8ZLWWk1otlE+tmQeKWRhzKOHSeR4RMUh1WzU6ZMTSjwuENScJP6e7
         d7/O+k7UsRmvszhNWV8bEJsqD+t4J5QFYpFjbD+4NPsGYb5AbEmWNlUYI2gj8InGLjhz
         ppUPvvkXKBf3p0RGWZG0Hbsn1xHXNoJummU3B0GeW5vvezDasmFy2FefgEyVWxvWvxin
         nr3OCyWdIJ109nZRH3928LJyg+y9gc+1KoHl5z1hjsDPB4yQIOJ/B6AuFA5xy9klepan
         fHvdT8Ec0cFLT6OXaZfunoMH6Vt8d+IF73RKXD70/EFTWgX3X35lx58/Jf01hM9mnXDF
         /sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fLmbb9U9bqHqilaK4385mcuNv91EOtpVFkgBOfJ5G/o=;
        b=E6SgHfr2/SU50R6QZHWMiUGQRFPGOqla0TTpQRkqvVyG/AF+Br77s+B9jrtHCqJF4p
         +es+KHgcbeSUCDvjeY4f97VjG5hqdkry/f3q27f/TbPSJV3g7kk+wjYTWRm0lm2lLd4I
         uaC7XZ3/yupXbG18YZd1IfQLxpeikjwGYCVxDYE5cOjCCSwSznJgqoNpMHuySo/rjCc8
         JbicObXBtQHJCM2z/KwaJu4r161zRgLq3ozbTtzZ66BVvfnhJI7J3BlmhxHIFFqd4eW2
         y+AKhUnx5Fwu/6u5Lj2nFYn6mgLkS1SbfesZ1D+zTCsKsKRBjvUIr7v74+ZwgKKmzXhM
         pgHQ==
X-Gm-Message-State: AOAM533ovi05ffeR2zdz6NybS1BBggz7hUUtxP1389DMyncS1/Z1ukxD
        PxQFhrwJdS1FKvYdRcVhQXs0UeX2ICk=
X-Google-Smtp-Source: ABdhPJy6vKnTPgLoiX0HtGkIO62575jsR7MzgOu0CgQRtBKXfWwHlcqdzmyuK6P5D3TqhFGniDjGnA==
X-Received: by 2002:a2e:8607:: with SMTP id a7mr197615lji.122.1600877414986;
        Wed, 23 Sep 2020 09:10:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id p18sm5357671ljg.26.2020.09.23.09.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:10:14 -0700 (PDT)
Subject: Re: [PATCH v8 00/32] Improvements for Tegra I2C driver
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200922225155.10798-1-digetx@gmail.com>
 <aee6c548-241d-2cc5-415e-9f0b60177d67@gmail.com>
 <20200923070153.GA2548@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <47220c52-76db-a153-45e2-6c223a2fe56a@gmail.com>
Date:   Wed, 23 Sep 2020 19:10:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923070153.GA2548@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.09.2020 10:01, Wolfram Sang пишет:
> 
>> Ahh, I missed to add Andy's r-b to all patches.
>>
>> Hope it's okay if I'll add it here like this:
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Yes, it is. So, I ideally we get an ack on patch 12 and are good to go,
> I'd think?
> 
> Thanks again, everyone!
> 

Correct, Thierry should give the final ack. Thanks :)
