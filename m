Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 847701B8D9E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 09:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgDZHrK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 03:47:10 -0400
Received: from sauhun.de ([88.99.104.3]:42846 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726110AbgDZHrK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 03:47:10 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 982322C01E8;
        Sun, 26 Apr 2020 09:47:08 +0200 (CEST)
Date:   Sun, 26 Apr 2020 09:47:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2] i2c: stm32: don't print an error on probe deferral
Message-ID: <20200426074708.GC1262@kunai>
References: <1587395826-17541-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline
In-Reply-To: <1587395826-17541-1-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2020 at 05:17:06PM +0200, Alain Volmat wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
>=20
> Do not print an error trace when deferring probe for some resource.
> Fix as well the error message in case of tx dma_request_chan failure.
>=20
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>

Applied to for-next, thanks!


--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lPHwACgkQFA3kzBSg
KbZqCg//Th0HgzDJWiYiEqK4xlVz2HKw6oqfYM+z5t09khlnmxL09D75I8FjU4sx
DzKZe+ATTWw6MNROZyyUtDby3lvZgxxiFCiKcju4LscgmgOKwkNu+PxxbKHkUrQR
1bvQJ8DuMlIVHe2fXPH65f/7EV0Th7AjltoLLSZDSFu34tIa+rOe6liQVJOSjgFS
tMA11Cm9Eb4hlbKQbtTrPB7OVpVAoQT/Tg5P5nEmAa/DbTZhyNYNbmQJKq8I8HN1
L2FO/19K0e2h/wqB15OSrjNY6gi/VMlCjCww7IIYjZTZAT1k6lohCQEAb0USRQ03
fFvCrf5PrBBA6Df2OYwNQBe44fH/BW9xUfj7qjm1DB7DdSEkFmMoO4OQZ7AJ1f/U
DaT0PkU8tFHvIkvTve2oR9WpizWbC9yGkuOPG6/C/ABMcOCU9du0fAexfOBkYqxN
57+xI21/U5Km80Kz4JNK2tx6yWoegetGoE50r+nsWtqT1gHT5sA1r9auccrHbZ6P
byyBbw8MXX7r2P9sMXkUzkN9eg2xIar3WaBOCrq5Py6cmY1z9VanJC5dOWs3Brke
+BY43Lx6e3r73zjPQPQt0siDrfffumnR8RY6OKaiCwM+R4RLt0jmDlXJd4Pk7uwH
4Fs9CeYgaq7ZKiBhrhwACUax6hxqgxep5OZR3GJhncsUCwBAqR8=
=TgHS
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
