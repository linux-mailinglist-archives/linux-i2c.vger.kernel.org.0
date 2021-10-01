Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7048241E6E2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 06:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbhJAEuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 00:50:16 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:34987 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbhJAEuP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Oct 2021 00:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633063650;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=b06yQyLAekyW6lwakwOLyFVuHuaO/jkcVt4ChJMYpRg=;
    b=oTBbAEdLtpos1INdEzfUjPNhbT7xu/qzW24ms8sTPFtyhiDpjOmQ/hszJ8Heu3H7bF
    9aZ4vbygDRIFAyMaASItaiC9xNwm2gaIQIYuuLFNs61cvUakjzekGJSog1kk1PgFXLd5
    m/V5tjrMjxM/maXTaakpPW+jJu8beQWnoPIr0XNTyEejryK9GxHK/Y0/CB0zgihV+hQB
    cifxOMEBd9qLdIfS2mnC+IB0relXoHMoQ9XdYRisQIidCY7R0hN6EWcpC4MSWzFiKPyF
    MtdCNQVJQeXu9XDxj98jT1mwmJn0vv7N4JN1WkjXIOvsPvk9PROOjFzIuncIbvizZ5qr
    ckng==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mYXDB7v3tOCDfwiDBygV+JEgJrW3AbrzS96w7"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b176:dac1:b99c:1716:ba2a:6835]
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex914lSbcN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 1 Oct 2021 06:47:28 +0200 (CEST)
Subject: Re: Add Apple M1 support to PASemi i2c driver
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
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
Date:   Fri, 1 Oct 2021 06:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d0a646c7-426b-4b40-b3fc-9776c6a1025d@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27 September 2021 at 07:39 am, Sven Peter wrote:
 > Hi Christian,
 >
 > Thanks already for volunteering to test this!
 >
Hello Sven,

Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your 
modified i2c driver on his Nemo board yesterday. [1]

@Darren
Could you also please check Sven's i2c modifications? He has also 
modified your source code a little bit. [2]

@Olof
Are these i2c modifications OK? Do these work on your P.A. Semi board?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54098#p54098
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
[3] Further information about the Nemo board: 
https://en.wikipedia.org/wiki/AmigaOne_X1000
[4] Kernel patches for the Nemo board: 
https://lists.ozlabs.org/pipermail/linuxppc-dev/2018-January/167288.html
