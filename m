Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5795A2EAEB2
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 16:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbhAEPgQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 10:36:16 -0500
Received: from www.zeus03.de ([194.117.254.33]:52932 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728150AbhAEPgQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 10:36:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=NFdQn5qhBY4EaK/mArB0GSkA4ssP
        FCjcK7Z3C5zkhHM=; b=10du+PnAcew2hMEnzcGLNvnORNA78EzknCZg6lKCR944
        qaKPBzcWWksz0cZq1uJ6U5z/jVUgxQO811X526VyNQRah7ZLQc5+Z31WGqKHXhN4
        lkrYgBB+UCXAXWDdoN9v8vMXaTsgHXkTATjUnoMtI4Ub2Rq88oX2NVh3UFG46WA=
Received: (qmail 107813 invoked from network); 5 Jan 2021 16:35:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 16:35:33 +0100
X-UD-Smtp-Session: l3s3148p1@I3UV9Si4HuUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 16:35:33 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/4] i2c: rcar: make sure irq is not threaded on Gen2 and
 earlier
Message-ID: <20210105153533.GE1842@ninjato>
References: <20201223172154.34462-1-wsa+renesas@sang-engineering.com>
 <20201223172154.34462-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline
In-Reply-To: <20201223172154.34462-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2020 at 06:21:53PM +0100, Wolfram Sang wrote:
> Ensure this irq runs as fast as possible.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0h0UACgkQFA3kzBSg
Kbb9GA//dtfbZoLsLlBbALy6/262zMGeKBCql2Ep1faHQAR97hIbV00B1G8rjbq+
u64+/DD93RpaRZFueSMphf9AZoRwvfudTeXQcFpfeGWGQOWzRUsorh+Q/wu3VQv1
8cXlFg2DrD00MTLXPAoVTPxsDKx/QcHVGtBgS8h9pT6q0b3Xvz/yb9BQv0XJNYDR
ueaRB609YSxveQhMzIrgDlrIBB4Ax73qU5ZI8ioJSVuzANPoo8Ikv9E91amYi/GX
C6lraE4KA/pJ40czgZcekxsNZ6PTEEHvpEPGdUlzlkQCyXvl/zCnyXO6Iu0HbRgR
jAX4jYhZib7yO3K+BVwvqZgx5qOEcU+PloApS3l0PGjHpCag+Bg1vDU/LAtrw9MH
Y9vjTtaRZT3q8YMahE2dhygpVaGSDt+5S/KwJGC2ygrpIbexz18sWvwPrevovlpW
IsTbQukNt15g2Ub6B2CaTs7/n1i8BqE34GbRUYw2ddq4HXl6wEFhv/HG9Mq7IqRL
ClvFnw3EVagZlo/Ys0t6zZP4YuNLR7AsWHAbw7hqFoIjAuFQ5zRBAks9SgKwQupx
wA5seK8w3RmHQcVYuv+PhgrKwqALwbaxj8DlI7M5uzoWpH38Nh3zEAcp03GHSYX3
TxtftYHqiT1dxDtRp++Qkf79SNVkS0z3Ys0a1RYCYXmO3EKXh0M=
=tzyW
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
