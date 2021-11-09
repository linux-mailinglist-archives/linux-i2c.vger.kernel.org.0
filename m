Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC45744B117
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 17:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239420AbhKIQ10 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 11:27:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:52378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238397AbhKIQ1Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 9 Nov 2021 11:27:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F014A60FD8;
        Tue,  9 Nov 2021 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636475079;
        bh=S02AWkEYJNSoTOH6r1bp7lYVkK/1pCY/xooUDR9Z8YY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D29EStRlaFZuXf/ZKsGy2wvtW2tv3OQ6X9FxyEWxTolayz//ngdUFuGwGl7TaQC0S
         F5pmBZNrzYlp1m/LUnrah3cILrV0JrFgZQIJnVzQbPfaJUncjTTPwVu/49ozn89NgF
         vuNLw6gZ2TLf94CRDtpejr2z5/eegrZGe0jkewVBQt1ySWS16pNeT1/cSWsEqN2a0L
         oYplSFy9K+eCRzCswU+cj8AafEefqlzGBQL5Q7BUWchbLGooxSFfjaJ369gcoCYSJ3
         LPRNA+R+j/iqUdcseKQ5Jt+8cDeK9aVH7OdtmrV4rQrT+gzkEUf6ewYAjwi7VXob2G
         ImBxYhg1VLmcA==
Date:   Tue, 9 Nov 2021 16:24:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        George Cherian <gcherian@marvell.com>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove Netlogic bindings
Message-ID: <YYqgwQVgjOwoaZZg@sirena.org.uk>
References: <20211109161707.2209170-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2FnwxKPLYbn/7HKW"
Content-Disposition: inline
In-Reply-To: <20211109161707.2209170-1-robh@kernel.org>
X-Cookie: Elevators smell different to midgets.
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2FnwxKPLYbn/7HKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 09, 2021 at 10:17:07AM -0600, Rob Herring wrote:
> Support for Netlogic was removed in commit 95b8a5e0111a ("MIPS: Remove
> NETLOGIC support"). Remove the now unused bindings.
>=20
> The GPIO binding also includes "brcm,vulcan-gpio", but it appears to be
> unused as well as Broadcom Vulkan became Cavium ThunderX2 which is ACPI
> based.

Acked-by: Mark Brown <broonie@kernel.org>

--2FnwxKPLYbn/7HKW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGKoMAACgkQJNaLcl1U
h9AoiAf/ekVKGxswprkfhL2xFb59W4S9TiOQAYT6SnP7lu202u3QcBy7W8oX4OjT
dr8uo6NQ6jHwai3ZiP85QrmuN4sweJG8JDzh6ArgtWgRHcYknDH/RjYhDYoo3P8O
S2fc1NtMu5mVXAMxJWjEuQKhoKkStNMMZOJCQh9SbXOUaF53JH4h92p4BOUSDoBh
7EJ0JvqWX1tGTxi3TEKb8e+9JoamQpZaMp4NhMlXKjsOEan/8CJ+n0n6E+TzUwqn
N+/sZ3uiuWQnrtsTBHPJ31T/iWMYt5ZpVhWN0kXRu1cKg0Xcs6zE4dsfjUnaRDP3
EifXkzdJvgUNnGsl7M5QG6MHyFmMAw==
=l4BV
-----END PGP SIGNATURE-----

--2FnwxKPLYbn/7HKW--
