Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82A0C2E9D0D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 19:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbhADSam (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 13:30:42 -0500
Received: from sauhun.de ([88.99.104.3]:60494 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbhADSam (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 13:30:42 -0500
Received: from localhost (p54b33105.dip0.t-ipconnect.de [84.179.49.5])
        by pokefinder.org (Postfix) with ESMTPSA id 0EE372C04DF;
        Mon,  4 Jan 2021 19:30:00 +0100 (CET)
Date:   Mon, 4 Jan 2021 19:29:59 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210104182959.GC935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2020 at 08:26:07PM +0800, qii.wang@mediatek.com wrote:
> From: Qii Wang <qii.wang@mediatek.com>
>=20
> With the apdma remove hand-shake signal, it requirs special
> operation timing to reset i2c manually, otherwise the interrupt
> will not be triggered, i2c transmission will be timeout.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-current, thanks!


--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXqcACgkQFA3kzBSg
KbZQ8w/8DE+WVtoHYrCXAHx91n4/N6jsfZxOi7xLlm9x3FX55Lo0eiHeNIRHjgXV
puAT1I9S8RkBC7s2Sc9jDH0ZGXsGfSeeWxTJydK3RV1tq59EySpl6PZQ5GYjPRPJ
VXf12AEDnFFKOHiN4K5N1uRFMkP+mp8lYnher8fJvEN3qOhtg+kQPw/JZVwoJ2yf
uB4MxKGyYdKPGHgb9cVrJhNYg4wx0wfHGWt/wrai4jVqjcqezI74SiUmbvI9a3B5
lFAwZkMKKQ44MKclF31Ctil+GRUTDp/ZrpuMKIJMX6zn2yTSS+M174NcvatScm5D
jJBTOdjKOD7f4Yz1FWsJ+mKx7t+go8+ON5DguoEFxJBVqyjcw7FEgsZLP7f5yrgj
QaJwdUx5v7E/+WPVAZTb7cnllHrPXrAihrRm4VSKlzbqWxUr0q5CDuIAQLKe4mKV
EFbRol3wetWpT5y2YPEj9p3O3IZnhYQWMysrnwI9clNOdZ50ChlNRHKylugbBXxF
V5LmyIHkFXDg6GqZulqaArUkp2kh4bavOejN0JPEZkPg0cGzqb1jd74R8CZuorHL
JtdZ8hp3icd360VXxSZ3YWeIPOPUSeaBRxusMNnJqNiGS1+4qGeGNBEdY3wdufDh
lRdyjCKQcIR3Ren+c/A3tbS+TRFQ8A1h9IBpznbaqgc/TQbzoAk=
=L+pH
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
