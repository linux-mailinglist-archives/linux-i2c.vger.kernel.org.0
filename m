Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5371B79B7
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 17:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgDXPgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 11:36:17 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40727 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728482AbgDXPgO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 11:36:14 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 900C0144F;
        Fri, 24 Apr 2020 11:36:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 24 Apr 2020 11:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=6AAlop7+XbnlGAq8sTAvjExYq4G
        7z0bSUfLU7dnZmCI=; b=m/rhcTuP5+5z9laJf6pkwLG7oXf/bW253s0J/touRXN
        Tk6ZpYaTLGzwjRh2qGj4IhlCN1fDhXe9xxVNmV46gIGebWJ70paPZDF5VsoUpNsb
        ReBE51MGUR430xuz3MOXH7wq8K2FUPp5QR7pG0kk3aBm7x9AAwIvKaCCStWeqCYS
        QRwjFtRBQuRRhM0HSanR9SlrBjvFp6GJ5fp6xaVk4pqoEy1uoLF2Uqc57uQEoTK8
        6nkVqiy0CBrOdOgUpXwkfVMvYWuIhgee3bdwqWvuY4mvd19FEbvsYHFKqsbIfjn3
        5WmJ4i1jIqcOLMb37Z0l/1eNAPSW7bsTybV0d7HxCKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6AAlop
        7+XbnlGAq8sTAvjExYq4G7z0bSUfLU7dnZmCI=; b=KDEewEuVc/v76Gb+sf9/TB
        OavFDSPmjjJeKz1amzbbjUxRjZnCBlXFMu1WeuQrWlCxjg316e6iiAAcpl8Y3oDe
        GjU+vloCVjHoWZCAcBmXdi6YAlVb0aYdt0fLHTM/WqB64Hs1jRErQZp3pkC9DQ9i
        gwA9JwqFFzOD5iNe3Ua2P+QUqEGbWCoFOA5K0qG9ceX4ceF5hbjLteCu+oLIgRbZ
        CfzmVQ/RdWIRaJimUQYN3YRQ41Fbf4YrGcdl5DZnjYx6B0+mkmG8QF9qNLqM/lkU
        y5Qjsl3jGFXjGaZYMFpyHh62leSzO84yKoVLP36bs8maYvupvABD4fqJ7PK9/CSA
        ==
X-ME-Sender: <xms:bQejXrPFU5ZZAOf7iHJMB_cRQEeuaGg2QPtp0dpIncJg0H9fD_lQaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucfkphepudeiiedrudejiedruddvuddruddvfeenucevlhhushht
    vghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
    iftgigrdighiii
X-ME-Proxy: <xmx:bQejXstPEUOaDgXNOf4qczVNs8p3o7wO_ZmnGVO5Bc-TXkSXnT59Fg>
    <xmx:bQejXsA75-dbwVl_O2OnUDfEARIzfWSkebuFYWLim7ikIlsGZsWXGA>
    <xmx:bQejXrbFQJkzUVNmGHzz1ZFDzqQMdsOsvEZXgxsBZOPWgZ2WL_ROrQ>
    <xmx:bQejXvLoo6-e4fcFAj7c2Caa8YMhRbsEW6mjfe2ZxcI50klP9vYjXg>
Received: from localhost (mobile-166-176-121-123.mycingular.net [166.176.121.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id BD2AF3065D9A;
        Fri, 24 Apr 2020 11:36:12 -0400 (EDT)
Date:   Fri, 24 Apr 2020 10:36:12 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     =?iso-8859-1?Q?Bj=F6rn_Ard=F6?= <bjorn.ardo@axis.com>
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCHv3] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200424153612.GB3163924@heinlein.lan.stwcx.xyz>
References: <20200424113036.15109-1-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline
In-Reply-To: <20200424113036.15109-1-bjorn.ardo@axis.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 01:30:36PM +0200, Bj=F6rn Ard=F6 wrote:
> If the slave eeprom has a "firmware-name" in devicetree, then
> pre-load the data in the eeprom with this file. Otherwise we
> init the eeprom with 0xFF.
>=20
> Signed-off-by: Bj=F6rn Ard=F6 <bjorn.ardo@axis.com>
> ---
>  drivers/i2c/i2c-slave-eeprom.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6jB2sACgkQqwNHzC0A
wRk3aA/+IkPleDbT17gsPCRIb3yMjTe8NI6LRNljsxO0S29zj8Tl30uNZ7JmnAoE
WbxAyTlqS/2XXg6mxRaXdFbt+zghDGnElWi93VlLlUICvAx/or9f5xLP4cHRh8ey
hgOC9VAkw9id8YOaBGoOqIJiqwzxjN1GlTXGOTuTKQQiT+KBTFzoy2Ei+7HPpyGP
UOK/OwXwqjywkQ9stbM+hOVmm7v+YlkBshuiqYQEj9eXSQKxxyRP8yTGMLYiDLGS
729I0btjqf0/sTseCeKRu5LJVjQrRJ/3n98QmGU+w+ri6mmiL2APY9cQ1YtkqreF
HIXuGoBU4BAhN3way8UJFJp/mWhj/JCZ/r1LuCxw79K52BPhQMN8f796VOnfFivv
TBAkoIZrfJTZL29nW0qxtVYS2T2GtIq2+ue3g2PB4r9FYGDMDIrQp8CY9G4kHiNU
VjQQLiXlzGIMWgmmd56xN6LoyeAxxcNcBiAM7jp59ZHn7TOjo0Scolc95+fYGUqo
lRiuD+6U0ku/BlxzoVBkETF2+5i0YKwVuEILyohmAOKkxtEB+nH0mknWbmomouIK
chh7KMyKxafTIT1GcKEu3iLrJkwIDkbcdXYeev56UdCPn4Ju2QpCxI/GgJPjPvO0
1s0iYweZcKnc+YyLAd/2lYTYAnIJjcXxSOnMUaK/l1hAW+J40as=
=DIec
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
