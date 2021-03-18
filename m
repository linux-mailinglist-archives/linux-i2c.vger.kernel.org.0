Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFEA2340477
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Mar 2021 12:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCRLU2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Mar 2021 07:20:28 -0400
Received: from www.zeus03.de ([194.117.254.33]:47922 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhCRLUS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Mar 2021 07:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=HBJeEwEMWS0BHBg3G6WyGfClbEVD
        T2g/WxeI9C8So20=; b=z2VxB7WFn85MQq3mwwgrCj2cnjZWsv+37pBdAMHcLazE
        fQ7Ox3wji1S5y3FcAix31FEa9tjsmZ7MF4SgVTNDfq6hEFcIwOF18RkdPdZTjAas
        PNll8q8gDVgjBJhqFCizy9jNjIOXGyKhrHmM/eFF4Wtb81qMEd3MWOplc1tqwjM=
Received: (qmail 389893 invoked from network); 18 Mar 2021 12:20:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2021 12:20:17 +0100
X-UD-Smtp-Session: l3s3148p1@b+O6yM29CL0gARa4RaSzAQBVtUgvoxMO
Date:   Thu, 18 Mar 2021 12:20:17 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Klaus Kudielka <klaus.kudielka@gmail.com>
Subject: Re: [PATCH] i2c: turn recovery error on init to debug
Message-ID: <20210318112017.GM974@ninjato>
References: <20210315115008.19110-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="c8UbHMnQwI7BF+TB"
Content-Disposition: inline
In-Reply-To: <20210315115008.19110-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--c8UbHMnQwI7BF+TB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2021 at 12:50:08PM +0100, Wolfram Sang wrote:
> In some configurations, recovery is optional. So, don't throw an error
> when it is not used because e.g. pinctrl settings for recovery are not
> provided. Reword the message and make it debug output.
>=20
> Reported-by: Klaus Kudielka <klaus.kudielka@gmail.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Added stable and applied to for-current, thanks!


--c8UbHMnQwI7BF+TB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBTN3AACgkQFA3kzBSg
Kbbb2Q/9FP5l0Qx81/crRPsP6EaM/VIqU7ohTLGh9QIGID+PY5CHszMAQlzmRvWX
fr33eOsGs75HzNigModnaSKgI9bF4c0Fj80yBavOIrfxXB4bvYljdwCyH3eYUW96
TUAiztsljlvJv1zR2bQqIN5eC1HFcgr+SrvmbKu09n2+yKa4mqtze0bcSiABbhGW
n4MHEbOs7QFiOLvoOBFJOEp+T0DX1bsOg8D3c3o56Wc2ekeXitL/f48QBmURQs8q
85CinYYKatuD7yzb+K/asMo2lSQm1lgXv663GKG+8QnNqegfY9g0eClztuMqhjQW
0a92nE+eWHZVF+okVIajm9pyAXAxnZiH2BNHc706VeORWrjk/JbdnpXqBwBxjhIa
ReBUtpKFHqumqR93aLMCVdRpnZVk1AdfwXMn3RO9RaWS3/SGnlSPN/0/XARKjJye
zhrA3Ogd0RDUOsCQAR4sRyYREMgS7ce16TLVEh5HCQAr+hw4ZIv8lVn6/esqrpdi
5i6x9G07E0lR+wCzjjM/9lO+8At8mhn4ukfacEAvJ5qG4U5FSLl/c+juV1jScAK9
CmelhfX03PEwBCrI4P7ltltR1CknjoI5c5gqNRUG8JrfAMfcC9oYV+ZzPxmzLiCb
9AMVn7rewf26b8Q/X3oo1JCwz1fQTFfg7yV68Ktf1q+KSnJpz8c=
=euS5
-----END PGP SIGNATURE-----

--c8UbHMnQwI7BF+TB--
