Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FC71D337F
	for <lists+linux-i2c@lfdr.de>; Thu, 14 May 2020 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgENOuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 May 2020 10:50:08 -0400
Received: from sauhun.de ([88.99.104.3]:52610 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgENOuI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 May 2020 10:50:08 -0400
Received: from localhost (p5486CC88.dip0.t-ipconnect.de [84.134.204.136])
        by pokefinder.org (Postfix) with ESMTPSA id 284FF2C01E6;
        Thu, 14 May 2020 16:50:06 +0200 (CEST)
Date:   Thu, 14 May 2020 16:50:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?Q?Adamski=2C_Krzysztof_=28Nokia_-_PL=2FWroc=C5=82aw=29?= 
        <krzysztof.adamski@nokia.com>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: Two separate i2c transfers
Message-ID: <20200514145005.GC1589@ninjato>
References: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline
In-Reply-To: <5a17ba7b-b1a5-234d-1cae-4e77132bd15d@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, May 14, 2020 at 02:41:17PM +0200, Adamski, Krzysztof (Nokia - PL/Wr=
oc=C5=82aw) wrote:

Adding Peter as the mux maintainer to CC.

> I have a problem that I think cannot be currently easily addressed by I2C=
 framework in the kernel and I'm seeking for an
> advice on how to approach this. I have an I2C device that can be accessed=
 from two I2C masters connected to I2C bus
> master selector channels. Both masters must do such a sequence before per=
forming long operation:

I need a diagram of that setup. What is the BMS? A chip? Some software?
Can you draw a graph and give names of chips etc...?

And, of course, why on earth do you need to access the same chip from
two masters within one Linux? :) (That's how I understood it)

Regards,

   Wolfram


--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl69WpkACgkQFA3kzBSg
KbadAA//QxDhwSyLcQNQrmBdcSmt94BrT3UWI0N+sQJJHm177HEwIT6k7F+atAl1
TkTyx4QxkEQKiUxp9ZzmdUY488bdqAcehLDkG9AB+qpbU/KtY2qIIH/UUF5q7b/C
UXRloCOqG2g1qYxig+RHdNsA5arrMemUiX/ZVZ1AyRghnmRDZROdWV8G0cUTZ5sm
LXYmE96la/ZvWm8JJu/qbmOo6N91F3aYDkkhIMX/R6jLVXdaq1Y674i57JEMGq2g
wK4/GjfdRokY5xnHfI3EK1iP1M/uQrluBq289eBHcAr82K5brI8AMrwmF5IoYpIt
FHD1ekmQrIzTYKoaabR96+lnYQR23dr9fZPXwfEDI0notrB9VX6LG2L1J3zOqec8
PwfDFTvP7p5/4zXFkinNmDRmjdI8BNoMmtNEAD3xg+sdPVI/abfXHD7YyoAmyJBz
2u0WoIqUG0/pgZ5TVHR/9N7+pUKTfKuzm/BQOWK5QJGo0zTzi5N2YlfiobjrLPUJ
vQZaU6sRPN86uf1bfVp4QZa+Wp3t8kZCLhep517K1dNU/wmYG5cLpdS1BUopkeci
NuNTtLbKO/W6IN99J+b4/Rg5BreHmtSZqbbOh2vBsBqgZ8RznR22a7OQiHowLTUT
WiX/l2zYbclBN6k7nCYr6sIVApGtPKm3HCwb/C4ZH8cVJLTq+Mo=
=hC9T
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
