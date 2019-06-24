Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C6E50136
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2019 07:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbfFXFoH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jun 2019 01:44:07 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45721 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbfFXFoG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jun 2019 01:44:06 -0400
Received: from [192.168.1.110] ([77.4.138.202]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mirb8-1iBLL42bbQ-00ernJ; Mon, 24 Jun 2019 07:44:02 +0200
Subject: Re: [PATCH 1/3] include: linux: i2c: more helpers for declaring i2c
 drivers
To:     Wolfram Sang <wsa@the-dreams.de>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <1560796779-17117-1-git-send-email-info@metux.net>
 <20190621211744.GC950@kunai>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c669a041-f025-693a-492a-80ce888db737@metux.net>
Date:   Mon, 24 Jun 2019 07:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190621211744.GC950@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FvDrHSFA8yM3VTo9ZSCraAJ6BwDwCFk9ahYKWgsP4DDZkk6r8ky
 YFwhJqRRev+bQQvSYnqRJ90sIt6HfVrJ4Bb47ltZXGJ88avFYlgHZ+qCH1NjHAf9+tQC6Vm
 W11tVZdPEFw5OhhXUqDmP9fBpb9UiaBpeM6oRcWZBL71fQfYGypQ0n49np14OS1JRe37L8A
 EaU5Wc/r33jgiYVpdodpQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q6wwMcoSqTc=:htisqL60GOqxnfeGPCSIZn
 UJmJhGBi0BgHHnYj8q1iSAR/lqlgPRdCgELgPdPoh3MUsaQB22sU4hAPzHRcU5bJuinye4Piv
 DfHiq4aIzeI0TBOGqvMxxvEc6FAOypHr89MZDA3MbMr8lkvjGGProSXW3t21CNxDHceO8vbog
 AtSbo35dKdRc/QRVXsMY4L0OwM7Zn4zOlbRWDHVFebmfe8xNhG+mE1gX1L3rbOgrhIdH0UrVS
 iGxLLsRWC4W/sHQ1auGy9qMFzwR0hNSN06UUJVLh34vgP1Q0MAyeS+Eb7nX9YjB5tZyYOQNkT
 yztCYLQXsYJ4+i3saQaCmv+KGHemO6hQiDqz746Ip2Dq1TkhsgCxJCkWAQE+AyW/igwJZdxtX
 kvwmljNdd/ybBtg3eC8u4wrLKrHPFS2C33VGPFxf8PyMnKZWvGxQWgtKljWnkVNcZaj7Moml8
 gH2m5bW6b6ERSN33wc1A2YaVIAKMXDCCWxrq2sAokOHkV7ibq8BnVBgj9HjrhHuj3uEZ66IO7
 yzTPAV4pxY7pRyO2uXuuVHYsvzGAH/NKUKjFuwD6wCcKfddVAUCkV598vU7AV8BONsbO6l+hm
 r6/8vQV4eciWiOHbmuhiW0ZstbU/9/D7DIoryOtuQKOmtT8Ve3jgv9ozaKUXupEWD5+TeT4NJ
 gSUPdHrl6kpMvbtxaLlKYagL3XuJjWK5ZHGIKnO5mxdQT8w/0zDCx3gOdtPLu2vWHxBKo5A6z
 OTaLIuuvpDca82Nfxbq5IrwleGpB9tTjBcZNhkpjt5yXA9R/Qngu8dnh9kA=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21.06.19 23:17, Wolfram Sang wrote:
> On Mon, Jun 17, 2019 at 08:39:37PM +0200, Enrico Weigelt, metux IT consult wrote:
>> From: Enrico Weigelt <info@metux.net>
>>
>> Add more helper macros for trivial driver init cases, similar to the
>> already existing module_i2c_driver()+friends - now for those which
>> are initialized at other stages (eg. by subsys_initcall()).
>>
>> This helps to further reduce driver init boilerplate.
> 
> Uh, no! Using subsys_initcall is an old fashioned hack to work around
> boot time dependencies. Unless there are very strong arguments, I
> usually do not accept them anymore. So, any simplification of that sends
> out the wrong message.

Okay, what's the correct initialization method then ?
Just convert it to already existing module_i2c_driver() ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
