Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29BF31D49BE
	for <lists+linux-i2c@lfdr.de>; Fri, 15 May 2020 11:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgEOJgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 May 2020 05:36:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgEOJgq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 15 May 2020 05:36:46 -0400
Received: from localhost (p5486CC07.dip0.t-ipconnect.de [84.134.204.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A45B0206B6;
        Fri, 15 May 2020 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589535406;
        bh=EWbnJSdrb2JGQCuwuvhoGws7QKlUIWurGSa53yiFjF4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tLOl47rkQPTpRDSxAb2MOQFo7uUW/DBsLcviI0dAajmsIBIiACF1p221Mupl5qxsJ
         vQcsT/dOe6ye2t3u8QhqnYw9wgYeCZN4KUhnF4sgVv519o/TGNhhV1ai4NGAELxtlj
         Uu3/AbAMYpcyq8s6DlaARflYH7LtqUNgW9ZgEoPI=
Date:   Fri, 15 May 2020 11:36:43 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: eeprom: at24: Fix list of page sizes for
 writing
Message-ID: <20200515093643.GE2077@ninjato>
References: <20200512122450.20205-1-geert+renesas@glider.be>
 <20200515092755.GC2077@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline
In-Reply-To: <20200515092755.GC2077@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 11:27:55AM +0200, Wolfram Sang wrote:
> On Tue, May 12, 2020 at 02:24:47PM +0200, Geert Uytterhoeven wrote:
> > "258" is an odd power-of-two ;-)
> > Obviously this is a typo, and the intended value is "256".
> >=20
> > Fixes: 7f3bf4203774013b ("dt-bindings: at24: convert the binding docume=
nt to yaml")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Since I have a PR for Linus pending anyhow, I step ahead and apply it to
> my tree. Hope this is fine for everyone. Applied to for-current, thanks!

Brown paper bag, please. This is in -next only, so I rather leave it for
Rob because of the dependencies.


--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6+YqsACgkQFA3kzBSg
KbaKNQ/+P6/fFkr0EC7kjwQx/Un37Vf0MS4LoxSQJyos1Il46+b1drcC2Pw2JTuj
ysDdguvHZm492n17lSX7Qs7LpcbiHRWuOcEdwwNmhnmdY5GnGDCOoQej9eA0JxQ7
++Fjbmc8kpAjVzA6WmjEPf6+ee6el+sp3U5C/3txHEMvF6XxPLe1Arv8yrVV6SI6
mQ0RQnFuVjtdvh3kWlrYMnZhUPPRtM4q2x5u2OIjS0uCGULDSMSEkWZR6yPorj2k
7XIWXq/r8H5LwRHtjFc4CateejuoihqyPwO+PANUTJr2jwfkBR3FNEg7RJlFWjhj
Ro86qU0d5muF4o4dMeghB/HwqWKE5wdGWbi2ubjImy7rUHJwEPeQ2tYgqjiDxBtR
SlaCXNuZ2faTvXLH9wx4jipFmRkA099vA2bWwKrt1+4+br3bEo6rVnJ+ja1/mOsn
L/DRtPRfwO5V0vDXoL1f9BB50BsXpj75rX5pWyAxs1uy9yU/KVQ4crcjI0if79Xz
VtjyvsLr0qwy9/z0s3uRgAziOdQLdpq0NUrciSFy1CMajDkInbiPExqvSaZKR3if
26JTu+z6K+Rc6tejG1SYcD2y542+nsLN4fHoZQWjuwbw5EHzS5KlH1rrnRWCS7eV
RbtcqRZ8lxNxewDEQhPEhUHKPs7eFuWp3onSNgSb+iJ44Wg2Gzo=
=HPEd
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
