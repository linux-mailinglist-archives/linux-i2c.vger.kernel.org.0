Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E02235512C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245157AbhDFKtm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 06:49:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:44236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245167AbhDFKtm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 06:49:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21552610C8;
        Tue,  6 Apr 2021 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617706174;
        bh=JIkmcTF37lX3G+3PpgxAgvLWFhCJ0Io86nDq84uP/fU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nJAtqK/YsYI16XtJE9NEMy+MAsGtX8JzUQJ+9AzJgx84lYoJOBS14YM8vGx6SpD20
         ukKigpZeeKjw0HO9bNtk+aTxSDXaECl/fmBnAixeoQsKLj76JOxG8RKJ2MPkWh25V4
         SPwyvWnvlYr42AdBpYYsjb5uod0RJyiumviL9d6mrY/mXvk9u8CVzxlc2UvNB1i0QF
         O1cRsDF7toUsh4BcZcgLGz+BkGPIauzk3w/dwfCh6INI+xwvFhbsPSBG6NJFEXKT8A
         bSo/A1n9QFcGjXqU8Wqw9G0sVXNrppGnVYT4fT43A+zrskPH+VN+zMdrXkmeDRcFwT
         2M8HK0lSiG1Sg==
Date:   Tue, 6 Apr 2021 12:49:27 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
Message-ID: <20210406104927.GA3532@ninjato>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 06:48:51PM +0300, Andy Shevchenko wrote:
> Platform data is a legacy interface to supply device properties
> to the driver. In this case we don't have anymore in-kernel users
> for it. Just remove it for good.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Wolfram Sang <wsa@kernel.org>


--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBsPLMACgkQFA3kzBSg
KbZo0g//a9GRDS5oKzOQxOz3zI0uikyojKvAyUF8G2g5zmRKDZomzlbunCjX0OJQ
mZQmT3K7qUJ5xLvEWbc9BTyRHXNmSpROhdou55oc0TelmOCiiZAvdH6Cx59wHHc7
TP2BC/4BRNC4g5Lknez8BIVWT6LglOnrY0ii1lD5bS+rCQZKWb0wpXPHOenkL/02
cZRp4UL9mgql0TUQruxaEuWO5lkIbStfzbfbYRErLTa9UTMsEQl8wq3sHGW3j16H
XEslCsL1/sAYoEan/IATyqErxJlE8RJdL6td+SRb/M8crWPA7n1DiNNwJGrYj+cq
0cmsXTJt10j7WgqQ0b1EIbyhB56cZxqoT1xvWHLAvAs45o5i0iTM2FqGtrEIQCRX
Wt011jWdKMMdRc1CLWGJ88C6ZE7HgjPpeFe18fT/2tshDjFW2rqUoOvcBAT+8vtb
nvL+OpUI5TwSIf6zI74rgPR4JBMRyLD6PiLyIPDbNrAqhHDcXWxxzbwOP+L8o3zB
jvjynAESSytxvNxQQOdP/P5dYMf7M6FEo8f9IQSzB5+vTZwnuN+ewQMcmg6kqwph
i4tTNSwN2MIpBTh/RjoEamFCJnQ0S4MSLaeToSwDrimNGzSFwsEm7mKxS0JFjBPZ
RDKIqp33yjhUjSElwkUIkdVTeAPtpnaTW6gScjTibwZ8552pNqk=
=s5vH
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
