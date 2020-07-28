Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058D8230FFB
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731273AbgG1QkI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:40:08 -0400
Received: from www.zeus03.de ([194.117.254.33]:33224 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731191AbgG1QkI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=e561RFp7+8SRZnbmqsZkNVZv8k3b
        g2ORekkv9tPH/38=; b=yMuH0wsMV48LLgDFI/GLRzHotxBRsncjDyK0X2R9Pmd/
        VoOQSFSF2JZr+ImZowQ+BL7qqsuybqzI1X6YdyEPUr9vU5bM7mcQjO4mFqDnOhyV
        PRojcn4260Qj6zTmIu3hyl9WRdGzDd58j92HfZY1nLy/k2f+TiMweCDr+putPm4=
Received: (qmail 708249 invoked from network); 28 Jul 2020 18:40:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2020 18:40:06 +0200
X-UD-Smtp-Session: l3s3148p1@GjB1F4OrtqggAwDPXw7pAIxt9EGuW/0q
Date:   Tue, 28 Jul 2020 18:40:05 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH 1/2] i2c: slave: improve sanity check when registering
Message-ID: <20200728164005.GG3736@ninjato>
References: <20200725195053.14334-1-wsa+renesas@sang-engineering.com>
 <20200725195053.14334-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IuhbYIxU28t+Kd57"
Content-Disposition: inline
In-Reply-To: <20200725195053.14334-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IuhbYIxU28t+Kd57
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2020 at 09:50:52PM +0200, Wolfram Sang wrote:
> Add check for ERR_PTR and simplify code while here.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--IuhbYIxU28t+Kd57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gVOUACgkQFA3kzBSg
Kbappw/+Ia9Wy9N+Z1LS/DOT/0ETCAhqAHLka5FQUJU1pu7v6tiOuky67jP7iDkJ
cU04i450hQkn7P7Th3/szW18JSZZILOwOgDkrYHfTjCdkLmR+rrl4sOHpWHvcJtw
Vs9Tdoy2OmU/fHZCgp3WjxSJA2o9uZxd8sZ37OnWY1adh1GVycOQOSDbnDRfuNJB
BuKc7shGjLG9Tc6bPgk8PK5/T0RXSAURTHWvhDIBPruUIDFBtyKg0Po69Psk8Zp1
QybhaV1q/xDLlsorPoRsvCScqC276jkzu41MT/vK3fhHRuajsBLhHcIPE4E5PIU/
BFanIkv6a8DYANSK59J0Ae/zcucg6JXiLpKlZpeAryL/7WUJ60j6y4OFlmgaOQM4
TWMnmo/hNYKYdv9lQcLJ3EczoInAmTGs+oss2+vjPNefSSa4t7poOifHuJNuloyb
ZBJqQyrYwX1VMyBcRLOAttZ67uneit5t/3j5BQCvNXjWIReZjDrqnp6epsI6Gs6K
xRJdwEEavjPRx17OhGVbtrX0TvRxy2bqtDZwvktSuQ1nqmWt6j7jrHJtIkwiqYyi
nDW8fJM+0Siu9eeP4rC6wYRzI2vKLcmxh7mYVm3uhxwmdx4XtqdkVMb6MkpKima+
bFPz/TANOPFDzay6PwNhw0Po7NXRMmjXCIXEUYOLHhy1JWbnCvU=
=xfbn
-----END PGP SIGNATURE-----

--IuhbYIxU28t+Kd57--
