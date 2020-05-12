Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E421CF53C
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 15:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgELNII (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 09:08:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:51538 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgELNIG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 09:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bVnvR3rOZs7GQ5Rx/p20PMBOzRG4
        5vFIXWPPh4D/qKA=; b=OQg+dVZ/hvYZcb9qtk8hkak52UNO4J1vCotQUy18WU0q
        nZ63gSXb59JW8mL+J9qfkjH0ihXkzTYoQw48IYCxwqPBNzJMNoYWGlpuScyzKlSJ
        9Mq7k8vHTvlcH0uPJkr3z5AsG5dtvvzY4mxgmGgbaJOXyYOtHtWgDmBVdb3scbM=
Received: (qmail 2948160 invoked from network); 12 May 2020 15:08:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 15:08:04 +0200
X-UD-Smtp-Session: l3s3148p1@ZV9lJ3Ol5MQgAwDPXw2aAE67cgFBY+HL
Date:   Tue, 12 May 2020 15:08:03 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     peda@axentia.se, robh@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Fix an error handling path in
 'i2c_demux_pinctrl_probe()'
Message-ID: <20200512130802.GC13516@ninjato>
References: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nmemrqcdn5VTmUEE"
Content-Disposition: inline
In-Reply-To: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 09:21:00PM +0200, Christophe JAILLET wrote:
> A call to 'i2c_demux_deactivate_master()' is missing in the error handling
> path, as already done in the remove function.
>=20
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-current, thanks! Peter, I hope you are okay with me
applying patches for my strange driver directly.


--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66n7IACgkQFA3kzBSg
KbYd7w//QfbfCkh7Qi2tx9ZYq6DwTGtz92vvLnKEiVAe684hJqfbIT58KB6Y+xxs
hvLU37hPtQHEylKHPjZKP4reKet/qhMBwa+izmicml37AYk/WT+bISP7bDz/cZm6
9gR9FGV/236CcswGGLcru8Us9PnxWnajXTq/Zgfb0/WcGfD+cV5zc3EDlR4iTAs/
wwJH7sLUoC6HTLWtEHDX9wRc35Baq1TqrHrecknGPctQgj2HNxickJrHJNclkEJ7
ZqTs//75b7SXWE4eE2WG4PYY2m12NkAuzTwkWLTJdmuuINBtbfEpJsfuONd1CX1j
PP/y25ssXKY5W0Qxq8/iR/Vb5rla2NtvOowCMjlWCTQmOkoaR1/wWJ12fDx4XOuj
Ut+zNMSg6OnnnW56rMe8pe54PjYszVuC9wwZk9skcuFWRYOVU5Vi0zfTIXnO5WHO
pBR6+BSHd04tndfm14qwNGIUa7DY4XwL07VlZVVHJ7vuzk8WyM65O2YuyfNh12O2
6zOMrG+FLYnDH4yiusAgQVEE3utwknrxUm5y0YI7SMLOnhHpbc7UAnhWk0H+AKeW
3jooXGPRT7BOSMLlRc6tvW3EEDJpjB6iUN8CNkc0yFSEFpGXS32YC1hTMcuNvcbG
NXvY6NpeIWHNfXoWZgcrJzMwqcXxhR79oWSyEdn2E69AFUMPmOs=
=Nlce
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
