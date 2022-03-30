Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C66C4EBF98
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Mar 2022 13:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343529AbiC3LLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 30 Mar 2022 07:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343525AbiC3LLG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 30 Mar 2022 07:11:06 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA813EAA4
        for <linux-i2c@vger.kernel.org>; Wed, 30 Mar 2022 04:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=3QQSNbjNP7Ok6fjHoEfPU7e5ImtE
        P66daRqlcHzeiM4=; b=UNyxFEcBYG6RH818AQmq2UimfwauQchILBxHfFuBzeAN
        0QogxM9nu+jQTduJsr4e2pBlLH0J9TdOtKdD4uXyv+b6Zr53LfvcBSVUGzgGtUPH
        JEL9ydNHSw8m0f3flxoyZUh/HjJZwlPMuCwY2KkCtWqNzFj/Vv8tjnAAxpQL76M=
Received: (qmail 2165057 invoked from network); 30 Mar 2022 13:09:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2022 13:09:17 +0200
X-UD-Smtp-Session: l3s3148p1@+peXk23b1qkgAQnoAFSoAOQGPeMhapNB
Date:   Wed, 30 Mar 2022 13:09:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <YkQ6XRITOFZ7hLXV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NFnIUwuWfjpA7uSJ"
Content-Disposition: inline
In-Reply-To: <YkQ31VMqj1MXqBd3@shikoro>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NFnIUwuWfjpA7uSJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


BTW...

> > ############################################################
> > ##################### WOLFRAM'S PATCH ######################
> > ############################################################
> > root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
> > 0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08

=2E.. for further tests I think the last parameter should be "i 9" here...

> >=20
> > root@rcar-gen3:# i2cget -y 4 0x68 0 s
> > 0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08

=2E.. to see if these 8 bytes match the last 8 bytes from above. The first
byte from above is returned internally as the length. It is not a data
byte.


--NFnIUwuWfjpA7uSJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJEOl0ACgkQFA3kzBSg
KbYoXQ//fY3ighVrepak5RfXLQSXDAVyQrno426iSfQ6jKhE+ySHx1mbAmKb8aD+
bKSZw52Vyhj9VPaqOf1XijqH7Z/7awxm3iCMh3IRcAXCdcZoaiMJQ7ahwMjDGtlF
/Xvc9iZeL4d+Cj7oeH7+xjo/PuD+4DClZbHHuLA8Vl4wobCLkhXP1xFhCJZYxK+J
r7/VXaZlaitqsH5H9+ii9H1GIDCoplvURtIIRtQ6gVRFXyTbOkkL2jEzp8GvZxoI
cK5H7YyInsXpYvk7ynTasAj8XwB1Pb9+3Z9isOalvD8PZnBkGdUIqAsC4NfPuIF2
DXJTNzEYvb74NtD3KflxnPxmvEVRof16fQ+4Nh8MXfYW1+ivbwmNxZCF6X4I+Bjo
ztdODeeC/ZEf7Ngixx9E5s9Jxr592lxcvj9D/WOuUnaWT90geg3Q/kJwB8cmVUFi
VmF/WWkyMIqiiQTOxjvt4Q9bNOZMNhSEE9/OVHWDZYqHHthnBe2aDMDKHDGbnIjL
E4LmB0YjqEyUtlCa2KDbXnFwtVhVb0EvG/OO8A+Ev5WLNa/CZLS1cLsCq5kVnT8o
N9kRTFBgEAjfM8zniWMt8rxSL5Iv0d8V0s1tC3pa3jht7zNfM/P9WKlm4Aq0+ww1
mic9HOVf9ZenmvQkkcqTjUoGO4/q+9fFX4je5A17jcV3Q7dLOUI=
=pTZL
-----END PGP SIGNATURE-----

--NFnIUwuWfjpA7uSJ--
