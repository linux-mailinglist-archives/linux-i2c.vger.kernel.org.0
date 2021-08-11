Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C473E9398
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhHKOXi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:23:38 -0400
Received: from www.zeus03.de ([194.117.254.33]:33486 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232276AbhHKOXg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=bA+SpoCd9Zrin70ep2OKmQSSiYzO
        VLF5suFO9tR8vJU=; b=sNdIRyoQrtF9c/RK047CRz32yayHGtxMCPHLvHJKEovc
        ciZpqZcEK4MAz205TALD1DNDpGQ067qZryQVPfVIIT4aUAkwZdAzSZFbU1sigKxq
        4dBNdMkkCNbVcGHhArZyH5QvJ0JBAU5GnoLh/3yzb1GhVq5xnDMo6Xzn2TA6UcA=
Received: (qmail 2682161 invoked from network); 11 Aug 2021 16:23:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2021 16:23:11 +0200
X-UD-Smtp-Session: l3s3148p1@QzenW0nJDJ8gARa4RTP4AfHKOCm/nqrR
Date:   Wed, 11 Aug 2021 16:23:10 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH/RFC 0/4] dt-bindings: i2c: renesas,riic: Add
 interrupt-names
Message-ID: <YRPdTiAakb6OBd2k@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1626267422.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0/yWTP9/4TtsiMqK"
Content-Disposition: inline
In-Reply-To: <cover.1626267422.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0/yWTP9/4TtsiMqK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> The Renesas RZ/A and RZ/G2L I2C Bus Interface has no less than 8
> interrupts.  So I think it makes sense to use "interrupt-names"
> property, to make it easier to review the interrupt mappings in DTS
> files.
>=20
> Hence this series documents the "interrupt-names" property in the DT
> bindings, adds the property to the DTS files, and marks it required in
> the DT bindings. Obviously the last step cannot be applied until all
> earlier patches are upstream.
>=20
> What do you think?

I like it and I'd think it is good to go. It is probably easiest if you
take the series via your tree to avoid merge conflicts and/or subsystem
dependencies. It's unlikely the YAML file will see further updates. So,
for the series:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Let me know if you think another way is better.

Happy hacking,

   Wolfram


--0/yWTP9/4TtsiMqK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET3U4ACgkQFA3kzBSg
KbYwWg/+MAKeYtltD8jFf1qc2Dpw7KM5aIJ+xh8k3TP69KhqUT0VrTRm9Arv0iyh
m8xarEu7CQJOksSxLuUScEHMmEsEyjJQ2YT1oWbqzvRJcm7jVUQJ9muAeaKbVDRH
ZM9Vj0GohckcVXrN98Ob+dHa5TIv7lzrcSr71DRLJJx6MT55lPezfARxSYQqnYFN
iaeyZ6rRLANzZ3DUvwM6LK5fWy460UB3Wr1SBLj9XxLEvMm8MZElVfyXZI+uwAIa
/MSKufEe2b0E0ACzoyQAYXeDDSF73LNV6+nTjScU9jw0fgTs6OlK5HtRzpYNfck6
8CyGacSHn0Fl9WY33/kZtUySbGzB6gsNqCnJe6pQOrMvUtC3APP8tXIRFq8gcIm/
hBjAv1yKCMFIdZMVnsK1TMf3MUCEZ79nIbJA0JUp0ytSEe65uHnPvoOZmCvHlTE3
rrfRmVi8T0ABBO+OayyeA4klswajvNMSjCei/XqbBh4XCi/ko2oq5pZcr1utTuxv
e2jaa2ts9Zpfc1NaQOUtKRw64X+53D07AU1GDjf1IGOkbvA1aBQWwYUbuNijda/X
F/FhCr7UP96RU7KZktYxHswwl6NSBEO0LJmQCxDPxUTTDZ68hDVgckKmL//Hseyt
2TK6AKLMX5f9YBtY1ufpvpHVsMpp62k+NlrIb0Ge/jbUp0lqa+0=
=DrMT
-----END PGP SIGNATURE-----

--0/yWTP9/4TtsiMqK--
