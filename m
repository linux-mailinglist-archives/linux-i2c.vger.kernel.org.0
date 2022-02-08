Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3B24ADB70
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351533AbiBHOnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351484AbiBHOnj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:43:39 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E84C03FED2
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 06:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=X31JxDuEq6mxIkrwKc39Ns2b32Px
        C1vxjoMu6UqEgRs=; b=i0iQYWedQ7Jmz0vzAPJTXlHzOmk3i+8e3IGcykEv4XiI
        UNkLNq309mBLPS5niM5ZggeFA2fWjuVV5ilKpHiH2/gh+a+pHlyKeUK21WZl/xro
        CpyXRBDynFueHDVsxrttfHoWlDwDmgkDoLZln462JX7WSYHk1r9DUcowyFhbpgM=
Received: (qmail 301715 invoked from network); 8 Feb 2022 15:43:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 15:43:33 +0100
X-UD-Smtp-Session: l3s3148p1@zRPFvYLXMtIgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 15:43:31 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
Message-ID: <YgKBk5o2aFegPNI1@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1643898531.git.geert+renesas@glider.be>
 <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
 <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
 <YgJjkOqg6YL7499D@ninjato>
 <CAMuHMdWNUC+XqMLjY22L6XZ5NTyWTGA6HLruZUNFWBDEpcsmGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hSRBq6jwJqA+ncq3"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWNUC+XqMLjY22L6XZ5NTyWTGA6HLruZUNFWBDEpcsmGg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--hSRBq6jwJqA+ncq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Don't we want to introduce a family-specific compatible value for
> R-Car Gen4? At least the SCSS seems to be a new R-Car Gen4 feature
> common to R-Car S4 and R-Car V3U (yes, the latter is advertised as
> the first member of the R-Car Gen4 family, so I intend to move it
> over to renesas,rcar-gen4-* where it makes sense).

Yeah, sure we want the family compatible. But for now it can point to
I2C_RCAR_GEN3, so the patch can stay as is. That is what I was wondering
about why a v2 was needed. If we add SCSS, we can update the family
compatible data for Gen4 to I2C_RCAR_GEN4. Unless I miss something.



--hSRBq6jwJqA+ncq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICgY8ACgkQFA3kzBSg
KbYDyw//QYj0SmuQvUdRolslYlj5L6s0esVg9A61QjDxuziwFiTg8zHjbXuBMDR/
+SohHkMSzjTEAVWDPs5VfaFASm5UFXpY5w8ifFc0VikPArQfcv78KdavLeuPpsO7
SCzsKHgDd21HC23GeZVBuh6kixLidPdh/fz7ZOw6cw6qh0VWpot1vMlAz8XW993z
3AV6S8r04scn62WyosDtTXeGD1BvMukcbuLDmh+rWHe6CMFQJ1EOj303nqcG3bef
9a/s7dUjDXd7kl+VmA+i8GoIhi6giRgtyoWlSwKahpuNWq/ZlQbZ3xfzRcMAzeAA
ReAtD1sj8zayTJXgvF1wXPIC4JM7jZE2Q7pZeD3wj8uNlR5hPBU+xXgZTjyKIGDZ
igk0Mo+WCsRBdcCBtniT4oMevqdeN+0cxRGLWHIprqwACQ90rEJ8Hdisbgq0f6eD
+zT+XFT0ph02ylwrteh/d8GcgmbiMOLCCWVZFw128P3YhACyo+5Pc0ZgbVlGPXc6
4Si1pnVcU2e5f7D5DYWaz8l0tpf2oO1LuBSk4Sr/Vjzs5IWxZHQpm5wsdqjY+nvl
PkkaFo4kFPbJrUzFm+jvEMweFxoE2/5x5VDy+V/XVRLoc8NbQWWJKYpAgC6OD2OY
+Vdcl+0dPBs9UDpmlkUEhrN5nx4ON7Ihum5TeaVmObEkgiitTwI=
=41gy
-----END PGP SIGNATURE-----

--hSRBq6jwJqA+ncq3--
