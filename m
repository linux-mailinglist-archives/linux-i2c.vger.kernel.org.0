Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826E1A721E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 20:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbfICSAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 14:00:49 -0400
Received: from sauhun.de ([88.99.104.3]:56692 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729751AbfICSAt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 3 Sep 2019 14:00:49 -0400
Received: from localhost (p54B3348D.dip0.t-ipconnect.de [84.179.52.141])
        by pokefinder.org (Postfix) with ESMTPSA id 69D572C4F33;
        Tue,  3 Sep 2019 20:00:48 +0200 (CEST)
Date:   Tue, 3 Sep 2019 20:00:48 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-i2c@vger.kernel.org, tglx@linutronix.de
Subject: Re: [PATCH 2/2] i2c: hix5hd2: Remove IRQF_ONESHOT
Message-ID: <20190903180047.GG2171@ninjato>
References: <20190813115555.10542-1-bigeasy@linutronix.de>
 <20190813115555.10542-3-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3607uds81ZQvwCD0"
Content-Disposition: inline
In-Reply-To: <20190813115555.10542-3-bigeasy@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--3607uds81ZQvwCD0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 01:55:55PM +0200, Sebastian Andrzej Siewior wrote:
> The drivers sets IRQF_ONESHOT and passes only a primary handler. The IRQ
> is masked while the primary is handler is invoked independently of
> IRQF_ONESHOT.
> With IRQF_ONESHOT the core code will not force-thread the interrupt and
> this is probably not intended. I *assume* that the original author copied
> the IRQ registration from another driver which passed a primary and
> secondary handler and removed the secondary handler but keeping the
> ONESHOT flag.
>=20
> Remove IRQF_ONESHOT.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

There is no driver maintainer for this driver, so I trust you and let's
see what happens.

Applied to for-next, thanks!


--3607uds81ZQvwCD0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1uqk8ACgkQFA3kzBSg
KbbttA/6AhiJZAUd2OSr3NdBGDZPcMbXap+owa0u/GqQ+yrERJYuDFC3Dwifkbrz
Y5VCZmus+5VDEi2ntFspTxdoftGKJQRL5t2H8ScE7SwmARS6NYUfdOcAw6/QFiDj
kVgNmoc7WN+ihi16lbrKQR3l4SORF17jxoi70XbVLlc3xJATRVAZNgEKFtDNk1Q7
zjE7bMs9khFvF61bey34z9uis0s57d3VRIUGV224/aPCy/obZ/Ehvr+fziSpHPtB
+xPBbi4VB++xWIWs6VG+lWmmlzPVo1Cz5wkYt+aOqzZbYTQQkzsTAHY2cZGM6mvu
OTix9Zo1przGQLpNSGebKlZ7j2K7ta0U1A70pQexZbObygi8YDftGz46BOrb1WMq
yGJYfGWas0z37o2+vfPEfc6deefc7idptpD7nr5YbvxnlJ7Mm25TXUS+ZE2OGxd5
9Qx+43Exb+VPV+2crPjXHS1Euo++kHYAcqY2yysZzWZoPjfGjiyzKp39bpmAaPwl
9swjNh6FYQ0XcFLiDFOnQxz+XEGEQiZqxJDVW+BxubphQ+fSHTaaT/YiImCBr3Dn
MjBHCVfws9xX6B3xJTevl2Gx1l0x6BKIhBx4v0PB1NSYaQWpkY+C4iukWm9zZQd5
RjN5ngPt8WnjraMt4QqwHANiLejYTdfhoUTfraeBO1Uh4Q9MEss=
=mwvF
-----END PGP SIGNATURE-----

--3607uds81ZQvwCD0--
