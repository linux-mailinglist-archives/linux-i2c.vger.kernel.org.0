Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C221BFDA9
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Apr 2020 16:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgD3ORD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Apr 2020 10:17:03 -0400
Received: from sauhun.de ([88.99.104.3]:40398 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbgD3ORC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Apr 2020 10:17:02 -0400
Received: from localhost (p5486CDDB.dip0.t-ipconnect.de [84.134.205.219])
        by pokefinder.org (Postfix) with ESMTPSA id 865B62C08FC;
        Thu, 30 Apr 2020 16:17:01 +0200 (CEST)
Date:   Thu, 30 Apr 2020 16:17:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     ryan_chen <ryan_chen@aspeedtech.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Message-ID: <20200430141701.GC3355@ninjato>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
In-Reply-To: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 11:37:37AM +0800, ryan_chen wrote:
> In AST2600 there have a slow peripheral bus between CPU
>  and i2c controller.
> Therefore GIC i2c interrupt status clear have delay timing,
> when CPU issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write
>  clear at i2c ISR.
>=20
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

Applied to for-current with a Fixes tag, thanks! Please, try to add one
next time and please also check how the subsystem formats the $subject
line.


--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q3d0ACgkQFA3kzBSg
KbaoUQ//QVc//2TXd44pz2LgsMx+qUkEgZNrrJKgAGlXr1KGtLR1Km4XWzGzEutz
cQCYsZtGWucGPt93oJeSXYx9FWagTYPrR47XbX0U5gCQyVY7XtQc4Wj9LXFOgfi4
c/QQVEAtO38HiNGcWumxxc8Td57nbEuvDfMQltBqsuNXeo4BDLl39xvbzFIWHVDE
9D4Re0pWNf4Y4sYFB4kR8hHdaQkYfki1jE0j99sXskuC6pMcVzSMKUIzrISs4BAe
LUCDcrSFokr1W0eqBT6uFvHk4SErXjY0OH+jWxugBXgVliAvSER22FBg2kwqvHC3
fH9CGDi7Ns3RdOoW7d9bTLiHgeaRLBbmTUyuzzKOgXrBJqBnT0AucMfa+X6Is7vC
DS4ojD5tVuP3cMQb+sqVxufPIDPVGRXd7Ee2upMtkNNrd9U6W1cun8jPto6hg5Zu
G/llTNEsGQaYXrSNXJ6mO3p8BL2EhhvSyaOCItGWKvzGudpNCIR47bMiobK1mZwM
F/tkz9xTiXnNipwRMmoQwcon/XoDdVcMs6VoVRIdKk0llGks5kfuZA+zTqc2Kv+h
UvuYl+dTFHH9QEbVN/guogoINdM+Fn0+NMaZWcg7D09tUxRFbbRB/eoyD5q8ms7n
O/NsT911s4Uw1axbcH/+iF4Ys1dnQlRuDglr/xiqogiibdbkfTY=
=f9co
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
