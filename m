Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616AC1DF823
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 18:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEWQId (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 12:08:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:58824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgEWQIc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 23 May 2020 12:08:32 -0400
Received: from localhost (p5486c962.dip0.t-ipconnect.de [84.134.201.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EF8A20870;
        Sat, 23 May 2020 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590250112;
        bh=ANHPjU7YN/d/8ujGajrmQwutVoIT1We/3B7WnuT/w74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvDJUBXqMRSjg8n2HIjPf7dQWubz99csitAPR5usWrqrKPAIL1Catc8rHP5UFPDbs
         A9EFEZ1fzWf5Dhv0gfz7Sz8Aea87VlvMU6BHyipRlb9qgVG9HbWFQTxUigXOyjxG0r
         CYON1jAzGYON31ZSDBAcBNdf3UAwWarbAQlp1El0=
Date:   Sat, 23 May 2020 18:08:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, festevam@gmail.com,
        vz@mleia.com, heiko@sntech.de, linus.walleij@linaro.org,
        baohua@kernel.org, ardb@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
Message-ID: <20200523160828.GE3459@ninjato>
References: <20200523145157.16257-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dFWYt1i2NyOo1oI9"
Content-Disposition: inline
In-Reply-To: <20200523145157.16257-1-zhengdejin5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dFWYt1i2NyOo1oI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2020 at 10:51:55PM +0800, Dejin Zheng wrote:
> It will call devm_request_irq() after platform_get_irq() function
> in many drivers, sometimes, it is not right for the error handling
> of these two functions in some drivers. so provide this function
> to simplify the driver.
>=20
> the first patch will provide devm_platform_request_irq(), and the
> other patch will convert to devm_platform_request_irq() in some
> i2c bus dirver.
>=20
> v1 -> v2:
> 	- I give up this series of patches in v1 version. I resend this
> 	  patches v2 by that discussion:
> 	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.80=
69-1-zhengdejin5@gmail.com/
> 	  The patch content has not changed.

I don't understand. v1 has been nacked because of technical reasons. How
did the discussion above change the situation? Am I missing something?

>=20
> Dejin Zheng (2):
>   drivers: provide devm_platform_request_irq()
>   i2c: busses: convert to devm_platform_request_irq()
>=20
>  drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
>  drivers/i2c/busses/i2c-cadence.c   | 10 +++------
>  drivers/i2c/busses/i2c-digicolor.c | 10 +++------
>  drivers/i2c/busses/i2c-emev2.c     |  5 ++---
>  drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
>  drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
>  drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
>  drivers/i2c/busses/i2c-pnx.c       |  9 ++------
>  drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
>  drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
>  drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
>  drivers/i2c/busses/i2c-stu300.c    |  4 ++--
>  drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
>  include/linux/platform_device.h    |  4 ++++
>  15 files changed, 72 insertions(+), 91 deletions(-)
>=20
> --=20
> 2.25.0
>=20

--dFWYt1i2NyOo1oI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7JSnkACgkQFA3kzBSg
KbYnHQ/+LTBnD8nOpIlX/IIOqP5LwGj03wn1jJ4soy0RxRLuFFE2Ld6lFQiWAWiA
5phUgUVfaUIB2GV6rFPsRg3bokfCcHN/e95QokhQ7nuVK6yNrmgIfM7mUYYF59j9
YCHzfizwwSAprzfcTzTAXiZGksVTk0N6Rlo26/3fublht5+6l4gISxQccGwZiIh+
xYGuz55m5x18BALCd+q1eNbvDV1NIgqUZv8GAp+vIkBtvo3uefPH/Q5CruZw9Wo4
xuc8PDrJF+TKosZYVzxKYZZNRqUvopidyitz8H5MXBX/397ZWZB+PIXQFv4OQjH8
l8KMxqF04wMCz1GqB52KRsPCrIKRWT4J0d0vAdW+5tDbWOrFx5GCwuth7BRvRC9x
RNfkbdhhc2bTDYB3ROuXkGAmD/sKmvAghZmd84dIishy+QTv64nqINPAeXXI5f0+
ESlEpyEDdVZUqmS2xDZoCi80N7qp71iH8P2brcW6TuZCyd8nuFEICRzFljAo+PAR
BH7a+R6e422m2zBKaNsHkWE3GIv45wQJQQO5Ds1zznz3oB2Ha5NcnRno960LmgFE
l3TQn81Aevo2lEOuhNKv7CkOPp2620RjlxwR/B5PLKa87QcxcbRIHvljNj//fOiz
eRoem1rxwEYL9/6xyHNqCvTyBfc5L3qkfSMRn2Lezsn3Oevm534=
=WzE8
-----END PGP SIGNATURE-----

--dFWYt1i2NyOo1oI9--
