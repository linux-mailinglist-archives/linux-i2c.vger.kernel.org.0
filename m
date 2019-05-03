Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABF74130BD
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 16:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbfECOxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 10:53:46 -0400
Received: from sauhun.de ([88.99.104.3]:34356 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfECOxp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 May 2019 10:53:45 -0400
Received: from localhost (p54B33153.dip0.t-ipconnect.de [84.179.49.83])
        by pokefinder.org (Postfix) with ESMTPSA id 09DE54A1428;
        Fri,  3 May 2019 16:53:44 +0200 (CEST)
Date:   Fri, 3 May 2019 16:53:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: i2c: riic: document r7s9210 support
Message-ID: <20190503145343.GF24385@kunai>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
 <20190430132309.12473-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hK8Uo4Yp55NZU70L"
Content-Disposition: inline
In-Reply-To: <20190430132309.12473-4-chris.brandt@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hK8Uo4Yp55NZU70L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 08:23:05AM -0500, Chris Brandt wrote:
> Document support for the R7S9210 (RZ/A2) SoC. Also explicitly document
> bindings for the R7S72100 (RZ/A1) SoC.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Applied to for-next, thanks!


--hK8Uo4Yp55NZU70L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzMVfcACgkQFA3kzBSg
Kbat+A/9HYjbx6Aq6tJ3Oo4NN0UU6Et6HxsROxT3fNzcUGiHJNWY7wEc+hGavCFr
lO51Fme0Jj04hF2KGXy6/zMRzO99t72fEfhMlTNtmp8CJ/CNXjVKCnhdEC7U2ZIP
ClaD7vzfymhJeYUWhJj94Zs2P0xKFqZoU92vkjceK73juLWQz9whPW7dLbv+ijFx
Uau4Z6g8IQapAvxzYg2vBk1EbLjC7CPCHAXgUqDM9WYxKEjLbjoZbdXk2DPfA2a+
iIfNdO/CJvI+0pq0jrIbEjTYVgP0U0nvBIMxsOlEMcleFm2s9+oqtqsgXKAtLMrA
Mb1ULNxTSO5xJ43uaBo8zeyiiECs/STXrl2giC73XVVzUGYLKRCYPd6DUv9H2eTT
Cym8sip9lyUpiQSZEhf2MgdDRb7EqXuZuUOHA1iZH3SPeEFEwMY1gmK7WKOWWGku
FXK+Ytp/FlBBPnU1r3MrPh7QPTlVoocQTqW8p4hJy6oIYwcds2Ixqs2ynfGecGzM
569IgHIQKhvQXoHmYTD1mbkrG2Snei+0Aw736BANLXjUb0iPMNkcTvEA/5wZGzTx
0CNSdHa0biUlXRhzFiVAa86SNB9b9f/CTFupcrTJzYuvBhnIGKnMCoGoyDNua24Y
DGZ2oBWjJOIMQsXGPkZq7h7vF4prLKZyQXwcm7qNw0yWmDW1M8A=
=8+kg
-----END PGP SIGNATURE-----

--hK8Uo4Yp55NZU70L--
