Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0B79A3789
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2019 15:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbfH3NIo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Aug 2019 09:08:44 -0400
Received: from sauhun.de ([88.99.104.3]:54088 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbfH3NIo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 30 Aug 2019 09:08:44 -0400
Received: from localhost (p54B335BE.dip0.t-ipconnect.de [84.179.53.190])
        by pokefinder.org (Postfix) with ESMTPSA id 9BEE22C0095;
        Fri, 30 Aug 2019 15:08:42 +0200 (CEST)
Date:   Fri, 30 Aug 2019 15:08:42 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Jun Gao <jun.gao@mediatek.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandru M Stan <amstan@chromium.org>
Subject: Re: [PATCH v2] i2c: mediatek: disable zero-length transfers for
 mt8183
Message-ID: <20190830130842.GG2870@ninjato>
References: <20190822094516.55130-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline
In-Reply-To: <20190822094516.55130-1-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2019 at 05:45:17PM +0800, Hsin-Yi Wang wrote:
> When doing i2cdetect quick write mode, we would get transfer
> error ENOMEM, and i2cdetect shows there's no device at the address.
> Quoting from mt8183 datasheet, the number of transfers to be
> transferred in one transaction should be set to bigger than 1,
> so we should forbid zero-length transfer and update functionality.
>=20
> Incorrect return:
> localhost ~ # i2cdetect -q -y 0
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:          -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>=20
> After this patch:
> localhost ~ #  i2cdetect -q -y 0
> Error: Can't use SMBus Quick Write command on this bus
>=20
> localhost ~ #  i2cdetect -y 0
> Warning: Can't use SMBus Quick Write command, will skip some addresses
>      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:
> 10:
> 20:
> 30: -- -- -- -- -- -- -- --
> 40:
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60:
> 70:

Thanks for providing these test results. Much appreciated. To shorten
the commit log a little, I removed them before applying, though.

>=20
> Reported-by: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Applied to for-next, thanks!


--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1pH9YACgkQFA3kzBSg
KbbbRhAAlMzupxZHSJTI9Bu7BvMjyJ/TIq0NM6//hPM8wg5Xz3qzcDPVi+MAE5vM
9f+KrOU3DBE0YwP1q1x1/b+O/iM8nzxNWnkpB1Ipzmy9tc9W1LrFAAE7LLYePmQe
m0pLyeILNajlw39r+4DVX+5ChWU6gKUyFuDlie8gzwUgC7YoqZDBcsleuHWxPMUc
TuU+zUCJr9FFMCsHp0IyM3cRmeScXjMSjQ6GswnCeTsYbDZJu7zKKINEBMHh3fGC
TM8PfFZCz6RdPaSal3gIzc+c6itm6ZucZTGt4IYrIOUMVlPE9d0wS440jKEITRr7
WkMYJ12oiJEQkIKWMrndFXn7NU2IjhN9WFq/hjgJujxN79MWTwQmSp2+sRwWW1na
9YcjeiOVKNTdXw/BPAaOv8FyD/6MEbr/UXcHD0ttFd0tlIeXedM/0XnDjYkwFqc7
fuuOI4W5z0xqp54Y05+legEaio9FhyskgQHyxILwM5penDcF/+7o+qaY5UE3BZ5f
EFl0wWV+tJHzEzMXkmarFK/QvHuWaY/awbHtVX/YZE+Wzztm4a29b3OX+cjUf8Q1
eTONETlSj6sZXmiwmgdI3K2qhuYz2pNPp8ZEG7291y0FMi6o4Ejc/IegH5rDN4fb
eECFCJ1BQyGzvv41KEm4YyZMWE0wTi7BSzAC6QoLc1yzRtZwuCk=
=prhC
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--
