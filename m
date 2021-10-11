Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B427428A2E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 11:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235580AbhJKJvU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 05:51:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:44394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235559AbhJKJvT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 05:51:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FC8360D07;
        Mon, 11 Oct 2021 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633945759;
        bh=2S2M+vWOVlpt6SDouVxbnwzuqIHxp67kF+TZGn3HQzk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qgboGxStzK89PPnYnYrazfeTg8br2hqCfCP9Cd6VYQBoH4VzUR4VQaxsvuSp0XV0S
         5BnNz207Mic0sXCLXCQnGxM9/ptzYTAtG4lKjzS4qt4YOP5RF/vcHMTpdCEgMW087y
         Foix2CtTPslsLBcwYswqQi87GEcHHYTwql8f+NOKmIEq2NV2bePnIdUdFf59P0f9nN
         RsKNhTXGni4Jt9ZaHuMIBOTFOuXM/X35TJea/R4UWkLeU8Q3A4keP62qJPan42iBzB
         AF1ityGZ2W8rkJS68xPHNZqvHokH4PYY/3KDB91l9M6rPq8K9txX4rFgWfKZy+UOr6
         Lo6D6bBoZ8P1A==
Date:   Mon, 11 Oct 2021 11:49:15 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v3 2/3] i2c: acpi: Replace custom function with
 device_match_acpi_handle()
Message-ID: <YWQImyIlsWdam7T/@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <20211007171815.28336-1-andriy.shevchenko@linux.intel.com>
 <20211007171815.28336-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UJCRYauk+dyrduoc"
Content-Disposition: inline
In-Reply-To: <20211007171815.28336-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UJCRYauk+dyrduoc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 08:18:14PM +0300, Andy Shevchenko wrote:
> Since driver core provides a generic device_match_acpi_handle()
> we may replace the custom one with it. This unifies code to find
> an adapter with the similar one which finds a client.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Fine with me:

Acked-by: Wolfram Sang <wsa@kernel.org>


--UJCRYauk+dyrduoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFkCJsACgkQFA3kzBSg
KbbBrQ//e4S6A/kk7s4p9GPeIz2YzaWXID6jC1bNc5ax9g6YuwgvkuSYDOyXQHl9
5U0mYLxdkOxq+9vG++t8lwh0vjJLN9dB7uDmMExtkzWejreqS9IDPc6/qSZIB8An
kLU1o6jVFTM/SSSMn86pe7aUhMha3i/akqBTdpFwth8ph47yX3AIQ/l8eLvWlHBs
w6EcyyNgfNLRj4i18bNvfTlqANUtt3R/Is4D73BWOpgCYFbZ6Mm2RuS+ukuyiYTx
5ZYh6il1Cn6PAEU4vLkA0uA5VGw0U9IxGHwRheIdW1iq5q7rlHFzw//eUVjuD+56
Uab0gi5gC/O67BFW90FKfH67LGjLl5KfZBKhE28cAlJ21XWYYqoXN8J8jg5wUxvN
9uK10H7kDQboFz4AvMH49VFvic1FXwzA7Xkw9p07lVpwRBJoyOoqbilTwt/5RDdH
9bTMJ2qp/hzMhabc3gaNh4gbq7Qe67KdY4RPvpoCvmOf7Zqkk6UaFsXUzjaDJBfA
qwMdujGL5xUqZtCMtG8ooW6X9rKIo+c2aeShlzRpDBHhMM5doOSObUOAlGECX1we
l8tS7K6Esoibq85b1y0eXX3iU3zgnapX4QJ8ZJhplkSRwr53NSlW7GCnTJWeColM
4+TrfXavalv1Pp5lgrM9GjnSH5/7R4D65ioLs75v23/u5JWpzQI=
=51+n
-----END PGP SIGNATURE-----

--UJCRYauk+dyrduoc--
