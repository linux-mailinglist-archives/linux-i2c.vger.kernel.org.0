Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F384BFDEA
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Feb 2022 16:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233839AbiBVP77 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 10:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbiBVP77 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 10:59:59 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52A2D7625;
        Tue, 22 Feb 2022 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645545541;
        bh=v9/boqjlEcMyJId9CIqJT5C3HYAS1X5pmHRpj5+LSPc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=cbzMWlssQz1//PF81imE5fp0P7GhAfIzopBnTdtSgpTFKkIIK0dcRYGairYstDVtA
         fTumudGg1hHmC5mVNbopU7Y/ObW6RxAZQFDUXV2RNmrnd0O9CpQbZenoXTf5gC/lFG
         zgo/bvwWAlDR0g4fwesrdJpFarVh2oVqkacLEUyo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1oOZK92U6C-0123sk; Tue, 22
 Feb 2022 16:59:01 +0100
Date:   Tue, 22 Feb 2022 16:58:55 +0100
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
Message-ID: <YhUIP4pvoGBUohCE@latitude>
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude>
 <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BFV9RJgjJXy7GXVr"
Content-Disposition: inline
In-Reply-To: <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
X-Provags-ID: V03:K1:rkMLMEInh17Ve8XEjZGhyurP/kHhNyjyxMPqtUdDPcpxZOVYY84
 txLbQ0ex8B7LbDZXCEOuqWbWr/BgbINmZ/my9cXBi5qZrwiU1ImYy0D7ahISGOQrPnpwxLs
 3QEMMXU/b6q2CuXyXDJPG/F5COM7fxchIRgR0t00uAF+ZePvhRcIPT/xfr51YVNNo2cJIwd
 WpPA7p37qFwt1E8AOOVUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yajh5NqeYhs=:yyQF5KUIf9keFlVIDVev0x
 RMyiFIEKsJfAqDv8iScdFtsSbx9c/MXj/m38FFWZ+S5sl/fssdxvp4lXPZ8koIFyM9prrKW1B
 rRCJQyicu6pUX/BKEk+uMk3FQPgJMYSrLCcScT284aJmSxzNRFfpoYAroQzaBwj2tqEAALX7x
 DKICabara53MyEGB8jqDrOwXtiFzo/86prDPX4F+hRBYfVcTQwwseo9HhDRA8bZyKF1McWr09
 wtDWzBGUJuFBgiw2GUnaaUcYkLxoghz0vvrhp+hVa+hnzedDc2kei1Xg2cUYfjOe+nFyoQx+D
 Ms1XEO7kfmcfTGxxcbX+9VYs9Y5g85GkwZVucKV3ylfHJ0BwrYp+bYmcCAfQSslo25rduYcQs
 ypL76f1f0DeMRzxAAn8B1Qw7i9d28oaGWFaToXs3isj6uJZTmRbNi77grVgW2H2nU+wDMoP0U
 fwHUKD5RJxa6xB5o81FlTysBMFr50rPKJvV2mUbzQhJKh0qZXo949bfPhISF1eKTKag7U5zo1
 1yalgmzNtdIzQ1s3rQJk9r6yZT7D9RoKc4WkM08MDtmfZ+O+tzpfqJ25qhozdSZPwvvzwa6xj
 HrFawC4U5la7dxnK2jwE3lo5DBQAHq6Djy8l21wdYptKID9vE9gaV7u6m7XkYwaj548HogTj+
 7bD/iMmStloFWhX4gkb5ZQlfxHfGt+zhBHtS7mIywqt1fOBTok/lbCtZni+yBmxi3XryFrt9h
 cUbrpllS2XV9d0HYjFFs1NVHnm14FbqrIXl4pQ0THAtA27rtp3tYMpzM+vI6Aplf35fCYKK5Y
 4YppBHNBrKqhAK7MIUrMK4dExLZE5rOihrM8EoXcivXXX186d6jjqLsHjiMo7W3Mkt+mIRJF9
 C/7AWQ8RKq11RCbzuOBykJk9R9HlBcKRiTU0hOslaGyhx0C/H46KBmRrx2Nj1uLN+O/VAauRT
 QvPLVaP9V69b2JjrEKbx2CTILdWpBec/Tw/mQXVmtaqGP8JTj/yVI4/davAI7pNMHJT98aHgv
 UC1k7vyg5x7KWlg4n2X4A1WIj8UD14m2Iq5UFcExEJoUAdTvyjqwX2jWj+4YbN+ONRKzsPZFR
 GEvrUYzS4AsLnY=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BFV9RJgjJXy7GXVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:15:04AM +0800, Tyrone Ting wrote:
> Hi Jonathan:
>=20
> Thank you for your comments and please find my reply next to your comment=
s.
>=20
> Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=
=81=93=EF=BC=9A
> >
> > On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > Remove unused npcm750-clk node.
> >
> > You're not actually removing a node, for example in the sense of removi=
ng a
> > devicetree node from a devicetree.
> >
> > So, I think "Remove unused variable clk_regmap." would be a better
> > description.
> >
>=20
> May I modify the description according to your input and attach
> "Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
> onto this commit in the next version of the patch set?

Yes!


Jonathan

--BFV9RJgjJXy7GXVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmIVCBgACgkQCDBEmo7z
X9vfqA//UCqVrHlOZvzDu7L0EyOn3evdp8KqQUPYp/8FSJD0Cb/Ak6HAByo7g0F3
wss1Xu7kJvV5YDYJn92mCS6oyLH4av/702Ej4s6bfw5UudeW+Fe4tXiumerPTP+d
0Af6kNPoVAv/JPxLzLaWOcuPqvQ7mSI/dXkJ67YjdPZ9K1uI3tOcP77Us864kBxh
0BKcaDzcyuSeZXcw3fNMFj/wJAjemU3poSHsO6iiHaqJIb2BXQohyT8D+vX/VAVz
RP3LJVsJWZDHbvXtjlKpXiCOEc3u7URTMaKCCqnGR5hUW+groLKqiWI4iltMk9eh
M0OOi2PF9imId4UWTikbd6cB/0n/XUqQ5Cz3AF698sYiU/VVtsrEtekjH3Cabhj8
j2kbzkPwPV0xSqeKrQohj7ARPsppynPxdoNUCQ3ebV0zBNxwqYQ1zXqtNj75nB/S
ixt5cjacJ8/PW/3UYfBcvu2+gN3lVrILRi+nq584LI73NXOh0RHNlNI8qDaNB+MO
waBjT0bk5BrgNTV8LO6xKtvOEMHQiccqzqGU7EouAm+qeu8gj/TibSK+T2mandcO
17Wy6HHAZlwtGI/hSnlbTRF/+0y1RcRTQZ13iIPbiXU6QsFAEfDolgvDnHFTlwA4
FbqAG/lIgWA5PtPerENLQkRH2mcoth8gFNZEO/CkVpQhr8g5vNs=
=aOOj
-----END PGP SIGNATURE-----

--BFV9RJgjJXy7GXVr--
