Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 370DE340480
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhCRLXN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:23:13 -0400
Received: from sauhun.de ([88.99.104.3]:41220 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhCRLXG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:23:06 -0400
Received: from localhost (i577BC015.versanet.de [87.123.192.21])
        by pokefinder.org (Postfix) with ESMTPSA id CEA032C0640;
        Thu, 18 Mar 2021 12:23:04 +0100 (CET)
Date:   Thu, 18 Mar 2021 12:23:04 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
Message-ID: <20210318112304.GN974@ninjato>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0aF+6pWUK5w8WdCh"
Content-Disposition: inline
In-Reply-To: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0aF+6pWUK5w8WdCh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
> clock-stretching or circuit loss, we could get device
> clock-stretch time from dts to adjust these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

I will look at this next and think about it. New bindings are always a
bit more time consuming.


--0aF+6pWUK5w8WdCh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTOBgACgkQFA3kzBSg
KbZRThAAjau0thEmr8qwOPK+lgNrBOVmicwqn/No7ZIrH5/uicp1251YepZ7hZ+d
IeUEJ5jMaqUQckvPmalKpFshG2XzRDc8samRvPxqoFEttNgrj0Ped6VF5q8JIjXk
+uhG+w8d/v3uPoaWA+XXDTB8tcN5ep9xi+2TeVNLbHqyX4+uM7JYdCUXI3xPBjwZ
gWo5jt8KzOk/VAltY3TDAR1bKT4vyOEUP928bzcib4lRM+S9FRf49i3xpc0C2AkO
dr340fXlX9BqaDxYL+0/sYZ38Rw7ju0TBfd6piSKt+9ZpIERZY5vusmgRBwtTf8J
GuPk3dNazPezZU0bpIvxquGhl3O0TmZioXDIvcZ5BkJJIOLMrOuhQw7X8msNyb//
dexUymGeDmgZqpZ/dmXPlAhIdYJLxrOZYYXivNkfKkIttchNMhvFD2pmQFdchGqD
CbLseCHKH5p9EmGy4f5AnxOS/q+i23p8uZdWmnbnZbUR+oE2BDhkA196VzOfYT8p
p5G85HWwDMSx491nb/g2jhy92Zjt0nIl5jBUmbtxmY1Eg8+LTTi4qauEwHcALdYr
lDLEA1MF8x/v1qN8kVEUfX5kwssdlkiO28bz+JoaoHymE9RoLRlQA/keBiuGl1z6
XNpZIt1EjcFQBO9hytzWqXs34AAIWmTLXUwahZyYcEVhRNF7yr8=
=B7sP
-----END PGP SIGNATURE-----

--0aF+6pWUK5w8WdCh--
