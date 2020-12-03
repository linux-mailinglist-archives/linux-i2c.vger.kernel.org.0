Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F122CDBA7
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 17:59:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgLCQ7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 11:59:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbgLCQ7E (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Dec 2020 11:59:04 -0500
Date:   Thu, 3 Dec 2020 17:58:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607014703;
        bh=VMkcLy6e7wNsxKmMbkP1derZ/NyIdK59AZNcuQRcYXg=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=ceMKQ83j9Ay5xrPe5ShVNcYergw9JWyCslthsveYboOOWcRL/JSVctnRS2JSd1Sy+
         xogZKmIr9DMiJC7GEKgoJj3dNrefE/8uXbR4GgXlC5zmII22jxXg5oS89JbYQYY+zN
         LsMkrPIiUCBDc1guMR5Yc5YcqAMQBY01RjN2BywWWVNgQMw6tp/06vrvsraTHqHT7Y
         abtvIKjDX1E3DTz4RCjWvE1A6iCvhBk9479muDs7ZphOAT9hFrdw/nsNSj7+uQW6eQ
         BIw19F60mT9/o0Laj7tWbTDPLVMahNFoQQfDsw0H0ona/VNWYlmdsJ945txLMKQk/Y
         dqOAFJB/1lY6Q==
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] i2c: pca-platform: drop two members from driver data
 that are assigned to only
Message-ID: <20201203165814.GA1034@ninjato>
References: <20201123202746.2817480-1-u.kleine-koenig@pengutronix.de>
 <20201202155701.GD13425@kunai>
 <20201203080311.kpomqeeqvjr3pjef@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <20201203080311.kpomqeeqvjr3pjef@pengutronix.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > My very first driver :)
>=20
> Just for the record: I was never Wolfram's chauffeur. I guess he meant
> that the i2c-pca-platform driver was the first i2c driver he wrote.

:D


--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/JGSMACgkQFA3kzBSg
KbYjEA/+KRi1cjaL+bm9BrIKWB6e847r++W2rZO99Gi1kTqdoWqbeJm6jMtKf0Qs
gtU0lgVjzcSnj7uLrap03AUdrJEU9bO6ToGVSXginxwdKIDCP6XmSEvN6eIWRpGL
VessY0lfu8IyZhDv9H8lOEQxa7MoHqzwIYH12mKIHSLmKxvgV6pQ4KBxeJ504RRt
dh31FK1IdEQIpponZqmMsj35GHRVdQXe7bD9Wkh9hAmx4XSJgbVHxTEBNoOqa7fv
Vu7zwqZoRIAWxD7sZAhvA3ELQQS4tBMpJ5hQQ8AYveumnRr82ZHG8NE5a/X+6HTs
EBfb9y+bhmrdgXdgmKZxnrECOHka3iRVbEuA15JPqmNd7f5VXe91NcJtPr6v/rZC
REmdMs5sC5Tk18IkzgS/h2/IZHgd+z6l4x2GOZ3C6Lo5ZRKAf0oq78wSHxj/odgL
axp+jQinP0+1Gv7hLXwJiLlc9oevG+0uHIw08gi6N1tZw2pQaaEQm3Gz/72s/AXw
fltbcIG7lLtwppeDIe164kLrbddR1rnhJboXYb6qFSgZkNuups/IIEQgdgvE4z3s
Sd9nH8qLW2fmSItoeT0JWpZUlCSOwZfodG5xgXFU9N+GxbObs/sfqsnHsvfrSv3h
Hh49I/H8IWsRi+DDanD0MaSC2X3ZJEROrpj1T2Lam8mOolK2zY0=
=nkHQ
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
