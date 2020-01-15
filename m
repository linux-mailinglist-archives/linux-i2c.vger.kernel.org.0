Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED7613CAEB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jan 2020 18:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgAOR0e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jan 2020 12:26:34 -0500
Received: from sauhun.de ([88.99.104.3]:38784 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728913AbgAOR0d (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Jan 2020 12:26:33 -0500
Received: from localhost (p54B33239.dip0.t-ipconnect.de [84.179.50.57])
        by pokefinder.org (Postfix) with ESMTPSA id 469F62C39C2;
        Wed, 15 Jan 2020 18:26:32 +0100 (CET)
Date:   Wed, 15 Jan 2020 18:26:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH 2/3] i2c: parport: simplify Kconfig description
Message-ID: <20200115172631.GC1239@ninjato>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
 <20200113210643.5033-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <20200113210643.5033-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 10:06:42PM +0100, Wolfram Sang wrote:
> The driver is not 'new' anymore, so remove details from the driver it
> surpassed.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4fS0cACgkQFA3kzBSg
KbYfQw//ec/rIONFvvPUh1AgdBt50hh6eqEFo8x8SB7AQ9DxmDvPRCcpGbfCuK2Q
YshA1OW/olCn9lpqtotraqRtPTprDL0uvu7kOtUCZAaQPFqK6ptSz7BqjpgoCEWj
oP97iMaEp4PdIR93+0IX91bsQ8Mi1sWBv/c/IlbCnarvVkDmTsXRuX/XDoCud4Gj
7RtIZxDRzLoSWe4hHtqz3Ix7MW8UOnZogWu9MRK8MmsmbvxBFUwjgYHB9p3n1XLN
kZRQatpCpu67s3l+4oDLC/6LdiNBnmrU7e3wGq7TbbuGMzNrDvYO/xsP8/ge0N5A
y1Hu/lRNO4DZCcY1+8VxVXM1gpeZH/gCFO/BYtbClLiyA42s/jN1f/oX3RP45b78
ELr3Yd8rkjJH7xgu8PtOiw/nHzOQCWJMetxQlLA6g/zIKko5VP+WjSQJ9Gz3nnXW
wxZmt73bcBovk2LONfR5wASNWFJbCXa+NEGCPyI1i+H6tV4gqn171BxuEbOQp6Jh
MDelZto7UkWNgZsH7Glntgp3blxvK5c5YdIEFpJGH80YXcn2UNPGPxy4aVLQOYDT
rqBwY/xd+e63/U9MaGdmbC7qXM/wAwLNsMsVN0zmM/Eq+GkBxLkkB49ddgBAsWLB
Uz4MtehMflC0KSi4wgqi6KW7B7AMJ6Jat1E/pmgAfyVOafwQXd4=
=/cP+
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
