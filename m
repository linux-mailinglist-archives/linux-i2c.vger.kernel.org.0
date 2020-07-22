Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7231422972E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jul 2020 13:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGVLK3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 07:10:29 -0400
Received: from www.zeus03.de ([194.117.254.33]:43852 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgGVLK2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Jul 2020 07:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=VV8jO+VNCBBi+L6IQSZtM6f1FOVa
        N+zw7Qwl6ob4vaE=; b=Oiq4W2YKFgeq4iRdqdVGwOlBa6vLlak4gKvLhOFCZbxt
        0kAYrQBaEMrxRhlS7WeL6/0Y/FVW/14nG8JwmIvQsbRlbVWqolhVrYbmI/+OKpiV
        d7Leb/jays3ScSQ2WsdaP/rliwn3b3xXU+k3X10gSzrQbzuYOcCPuOPwyL8gLV0=
Received: (qmail 3017535 invoked from network); 22 Jul 2020 13:10:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2020 13:10:26 +0200
X-UD-Smtp-Session: l3s3148p1@WJd4yQWrXtggAwDPXwY8AL9PxqFiRnVq
Date:   Wed, 22 Jul 2020 13:10:26 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] i2c: rcar: always clear ICSAR to avoid side effects
Message-ID: <20200722111026.GR1030@ninjato>
References: <20200704133829.7015-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/Isdj7O9hWi8F9Bn"
Content-Disposition: inline
In-Reply-To: <20200704133829.7015-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/Isdj7O9hWi8F9Bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2020 at 03:38:29PM +0200, Wolfram Sang wrote:
> On R-Car Gen2, we get a timeout when reading from the address set in
> ICSAR, even though the slave interface is disabled. Clearing it fixes
> this situation. Note that Gen3 is not affected.
>=20
> To reproduce: bind and undbind an I2C slave on some bus, run
> 'i2cdetect' on that bus.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--/Isdj7O9hWi8F9Bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YHqIACgkQFA3kzBSg
KbZXoQ//XxBed0oLBECNJmSuQ1pCqP0kL2g+Wqcn0OQzdiridBPAJacHxuy9wOSy
fwMgWhw8MF5HQLfqzdxgRKeEel3Hsxm+tEDXCaSr7i23226n9M3sguujJH6mMsxg
UfJp6x5mzOOTygFYe6c68cfUYfDFt+l3futa6KJw5vVPr6C5gpupQcj79/JhjhYZ
ytQSFqqp+VbWp1DGd1IVFK4plXfzQ2qCSfdvffiILGiHkayiJASYzMHqq02+8N7n
9jF4137jvhNS1Xm6ayJgxg8Oox+V7BmDWarMtuGH9K8O4vL8lI1tp1ci4A/kPEDL
sc9SzKq8it0hkLEuOhu7diwTq08kBj7pwAh5l/yD9XJB8ZwcnfKQTvb85Zt8EjT+
k16Fy/yoLgn+k49leU8fs7g1pGheQyxiq5ouqF00+aDmjFK2/r9DaeoPiq6qw2Ab
Z/EKckM0KqYdvMCIktZxWGao+rljZVuE+kntmzLySRYCG5SdJLKAe2aDD7j+UUme
pnj26dgDmGdQuKOpf7MLBn1YA6SLk/6NMSnfCf4p1bPAwrT40q2NnXZ50pyNOPba
jYIYs+RJDh/gxwdGaJXulce5rYc/xwVU4FTwqW1vqv9ZMmb0wh72CnBAKgvM2Tzu
6HfjmYMdqEFnPHzNWs8Q88GwvTu3lA1BX3h0IfHtc+AWFBfTr/I=
=E0/E
-----END PGP SIGNATURE-----

--/Isdj7O9hWi8F9Bn--
