Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3E921444F
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jul 2020 08:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGDGcU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jul 2020 02:32:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbgGDGcU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jul 2020 02:32:20 -0400
Received: from localhost (p54b3324c.dip0.t-ipconnect.de [84.179.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F112075D;
        Sat,  4 Jul 2020 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593844340;
        bh=M1LITLgZWedAqPaeDFmPN578cGEKoPhgwQmTWgqw0Aw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QPY5JS4UhHL9aOYiaU9qHYn8pt+hZjL11z8SyOMmqFPOjzf9GtxMHNe6Vb2WKWhD+
         qjZWBuXrz8tqiy327Eq63yO/wIW19B1jBJQ/sbKYhFkBcwJniGdFobkfPpuI4SLHbI
         dd3xizy1kZySr8bbWYMbinS1rt3RrUw36ITnA4HQ=
Date:   Sat, 4 Jul 2020 08:32:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: jz4780: remove redundant assignment to variable i
Message-ID: <20200704063217.GG1041@kunai>
References: <20200610125901.1134204-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline
In-Reply-To: <20200610125901.1134204-1-colin.king@canonical.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 01:59:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable i is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

What about 'ret'? Doesn't the same reasoning apply for it?


--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8AInEACgkQFA3kzBSg
Kbb+Bw/8DjdHpZF7hd2HqBySqH1zWA9Pq7rs0E0odz5AgngsAIREXgm9jq3NpF8q
tN5W0f8rRuaBOyslXuR/v3FKU9ISAwGroDputlZW/O3yS4yYs6GPHxgiXqetKCq3
sCB3my5jdtugp0pndjFn36UbzFxKANCxq3I15ZhQ2S3MVXbaKo6DzmBSiodihJY5
QqG1RaKkLZoLCVlgO80CU6wCaoUOXkXlx4kurNuVSe8/3XhrbmHBylT9w8fMsxFq
uWljyt1kLMhUlkBBcA9PQmGhwh31fCzWPBsP2T8Ti8oYm82oSqxlC69MLXZYYeEf
3mIN+HjsVS1t4d2yW4li3UgMj7bBSFc1j1taOYFSxbGkxbGqMkcf6P7FnvNoIVum
czPIXeA4JkYTsn3XZGM53l/sy+eSUr4/LF01DEqksHBcvTMBGAULlOLTuXWTGE97
GEnM8aZ5fRqRa3ozV5BGbqDOhoMBvOgVoZR4jAhPVG2F8dat4UfRvu/e7V1dVS5P
1vs5L/VNDIura6ZHofk5AMKZU2rDl5NQLkSeHlo7b2fhZaRBTn9329mIPm7rOixA
jEw75Mu926qVeRnWhGRC0m4ADwSqZdsz3DGiR3WPZHY3G5JGQmqFNusfwhhJfOWj
C+dDbTmVTKNSlAV9nhFuEOpW/GtyZ3PzQeFo0C5krvzglLUWpgs=
=ZgOV
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
