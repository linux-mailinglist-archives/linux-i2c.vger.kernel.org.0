Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A0A331460
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 18:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbhCHRSB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 12:18:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:60420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229690AbhCHRR4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 12:17:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 540B5650E5;
        Mon,  8 Mar 2021 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615223875;
        bh=Fu/JGQBOiy86rBvW7ExIkK3fJm6AQtgCbYoK8Wp/T5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W58Q16HEqezuZm4pRNseTZXtJurVK4AuXQNxhvNLEXaYXTDY+FbesGFvspu+sbZyh
         1QKQZZ80woTEYZS21WQWhOgtpW/V+4oo91z398FqSkZ3GXiD4JD7x7hKiQIj3zOLAu
         LfgtUigscTWrnHO3AM0fGK6phRYYzZzOI9mKlaCPF+8ReM3itkSrzHmEgKFYGEylf0
         8ggp3HN0RaET4G4lYgwSHEFE7iMUb/SeKjPH3YWeJ3y8CW59lONIlFVJ5n3Oa0Qd9U
         nI157hZsvKka1mUgw19OiTpqrFJ3Dm+D86qIC2ww0/6D/82pbxsF4yz14y9jOcGNLs
         p+aPvW/ZXX3AA==
Date:   Mon, 8 Mar 2021 17:16:44 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Bibby Hsieh <bibby.hsieh@mediatek.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v16 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20210308171644.GE4656@sirena.org.uk>
References: <20210308043607.957156-1-hsinyi@chromium.org>
 <20210308043607.957156-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <20210308043607.957156-3-hsinyi@chromium.org>
X-Cookie: Am I SHOPLIFTING?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:

> +	adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +	if (IS_ERR(adap->bus_regulator)) {
> +		res = PTR_ERR(adap->bus_regulator);
> +		goto out_reg;
> +	}

Idiomatically supplies should be named as they are by the chip datasheet
rather than just a generic name like this, and I'm guessing that systems
that have supplies like this will often already have something
requesting the supply (eg, it's quite common for consumer drivers to do
this) under that name.  I can see this being a useful thing to factor
out into the core but it seems like it'd be better to have it enabled by
having the controllers (or devices) pass a supply name (or possibly
requested regulator) to the core rather than by just hard coding a name
in the core so bindings look as expected.

I do also wonder if it's better to put the feature on the clients rather
than the controller, I don't think it makes much difference though.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBGW/sACgkQJNaLcl1U
h9DCqQf5AWoY9ts6hYYjbt4Rs4LUqzM+fet/NEq8b74WOnZgN0CV/Z14n1897bb6
NfPqKzN5/+39WvYaZN5Bm3DUG7DDbwtvzJY7Xhi33xDkvbE+EFNQH0CbGlE3CdbV
N5uGr7oYe7fhTzbj28R6Edv1Lc3ZRLR8iMlDGeA04KVgbXg3qP8lowfPkr+GqxjQ
f5ja8ZTnbG8DvmGAa4x8XT+B7WQ3EIFoeO9O2PiAjAHn0EY6h5EFPxaLJQ+1F6Rf
Fbtl11qFb/NaefGgEAYN17x2bn+8p1cDv4k6ljOUt07h2alTleDouzbQLQfNzQjH
oVohYzF4E6HpXzMqJkv7S3p46VrJwQ==
=VKuM
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
