Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38813321927
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhBVNkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:40:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232285AbhBVNix (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 08:38:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7EA264E44;
        Mon, 22 Feb 2021 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614001090;
        bh=bbqldV3C5pLU+/sOheF/iRbgv+7t6yBbTxmvk7DCysE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y1m/7LwPY6GAdv4oIlrmEatcracwlvGTpPXfk88q+CKp15q+5GWqnTactAcIDpt8t
         Yt0lYTtsDB5ksK//DqWrxqu8xquLyrCFwdvUpx66/Kxrtpo0Xq1h+PcjWFHZBouWiK
         sM5gHmzlWH79ndD7DkIqaH8LtPjc2OKSueNdJfsZ4Wdw9CEd35b8ok06zUONHr3quq
         NwQSfz7KurHdZIjBb5YizaNYIA5KVtX01GmCR82tddJDmdRAaKzlLz0gWJpFX/e0jA
         cSfWM5AUJFrnaG1cEsPdQnGuTq6JnRpMSfXQ16rVk083XE1CyivVbxBDICekqna9v0
         tOGyM6FstVTgA==
Date:   Mon, 22 Feb 2021 14:38:06 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, lee.jones@linaro.org,
        andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
Message-ID: <20210222133806.GA12867@ninjato>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-2-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20210222130735.1313443-2-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 01:07:30PM +0000, Daniel Scally wrote:
> The acpi_walk_dep_device_list() is not as generalisable as its name
> implies, serving only to decrement the dependency count for each
> dependent device of the input. Extend the function to instead accept
> a callback which can be applied to all the dependencies in acpi_dep_list.
> Replace all existing calls to the function with calls to a wrapper, passi=
ng
> a callback that applies the same dependency reduction.
>=20
> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

I trust you guys:

Acked-by: Wolfram Sang <wsa@kernel.org> # for changing I2C core

I might need an immutable branch, though, if this is somehow possible.


--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAzs7oACgkQFA3kzBSg
KbaZyhAAgt84TEEjhyoorO1hj5++BckLkwH4A0rYrtFzt+nrdj7QEXadYTeahMU+
V3fLAvPJvFyeo/6j3QbdB8Oyk4/tNU7hLSD/6Q3qGnOZeVB3BQ8qWZevdewH8SyO
ahejbV9GtPWwG2QLTZ/kDNc/g3HTpGZie0q3UbzgTEnUINYEPr6+81RMPrVPPgS4
9dtOsHjAxBa00X8SQv0kThl0uaZ1wiZ+qhGFQI6QVDV+Z5RUFTThuE4DeLnn/n9G
SDuYOYUfYeAxZjGKwd0pJg8vltVTSXfzV22DNGawCCUuvCCiIPdkus6HvyuDKaFk
33RNnw2wdPGK7G2BpHBt4wIu9A1a92YL6JJ53Z3auMlYAP1uivBz69i1PbgS+H7o
x5dqcFf6ETlghmY8I7GXD4q29/PLiBiPwWNdlw5j0TPsiuTHdKJhkSskXb9KF/7K
30NN6P6BouRU/xBRw3BhsdSiiKYYijvXFtA1UCA1iHTKilEQuJX/p1zjPbuGp9DL
uetROPNG+iGGrXHmKoAO+mTeiUJ/EZxUc13qBJm372utugwsNCjshUekgzfGiYMP
l2flQ+fufKeYcJn9qHpRpBPyXFmZTvQptGV4iMMrj3ZRrxSZParRTavy/V7RGKkJ
0gK2BjmCFWkyqHJ6v35NcXIHtLaiMlx975PBtkfT4Hdk+u2fVeI=
=ijcs
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
