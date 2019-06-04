Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCE73503C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2019 21:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFDT0t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Jun 2019 15:26:49 -0400
Received: from anholt.net ([50.246.234.109]:48998 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfFDT0t (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 4 Jun 2019 15:26:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 816BD10A288F;
        Tue,  4 Jun 2019 12:26:48 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id JbnoffimuG9y; Tue,  4 Jun 2019 12:26:46 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id C88F310A1128;
        Tue,  4 Jun 2019 12:26:46 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 45BC92FE3AAE; Tue,  4 Jun 2019 12:26:46 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Annaliese McDermond <nh6z@nh6z.net>, f.fainelli@gmail.com,
        wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     team@nwdigitalradio.com
Subject: Re: [PATCH v3] i2c: bcm2835: Model Divider in CCF
In-Reply-To: <31580e1f-60d2-f13b-dcfe-6bc6e75e9285@i2se.com>
References: <20190529042912.12956-1-nh6z@nh6z.net> <31580e1f-60d2-f13b-dcfe-6bc6e75e9285@i2se.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Tue, 04 Jun 2019 12:26:44 -0700
Message-ID: <87pnnt6tjf.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Am 29.05.19 um 06:29 schrieb Annaliese McDermond:
>> Model the I2C bus clock divider as a part of the Core Clock Framework.
>> Primarily this removes the clk_get_rate() call from each transfer.
>> This call causes problems for slave drivers that themselves have
>> internal clock components that are controlled by an I2C interface.
>> When the slave's internal clock component is prepared, the prepare
>> lock is obtained, and it makes calls to the I2C subsystem to
>> command the hardware to activate the clock.  In order to perform
>> the I2C transfer, this driver sets the divider, which requires
>> it to get the parent clock rate, which it does with clk_get_rate().
>> Unfortunately, this function will try to take the clock prepare
>> lock, which is already held by the slave's internal clock calls
>> creating a deadlock.
>>
>> Modeling the divider in the CCF natively removes this dependency
>> and the divider value is only set upon changing the bus clock
>> frequency or changes in the parent clock that cascade down to this
>> divisor.  This obviates the need to set the divider with every
>> transfer and avoids the deadlock described above.  It also should
>> provide better clock debugging and save a few cycles on each
>> transfer due to not having to recalcuate the divider value.
>>
>> Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

FWIW, also:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlz2xfQACgkQtdYpNtH8
nugysA//bZbeBZr4HJvvzsJhUkxzSPImOH4/xN2nzZVCVPXWro2fQXPC/WRTdl5K
/WA44cuxN/zAfFwzOQgPs3LRRQiddJZsiKMhSiZeu4+Wu9vQP4vCoFU6lZHoZzGq
XL3N29LzHldvQ4OY7wOsYDgPZrR1EKoP0nqeH8K/ayJ1m1bGVv0SypbdyAGRDPH3
t39/xMXBDhgLjFd8u5rSDObqVLDo3W6yJDyb4n7Jd61qomrIqCzwPWT6/P2cxr7o
70p85EcGXejuwPEez5SCbMY452e5LmHFyTa99aRf69KYEfXm9Ut6/uGjohlINIzk
isMZFI2wIKt7BKpjDep3LaQAlO+B5S7m21rqcHB0BT/yarY4tPdA1M65L+eSMN00
MVoCwpI4Xy9dN0R2YuXiwBFtGChXEcqwbct9TkBd49nbjQIslBQQUOgCWKWyfXwX
Qa/pxuXl8vVVI2F+ACFBPaM4EVt6mYS7Uc12PokM8XU2tiIWklzaPIjEQlI4LSVr
uj1cxcAc5aSbSfioenbPeNCYFO8AxlwtRdAIk4CQz2yD7PNmkzUnkqnKGyjOngCt
S026/jbBITOpIvGVEdeXzAfKTwkNsNqj2R2Bul5SSIr3u3pUxcUoTUhpFXnzf39H
CXJZTCowSW8/5Fk6UxQ4RFSfuVUXF8cQmjgkvL+8VLKITVTMBS0=
=djj2
-----END PGP SIGNATURE-----
--=-=-=--
