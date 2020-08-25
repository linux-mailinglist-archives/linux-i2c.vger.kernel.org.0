Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53C8251548
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 11:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgHYJ0U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 05:26:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725936AbgHYJ0R (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 05:26:17 -0400
Received: from localhost (p54b333df.dip0.t-ipconnect.de [84.179.51.223])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0A7D2068F;
        Tue, 25 Aug 2020 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598347576;
        bh=T2kSGOuK3m8k7gWo3P5HzQK2jaRznKuC20hjtiRBOjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1LEMhQv5WeJFL2nBK/MIhnwi+Rsmd2rP6kyGFal1Ibj3oyVyP6QTmZf8b9QFO0cJe
         BOWHPOJ1C5ucLNpfSrD7Sms7JRo6XyJ/1V3tOJAl42iMk6thRjCYB8x52DwZEbl8rp
         iN0ZN0aZZbWdNq+xFA2WhMg3kLeOITGjURJwyiuI=
Date:   Tue, 25 Aug 2020 11:26:13 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mv64xxx: Add bus error recovery
Message-ID: <20200825092613.GJ1861@ninjato>
References: <20200824225254.1114-1-mark.tomlinson@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aznLbwQ42o7LEaqN"
Content-Disposition: inline
In-Reply-To: <20200824225254.1114-1-mark.tomlinson@alliedtelesis.co.nz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--aznLbwQ42o7LEaqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 10:52:54AM +1200, Mark Tomlinson wrote:
> This adds i2c bus recovery to the mv64xxx driver.
>=20
> Implement bus recovery to recover from SCL/SDA stuck low.
>=20
> This uses the generic recovery function, setting the clock/data lines as
> GPIO pins, and sending 9 clocks to try and recover the bus.
>=20
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
> Changes in v2:
>  - use generic GPIO recovery function.

Thank you for doing that! Glad to see the new helper function works for
you as well. The initialization code is all well, but I wonder about the
use of i2c_recover_bus(). Recovery should be tried only if it is
detected that SDA is pulled low when the bus should be free. So, you
shouldn't call i2c_recover_bus() in unconditionally in probe(). Can your
HW detect if SDA is stuck low?


--aznLbwQ42o7LEaqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9E2TEACgkQFA3kzBSg
KbY5iQ//XCFBdzw1bllHv/Z/puDG8CmCq+PfsS+u1FqRaxrqC88T0/dBq04kbWVP
wa/mERJ6NjSJAHG3BYrV3zeGxlKw/60XV9gLeycj+Q9Xq+xCnPbXh5cAfDoGoJL9
GhKso1gfhpA8YtCN+6NpG6S6mRMLSaW2XfLEw4n7A+LHAVROzA7Hp+payFWyn5zm
3ic9Lrdnqay/7CtuaCLmcauIb5jlixEwcuLdlvHKrxYZ13/7iSFnLNj62308lCwj
8I0ykEbviIhyDzAHvqe4DhyghFBK2QKuTg0q3rxHWq8jKcWicPpp+qqCqVI1Ugab
oKFzbuuXS8/nP551WkvOA7Hqwc7YI6HlrH+LYUxJllLTvL+O8UpDM3Jgv6U+Csvo
omNAPXOfZVbOtrpfRbLudHWWdhNdwB1+YDtEcy+Kw9fhTADapDgEQmaiXMt5IRMU
dP4bcxPswhg5y11fcRbhJM9tiHyTA3kz0Fch516CTLhRZP4C9FkZZ7Wip0aHHtCZ
nVxmdGRPN+AnzQd+fOHGs8W/8iXY5H+x/OIzC7KKllq8Al6CZ4xGwh2dUCFB4DaD
WRbtsUFyRuLMbK7phO+PLoxk+Dm16z2yZRW1uV5b9916myM2iNS1VVUrFfotVyLH
tZqK9o9eKPzQy31xcpgCCFYnlrMf71VQNhshRSlUxI4Zo4z9b6I=
=Rz8g
-----END PGP SIGNATURE-----

--aznLbwQ42o7LEaqN--
