Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB9B656A09
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2019 15:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfFZNJr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jun 2019 09:09:47 -0400
Received: from sauhun.de ([88.99.104.3]:55836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbfFZNJq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Jun 2019 09:09:46 -0400
Received: from localhost (p54B330AF.dip0.t-ipconnect.de [84.179.48.175])
        by pokefinder.org (Postfix) with ESMTPSA id 13EC82C0114;
        Wed, 26 Jun 2019 15:09:45 +0200 (CEST)
Date:   Wed, 26 Jun 2019 15:09:44 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] eeprom: at24: modify a comment referring to platform data
Message-ID: <20190626130942.GA801@ninjato>
References: <20190625075544.17796-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <20190625075544.17796-1-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2019 at 09:55:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> We no longer have platform data in at24, so this comment is invalid.
> Make it refer to device tree & properties instead.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Obviously.

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0TbpEACgkQFA3kzBSg
KbZnNw//TR+KbzlfCfp0Mq7831FRDlbN2D8KkKFwD/EgGim4CupE/G9sQN/HDSpA
Gzj3KbBK50kOTI68kwFvejHwbSBjP4glp+uhrZPj/fulEYMzpVpeyVDO7qWKTV4q
llb/RuLLDAFefKDD+KpGacfuaVOg4nlsV9Meo54MRTd6l4OktArhRdwjbfXe5TmH
hyoi8N+zRSPTYcBxxKL01jd3hFMfl8VWJzhIbYbDR0s/Lc9dVcMsOWotTiGjFPdk
ilbtRCk57zYoLrBFGvE0x0oIojvuJ52roK6INt8eclQtLAZnqT+U7Yrcs4raoLH5
D6yOZ9qgRjp0hzRGG5B6yEVDKzpBEzcJTTYMv5TEUpkmuYsGI4quw4txHbF7ddg7
nJvkOUOKi25wjxRGnwI2b6fUYMQCd9ZXfckoPKKOygDWGvjOA4+7dYBX1qj96TnF
8snPWLLmeZcFVxZ2Z60w2228WSF3lAivsy/G9pIArXsSgtwtiif3IvYu/S98hBfv
YpqFHgqimLWBEJkxSMba5V7JRjldt4TLg8Mvu6332mekXN8TpJuxXvNdTABquKjY
1oTLN+neQyeBgCLcYBhxu1KZxorhXMhjHX4MeBbe/LJ8Yd+s3a77j70z9yT94+fi
CILFz7OiLgX8msb+73nZwzuwqKUvYGnMhaOzFlSH9ZAylYpWgoY=
=aAeA
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
