Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3FA4208B6
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Oct 2021 11:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbhJDJvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Oct 2021 05:51:07 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171]:14057 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhJDJvD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Oct 2021 05:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633340878;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=FeHR43dQLLtrHkwR5FFcK3N3PxqoSGlaaCsoAV1our0=;
    b=fZNvt6nZIg6C5j381lGsn/vwnSGy4QIbsdMofBzeI8dDMaDZ3hoJ0Jrl6eaU38rGnn
    UpHUck8lGxVIHCwoYVKCZniYtIGZ4W5vMHjWyIObGFR1RlJuEnyUhPw9/tkKEAPDP1o7
    LvlyAuDTtPTMGm77Fp9Okl7BuO0wISpdsSpndfKkT3K7CZ4byB2c8wgsWc2vE++1Pivl
    Hw1QFLh8LjEf3aO+tk9mt9N7jHlR0QIfLDEHUE2f7D2wQGoseswwqfIFSPSEz+ubhusl
    wSmm0wOR8vDy+8m+EITszNrMR8109I1XeuDaplJVJfx9HnYX+uS0mwBTJg1srXvNghGS
    XGgg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7R7b2Z2iLowxnW5xYeu/ol3GhYINSxQY8iybSLQkkHm"
X-RZG-CLASS-ID: mo00
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id I00cdex949lwlK5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 11:47:58 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
Mime-Version: 1.0 (1.0)
Subject: Re: Add Apple M1 support to PASemi i2c driver
Date:   Mon, 4 Oct 2021 11:47:57 +0200
Message-Id: <1B71F6A3-6467-46EF-858F-82E93D54365D@xenosoft.de>
References: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
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
In-Reply-To: <49890226-cf04-46ff-bc37-33d1643faea2@www.fastmail.com>
To:     Sven Peter <sven@svenpeter.dev>
X-Mailer: iPhone Mail (19A346)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sven,

Unfortunately Damien has found an issue. [1]

Output of i2cdetect -l with the default RC3 of kernel 5.15 without your modi=
fications:

2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x800200	I2C adapter=

i2c-9	i2c       	PA Semi SMBus adapter at 0x800240	I2C adapter=

i2c-10	i2c       	PA Semi SMBus adapter at 0x800280	I2C adapter=


Output of i2cdetect -l with your modifications:

i2c-0	i2c       	Radeon i2c bit bus 0x90         	I2C adapter=

i2c-1	i2c       	Radeon i2c bit bus 0x91         	I2C adapter=

i2c-2	i2c       	Radeon i2c bit bus 0x92         	I2C adapter=

i2c-3	i2c       	Radeon i2c bit bus 0x93         	I2C adapter=

i2c-4	i2c       	Radeon i2c bit bus 0x94         	I2C adapter=

i2c-5	i2c       	Radeon i2c bit bus 0x95         	I2C adapter=

i2c-6	i2c       	Radeon i2c bit bus 0x96         	I2C adapter=

i2c-7	i2c       	Radeon i2c bit bus 0x97         	I2C adapter=

i2c-8	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-9	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter
i2c-10	i2c       	PA Semi SMBus adapter at 0x(____ptrval____)	I2C=
 adapter

Please check the outputs.

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=3D54165#p54165=

