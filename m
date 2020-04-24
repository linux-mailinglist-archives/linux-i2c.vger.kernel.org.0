Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B73871B7998
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgDXPdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 11:33:01 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37579 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726806AbgDXPdB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 11:33:01 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id EED00144C;
        Fri, 24 Apr 2020 11:32:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 24 Apr 2020 11:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=E3sMeHbCAsorKLNRBwtJuvMxe4s
        X7oNFJA6uh6/V09o=; b=I81Vv1U9rffqzG+MziHsg01V2e+Ds8NzFDwTn3/cenD
        S2WJV5ETTu67visXHThN51YGYN/Ta/m5LgtjaFHC3VIOOQcvfz7C9IKyo2Vr/7VZ
        1PrdFpEBaX4po9f+TTGjICYwkNcjTG+o2XMCAhFLhpz77o8gH80mSkOouShoUuDi
        Bq9F+6AW1KlMnquUi7nwrHK//v+TzRUFdC7rVrvUwKKElNS/4UNsTn3XfbTi+M2+
        Di/A9kkLx8IZ2anydYuLcu7o7q52pSi0g0PFBlqzaMqEbRDHkgpdyhYCvkoIhvVZ
        AiJ0xS438mYG30IQYO6LR37jWl+kYq/fiSRucXGlxFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E3sMeH
        bCAsorKLNRBwtJuvMxe4sX7oNFJA6uh6/V09o=; b=144WcH05O2wtvJjQu9Gukd
        pOq9fUoluzmpIiET82PYcq6jqyOLVaDnqlpkepnBcuSSIro58kVF2lwL1gmv9pxy
        +tcF1Fl3LaH1XKaSCD+Yy7BQMketUSUmwg1cq6PNfm/dp4cKqISgWGc0oLN8BnsY
        aZ1VeN9yH5JF2TjV2k7kbqswtnO0GD3PEUH9jCiD0nFE5zM3NB10PZ2+egoGPioV
        8FnHSbZQrqGP0Zf7A1TsqC0HnMVSzk4s0JGdO34fWcPdoAnx00uOMeo5gKdjCqPF
        tEwwhlXe5wj6znxOEoApx+R1CjlgxjjUfmHaaW442rg7dGMu7y30Gnfq1Q5rTkCg
        ==
X-ME-Sender: <xms:qgajXic365sAgtb2Qaaqpb9EHZ1IVctpppO7Zm6VIjiy7qPIqWKvIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucfkphepudeiiedrudejiedruddvuddruddvfeenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
    iftgigrdighiii
X-ME-Proxy: <xmx:qgajXvSGHJHDkQ9PVC6ziiJCVjzPUvYFVvfQpFeHcx_HXnmNH8_OGg>
    <xmx:qgajXuKFcsfMEW1c1eZE6azbWbNp5w6XZ_40oHJQtS5_9P89lF1kPA>
    <xmx:qgajXsKEZhE52YGGzsRVsSDnPTRCyhkAWTfsi5NXNKmCZzf23q_vQQ>
    <xmx:qwajXgKrr-xmtJGDHvuhc5VuevbiRR7PGv_rktmhVCv-_lrERdudcA>
Received: from localhost (mobile-166-176-121-123.mycingular.net [166.176.121.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id 896013280060;
        Fri, 24 Apr 2020 11:32:58 -0400 (EDT)
Date:   Fri, 24 Apr 2020 10:32:57 -0500
From:   Patrick Williams <patrick@stwcx.xyz>
To:     Bjorn Ardo <bjorn.ardo@axis.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@axis.com
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200424153257.GA3163924@heinlein.lan.stwcx.xyz>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
 <20200424100307.GB1959@kunai>
 <5180b657-33ff-c182-8a16-82a35a61f647@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline
In-Reply-To: <5180b657-33ff-c182-8a16-82a35a61f647@axis.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 12:06:44PM +0200, Bjorn Ardo wrote:
>=20
> On 4/24/20 12:03 PM, Wolfram Sang wrote:
> > On Fri, Apr 24, 2020 at 11:04:43AM +0200, Bj=F6rn Ard=F6 wrote:
> >> If the slave eeprom has a "firmware-name" in devicetree, then
> >> pre-load the data in the eeprom with this file. Otherwise we
> >> init the eeprom with 0xFF.
> >>
> >> Signed-off-by: Bj=F6rn Ard=F6 <bjorn.ardo@axis.com>
> > I like it a lot, thanks! Maybe we could add a SoB from Patrick for his
> > 0xff-suggestion (but keeping you as the patch author).
> >
> > Is this okay for everyone?
>=20
>=20
> OK for me!
>=20

Fine by me, also.

--=20
Patrick Williams

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6jBqcACgkQqwNHzC0A
wRkQGBAAhOJXizdAa1+dcsc7Ala89T+gaL6McSbjh9Prb51VZcO96nQN7EN1njR0
nmzUBPLhejXf7HDjOeFqJXn/RyobhamrPxkCJWiKtH4fag+IKcoNOP2s41QblOMG
LVFn1Hpag5AvyGrYjXcTB/4ofrzX8PFrejAhqbaL68XyNow+2LPlJQY5lGCE2Vtf
Pbmu/HDGe2kGXIzq0pG2BNE2wHm+0rbG/BjOkDJPueDCdqV7WdKnaiOggYo85aFd
4h73DH+s1pmdc1X23T5LMfNhsG2CuGywGwzL6Xq+NtRuR+gLRKyXTkmidCNg2bc1
E5i7ofRZBukJWYDYz4A+0csfuVuVqso/4v3xnxJitwvG8l59Cwv4PYO2t2OP2OkM
lpC43Vx7PQyHMAHRPNMGvlB+2lFP+dEUiADagGPSgse3F3Fz2bwkGoPflACJ3vDc
5lVWZvWmQMEDITt3xlbYOIdayl47orbuHuAdWlOeEipGACt2AzbpSkiVkwSNWZrV
VZG/me3pILyo+4/Nk21W98PX4uN63vbdKN0FxDzqutIEJR/4N5f/SY1D60mwlVW8
Mw+QEcUwkwPLQ8BdgCEXup/dnc6rHJhma9yAJ/gktQ+x2XSwS+2Y9rzW6otnzLBw
doJt464t73p7J9upoFqGpP6j2u6IpOGQMGJD2PpeXH898a0ndNs=
=Xkmb
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
