Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68FE4AD8BB
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 14:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245687AbiBHNPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 08:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348335AbiBHMmN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 07:42:13 -0500
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:42:12 PST
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B38C03FECE
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 04:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=vvNfBi9E3b3v3d/OUVzRUnSe+Z48
        koHP8XeagZ/M7po=; b=aI9gD9NnPN5Dcq6KdDESP5KICDFbD7W4qTzNqvT3AUab
        r6x8lzlfbNnTRi0lBF5j8oOFyeLhc4+9dh6+R0X/wShbq9l3BFURBExmgu1ktq59
        GpW1uxUDQV7etbEFaeO7kJxBHwSXMMcZrq128+qTNR+dVHccJrmqGUgaRDWV0zc=
Received: (qmail 249715 invoked from network); 8 Feb 2022 13:35:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Feb 2022 13:35:28 +0100
X-UD-Smtp-Session: l3s3148p1@yUK+84DXXskgAQnoAF1FAEKPHF9sYOFO
Date:   Tue, 8 Feb 2022 13:35:28 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
Message-ID: <YgJjkOqg6YL7499D@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
References: <cover.1643898531.git.geert+renesas@glider.be>
 <127a63594229deca2f63c7393b9bdf17b572163a.1643898531.git.geert+renesas@glider.be>
 <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dV2F7HwC6DjyoOlT"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVVN2Jc0sYpsc=V6gfQRGXk44Uh4r=2JWhM28gF4ePASg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dV2F7HwC6DjyoOlT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > While I2C on R-Car Gen4 does support some extra features (Slave Clock
> > Stretch Select, Fast-mode Plus), for now it is treated the same as I2C
>=20
> Correction: R-Car S4 does not support Fast-mode Plus, so there will be
> a v2 of this patch, eventually.

But why? Unless we implement slave clock stretching, we can still keep
it at Gen3 level. Which does also not have FM+.


--dV2F7HwC6DjyoOlT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICY5AACgkQFA3kzBSg
KbZ2qRAAn7qOZRcamtx8zAvBqb6eWJQcFTvRKlafW2bUoTqJGpZwymZLhHeJn/OF
9XqCIFoLiglRHGYFhg/yExcIBaUzfjWePnmmPxwAPCZjEY/PdIM3r78i4DSbRa9b
19B6ckobqUekKZjQjf7GyzxxD1n4f7kdHuMzBaQNwcM7eOFyzCvOFTrcxL+OHEoW
yrE510hBOAcyv7EmL/YBSx/oWnnGFQKxTkGyryYWxAJQZmv0ntru+YzbSu4sDgRN
ASNy5LIFhqcOmZ0/hhBL9Vs56tsa747Ym0YS0SDjUp2x4zQu+FSZhFptC9ve7/AD
dNlvHnfF9mXGQ32WCBmUtGNSSb52CSaZPvF44ThoQhZJqZSzSUViRavFEJzbvg+S
QEtgALwvW4MRMBnZBw5WSjdegLb4c9cNUfLJ7esRTLMHXLVgFAx3qYr0Bbb/9nBa
u+W3QgjoxK/1Isajf3dnud8t2umFNAEpn+HHx7QjMH9EKcJEfGlJ73tA/zKIX0Xh
bbSZJyHIgq7aqz7cmH6WZmEH8Fnf8bT8WD2pVr/s9o18F7vUSZ8wLio/ECwMfAtG
0t3gGxM4OAmtiFexGs8Ne3WcEapHxIYbm4fZLAmK2s04YjrTJJrrsZ/egildX4ja
3pdw5tHPCzTz4OHzAh8LRCzcIvUd/vluMDSCN1uUnWtEXfiI4OM=
=D76J
-----END PGP SIGNATURE-----

--dV2F7HwC6DjyoOlT--
