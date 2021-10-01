Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFB041E749
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 07:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351850AbhJAFwR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 01:52:17 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:13602 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241958AbhJAFwO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Oct 2021 01:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633067380;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7SIB8AxntpY6yMesWH3shU0yamjQqWeCLJGlZjY1NmE=;
    b=XEGt7h4cNzN2fm27xuyGt4gS4I6q7Hjqz9/vur4cubJv+ApEyTckNOixtm95THzkTW
    hJ0SazTCWeFQXoWUwKmA+zrKwynbDPPucvWpFj0ABWcstACO/o92UzN0dnH3OoHC11Ay
    o0PG/LTi8vtv0VoNTi7j/O5OcFzBtUMTQbnA0h4SH1j0D9zyAHTsKRP+E3jKpRiU+/rA
    rtrUJ6jGyJ7N7oqGr/+nENRzn0W+3AoH1ZjdzRwn0CPdKbi5K4/j3zsPgIXcGw3YdNQe
    +rVWX4cgkho+1VoT0MfVY56NtHqv7ZzplfPUklBvgaFChIsBmgsWEw/BDzX84rKJ18pb
    941g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mYXDB7v3tOCDfwiDBygV+JEgJrW3AbrzS96w7"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b176:dac1:b99c:1716:ba2a:6835]
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex915nbbkg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 1 Oct 2021 07:49:37 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Message-ID: <ef6970e8-9a85-4b31-0697-91346bbf58b0@xenosoft.de>
Date:   Fri, 1 Oct 2021 07:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Typo: Damian

Correct: Damien

On 01 October 2021 at 06:47 am, Christian Zigotzky wrote:
> On 27 September 2021 at 07:39 am, Sven Peter wrote:
> > Hi Christian,
> >
> > Thanks already for volunteering to test this!
> >
> Hello Sven,
>
> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with 
> your modified i2c driver on his Nemo board yesterday. [1]
>
> @Darren
> Could you also please check Sven's i2c modifications? He has also 
> modified your source code a little bit. [2]
>
> @Olof
> Are these i2c modifications OK? Do these work on your P.A. Semi board?
>
> Thanks,
> Christian
>
> [1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54098#p54098
> [2] 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
> [3] Further information about the Nemo board: 
> https://en.wikipedia.org/wiki/AmigaOne_X1000
> [4] Kernel patches for the Nemo board: 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2018-January/167288.html

