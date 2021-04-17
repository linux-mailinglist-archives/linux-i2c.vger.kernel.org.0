Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B10E36322C
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 22:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236560AbhDQUJw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 16:09:52 -0400
Received: from sauhun.de ([88.99.104.3]:38836 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236491AbhDQUJw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 16:09:52 -0400
Received: from localhost (p5486c83a.dip0.t-ipconnect.de [84.134.200.58])
        by pokefinder.org (Postfix) with ESMTPSA id 5CAB62C04D8;
        Sat, 17 Apr 2021 22:09:24 +0200 (CEST)
Date:   Sat, 17 Apr 2021 22:09:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: [PATCH 3/3] i2c: mediatek: Use scl_int_delay_ns to compensate
 clock-stretching
Message-ID: <20210417200923.GD9996@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Qii Wang <qii.wang@mediatek.com>, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        srv_heupstream@mediatek.com, leilk.liu@mediatek.com
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
 <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 17, 2021 at 02:46:52PM +0800, Qii Wang wrote:
> The parameters of tSU,STA/tHD,STA/tSU,STOP maybe out of spec due
> to device clock-stretch or circuit loss, we could get a suitable
> scl_int_delay_ns from i2c_timings to compensate these parameters
> to meet the spec via EXT_CONF register.
>=20
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmB7QHMACgkQFA3kzBSg
Kba+NBAAn6JF4qXFNrDhGxvLXRTjPqXUMD6/NwnxMpuk8enYQIOz18Y+jbXlbNNb
3lLX/OuSDB4Veclu/q5/EW5DH/066q7DAp3WkVkxXEOqsP5KgfsjxKy0RH166WtX
7Xo1bUecsTdlqFxO8SObPsid2FDabhoEAKCuQ3bhkr1vjuW7dLra0ZgzK/CE4tnP
8HlqKkzY9VYeXKjVi/GnjadVLsfcX8Q47DwlTJ4f+G2zBAWwoXGio48FJkZsZagW
STxoSdOE17gvIk3O+0MzfuCbam8XtJmgfo68CmouIPKNaJcB4i6WAkJYr05U1lQ6
LYhnJyDZ0ytDGpDlRnTyfJbSdQaeecuCXoIxDgYOOXoed3rjqQ10ZmaTC7nygj1v
FDOV3OMEEzbjSysFb1/V6QMdlRxELSDxXNS2HtEpqspCAkIl3PMM1Xvfz8gW/WG+
wyuEpgtDYPhtv7SxOrOFJxb8aRJcVCEbjyV4T1IoMzQYzvAmZxmNdRwRuTC7429G
Ou8qgEa2QsblpDzUoFhmFjwJp10qBt7I27L2EH9xVRPmeQa+wqCg2+AHVbSlQWOu
/QhPt8MG4bZSM887RT5tVfof6eyXeJ6OmA8GkMz5UnmD+ReUEiAmoGeWvaBh5b9J
WHCXZgcvNMgTBG8WuU0MuFjQclhQ9bfujZcMaABjmiZVBR8ssyQ=
=z08x
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
