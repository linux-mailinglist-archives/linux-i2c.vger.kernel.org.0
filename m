Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19A8A17F453
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgCJKHH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:07:07 -0400
Received: from sauhun.de ([88.99.104.3]:46880 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgCJKHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:07:07 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id A5EBD2C1EB6;
        Tue, 10 Mar 2020 11:07:04 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:07:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 01/89] dt-bindings: i2c: brcmstb: Convert the BRCMSTB
 binding to a schema
Message-ID: <20200310100704.GJ1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline
In-Reply-To: <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:06:03AM +0100, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
>=20
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I didn't get the cover letter, so I assume I shall pick the I2C patches.
Please let me have the cover letter next time.


--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nZsgACgkQFA3kzBSg
KbbQ9Q/9GTVZf8R/GtAv29DgISJ/YjMp58JVs7OU6+mBQE0j7tiCJ6PLhm23VGiU
cdjdeDr1WnNxjFJVz4odMqLO3I6OQ1D5492m9JoDPyulYLf977dEiSMq+k3m50sp
Fjtmc2wfaeQD3IEdkDtNcFJkFpj90z3u7lQdT3g+HjnVXLMzQqPCKMNJ86uV+Bch
S5zkZy+T5cNq8ddDKy9pFKtLO5RtVsaJb4voFeCAn3mxvW768XGv6zH0p0YUDeXI
O+l3CwwFe8V1eqvQceTRu8eSq6k7XD0/EnH9eu0LVee+ou5gWUNgOI5oVyqee1mv
h9lJ/m4Dwnw5vwRb1Eo3yloQ5laK5Qoacj+PC1ywwQD6VajDelfa67qhjmGBVoMu
pu5gguaOFKTHsKDodTv3eKkupQmTeSvN50spne+/y8dZk1hth5k9mf6hfahKZYT5
NLyaSwsgCDnQ7cvJBHE4WkuCBx9yTyVVOTQB4TdtHwvk0NdhQSq8v3cCQeoe73IH
PipJrkHNeQrag1t/2WQwNQEViKoomxVK/n7zp8AbXfxiarzAmVnNvJi7WHoLotaM
LKnth/eRoerOtXeF1Owk54u+/V6kJE6mlNcl7RVvHauIANEG5k9p2cmPaXRFGnh0
n2qmm1mj0HCYrQxIkKJ+qtFeaieY1IQU1op1flY5kftD5ZzqRUk=
=EeaW
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
