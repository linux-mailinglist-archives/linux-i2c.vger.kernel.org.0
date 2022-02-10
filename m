Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA2F4B1807
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Feb 2022 23:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344892AbiBJWQp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 17:16:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344888AbiBJWQo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 17:16:44 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD611145
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZNtBGTDPci5Qd6f97wggq4YVHg25
        1d68vB6sUJKfQps=; b=fSRf5kX9dTUb2pv2dYxA8JzduAJAkzHiKoioffw1zr3r
        ILxqezoDdiHn/WXhtUW5NWA0mcb61NIA5LbkV0PNTk7Zk6dcEmUuH/G2gDnhwAGr
        4UzFuhW1dUJ0WxYOWBz1esXFs3n6lpAfZIzTDrOPBqujpXAE1ysT23OxTIcsGEU=
Received: (qmail 1363218 invoked from network); 10 Feb 2022 23:16:42 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2022 23:16:42 +0100
X-UD-Smtp-Session: l3s3148p1@T3cSTrHX7rsgAQnoAGmtADvKpjkX1tF1
Date:   Thu, 10 Feb 2022 23:16:42 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: rcar: Add R-Car Gen4 support
Message-ID: <YgWOypd4oX3IFn26@kunai>
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
 <YgKBk5o2aFegPNI1@ninjato>
 <CAMuHMdUCB1=UT7bidSJ0qqhf1qbrUmkwdyiiXX8E9zRo9uVkUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ROfT+6WWaj4fguPI"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCB1=UT7bidSJ0qqhf1qbrUmkwdyiiXX8E9zRo9uVkUw@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ROfT+6WWaj4fguPI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 03:50:02PM +0100, Geert Uytterhoeven wrote:
> Hi Wolfram,
>=20
> On Tue, Feb 8, 2022 at 3:43 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > > Don't we want to introduce a family-specific compatible value for
> > > R-Car Gen4? At least the SCSS seems to be a new R-Car Gen4 feature
> > > common to R-Car S4 and R-Car V3U (yes, the latter is advertised as
> > > the first member of the R-Car Gen4 family, so I intend to move it
> > > over to renesas,rcar-gen4-* where it makes sense).
> >
> > Yeah, sure we want the family compatible. But for now it can point to
> > I2C_RCAR_GEN3, so the patch can stay as is. That is what I was wondering
> > about why a v2 was needed. If we add SCSS, we can update the family
> > compatible data for Gen4 to I2C_RCAR_GEN4. Unless I miss something.
>=20
> Ah, there's the source of the confusion! ;-)
>=20
> There's a need for a v2 because the patch description says R-Car S4
> supports FM+, which is false.

Now we got it! :)

Well, I can simply remove FM+ from the message when applying?

Anyway, with the above fixed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ROfT+6WWaj4fguPI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIFjsoACgkQFA3kzBSg
KbYQcQ/+KxUo3mdgb1uWKa/foWWcAWQLK3JPNPWEyiuz6ifPZpTdfn75qsSCtYU7
9M2Y3Mogt4EeaLRyOqkuBJNDnK+ZPvSUSH1kAGRT4eXetIbOCoOe3jRzj2b1HnM+
t8X6pVCr+jxmc91V7Ytxee1GV3OQUp8ueSitcsUwcJs+Xu0XV/Tn8zf58Rh/Wcg1
ml9+ovi9oomoAd2PDzZtCKzmVbec7XEzHpz7u0tNkLqbf3FG02rxzZLNACKs04dm
nD2LhF9mHBTN97F8UvsRGuyzRCrrB6F4Bc1I8cXErnLzdIh7sQ6vkCv/Yto/7WAK
oJYknDcCtVeTlnYhI4l6C8bi+OF7w0DZo4AEqLzqL9XfwtJY3Ytdqx/+Nb8TY8n+
g/m9Q4pCMJ7Jvx3E2fXFj261xxWM/6DPuoAO5l2XdYghp9JGFWsdACBKh6pxxNRA
Fx5scALSUHMHfqVVPOim4pYGDLoHbZn3JCCoYMISBEulCQ0i81Mo42giZTA9w9PG
0SCUA+ziFmD6IJrccvczLapSoLdbUF5H9drWP4THUCH/FeT/mNBcIs4anUG78945
iOLjiDuHT7SFiCr40uEZa+7ZtblFZO9g0r7SyqSGExYJp7hWwp5RDnxwKWed7P3L
lKIF+SsXsj7vJgf4WWCQlVVVuKgNj1WAdyYpxBp7EaIdGdZfpj8=
=suwS
-----END PGP SIGNATURE-----

--ROfT+6WWaj4fguPI--
