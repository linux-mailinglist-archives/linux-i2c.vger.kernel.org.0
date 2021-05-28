Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC776393E3D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 09:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235465AbhE1H5l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 03:57:41 -0400
Received: from www.zeus03.de ([194.117.254.33]:48620 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235049AbhE1H5k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 03:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=7rSjJZOhbvAiqky7K7D+bqXWtjDC
        P8bPQExYiSYXFfM=; b=UaGLOmRQCQi2lp0fR0FnbEpwgIRE783I1E5JzOL0hrWF
        4YZgF/nWcQUNEuyJDhWD9YTBahHsG4dDoD+LFow9Sm0FXKot9TjJMQd3w8ryNAfd
        mqGnktlzQi3jBJm93l+c7+2CmL45Rc3CgiKf7x5XSls0n0IPMqPWvZAzy2ccHYw=
Received: (qmail 2272172 invoked from network); 28 May 2021 09:56:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2021 09:56:04 +0200
X-UD-Smtp-Session: l3s3148p1@vlUoNV/DfN4gAwDPXwoXAEGfoBQqamfc
Date:   Fri, 28 May 2021 09:56:04 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,i2c: Drop
 "renesas,i2c-rcar"
Message-ID: <YLCiFECkP4vROIzZ@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1620138454.git.geert+renesas@glider.be>
 <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cUPCrgFWGF4eeoei"
Content-Disposition: inline
In-Reply-To: <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--cUPCrgFWGF4eeoei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 04:35:54PM +0200, Geert Uytterhoeven wrote:
> The compatible value "renesas,i2c-rcar" was deprecated in commit
> ad4a8dc3fec6485b ("i2c: rcar: Add per-Generation fallback bindings"),
> and never had any users in upstream Linux.  Drop its description from
> the DT bindings.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to for-next, thanks!


--cUPCrgFWGF4eeoei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwohQACgkQFA3kzBSg
KbaEyRAAicCWpR28BE8JfL57IZ7YKiW83/tSxPVzzuoXm16cCopeJMui5VomSMhx
Nam+jo1q+GMiCh+wtBmUojWlaROk8JrQGiDF0ZaYkD3lLXqX75/1DIR8x2rgokfk
SkYDp4oaUqGWGGTK9G3iuOj1PbxoviutmQ2pOIhvOwyi3qkphZuTAcfIoWpx/qjw
pD7WSGMeFPGzX/qxVFOTCGhJAkoAZpIvfbRaUPck3i6yjB8RgMgDcLGEHLG4vkRk
fiw0w3ILGIBoaEHC+cfl7luKrwlkUD0OAPWnYW75dVaP6Q2XOsmZQaKgbIfQ1VWG
iwnXtdSDmSbGzIQX2PJsEG5ib8ksPARaW+VS3bMoYelBnGCpznrHOuisf6u42SpG
DRSLp+/7vaHAaqTbjH7yLwxtuK0AsTr2IRc1AgZV3KMl7DUcBRXwVftCaM1BdvYF
FHUXezszjfaWIBz9ltPy7FYLwFpHqOX0EReAbl24ECFn9T3D3IAAyxVZ3Mey+XYL
Tn8KyxDWaYOy5Ozr6/eIE3rFEjnyc47w1niH+dScU9aKyzFvtje9Opupc4URaop+
gC6j6rrFmmIIrQCM+dp2VHkVL2rHlu5UBmTHn0gJU81YF9UrUBXX+C6clBhMf3Ge
XdRLdPUTnBcNSbU9Io9Z+ZH3tTk/pu8w/LXdpG0cw6FuJS6iBIY=
=PUOe
-----END PGP SIGNATURE-----

--cUPCrgFWGF4eeoei--
