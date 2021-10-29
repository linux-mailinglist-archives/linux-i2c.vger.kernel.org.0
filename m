Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631424403CC
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Oct 2021 22:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhJ2UI1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Oct 2021 16:08:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:39250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhJ2UI1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 29 Oct 2021 16:08:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D224A6101E;
        Fri, 29 Oct 2021 20:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635537958;
        bh=s7w+tMlthGfQT7o+0MSkSXq2ov58k7Q9neTioNtBumU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rnz4HHvuOiVVmeEfYk86APkPEjs653rmGz/ORALvhSNX8zUFq8KWJzrHOrYL/gQZm
         xIEU6N2dWVYCtSXrOwQl9QoJlZ+RnrLl6xSmGj6inq0gAO+u0FvIL8p6soXNJwrOBy
         NHSCfvE1NqMs3DY0KSEkIc6GZJ3ywDCnXk0S2Rrw+7odZKZgslgucqIM06VA3w75SR
         2yJ1baazaPr/g0lPRKEwAU9QTzL/ykw+rgLkSz8oPfpshKLAgDz8ifxSOl3wP2koxr
         /Esu2oyYghIgti3CHP5CKuOWzFmsSlrG6FB/oClBYo4jv4fx4yZdBSIWzG97D9Ld83
         H8/EuNcK7rJVQ==
Date:   Fri, 29 Oct 2021 22:05:55 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mans@mansr.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: xlr: Fix a resource leak in the error handling path
 of 'xlr_i2c_probe()'
Message-ID: <YXxUIw02XJqVvus3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mans@mansr.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <e928fd285b37599e1f6648d0b963de8ed7773166.1629405992.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y1W4jpuRes0sIcvE"
Content-Disposition: inline
In-Reply-To: <e928fd285b37599e1f6648d0b963de8ed7773166.1629405992.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Y1W4jpuRes0sIcvE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 10:48:08PM +0200, Christophe JAILLET wrote:
> A successful 'clk_prepare()' call should be balanced by a corresponding
> 'clk_unprepare()' call in the error handling path of the probe, as already
> done in the remove function.
>=20
> More specifically, 'clk_prepare_enable()' is used, but 'clk_disable()' is
> also already called. So just the unprepare step has still to be done.
>=20
> Update the error handling path accordingly.
>=20
> Fixes: 75d31c2372e4 ("i2c: xlr: add support for Sigma Designs controller =
variant")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-next, thanks!


--Y1W4jpuRes0sIcvE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmF8VB8ACgkQFA3kzBSg
KbZRUA//XzsKKdmLWxE49+livXOqAA2C/3fsrZGauf5siAjOyd90xO6EYz9OpOjL
CLFgsDWGLizuQZ07lpUSShpYIR6cv5m8U5qXvfx6oGw1qgfNhjbNY+T7GR6K3XYD
y5eFANkeFN5cb7j5bogMZ/INoU1dl5Bxqqwjzl9dtXy9dMa/fCtc1+nB6HEyrkyJ
T1tCtcAjXhil9trbDcuZT5+iTxKl8eSEMmMFXOJaqrTqgaRPCfT6P2q+g+3ipqrW
b19Av4MZm95RB4o+Es6Z+dmyMo/VNS0l7dg9xeiVIXIWgwlRSqbFWLINqRVgc0m/
wEo0Vjjrr/Jhkm+/D1rBJplg8p0IjB4Bontl9218mSGK8MXZrdViBLqnSeGy9+g0
OOFRGjy6n+bl8POD74fmODABAIYjlTnoJJ7mGcSs3l2Jg0aFV7fzl8gbhJMkwQBM
iDyacaZ562WyOmygz4neGgBDx0v7om+Z75qLPAF1NRWiANXVci7UnT/II4rA5psT
D6gZvA0x3OuiIn+wDZohde7meDKq/mLaM29PAj1gBeRI7i1eTNpvsntyR8XOIgu5
C30hh7Z2KIle6fCcEKCI3G+Cc66prywcJxpTjLnf12TaucgS+zgJj9kqxy/wx6d/
c/iZ7BCorUHwJVviRU72WF0YaSXNV5NVOpTuPEircopGY09fU/A=
=xhNM
-----END PGP SIGNATURE-----

--Y1W4jpuRes0sIcvE--
