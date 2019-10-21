Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B6ADEBB4
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 14:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbfJUMMl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 08:12:41 -0400
Received: from sauhun.de ([88.99.104.3]:46474 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727959AbfJUMMl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 08:12:41 -0400
Received: from localhost (p54B33572.dip0.t-ipconnect.de [84.179.53.114])
        by pokefinder.org (Postfix) with ESMTPSA id C6FD72C0076;
        Mon, 21 Oct 2019 14:12:38 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:12:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        tglx@linutronix.de, hsinyi@chromium.org, drinkcat@chromium.org,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        Cengiz Can <cengiz@kernel.wtf>, Ulrich Hecht <uli@fpond.eu>
Subject: Re: [PATCH RESEND v2] i2c: i2c-mt65xx: fix NULL ptr dereference
Message-ID: <20191021121238.GD1145@ninjato>
References: <20191018173213.13282-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ycz6tD7Th1CMF4v7"
Content-Disposition: inline
In-Reply-To: <20191018173213.13282-1-fparent@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ycz6tD7Th1CMF4v7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 07:32:13PM +0200, Fabien Parent wrote:
> Since commit abf4923e97c3 ("i2c: mediatek: disable zero-length transfers
> for mt8183"), there is a NULL pointer dereference for all the SoCs
> that don't have any quirk. mtk_i2c_functionality is not checking that
> the quirks pointer is not NULL before starting to use it.
>=20
> This commit add a call to i2c_check_quirks which will check whether
> the quirks pointer is set, and if so will check if the IP has the
> NO_ZERO_LEN quirk.
>=20
> Fixes: abf4923e97c3 ("i2c: mediatek: disable zero-length transfers for mt=
8183")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Cengiz Can <cengiz@kernel.wtf>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Ulrich Hecht <uli@fpond.eu>
>=20

Applied to for-current, thanks!


--Ycz6tD7Th1CMF4v7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2toLYACgkQFA3kzBSg
KbZHYhAAl8PJLRm3n1nm+VexzkwL5Vr5flPI4eZvMIG+4oHfei8QC90cd7qAMaid
FLmD34xBk+wvW4QUp4VH/UoKm058/2xXE8xPEvVAZdxSVfhpU9tqkOsL4exxvv9A
ERB4uZvYNbirHWOEv4XgxMSKucnFU+HwcDKqR0JjVWcYfl7jRKoq8lWgiQ0lPSc2
y87dyYhM6Kp5XU3lGd8WqJbArlxT0h+4IzshXhg7Jh/nbqPIeu+R5jX1ilt1bj/A
Sk7UCssar8LQ9Xj8kYXWhm7YJZ4mD3DaQ5yvl086mI2QOuAd65MYsU8IiW1/Bq1f
JzBNSL0nms9CSZwnGL84qa4BC/3PT+MWMTDQYlsKAJAmhz4zkw8JMp2F4uI3KaZd
p4uX+T5ecjdljvDga5HEsJ9zumJl/U+Hy3jxY+rxLDF+3ZiTVrQa68Hft8S97OI/
83Q2LikqYYsbUJBXl/6asEdcpitFQwP545w/sSa5wa1kXBwCeCoAbFCxC+s4Sp7H
aXZQDALTnUeYSLi12K2LYzZ3JZcjr9rPBg5EDNssm3U+SZBC+YESlNIEhGM6HMzX
ZqHdhYmKM4FRI8F5fQ5ck7NQjq6GKckVIdUQM9q9eb/HdTw2ChgvetaVFO4JcdD+
WhaIBzgT2gL6ESoLO5gvFya2cV8faV+zrg+SzykofwM99hR4DtU=
=hHgJ
-----END PGP SIGNATURE-----

--Ycz6tD7Th1CMF4v7--
