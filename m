Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2112E4009
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Dec 2020 15:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392377AbgL1Oq5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Dec 2020 09:46:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:41278 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392375AbgL1Oq4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 28 Dec 2020 09:46:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=sRpkyF4vmzNA004YE46ReE+S0eKX
        SY2NridUw6//xYU=; b=BylV0aaKStlGYvBfdL/0HnJErcHgq80IRnC/J2NImr3J
        j/mzeqiQ+lfJAOBJwR1CZH53QEo+AVZfDnDYTT6nSJQskuE0XLfBRYYSwKj9QoFS
        eg9S79KYl9O2wxBa0rkyGuMPxlY8v17+YMT34wDyiQnC9arZPOhY1qC6y861pDs=
Received: (qmail 1784989 invoked from network); 28 Dec 2020 15:46:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 15:46:14 +0100
X-UD-Smtp-Session: l3s3148p1@2070VYe3ipYgAwDPXwIpAOUwDQytQs2L
Date:   Mon, 28 Dec 2020 15:46:13 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 4/4] i2c: rcar: protect against supurious interrupts on
 V3U
Message-ID: <20201228144613.GF10822@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdW48sFLernApzcQ7Dqz90kX18d9+9e9ytQ=rVQ2hWD_4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DO5DiztRLs659m5i"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW48sFLernApzcQ7Dqz90kX18d9+9e9ytQ=rVQ2hWD_4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DO5DiztRLs659m5i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >   * the now lockless behaviour. Please keep this in mind when hacking t=
he driver.
> > + * R-Car Gen3 seems to have this fixed but earlier versions than R-Car=
 Gen2 are
>=20
> s/than/like/?

What I meant to say was: We know Gen2 is affected (first sentence of the
paragraph). We know Gen3 is fixed. Earlier than Gen2 is likely affected
but we don't know. So, I'd like to keep 'than'.


--DO5DiztRLs659m5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/p77UACgkQFA3kzBSg
KbYbEw/9EcMXq1US59pfjCl4rAe1T9IkQ9G8oH8eMVtZorlS8UkoU4OMv8qF3zuk
0yRoum+d658yb1MmzBXMXdIRJetWtiVlXrNYX2tiDRTs30/x6U8R8qIOt/Om9XL/
4mrel4IiCwvtgOFdAQ9mSAP9qHWFkai/+T9kdBbjiH82ToaIsrmleY/gCfvdYxII
S7XnSC/jDBHUBbxg2EFvyebD30ggeLuKbG91gvQEHMmps4YpZcPoEUkUYKveat/2
1dhB2ir/0fN3yNn4nYBYLv3FpvGaH4dAqIFj0RRnI0h9sGpWoL1zLN7vh7+8VTs/
VXIuEAbLQpAGWw1DBBcUQe0tjhgmJsue0gpxeqHRX4W2pqqrdQeKWZ0iDRzPZWkc
c7z/JJTDskeZKnVCK7FKbYz1spQ237HKLCJUyyMbADxtuy6TxGwzeghtcIH8Olyj
XRcAe7L6rDMnGxteA3/qhxrCSzM0UJW9HpVIO/t7mGP+lPYXJiLuoSPVYhd8MlYt
M5o5mbeOHCUipgbE473uP0WY8Fu9rtqx/9pGxQ00aPVrq/0jv7SjV5gh1ytWKgyg
/7KcC9pdKYY/STPiJEsXVyt/ErOHXrqqJbIWXHjGTkeC3fcCCIWdlmbR8iTEZ54r
iTpHv50+iv5ajmQw0U4FHQb9MOAeIMqO+S0mKRlcw+lkh7149l0=
=oEfR
-----END PGP SIGNATURE-----

--DO5DiztRLs659m5i--
