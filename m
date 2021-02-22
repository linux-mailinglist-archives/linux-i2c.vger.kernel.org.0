Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D44A32192A
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhBVNko (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:40:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:39894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231126AbhBVNjZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 08:39:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F017164DD0;
        Mon, 22 Feb 2021 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614001124;
        bh=pF0BfgKYd0Ich3iN8DYGri4AHRFH2Fz4CufDo9aYWII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YR0Y9ZN5PddDjvCmxNcazj+OKMT5GGMv1/jVpoM9TcN3DJUhMnA3Q0nitJ+Bs9Gzy
         zgR8pcsT5ga75Zby9czysd0EMTDWfke/cnQIEjBMr5m2Cf1kiLdN1vEyR3Ksap6P4J
         IcUUyyTspKLOJ7p75cp6yKdsvBFol77VqYbvsWAtOgGd+kJ38f37BIqysMH17zLiRi
         YutOEaNz6DrJPULfUz3MRt41TOqOlhQKBkhioNSwUx4ellYy1TRBezt9KrN4FQ3N8z
         la4MwF0f7FTVy3tzWbxCiC67U/kUyWCL4ALJy29ytEPpAg6DSLHqf6k1NPT7xB6LCJ
         q5seuvdqzcocA==
Date:   Mon, 22 Feb 2021 14:38:40 +0100
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/6] i2c: core: Add a format macro for I2C device names
Message-ID: <20210222133840.GB12867@ninjato>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <20210222130735.1313443-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 01:07:32PM +0000, Daniel Scally wrote:
> Some places in the kernel allow users to map resources to a device
> using device name (for example, in the struct gpiod_lookup_table).
> Currently this involves waiting for the I2C client to have been registered
> so we can use dev_name(&client->dev). We want to add a function to allow
> users to refer to an I2C device by name before it has been instantiated,
> so create a macro for the format that's accessible outside the I2C layer
> and use it in i2c_dev_set_name().
>=20
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Acked-by: Wolfram Sang <wsa@kernel.org> # for changing I2C core


--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAzs+AACgkQFA3kzBSg
KbY6YBAAg771Zhn5DzhCk0mcbHnQ7YaVai4QqwXwAJKQ6mPpl5D46pP8Il+45bSb
DXo2wT8va/XQR5FpZjOSpSgyjOZoO1oUwbIZVR/ZWHSZ3R+ds1dOvw8JbCmAmolO
DVu+EXg6o/1xumlL9Xq3Av1+yotNzuf4p7UEG4JNAmfQrooP3ifq8iOAkef4lEzk
HlqG8kD/pAfazJUtTabEBh/Okbnzc0xe2zZKK5QpwbJH+xYaRa88XANYBtfZQXCT
8IZrywf7jf1HnPxjNxU18ovQHyJN4LCN1aLY9xT+rwYSvpcfd+PB6D2ve/LqHHLp
jYsHkqZ6pBUZ1Z+yKoGP2awWQy4Ta6OAagxsEnDgtAvop0a24ljjcGzM4vo31VwA
AtNY2KSR4W9A+Ny9ldO7c9bJUAEJ4N/sKwTtw2V/Ww3d86PWktziq9TdEyUtRz3b
TKLGsrKHfwNVrMayBl0iHgRxdvh7lbrs4Y+3g4tt2hT1S9YcKiCPE/KhQsLlss6N
p1WSWPv2tj0fx7bxBDtsuvSuDtl4hwWmH7a969faxNsa9zL73KczUcaod9G0W/4m
7tsy+RuGIIWNRGuoLMrRU2PgzLGTLa/Oeg+jojTdezz7+b+ZtXQNXNZEKNgdvEjL
RyBH9FX7Q+Kd4o1RFhu5b4SznJwY+nju2GeNImUv8awDeNPKgIo=
=47ln
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
