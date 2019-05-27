Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA9512BA73
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfE0TAA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:00:00 -0400
Received: from sauhun.de ([88.99.104.3]:35882 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfE0TAA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:00:00 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id A09DE2C04C2;
        Mon, 27 May 2019 20:59:58 +0200 (CEST)
Date:   Mon, 27 May 2019 20:59:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH] i2c: dev: fix potential memory leak in i2cdev_ioctl_rdwr
Message-ID: <20190527185958.GB8808@kunai>
References: <1557238832-10723-1-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <1557238832-10723-1-git-send-email-yingjoe.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 10:20:32PM +0800, Yingjoe Chen wrote:
> If I2C_M_RECV_LEN check failed, msgs[i].buf allocated by memdup_user
> will not be freed. Pump index up so it will be freed.
>=20
> Fixes: 838bfa6049fb ("i2c-dev: Add support for I2C_M_RECV_LEN")
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Nice catch. Applied to for-current, thanks!


--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsM60ACgkQFA3kzBSg
KbbrPg//afgtgokT56fLVAUimGKtp43xzDIQTphV9hSrj6qPYR0k56cR1pHzIusn
2CI1BMettrTAASHv6klyeQcSJzoNDEJLwc3zWgPnMEARpTOaqc7IeptQfS0qNMkJ
a83IE5Wvhl/w8dDINSxGqXOiMOIsYQ1fVHXYxB+9iaWM2ptxsCidWl5G+6hXUTn1
wW3icZKaPALroV+TlvlyFIp1D+WhkrgWf/Dt2t5xe4kvnO4Z7dAvdBKvzMh9ns61
zR/F9g0j8044RWSPzIm/uw7yvoamv+haq2f6P6k8aEvlt/R4HnsWSB440uZinZvy
JGjn+XskfNUny0rQsWn7L8b7Avigx5bJSS5DCNeL8TUSIu4qCaBv3GSJAMd/IId4
u8Hfs2efh3xVY8szRzl3Cw2UT92Alhg5Y0+IQK2iSeEovnKiH9asyQU7FPbDLEeO
L10vkNMEKz1WsAOmDr+MTf7qjER6sYoECehEnn2doOE9Cvsy2K8OmrLXZ5lnQ4zl
w30FOYcZWdohFjMBYFOtZbL785pReQ/5dAPJlNUNPdbWU3FMfNhtylcbhCc4KJVV
Yu0NvSTfN0fKHtfEpdB6VTsecRw7tjZogVXUvoecos8SKRd+J6n18j0QXBeR2BRx
kUdKKAQWKwTi9U/bFlwHsXGW0yJRJL8w8Z6utUXJ/xPmNXnQsRI=
=VNJn
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
