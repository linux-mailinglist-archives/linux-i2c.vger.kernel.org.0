Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8670223C8FA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgHEJQ1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:16:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:57734 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbgHEJMW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:12:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fd5ujFxWzzr0n6x3eVmi2B9Cgj+M
        0mYY00hZn2GeyV8=; b=Z7wZPN+6zB4GUKziyn1aTwenBqeHHbMszQzjXrGInZb6
        Fad16C8nG9nsUtpWnPEQ+kM/Hu5jbYjuokuOsinBEWYnNjrYSnOuL6ladIMw7p47
        Df8hsa9iTNp8b6GeSZA5TrY+SUqEzynlKqG9t/n1VZciBkif94BaHGAGiywRRmU=
Received: (qmail 2979818 invoked from network); 5 Aug 2020 11:12:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2020 11:12:15 +0200
X-UD-Smtp-Session: l3s3148p1@5HiYxB2soulQT+F6
Date:   Wed, 5 Aug 2020 11:12:15 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] Documentation: i2c: dev: 'block process call' is
 supported
Message-ID: <20200805091215.GG1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
References: <20200802082122.3863-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline
In-Reply-To: <20200802082122.3863-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 02, 2020 at 10:21:22AM +0200, Wolfram Sang wrote:
> And it has been for a while (since 2012 at least), only it was not
> documented. Add it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qd+sACgkQFA3kzBSg
KbYOiBAAmHtHHa47GDx9mKDnsdtoD8SL2KcuLWDvNxoqL+lXSsr7aiznY85L5Bjn
sGLpvUrc5wJ0cTUiVmmq0uGP5nIvneXzC2kFAvO3QuLgwujb7xRS6WEp58cq9rSA
M2wQ2pSNMU/CvzXhRWK7faBsDFKzm2lBHnv7Xgsm48Ryf6pswM1B7vt7pTmwsAfz
r/etMtDncsrfCoPVUwDQDAbzNVVZ9kYrdX/37F4WYoREiV4Y68uiJNx9cV4WaBYS
eW/BZsRl1bdgOEPFoBYzkWfemrI0Ah1tUPa9hIPAj8m4WghL88+soGHVxRbhidjf
RngoNCqM/MxHCZdd66ZFcw9kNrEaY/8Q7PrThRIzmAWfxbSzD/RwIXYMTqr9xe+8
PGUA2JvpmHnu6THNNb9zDdxmAFp+AN5YoURO98aBtCPQp6HdtrEfeZmMbTCUZ1XR
R+MWSZG1qyraRVwGrBmd1d7nJ2AojZ5B2WIwbdYF5Vj9TMwp7hA0P43ocuiPBGsn
5VMR2S9DQTYub/3g6m/hOGksh3ttmgR9COOEmG6WQGVPz0uyMPD0nHcUhMphDN2y
2FXg4uL9DbGJX7mUvY0FJJFrbSEU4ZcLN8JJ9PJiOoEJhE2bcmjB9Gce0B1cr/EW
iZY+qZrHMIOV1ywg78XedWags1Gj2x/bJd7Zcb7Uj6urL5otSQ0=
=nf+E
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
