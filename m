Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9DB4271F7
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Oct 2021 22:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhJHUXY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Oct 2021 16:23:24 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:16344 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhJHUXY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Oct 2021 16:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633724370;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=9Qddfdz3dC8KutvLRsZHf0Tt9+k+p0grqx2ZHUbhmX4=;
    b=jXEKme6TNHQ9fN90Rmr+8Xie0FB7EhkfPa03hZz0dwzq1vH6IQuSjvw4R+NygixnlA
    L/5WAIv1ns8EfmirUFPEGfMDrfxL/Nhy7iMVE3eYG3qGhIXq4c3PyNLAcNskNlVjSFnK
    9fAyL2GltqFIbUha9nTxIx/l2qYOHzwQLRmeh1MQxgjRhnJT2nllCHEEGBLa9Wb9d3Kg
    qIyAeVTOSthwOipGwI3ltcmYX5miYCe17ZtmxGv7YyOQ2HK5i6dyXs9NvdRL7DM7Yz3o
    NRb7YWEpLM4TGZw1GbnWDZHmytZktWwl4CMwbIFAqa9HM2zdOCXGcuEfR6IRzrpO676E
    IUoQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaM9fNtIXuaJFG7SAKEfgx/8vXcfbwY5mb44sEm"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex98KJS3uS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 8 Oct 2021 22:19:28 +0200 (CEST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date:   Fri, 8 Oct 2021 22:19:27 +0200
Message-Id: <B2915AF7-A603-43CC-9ED4-9F8A869CBCC5@xenosoft.de>
References: <87mtnylaam.fsf@mpe.ellerman.id.au>
Cc:     Wolfram Sang <wsa@kernel.org>, Sven Peter <sven@svenpeter.dev>,
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
In-Reply-To: <87mtnylaam.fsf@mpe.ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: iPhone Mail (19A348)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Michael,

Do you have a mbox link for the v2 changes?

I would like to test them on my AmigaOne X1000.

Thanks,
Christian

On 27. Sep 2021, at 09:58, Michael Ellerman <mpe@ellerman.id.au> wrote:

=EF=BB=BFChristian, the whole series is downloadable as a single mbox here:

https://patchwork.ozlabs.org/series/264134/mbox/

Save that to a file and apply with `git am`.

eg:

$ wget -O mbox https://patchwork.ozlabs.org/series/264134/mbox/
$ git am mbox

It applies cleanly on v5.15-rc3.

cheers=

