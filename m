Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5F753EF30E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Aug 2021 22:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbhHQUJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Aug 2021 16:09:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhHQUJp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Aug 2021 16:09:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7FF0E60F35;
        Tue, 17 Aug 2021 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629230952;
        bh=1mBxSLmpdpOV1fOv7ziL7hOsqQXQWzH33HEO1fBbdl0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pLurhdNOPcrzDsVFf2CMqdwYDpN9yrVjzKPfXz8V9M/vvmSKzdSgihEJ9X3UHbTMg
         UARWrAjfbbMzcCFGcrJeQ3wbjMjI08yyGkzgF9c1j8vC2imDY2RRcLTiA/AWMHX0wn
         uC9acoQkBizmGlKzwylbD0lSI65d0AngpqlREWKC4stbKt5Sq3v3BxWwvSENF1zT74
         eiwWstcFOQbaabOHsE4i1p2CMQh1gdimAGHkF/FCXigE95cIYln+F8Oi7yBHRJaT+E
         5w5AFrarc8i6Cz6q6G7OqFUcHToc9Ebz+ORlR0ZoUpyLx+SkOml/oGkGmX5sAmfCnK
         NzUr+K9yOhLFw==
Date:   Tue, 17 Aug 2021 22:09:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
Message-ID: <YRwXZVxORTpddj2k@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>, linux-i2c@vger.kernel.org,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0yY7MVuXzIX4oSrC"
Content-Disposition: inline
In-Reply-To: <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0yY7MVuXzIX4oSrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 04, 2021 at 05:38:45PM +0300, Sergey Shtylyov wrote:
> Iff platform_get_irq() returns 0, the driver's probe() method will return=
 0
> early (as if the method's call was successful).  Let's consider IRQ0 valid
> for simplicity -- devm_request_irq() can always override that decision...
>=20
> Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controll=
er")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>

Qii Wang, do you like this patch?

>=20
> ---
>  drivers/i2c/busses/i2c-mt65xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Index: linux/drivers/i2c/busses/i2c-mt65xx.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/i2c/busses/i2c-mt65xx.c
> +++ linux/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1211,7 +1211,7 @@ static int mtk_i2c_probe(struct platform
>  		return PTR_ERR(i2c->pdmabase);
> =20
>  	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> +	if (irq < 0)
>  		return irq;
> =20
>  	init_completion(&i2c->msg_complete);

--0yY7MVuXzIX4oSrC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEcF2UACgkQFA3kzBSg
KbaS4BAAkuQqKBfaT+tbSEvRQ0R7x/ilbpIC+nlWrCwPD18yUSWkgzIJPL08yqZR
dMLEkeLFQjNTgkk3M6YvD3soi50s0EohVG97o7YFXMV9QI1di3+RpTw73nuKDEl7
e5CYpNCnGST3/iElUj5aJZweQnrZ4DYw6XDOK7qhS+hhNZQiOIR6J5Z8mFBmKfwx
oXMtyUQnyhyqGzSTA2yM0+Q/u7KIS21bMwePSwpjyqS2/eS3YkqjvnmhiCKnPwR0
AQfX7m2Cg1qbgOqu1oEOfp+oCh4BDVZpPIY31NhodoUFb2/JMelIDc7FDlEs4Nrs
pyuW/9tRr6JGiRTzTQ/b11xuNQYW5PTD5krQas19SpsMOXOeOfUkg9Ewx6yaPJRN
z+h/48Xw7zAi1YGEx8k5RtGZ/2cVPL7CMcSjtyIkqzuP+//62UmsJJFWsqVgQpt1
1LpTqiYYF03hggNbWv8ql1F1uR78kDIXE6tOnoQn/YgvshjEm5owM3jXwniODI1N
G/XtmPrQpdE6YkJrKl2SfNkTqacf8Nou2qwGdzGK2b/ghfduV62TZHbHqLsvSsK5
1cwZBw8zxmQYamzC3loUT8vqnXRBXfJDi8d1GLuLJB636viHtFBn+bRmK/CncTl2
0JjO1knFr4E+rxSqdHmQYNiKKLzvDqO5i6OxiFLpWKXentDqDDQ=
=+38Z
-----END PGP SIGNATURE-----

--0yY7MVuXzIX4oSrC--
