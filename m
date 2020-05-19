Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0908A1D9264
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 10:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgESIsD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 04:48:03 -0400
Received: from sauhun.de ([88.99.104.3]:51884 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgESIsC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 04:48:02 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id 19DC12C1FA8;
        Tue, 19 May 2020 10:48:01 +0200 (CEST)
Date:   Tue, 19 May 2020 10:48:00 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v15 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200519084800.GG1094@ninjato>
References: <20200519072729.7268-1-bibby.hsieh@mediatek.com>
 <20200519072729.7268-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Content-Disposition: inline
In-Reply-To: <20200519072729.7268-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 03:27:28PM +0800, Bibby Hsieh wrote:
> In some platforms, they disable the power-supply of i2c due
> to power consumption reduction. This patch add bus-supply property.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7DnUAACgkQFA3kzBSg
Kbaa0Q//bf23b/Q6JUEHDe+pvwCyO6kVwRO7StcA2cY7O5oSCsAOQFHlHu7oxKQi
qeJApZGdQXFv1QvkIdPJWhpumu4QmCucljDFkf1Pzzlz0E4BmJw5VOQ5RBO/hHJE
UnHugK8aEyzkuhuNUWrynDD+fCSOBMJfHV1KqdUbiHDfkYgc4LpwVOyWYR0Yh2af
3cFkyIHaA80RF3NoKU0A0knGkV95mHz1TD9YI4cApHGVwiRYImNKGK8TE9NqBJmA
/xa9/dK/rzGCGfMuw5QlnE5Tii7haOeYyiUxvW2/NxQeaDVZex9YltRvLQ7C95O4
e6vOfYWSPKEHIEKxLhz2bzR76/5qTJpaYt1PLNZdx9V1dbkis0pYapeiT6wwHETV
tjkxGSLFFgRx0TiwrkhgyQwbRVKQXyy3I3ayhg70lZOKhg274XqJ9u6dWhTNnojt
LMYVdl8pGIg3avn8LG/tt4aMDldWcVsC31GnyJ3uqCU7AYU43w7wt6cGZ36gMWB2
9ClOn+SV6oN7+ndGedQYpF8HohQfbaTJG5a/kQawx0nxDABWAJZILVu56tNSFigE
ECq1GiFY8pRvBPIRzLXyQhXZaTOdbM2gCTsRIvlaPP7fG349HfAjti67GVbbuuOW
7Mi4qH2dBf2hAqwSPoAQOW9C5wS0RVbDRP1f1hA00ZONfjOSOBU=
=+7m6
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
