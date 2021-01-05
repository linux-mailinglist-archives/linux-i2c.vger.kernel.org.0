Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D152EA811
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 10:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbhAEJ4V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 04:56:21 -0500
Received: from sauhun.de ([88.99.104.3]:40878 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbhAEJ4U (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 04:56:20 -0500
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
        by pokefinder.org (Postfix) with ESMTPSA id B54AC2C03EF;
        Tue,  5 Jan 2021 10:55:38 +0100 (CET)
Date:   Tue, 5 Jan 2021 10:55:34 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Qii Wang <qii.wang@mediatek.com>
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210105095534.GA2000@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
 <20210104182959.GC935@ninjato>
 <20210104183202.GD935@ninjato>
 <1609831496.23685.7.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <1609831496.23685.7.camel@mhfsdcap03>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Could you help me add:
> 	Fixes: 8426fe70cfa4("i2c: mediatek: Add apdma sync in i2c driver")

Thanks, added!


--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0N5IACgkQFA3kzBSg
KbYv7BAAnDggg4mbm29RRXNwxb2yO9vm0fVbb+W3FGF5JcD6Djg+baJqJwy3JbqU
UjUTSaZsvlhtI9qbWQaO39gnDSsFmVFm8mcTVK1yRAB2KyduAz0zEDPuk8tWGhgR
7LSS8F7OGLPM7iHEtVa1mhb+Wkt4Cq44bgbToXyYQymDgw4qoRWxFMQV2mAdc3xq
ZbzrJvqkDBRKF02K3bA734sTcGnILuA+31ewfgUBGpy5Tqx9I2WyJ5yGKO7DdYwy
+a3TQdrZHnE5LRpYkrZltKvHg5wyy2gL1Z+tLtgZOqzzavaG3TVyJfDzfvWS+ttv
1gke0PG5G7BjovGfDKoeNX2kYc9UyMNALebIv+aw3zqsOcfoMXrRHM3dsnsfAAKa
xnv4NqTeuGIbBNHEvje0AwnlOyMnsu9t8vwezwUNFk2jJmPDbEEHOcczS6ClXtnw
/AZraLbdipJqXMx/jDHAov2OOaSCu2gz0gaIyOc+coDJ9El2kbqQs74OS9wL/Jlg
V4YRaRi4f7yd1zrMwHUXv+x5MMMb/s3tJVVuSNyKeGosZ/893IfKxFUPmL1gUroh
Af7eyqY8X2FvzFA7AKSCY2Az/fofN4DZxA+2gGTHz35b1TRQdKWpuIOoK3JsK0Vk
yT1uFZOnDfQus358NOi+I6Jt2uK+BA5rRXKLyg5sQsqbz9L6cGE=
=cDDG
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
