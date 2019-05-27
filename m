Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF5E42BAC2
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfE0TeV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:34:21 -0400
Received: from sauhun.de ([88.99.104.3]:36294 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbfE0TeU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:34:20 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 243282C04C2;
        Mon, 27 May 2019 21:34:19 +0200 (CEST)
Date:   Mon, 27 May 2019 21:34:18 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Masahisa Kojima <masahisa.kojima@linaro.org>
Cc:     linux-i2c@vger.kernel.org, ard.biesheuvel@linaro.org,
        okamoto.satoru@socionext.com
Subject: Re: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
Message-ID: <20190527193418.GI8808@kunai>
References: <20190521013350.8426-1-masahisa.kojima@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K1SnTjlYS/YgcDEx"
Content-Disposition: inline
In-Reply-To: <20190521013350.8426-1-masahisa.kojima@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K1SnTjlYS/YgcDEx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2019 at 10:33:50AM +0900, Masahisa Kojima wrote:
> master_xfer should return the number of messages successfully
> processed.
>=20
> Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C contro=
ller")
> Cc: <stable@vger.kernel.org> # v4.19+
> Signed-off-by: Okamoto Satoru <okamoto.satoru@socionext.com>
> Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>

Applied to for-current, thanks!

I just noticed you have an open coded loop in synquacer_i2c_xfer() which
should not be needed because the I2C core does that? Your code does a HW
reset, though, but is it really needed for a lost arbitration?


--K1SnTjlYS/YgcDEx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsO7oACgkQFA3kzBSg
Kba+hw/9FSGITW7ztHmB1/gKFiM23IPiVmKPBVx+f/Fc/sJSKsU3qEKxfcAGtbkV
I7KG6oRhiUNYnfnpmq2yZs5sjMZXk6cT+IHjqxXajnyEgUdK8SLe8D778yLskKPZ
//cGvQ3eYxgf2fAfeEuExFGeQDH2SnA6OiP9rIyabJFMY6l2nS7Q5jnIy9CP0pGG
5rJ5OAdIbFUsSOlXBxDzT2QwpnOtyEyL9M7Vtv5P8WC7cZMWDEfO5oXEsvVBOPYv
ta+hIwE447Hyfzd63w6GsglPk9kqMmuKWcZq4duA4XPWF04rxDlAnZ0khIYlJQie
kUgAa4TR92ueoEWNKhVYVGOzVDUdfIhzyLXqHXayqvlwhJw+vKWOp6TflYSe4+8f
09C1mMqkUD4ZvpLHV1mqcjgJW+3gOXGZJ9Z9oVE+P5OFmiAkm+ol8tyO070NxOiV
QGGC0tGwqBxFDfa7oISYRrOtCfZxWKOlz7lECbzOKpzH4Mic97TfSn43QCREwaha
IW6ovX4mp4onkALZFowk2S9uw22c5k7x0RmfpAAf+AEjB5k2Zxn2c/y22/9QNxS7
2afMpptV950fJEOBhNDQTnghAMT0pBstUNmSgE7eRu8cmdH4ciktdQsELlKKtvYw
C2JNcfOcBp0rygXw1v4yM76hpQm3DIA9tFS2Trl3IjLAxLULc6g=
=rPBj
-----END PGP SIGNATURE-----

--K1SnTjlYS/YgcDEx--
