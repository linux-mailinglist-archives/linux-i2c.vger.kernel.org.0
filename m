Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85318FDA8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2019 10:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfHPIVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Aug 2019 04:21:20 -0400
Received: from letterbox.kde.org ([46.43.1.242]:36542 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfHPIVU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 16 Aug 2019 04:21:20 -0400
Received: from archbox.localdomain (unknown [203.187.238.17])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id 8FF8528AA7C;
        Fri, 16 Aug 2019 09:21:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1565943678; bh=Fq/JAj2DMh5WajhSajiSBS2R4HbCSthz3JemWQBtydg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OtmIbVxJwwcw6KxbEh03BicruwOl1HuQRNp/YGd4t/srRWSJC8O4SEroVIJqQyOYQ
         T3PSedJzn3/9EGnfjq3ZkY97GxxWfC7LneC3xZ663dyWNDlhcV9tHkvhusMb5V8zqB
         xhKUjj3FVPgV7BgCtppVrAVUOuqBPthstefPURWuO2oRyJNTPuY7NYn2wF9aRSXpff
         YgHtM/n2AQfY4OQhmdYUilcsqN7YDSsjkgIJkQKJEoYcaNd4l2UBA9TOrgKrrrgtni
         7F3yDqRw6pohzzV/IHEyYrBEqhTsnAReg/JcrBk2QvY02mfvOfxAWCkpunob7zFwLH
         /jQo/n1QgEXbQ==
Date:   Fri, 16 Aug 2019 13:51:14 +0530
From:   Bhushan Shah <bshah@kde.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Bhushan Shah <bshah@kde.org>, Icenowy Zheng <icenowy@aosc.io>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>, Wolfram Sang <wsa@the-dreams.de>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: allwinner: h6: add i2c0 node in PineH64
Message-ID: <20190816082114.GA18236@pyxis>
References: <20190811090503.32396-1-bshah@kde.org>
 <20190816064710.18280-1-bshah@kde.org>
 <20190816064710.18280-4-bshah@kde.org>
 <20190816075211.xaq54q2cdniwjpp3@flea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20190816075211.xaq54q2cdniwjpp3@flea>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2019 at 09:52:11AM +0200, Maxime Ripard wrote:
> > +/* This i2c interface is exposed on PI-2 BUS, Pin 3 (I2C_SDA) and 5 (I=
2C_SCL) */
> > +&i2c0 {
> > +	status =3D "disabled";
> > +};
>=20
> This property is set to disabled in the DTSI already

I added this node here with disabled status due to comment from wens in
previous revision, main reason being that serves as reference/pointer to
people looking at how to enable i2c0.

I can remove it if you prefer.


--=20
Bhushan Shah
http://blog.bshah.in
IRC Nick : bshah on Freenode
GPG key fingerprint : 0AAC 775B B643 7A8D 9AF7 A3AC FE07 8411 7FBC E11D

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEs8s2ZVJUC+Bu6a2XEZaMRJKMrvwFAl1WZ3IACgkQEZaMRJKM
rvzmrQgAs4UbPI/OrKjksQjR9SX73B9grk5BFXC1ueeuEriMeFJmXNCDe8p8TKOj
5uuflxKRw958jtYLvMoc9Z+AQwJZG2oBjzP0X7s9aJAcXIKulQ9NIW6eQU7ZoiZD
2F5Nwb8iYYq8v7OYd+t5I7yGzq/olO/tYvs2eIpPPHQDM7NqzYU+FLi4JcB8UUkL
Mp7h9MrMtNQoY149/3F9QfaFyU77C3rirD0xqf59Lf4e+UVyk8u/eeYzMFemA7br
5rJg+jDbOpJzb6Jn9bw8MMM9TKWs0rW8WyLy0xabATSNB6XEPCyCd/WxH+XzRP8c
wA+Kb80TXdmtsgssKa1+/Llt/AYWew==
=FgLh
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
