Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1BF34189A5
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Sep 2021 16:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhIZPAy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Sep 2021 11:00:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35853 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhIZPAx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Sep 2021 11:00:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632668163;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Date:Message-ID:Subject:From:Cc:To:Cc:Date:From:Subject:Sender;
    bh=KaFOSJIVV9boepqNISMUi4waYym/nvTXk7mWiUd+w+E=;
    b=ooEa3XRcGi80ORmIk0uG5WczC8WNFfENVTXuynNKu8YrCIv4DNO18sdJHSVLzgBhcD
    81wltzX70pyAZEbf/rGXKcpHhIIiK2+cxVYXocQxb7m0W+A6Dk01nHmcQ4yG/mumYNtB
    zlh2H4iU9Gj5ueOaSu4pxWgbl+uyYzzR5k5LjViC3FE0zBpnKWnuuAL/s3RWwudUyUWM
    eunFZhgApojjMU3stM5Hn4b7iqIMtjcUsCruTppD+w2/NIvPjYF8B1kIXQ7qtti8Kpl9
    Ge5bO+eyF+Puh33tlgXwGC04YjJE0/ER44gh7XzXS6Dl9u8apIqf51nTzDdaB/Hpsgy2
    nIqw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hp0mZ3BcIsNuXwFLsTA7sa7cyyFFkU2ERvSHsGhb"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:b170:9699:595d:1b3e:7cff:9aea]
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex8QEu0JNv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 26 Sep 2021 16:56:00 +0200 (CEST)
To:     sven@svenpeter.dev
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Olof Johansson <olof@lixom.net>, arnd@arndb.de,
        marcan@marcan.st, mohamed.mediouni@caramail.com,
        stan@corellium.com, mark.kettenis@xs4all.nl,
        linux-arm-kernel@lists.infradead.org, alyssa@rosenzweig.io,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        Darren Stevens <darren@stevens-zone.net>,
        Matthew Leaman <matthew@a-eon.biz>,
        "R.T.Dickinson" <rtd@a-eon.com>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Add Apple M1 support to PASemi i2c driver
Message-ID: <6487d099-e0d6-4ea3-d312-6adbd94589f4@xenosoft.de>
Date:   Sun, 26 Sep 2021 16:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sven,

Thanks a lot for your nice explanation of the history of the PASemi i2c 
driver.

We are using Nemo boards with 64-bit dual-core PWRficient PA6T-1682M 
CPUs (A-EON AmigaOne X1000). [1]

The RC2 of kernel 5.15 works without any problems on our Nemo boards. [2]

Could you please post all your patches merged in one patch? It's easier 
for me to apply one patch.

Thanks,
Christian

[1] https://en.wikipedia.org/wiki/AmigaOne_X1000
[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=54056#p54056
