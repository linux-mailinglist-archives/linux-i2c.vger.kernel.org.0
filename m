Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375A4373574
	for <lists+linux-i2c@lfdr.de>; Wed,  5 May 2021 09:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhEEHTD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 May 2021 03:19:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:51884 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEEHTD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 May 2021 03:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=58f+mCPRN3qn44L6LPuVYtWcuyEU
        HX3OAfKatGgGZs8=; b=rC8Xo+4AwjKYnOJFwCDwXPN/eEX6ktEctAcBeQyY+AgP
        wOG2t3JGT7B0Bju+MSuSQa0LmwXVSP8OuHI+ZsThSzafHtjhbe577bTos7IwcBbG
        Fx9HAkUncRwvRnMAFUmHZ5fjVyJBR2KioeCkIJ5QBG0ydZgcVmI+Q0xaksG3RNQ=
Received: (qmail 1678409 invoked from network); 5 May 2021 09:18:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 May 2021 09:18:05 +0200
X-UD-Smtp-Session: l3s3148p1@v9T1/o/B4qIgAwDPXwRNAK21Lx9NnZcs
Date:   Wed, 5 May 2021 09:18:05 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: i2c: renesas,i2c: Drop
 "renesas,i2c-rcar"
Message-ID: <20210505071805.GC1009@ninjato>
References: <cover.1620138454.git.geert+renesas@glider.be>
 <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline
In-Reply-To: <3628120234ef0fbc26cba14e62ff8468bfb961fa.1620138454.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ALfTUftag+2gvp1h
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

If there were never upstream users, I also think we can remove it.
Still, I'd feel better with an ack from Rob.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCSRq0ACgkQFA3kzBSg
KbaFbRAAsvVz5CjGgqlyj4ae5A3cXLoYlLJ4kK3jFTIaJ2PP+veastVs7xhGxzkh
kB/xvmTs4e6ZN/0YIqJ/gxxvBTlGwY+C9ht3bpFhQ8PHf+byXembVLfx3/w5uE2f
jpukJozJreDQ76AG9riQPLs8Cd+6/WEOO9+NCj3ngoOBZMdIsntb6pxHbr6oS29o
rrGM5wRpbXmaMow3wfmvHO7neWn6D9kraAzLi4QOGLD67l4i+bNsKsibjAar6VO0
PVKY28L7Wu3xHSzYh0MzbNcpTk8r8L1HTRy2CeL9r9vnVFdaMbfMYgOC6e7OK/7v
8UKxBqCHo/x6LrjAxH0D/ARxjFt9KRoVObRjpAuyE3Ik/lKYmguIkq4+QpNdEjCG
Qzu8RT2M62/hcwUqPIXRiupLBpnWanQIiSmQVHJI1077c/dLf6GzbPWg8KrBI7Mz
zScAOyknZmYkOdSbdYnP94HQzhCoBh65ZGuH3ecWScK+CE11LNP4RBICmteTSEPT
+/Y+hzM+Z7meKDj3fP/jJk3UsZUQHDQDA6oFM7wPqlWax5i6f92hh9hzMO9CqV2H
3Hso0Fk5hcQXfnvhVscdAWnIWa1vlklm3QuIKYJS/PRJzhXhl7HLBSCuOKtRlwIw
H/gx6Ww6vfhjg0dhvXzKYXwzbXpdfkHlMHtjGJOaXcbltAMhy2o=
=Nw8D
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
