Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139E94196A6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Sep 2021 16:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234799AbhI0OtY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Sep 2021 10:49:24 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:20881 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234782AbhI0OtY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Sep 2021 10:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632754010;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=G44RgpYWm1lf5aJbtqvM3dEwZV68hpUjNCbqcFai2VI=;
    b=lo2YMw8aaukGvNonTLkxYqC8YyZ9zP/V7FOgY7vzij69NlHvMd1lma39cgaAftn45E
    vpQAI2pt26HCzo9wF+VIvqsq+G+RoaE7QGmWmIpVoStaNyQO0A7L6eUAvvw0M4Umhkki
    jbFqvb+y0Wa872yzsWHFeWaUzbjnQGaeEuwtMyaI7fWXowDHXlnrU64OZ5ldXHsxvFMd
    buaVRTRjVM6Vn15/UVky/jNELgDyswPJ15Ba4ed0ALb8xBevCwlSr0i9R5V3lGXOrQGr
    PL/0OV+sY3JS4oPzVJwSy4spBAMURkePSy8IDPG8IY2yq0/wqkAjgpPh7Lw8WGzP+BCu
    0SgQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZXC9uZstB89hq66pCQ/IzAuyWHINmLRkeRKr"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b172:60ba:4101:c483:8872:ffac]
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex8REklONq
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 27 Sep 2021 16:46:47 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        mohamed.mediouni@caramail.com, Stan Skowronek <stan@corellium.com>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        linux-arm-kernel@lists.infradead.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
References: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
 <3dcc6c36-a0dd-0cad-428d-a6ed0f73e687@xenosoft.de>
 <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
 <YVFtrpxfUbzv4XxT@shikoro> <87mtnylaam.fsf@mpe.ellerman.id.au>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <75053ff2-7adc-178c-81cd-e80a2732c5fc@xenosoft.de>
Date:   Mon, 27 Sep 2021 16:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87mtnylaam.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27 September 2021 at 09:58 am, Michael Ellerman wrote:
> Wolfram Sang <wsa@kernel.org> writes:
>>> Sure, will do that later as well!
>> But please do it privately. For upstreaming, the patch series you sent
>> is way better than a single patch.
> Christian, the whole series is downloadable as a single mbox here:
>
> https://patchwork.ozlabs.org/series/264134/mbox/
>
> Save that to a file and apply with `git am`.
>
> eg:
>
>   $ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
>   $ git am mbox
>
> It applies cleanly on v5.15-rc3.
>
> cheers
I was able to patch it with the instructions above. Thanks! I will 
compile and test the RC3 as soon as possible.

-- Christian
