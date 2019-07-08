Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0493E62905
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jul 2019 21:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731535AbfGHTKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Jul 2019 15:10:54 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:48169 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731294AbfGHTKy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Jul 2019 15:10:54 -0400
Received: from [192.168.1.110] ([95.117.164.184]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MJmX3-1i4AFV1OC9-00K9mg; Mon, 08 Jul 2019 21:10:24 +0200
Subject: Re: [RFC] SW connection between DVB Transport Stream demuxer and
 I2C-based frontend
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        I2C <linux-i2c@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        GPIO <linux-gpio@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Brad Love <brad@nextdimension.cc>,
        Antti Palosaari <crope@iki.fi>,
        Olli Salonen <olli.salonen@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <5e35b4fb-646d-6428-f372-ee47d7352cd6@free.fr>
 <b6abf5a2-3151-29e5-8eb7-c960580fd4ea@metux.net>
 <79b9bd5e-be05-daa8-0d16-d84a383138a7@free.fr>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <bb66e283-477b-38f1-cc0d-95ee94b70dc2@metux.net>
Date:   Mon, 8 Jul 2019 21:10:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <79b9bd5e-be05-daa8-0d16-d84a383138a7@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DUR7avr6KGM5zxlK1ue3WZpoy1VAsrFT6DJH9exnTs1P7lmuw8m
 hNEimNt/6wbWi+eUJJB3YXAECYZ4Zi6nVmmKD5CAzozqNe/FxzfE6yyk/G2dkDNq9aAcp4N
 4sTdHKGEByCyj9Dfx9+s6RoHCTdk6pImgvpKULqu54mg7+u4Lv9DuazEy+N6jR25fJ+Hu/d
 re3MaMlUEphN7reVEUwPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R2Teip2HdFg=:CEjBvuK84q3bHjaHNjALxP
 3x7wSBcQtwBN664UW6zPBtZ0BOkxCUAFuyuCJr+LljA/W+g7V6t1lSjluQPfZDs6EykCgNQ6L
 mNJ/XSSQpeMbcUv3o8ppdMhUVH+WSO6UrnxU4iwvstsJFP9qisCZG/vNxmr1e/ovYBIS8ytzN
 8KbPjiIE7B0+tCcvl72uQ1hPYPJ240KaiQ0DQxKj5vUmh/vfEawzvxPjdeU4qGOIIrKUEMoOJ
 +Ak2UK1Ey/YGQ/T7O7s3W5+mEcW+qFNzZRkBSGyc6l6GTcnnp4VY5v5GOsySisyQfGoPClGXg
 I9ry0QG1YoYZsU8vomszqm8ZK48bQlJr2uKTvWLExO+qYfK1bm6nbgPvfLb43nZQv38ATpq1m
 ggt+HvQ1A3vYBAxEQ/waPl9eFWO/n1sbT4cPAzQZH1HEPlqjru1kVoYKqlvy23jAyVA0LKcI6
 vTevNMFNJ8cloIgfIKqCvwjGXfv+Egs1umAdKGxobhoh3U8K+vYxNHg8vPnZBzE2XXdJ1gpPQ
 2cEhfs48Sv5zNPn0/a47NxYpQy0qeVZUCo7s/yEJUoeoDBY2BB6rq2JN/HSLGmAwFUfzxVxDp
 iNzL+I5AAZ3RYkMU+hhXHmk1UlA411dH2e3v8h3i7ID7KhxIcFUz6aW/oBtT1prlPWSgVzUwB
 jSxIVmUeEfTfCrki2YXJNJYrfbdbm/9uqge1oJkWzkpe6+6FLMBPscU6jTFg65yAdHsgP+SIp
 oWO0OYz/St7hJuspEPwVvfdJwLGZOmqiS2kzx6ZmiJzVLcRMPbA1KAVxTrA=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.07.19 17:03, Marc Gonzalez wrote:

> One problem is that since the internal bus is "created" (declared?) at run-time,
> it doesn't seem possible to define it (or its client) in DT.

Maybe declare it nested inside the si2168 device ?
The driver then needs a piece of glue code for triggering device probing
on that bus. (so, it really needs to provide a full blown i2c driver ?)

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
