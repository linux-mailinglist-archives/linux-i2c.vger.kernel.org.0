Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78CBE131404
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgAFOrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:47:32 -0500
Received: from sauhun.de ([88.99.104.3]:39526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgAFOrc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:47:32 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id 52B142C0686;
        Mon,  6 Jan 2020 15:47:30 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:47:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mark.rutland@arm.com, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com, 2374286503@qq.com
Subject: Re: [PATCH v3 1/2] dt-bindings: I2C: Add X1000 bindings.
Message-ID: <20200106144729.GI1290@ninjato>
References: <1576570450-122556-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1576570450-122556-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LG0Ll82vYr46+VA1"
Content-Disposition: inline
In-Reply-To: <1576570450-122556-3-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LG0Ll82vYr46+VA1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2019 at 04:14:09PM +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou=
 Yanjie) wrote:
> Add the I2C bindings for the X1000 Soc from Ingenic.
>=20
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>

Applied to for-next, thanks!


--LG0Ll82vYr46+VA1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TSIEACgkQFA3kzBSg
KbZGtg//RNl7RfOle2TwNb8xGpFOYsd1Z0jAXLXoTcJ1Wh1vLsvbThveOqnaO/Db
vCAru7Z0xNZwuGkty7WnBRdDS3Ztw5HCDHyIO9/69HAggwU1JQW3MiMvj5Xkmcdc
NKk0CUCTXpZPn04gClHIctizPw0BnPk5i/d+vhVvI3ehpxEwjVH8Dg/s/Ru24la2
3lXefTX2yJeIs2sEtqs8W5cr2hkyd6XH/7IuoZZ3VHzRUYwF+FDqaQ+DWbuihRay
X71FACHEfS2+dv80liuNrypWPgynHwXzDsKLh1mjPre90p2MMF3FD7xD5QhdJKpu
c4E5Jh3Wz3SGQzDrhNKW08zWyDCKD3kOlmmp4zMS+KRib6piVZX03F2QxIu/eLj8
UA//Xlf5cm3sk/mPA8Qy6ymbs5inlDvnV7N1DdiyQYD+uKAFiGD3dMhetu1ZwLbj
t/LQ/rFMdCzKMZLuIeU4uYz0yFDqh1Hzku2qkL6mynixE94OQetDLFmHBEb0A6IV
DYkQ27oig2e6KyyTaiNhhk/gSVbH+73yNbuSXQn17/lpT13eNokduZdSWj+RCX3t
gCmHynalK/eEr4ooGcJdnVRCHMdhtZUgIiv0tA7DHwi8AOVJBULg/V981ST9agFm
d8IjxxExrJUNBeWh3GE8S+H6uEt5yWNnceLtlgaY+XaPJCZ1iZE=
=0Q4c
-----END PGP SIGNATURE-----

--LG0Ll82vYr46+VA1--
