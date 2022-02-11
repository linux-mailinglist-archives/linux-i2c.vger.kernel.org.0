Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECAE4B2BCF
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 18:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352190AbiBKRds (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 12:33:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343905AbiBKRdr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 12:33:47 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56790394
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 09:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=BY/rAX94vOy0LpznrWnml4RFBUfP
        YzoCCpV+uaQz+hM=; b=hnZDaJhAF4inZeTdkdy0eH3oEJM/F2vmOXOqNQF6iYjN
        jzyDaVRFmLcjH7UsUACx3flbybWz26f4cJ1+fIBPEQgMfcVd2NOg8UME48eigu7M
        8YvZ8h03Jz02iDsIGlCozKuaItoy8vYS2GzzBBbxO5yYJ6j1RQk1PwbmEUcAZKA=
Received: (qmail 1733240 invoked from network); 11 Feb 2022 18:33:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Feb 2022 18:33:44 +0100
X-UD-Smtp-Session: l3s3148p1@HQfsd8HXrpsgAQnoAG/OAF8CQcyiW2Kh
Date:   Fri, 11 Feb 2022 18:33:43 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
Message-ID: <Ygad90zoOm+3nH1w@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1643898531.git.geert+renesas@glider.be>
 <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oR+G0fOIQhQzDh9v"
Content-Disposition: inline
In-Reply-To: <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oR+G0fOIQhQzDh9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 03:33:17PM +0100, Geert Uytterhoeven wrote:
> Add support for the I2C Bus Interface on R-Car Gen4 SoCs (e.g. R-Car
> S4-8) by matching on a family-specific compatible value.
>=20
> While I2C on R-Car Gen4 does support some extra features (Slave Clock
> Stretch Select, Fast-mode Plus), for now it is treated the same as I2C
> on R-Car Gen3.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Fixed commit message and applied to for-next, thanks!


--oR+G0fOIQhQzDh9v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGnfcACgkQFA3kzBSg
KbZuMQ/9GlokBVb7c1remuc0jR9jpBpJUrp6vNziZgkhYvaryGZ4BLcNNx2+9IbR
MVu85ZTNAbW0/Cr8xdnsN7PdQ1D4OM4k2mME+ywur2tUod2cD0lq0bbf6sT2iiKY
A4M2uBeVmp9xBmjlIPnsd92SGV5SJcPRwCLrO0lEfaNpe3tX3NuB8qx55v8t3yzX
Q4cLrhpeL4NsldRfRpYbq8IPozduVAAEqB3nnUPFLE0Ko+8vGzfth60+EmFXkGos
qL5TChzD9emqodRzDWM3Tg1Vd3VHxTGym9wBlDIQvVOOZSmCg0YwaLP0U1Shm4cX
J7UVNwRb15IHYWvdf5/F2/dgBdBJS2NcCNy/YgcVCTUXOolmdHkYnXIAlLGO+XAa
ZyBG8j8DGhOAEiN8Blhg22BNpUlK/dZdXMzVH5s8bc320zFsNAxAfQdyGDuWyZWu
Lfncxmls0rh4GbRbQYMd9IotRucOuDIvJVn/S7xybGuxUL1GWnfz1QG0HwTV9N3Y
S8eJIro8wXt9A8H++m0KP1mX/9w76kLpU0reu68nEulD6FiJ2euhMcR+Y/J2fHOp
tauQaR0tVN1Xc67IYMNDXLL+1LSYgz0gdFsNEcNjMQ9+4ahji2fBJmeU/mFHqskO
GOU2tRL/t0BSQ1szDGNToK9Prh5uOJN+zcuKnQq+RlU2ZG3I1jk=
=21P6
-----END PGP SIGNATURE-----

--oR+G0fOIQhQzDh9v--
