Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA5D15379
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 20:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfEFSOG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 14:14:06 -0400
Received: from anholt.net ([50.246.234.109]:43320 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbfEFSOG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 14:14:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 4B57710A346B;
        Mon,  6 May 2019 11:14:05 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
        by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id hKW1Zyu9ecRG; Mon,  6 May 2019 11:14:04 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
        by anholt.net (Postfix) with ESMTP id 09B1410A3468;
        Mon,  6 May 2019 11:14:04 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
        id 5AA492FE3AA9; Mon,  6 May 2019 11:14:03 -0700 (PDT)
From:   Eric Anholt <eric@anholt.net>
To:     Annaliese McDermond <nh6z@nh6z.net>, stefan.wahren@i2se.com,
        f.fainelli@gmail.com, wsa@the-dreams.de, swarren@wwwdotorg.org,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Annaliese McDermond <nh6z@nh6z.net>, team@nwdigitalradio.com
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
In-Reply-To: <20190505034339.30778-1-nh6z@nh6z.net>
References: <20190505034339.30778-1-nh6z@nh6z.net>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1 (x86_64-pc-linux-gnu)
Date:   Mon, 06 May 2019 11:14:03 -0700
Message-ID: <87o94fo3h0.fsf@anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=-=-=
Content-Type: text/plain

Annaliese McDermond <nh6z@nh6z.net> writes:

> Model the I2C bus clock divider as a part of the Core Clock Framework.
> Primarily this removes the clk_get_rate() call from each transfer.
> This call causes problems for slave drivers that themselves have
> internal clock components that are controlled by an I2C interface.
> When the slave's internal clock component is prepared, the prepare
> lock is obtained, and it makes calls to the I2C subsystem to
> command the hardware to activate the clock.  In order to perform
> the I2C transfer, this driver sets the divider, which requires
> it to get the parent clock rate, which it does with clk_get_rate().
> Unfortunately, this function will try to take the clock prepare
> lock, which is already held by the slave's internal clock calls
> creating a deadlock.
>
> Modeling the divider in the CCF natively removes this dependency
> and the divider value is only set upon changing the bus clock
> frequency or changes in the parent clock that cascade down to this
> divisor.  This obviates the need to set the divider with every
> transfer and avoids the deadlock described above.  It also should
> provide better clock debugging and save a few cycles on each
> transfer due to not having to recalcuate the divider value.

Any chance we could reuse clk_register_divider() instead of having our
own set/round/recalc rate implementations?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzQeWsACgkQtdYpNtH8
nuh5Lg/9Hz9DEDFEVdhjXtd+t3vKtl5okxkdaEIugqXb/lA3D71R/ish1ONL2sDL
09JoAA3Zt+WTMAZM/qPmU7GaDh1gJ9sRNzKi4AktA+XPZK/TUrFdGqZEpwhTYcEe
NHc3bp6TIzi6zDffoleIwIEhbJbfM42j/XlOycFSocqkIajreaYlofCxMNwQGn80
+JxoQbixw4xhq+0eTbDxO5rwrocM7++l4egkimH3/oX6y+mv39k+T/wwk5zLUQZS
KNqQgH9Z5Ad12lORo/OxO4XwCwXvFXWQpbAsu27W91d0dRV+SvHJcFNHAYWj7Wol
lJa6LpDoxLUZBMSroI0qZT3XcQCjJ7Szt18MIGj5AKoRZb3qUK6wI4eRM3CLtSwi
9FyKLMb7anvfubplCKHT2zBr1CpZRHQAafWQEDmlNyqqsfQRU4w66RuhUwtZ9BXy
zCCLNsPB2C+oi9bF7RTdsbNWysD0qzT1dGYJIh3FRDjeuAdsKfUqeToXWTnQIxod
kxpvC84lZgwfJohqt1QLe0vYXmMJ7m24+fwK9U8B7oBCMMvP574VJpUaJUHQUt+l
WSGN3bihzs1TZOBHyVBuA/ewQndOGbYamLUYXSf0fb6f6JYVFDc42zOh2VGDt+ts
Qw2bMUaviG5cse6/C25pPYeLiCiH5oX6MGptPmMd+ExHd/shC+Y=
=Gimv
-----END PGP SIGNATURE-----
--=-=-=--
