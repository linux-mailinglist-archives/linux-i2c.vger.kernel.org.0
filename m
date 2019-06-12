Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9471342250
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 12:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437961AbfFLKVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 06:21:55 -0400
Received: from sauhun.de ([88.99.104.3]:58198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437611AbfFLKVz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Jun 2019 06:21:55 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 1C3E84A1203;
        Wed, 12 Jun 2019 12:21:54 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:21:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Dmitry Osipenko <digetx@gmail.com>,
        Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
Subject: Re: [PATCH V5 5/7] i2c: tegra: fix msleep warning
Message-ID: <20190612102153.555errst3c5jbhui@ninjato>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
 <1560250274-18499-5-git-send-email-bbiswas@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="t7o5sdigsmuuvqjs"
Content-Disposition: inline
In-Reply-To: <1560250274-18499-5-git-send-email-bbiswas@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t7o5sdigsmuuvqjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 03:51:12AM -0700, Bitan Biswas wrote:
> Fix checkpatch.pl WARNING for delay of approximately 1msec
> in flush i2c FIFO polling loop by using usleep_range(1000, 2000):
> WARNING: msleep < 20ms can sleep for up to 20ms; see ...
> Documentation/timers/timers-howto.txt
> +               msleep(1);
>=20
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--t7o5sdigsmuuvqjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0kEACgkQFA3kzBSg
Kba6yBAAiIFx0pXIWGFXAasn4IDIQa3zUfphhwefhtmMJVumYDp1kvNQCunHSwlk
/eUWA3n2+jEAbCr/KX7mddWLVV0joXjDfVk70ckaIh/+DSWh7qeCvZqkTYo+/h5M
md/9ftg3ZtbsHHYurgrB6ro/867zUumiVtAmDllZWtlHtIq4XMUkF+FXQx8ox2At
WDeyT5rkooZqxx2rVWcK3ANpskMCR6tJbJy0vLs2C0lS+DK81I+VR+NEaZs2LUT0
nRF/anijDQqvZp8sWsSlQbiiuaTX0ZpWPHh99JDEB67TT3G2wnn44y+GJXvreKLK
AcSl26IJM3Gxas+IXor5DdmOSWruRAHZOOaNtmphqXOmTUMm2DjJwBVukdIhh9EO
uS+/5QBVY1vXWywXWXK/D0uZjJLcoap+EInrAS60YrYCnG35lM+iQEDSYvtwKHir
OOvaiutVWfz3gjipsvbXt+UP3mGhp4nGMuv6tXGQ4iT4mxjrb/WpFj3wUite1b0M
tMZtRuBXJclmpa+FewmjqjFJsKtQUzkMNQ/yJDMUUIFbgmtZJfnaU9LAIvJGBuDf
HT3OyYn9d3/3QAsjvOGSuiGI7EskmpeYKxYVsCJPstZkPfydHW8zUQIo/jXG7KM9
UDrwNafr1vZXXwckDPCSq7x2jfPeS/cdQfg1GwE3PKSdWqiNxQM=
=6Y6t
-----END PGP SIGNATURE-----

--t7o5sdigsmuuvqjs--
