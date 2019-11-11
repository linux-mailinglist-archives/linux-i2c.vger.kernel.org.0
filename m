Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0FEF8045
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfKKTh4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 14:37:56 -0500
Received: from sauhun.de ([88.99.104.3]:49332 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbfKKTh4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:37:56 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 685522C0428;
        Mon, 11 Nov 2019 20:37:54 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:37:54 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191111193753.GC1608@kunai>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:00:53PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.
>=20
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to for-next, thanks!


--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JuJEACgkQFA3kzBSg
KbYj7Q//TuutjZs/aYraDB/ReEVZnqZHRljwGBj13He80LQ7/a51QrsqPtpUiC66
VjqFNwHsFJ2eaEco1ehZBrqAqTRcqemg8N9SljOMEN/RSTlsoOIWwgkOgQRHiVyz
HlhJCTg+Hd+1z+gnrx5PbabR1JRgc3Fg+NBPTklP0UEbd0M30519TjaJyJc1K/cn
aZJy8GEIGRlcMT6pksS8ul6OmpnID1UIQ/vceNVB0rX3ECPoZYWWJQqcdfCw7RZW
MzoJkxU5QC8/QsbnT8Q0rpmrgCzWf7R19FUBjlCtAOPkYmdh2i8psHvdCd56L+b4
RXgfQjuQM43kG5xlQhVB0SDnURTm4hNDkdjVTQYzc/GabY01pkNiDRvHWHx0n7Lu
pP/F/0gj/tcu9U4Euohq8/yGpKbdl8/E46SeG57squt/Sczd34gkObBtxtCzUt1N
XzUk/PKvcH3Dd5KwU+MuHe3AJtblaaLR7ux0CpEFm9tOH7rBfd7lO5g5ThpH2Wg+
JwC1zUsm5ufcArkpDX5LBGw+deR1hDs5lAeyQrX0f9UiJmHM+VHIcEr+laCOJlYj
cc32DEktiKMXj/BOxLdoUCWyMnoAmCXC+s3xp50H69Sy/bAMjqeZkx/B8Jpnh8Gl
hvkjmZjECULGcyXiwlzuDrsaO4VVaXs9I0uqNfdiaBxExyiTz5s=
=8zQO
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
