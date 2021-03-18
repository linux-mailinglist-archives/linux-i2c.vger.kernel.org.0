Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65379340806
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 15:41:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhCROlA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 10:41:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:50071 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhCROkz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Mar 2021 10:40:55 -0400
Received: from [192.168.1.155] ([77.4.36.33]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQdpG-1l1OP032Yg-00Nklv; Thu, 18 Mar 2021 15:40:32 +0100
Subject: Re: [PATCH v8] i2c: virtio: add a virtio i2c frontend driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, wsa@kernel.org,
        jasowang@redhat.com, wsa+renesas@sang-engineering.com,
        andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
        arnd@arndb.de, kblaiech@mellanox.com,
        jarkko.nikula@linux.intel.com, Sergey.Semin@baikalelectronics.ru,
        rppt@kernel.org, loic.poulain@linaro.org, tali.perry1@gmail.com,
        u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
        yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
        pbonzini@redhat.com
References: <c193b92d8d22ba439bb1b260d26d4b76f57d4840.1615889867.git.jie.deng@intel.com>
 <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0dfff1ac-50bb-b5bc-72ea-880fd52ed60d@metux.net>
Date:   Thu, 18 Mar 2021 15:40:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316074409.2afwsaeqxuwvj7bd@vireshk-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TczQ+6YEjmhiLNThfpaIYABvuIvDLWQ4+8Fmuu49ByV4BPliRm+
 YjGrfxRBj3WxEDNVzVv6ba93pZA5owUAcn+X6ZYHpxbbG6ALgK57fwFcQR1uQEPAAO2/hMS
 i21zZpUtQLfQfBt9iurF5SYe8XtRU8ajkzII6xLCKNc5T2RzHjwUlr/kPohsj28UcOSaYcc
 Ey+WfUxoYYFBcA8xOqYzg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LXitjFqTwjg=:bGm1M1duhGxfwdSdCC6IcK
 gAyL4ewI4RORmbN8SrcXm95Qu4GclOWoG8hPERPkSlah0nXHA4EPizYp5kIAPvtYIUlAqPP8g
 sZXoQmX7+tHpc+/O++s/UwYR2XMjyCiHEO8cn3H/Jc7OAjYKbyClY/LHHP2duowYC8CQoi7RB
 nr6UxIVNMekZni/YbknmI7WjH0LqxHfl3Ape9rFKawpSZ17Pob6Sz4guZX+josWH24WvN8aMw
 MW4dqUCLPFATuAaWUzoH9E1YXuhdka5U+KeCX3gCK3170BSO+jeEbEgoU3kJNG/X1DrRdzluX
 kReNLaZf/CLYG9I07A2G2RxlUeHdETixfX673wyyzkXoBHfbHjjglbS3TgWL5enYVTP2lq8+d
 o7FLuQqEB57O3NmWEgCRKabTVhJhSYihyCoUQ1NPs6Qv+y3ZRX5DNOKNmS3JT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.03.21 08:44, Viresh Kumar wrote:

> FWIW, this limits this driver to support a single device ever. We
> can't bind multiple devices to this driver now. Yeah, perhaps we will
> never be required to do so, but who knows.

Actually, I believe multiple devices really should be possible.

The major benefit of virtio-i2c is either bridging certan real bus'es
into a confined workload, or creating virtual hw testbeds w/o having to
write a complete emulation (in this case, for dozens of different i2c
controllers) - and having multiple i2c interfaces in one machine isn't
exactly rare.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
