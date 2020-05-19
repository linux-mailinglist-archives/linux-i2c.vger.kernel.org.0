Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928481D905F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 08:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgESGxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 02:53:25 -0400
Received: from sauhun.de ([88.99.104.3]:50670 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726841AbgESGxZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 02:53:25 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id 884E52C1FA8;
        Tue, 19 May 2020 08:53:23 +0200 (CEST)
Date:   Tue, 19 May 2020 08:53:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v14 1/2] dt-binding: i2c: add bus-supply property
Message-ID: <20200519065323.GC1094@ninjato>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-2-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <20200428061813.27072-2-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 02:18:12PM +0800, Bibby Hsieh wrote:
> In some platforms, they disable the power-supply of i2c due
> to power consumption reduction. This patch add bus-supply property.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

Applied to for-next, thanks! +1 for the comments Rob made, please add
given tags if you didn't make further changes.


--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7DgmMACgkQFA3kzBSg
KbZVjQ/+JwxxOo7eBYPA/lGjh0/+tWpcHvV7u5wD2g7a5jpzB2C4AtOrsNbxZPBg
R+0VDcMjALqnU9vr5Og8BRVYD55KIUnlzQ5x4lf8BHOOmziUciJKO/yaW5QQbSqS
wQYeld894w63v4OOjKOaAMFMXuRw9D3/rDOL/Ep/3h0MlIffjowfWFZ/sv9d4SdI
CL9q0RfrRvQeFGOLRGw8dQGG4V8mtoQQf0o+QF2iJ6wzzFALqomquJZSgRKPEmkC
Lb1NGXVqGP+cFs3jUzbKBSxVNRjkD+9teck8OQgemMoDj7yiwLTcPx6qsR1x26wS
9XHybBlm7+G9JZatf8rinzKqTg92wrS+6rXvcv/ypQx6xIB1QylX7Q7G+JFxpPdg
QSzY/I/L6QyOYn1EIAakqpJZTZX5373uprAAEk54APWPvgkEqGN2OtvHEec/oOab
ABZEwa20WOqYTEPVwiVusbIQ1X6kGSN101vE58YRqj1kwjN6Dnf4wi35dWMO/Q3B
3JTdaxos1ZbpCNDcjPwOecI56E4G677wqzUC0Ji9H0/V/K3Iy3qzkB+l7aA5K3Hr
75o9KDXgohY2+VDFcM5FfHpW+pywQ7UoDRryq5KJRMij6GYR3CA/eXeQuqs3zblm
I1B/WUAuAn83r0O0kqrAD5wdUHAjkYHeZdAuiIQRmTfeyDy/V3I=
=Gi5z
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
