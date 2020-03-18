Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2487C1899CB
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 11:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgCRKoI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 06:44:08 -0400
Received: from sauhun.de ([88.99.104.3]:46454 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgCRKoI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Mar 2020 06:44:08 -0400
Received: from localhost (p54B333FA.dip0.t-ipconnect.de [84.179.51.250])
        by pokefinder.org (Postfix) with ESMTPSA id 33AAF2C097D;
        Wed, 18 Mar 2020 11:44:06 +0100 (CET)
Date:   Wed, 18 Mar 2020 11:44:05 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Tang Bin <tangbin@cmss.chinamobile.com>, linux@rempel-privat.de,
        s.hauer@pengutronix.de, shawnguo@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/i2c/busses/i2c-imx.c:remove duplicate print
 after platform_get_irq()
Message-ID: <20200318104405.rsqiw5og4xbuv6n5@katana>
References: <20200318100748.17540-1-tangbin@cmss.chinamobile.com>
 <20200318101844.55c273zh242ymxcf@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bce44n5wofewyr2x"
Content-Disposition: inline
In-Reply-To: <20200318101844.55c273zh242ymxcf@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bce44n5wofewyr2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

> Maybe add a comment for the next person who wonders about an error path
> without error message? Something like:
>=20
> 	irq =3D platform_get_irq(pdev, 0);
> 	if (irq < 0)
> 		/*
> 		 * platform_get_irq() already issued an error message, so
> 		 * fail silently here.
> 		 */
> 		 return irq;

Hmm, too much boilerplate for my taste. I'd rather assume it will be
printed during the call.

> And to get some extra kudos mention the commit that modified
> platform_get_irq() to emit a message in the commit log.

Yes.

Kind regards,

   Wolfram


--bce44n5wofewyr2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5x+3UACgkQFA3kzBSg
Kba8nA/+P5T/G4aR4JXxKUJpSsklVKMksLmr30FVYSwIDwRM+ZtiE1Gb5YlxIq2w
xGrwNdKPkoYaYYfPeV51FgcQ0p6LcVF1SkgFxox8B8ga20m65uyu+/CoSeblzcJ+
J7OP6D1XHGezNJ75wD6rUO9buqqBhxDOQ1VvQsKxVN6V16Zc4TULuU5CZNh6KbnM
h//fMAuKK2mubFJVYiDHZCeaFPgCLESrmYmuCup46fPkthkMwZbynpeXo23dvhd4
5rh8tB1n1DpCz4JICMfyaTlLMD53U3Lkq4UivUmwi3oU17rnhNqfYvggZ+gGmucz
UNZGT9FiMCRzwidSU9WitQbF8CkkS7+0RhVRf/8T52GtZm8VroRg3apGfp+FpzP3
Ep/bFgZrBJuDCY/27JtiaGlF4qGSFis0ZvdOnneEC1pzwQ5WuaN0yJw6PdYq5W6X
Hy2Bn1m9gsnI1DfEF47y6jlDgjmMAt0huqoTKwvWIAJnaE8SQfGIaHsB667c/Vo6
BEHCeewgbX9crZk5S7P6swVEXIoFAVZYnCAqFowunYx81dKn/VV/mHiuwVw6gy7A
tnvZh1GvJGAzC5JibIhAfA6ZExGesQRR36XegKDiQm2YrLMH8l0qYmUjkYCWZjE4
Ejq+5Srx6Sxk+rZxdMmxA8stM2qhn+QFnUtZKJ4g6jdTYeI6720=
=MP33
-----END PGP SIGNATURE-----

--bce44n5wofewyr2x--
