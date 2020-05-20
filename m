Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C77E1DB4FE
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbgETN3Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:29:16 -0400
Received: from sauhun.de ([88.99.104.3]:37730 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgETN3P (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:29:15 -0400
Received: from localhost (p5486cd24.dip0.t-ipconnect.de [84.134.205.36])
        by pokefinder.org (Postfix) with ESMTPSA id 98CC72C1FD1;
        Wed, 20 May 2020 15:29:13 +0200 (CEST)
Date:   Wed, 20 May 2020 15:29:13 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [next] i2c: mediatek: Use div_u64 for 64-bit division to fix
 32-bit kernels
Message-ID: <20200520132913.GB5759@ninjato>
References: <1589970713-19944-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <1589970713-19944-1-git-send-email-qii.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 06:31:53PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> Use div_u64 for 64-bit division, and change sample_ns type to
> unsigned int. Otherwise, the module will reference __udivdi3
> under 32-bit kernels, which is not allowed in kernel space.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next by squashing it into the relevant commit, thanks!


--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7FMKkACgkQFA3kzBSg
KbbynRAAmwCukXP9v4Fs9sjBIrxVil2vgnjXCEmpHgr7IZ37e9uoqxlUndj/oHhs
YuDiSBGBVXU/ZYFP2VDsUdMRBa11pyoNALMiO0uIThiQ4gkn132Ej4DJ+s9o54cz
nh74h8be69a0EmvvYY99oBfIFZ7ORRtvL5lIktHUaP9h4YvU1CC/neJ5o97q4bVU
GBugpXgWfXEBApFPyXr3ShOaUyxnCJKYHAFyHShqoEtgIwXlyurDYG9yzkeI3d6w
U5jKdhAp97EwNf+b1iLj/2EEOpE0G1wEWke8rTL1mjJMJRVCwUQqzeFzPORfGMK+
YpphdJtvU6mvl2wjnybBcc4gb9WoQP7wRkb7lEdgW9kmlNIqPgzuds7F6ePHMNRD
GxdMBnOiLFC6UnTih18N4gMnH9AwjX/1Hz4k8g9riHdF1+BGpcytZsosCXXE7n7C
9rVPE/9HE9juuEWLBTqdonrOje8DOtOtOqX1b7DwEbHotanakMQY1C5xPbX6Wzr3
QnKeVyuTbd0nUVkLgMCOJP/d9/1mJWWNvJSKdG/7zRyyz2nhOr4C8lJhLLH14Hub
XKK5/K8qiufXzdhryt/EmiThF5WbhcRHQ4HH+irt9droO08MkBlZfnuW7NT0NPuY
uk3OkrWasxCtb9udRSUrM6rGmfcueB//OzLR3xiq8GH/AykuwaM=
=gKRd
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
