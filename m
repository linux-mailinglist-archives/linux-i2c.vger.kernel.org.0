Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2768B420270
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Oct 2021 17:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhJCPxC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Oct 2021 11:53:02 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:29519 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhJCPxC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Oct 2021 11:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633275917;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=n2U0PeCsRntS+jp/SpPVszJZtYbXqemerUZ0qpTMk3Y=;
    b=jHCVuR3xGifKlofLLmuBTrzVjBk/X/XTWXVFrjZJBVrGpJDUzUodQFRCUY63HjTqOm
    MCDgwgKMqJsUmlw/ZBESOwt54n9riq0Kp/02jNPE/l50GRe3TxIh4FJ5ThroT0e+JkGS
    QZZnKrVyQX6Ns1gWtfwmfnK0bAgJxk3FQb5PZ+vTF5b+cTu3Clo2K/D2fWLCyGp6Ij08
    +B089K9+ZpQz6FUtqhpaz+h5yJRFdeDXN217EbLZbQ98c3zJI5ycsvLrUCIL9cZ4u767
    cSweAdnV2Loq9VtqUlwxf7kn/GWKi7LPdoGUHAwWgPi7lgMHOfTOfbAyid2dSgP2zSKL
    UdDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZXDvscF/B540qv0BQZVZQLfrrxE4ejuGDN89"
X-RZG-CLASS-ID: mo00
Received: from cc-build-machine.a-eon.tld
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex93FjDhap
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 3 Oct 2021 17:45:13 +0200 (CEST)
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
 <9c1f5c48-bf1a-0ecc-e769-773d2935c66c@xenosoft.de>
 <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <d4aa72da-cb0b-45b9-1a20-08f183cde421@xenosoft.de>
Date:   Sun, 3 Oct 2021 17:45:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03 October 2021 at 04:36 pm, Sven Peter wrote:
 > Hi,
 >
 >
 > On Fri, Oct 1, 2021, at 06:47, Christian Zigotzky wrote:
 >> On 27 September 2021 at 07:39 am, Sven Peter wrote:
 >>  > Hi Christian,
 >>  >
 >>  > Thanks already for volunteering to test this!
 >>  >
 >> Hello Sven,
 >>
 >> Damian (Hypex) has successfully tested the RC3 of kernel 5.15 with your
 >> modified i2c driver on his Nemo board yesterday. [1]
 >
 > Thanks a lot, that's great to hear!
 > If he wants to I can credit him with a Tested-by tag in the commit 
message,
 > see e.g. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes.
 >
 >
 > Best,
 >
 >
 > Sven

Hello Sven,

We are still testing your i2c modifications. [1]
Please wait a litte bit till we finished our tests.

@Darren
Could you also please check Sven's i2c modifications? He has also 
modified your source code a little bit. [2]

@Olof
Are these i2c modifications OK? Do these work on your P.A. Semi board?

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=54138#p54138
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2017-January/153195.html
