Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E048240428
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Aug 2020 11:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHJJhN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Aug 2020 05:37:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgHJJhN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 10 Aug 2020 05:37:13 -0400
Received: from localhost (p54b3345b.dip0.t-ipconnect.de [84.179.52.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A373206C3;
        Mon, 10 Aug 2020 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597052232;
        bh=0uUJd2EJsHhldH1UxCaCPUlINjY2AtbcJn+2CrA8kvk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xurVYm67+3Z0ltECMPjYEqCYcndUnDj9+bQN9ZtRVWUWFlHxU1XnSe72gqUiR+BLg
         Y9WFeULURfif6TdCFq975gTNjuvQAdLV9JWm3eCFQsWHUkp3/PWPQmL27TG2iCsoay
         c1eON+q9fhTfHCDMr6WjrKGDMTci4NGLU4cZuCGQ=
Date:   Mon, 10 Aug 2020 11:37:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: davinci: use simple i2c probe function
Message-ID: <20200810093710.GD1290@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200809172444.16019-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Content-Disposition: inline
In-Reply-To: <20200809172444.16019-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2020 at 07:24:44PM +0200, Stephen Kitt wrote:
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
>=20
> This avoids scanning the identifier tables during probes.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

This is useful, helps deprecating the old probe method:

Acked-by: Wolfram Sang <wsa@kernel.org>


--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8xFUYACgkQFA3kzBSg
KbaDBA//RMHxBTPqmSpMWrkfjm8/5uYPzt6wWAgEI5z1Z0zYzo9sQo+l5ky/WFno
dglWCjkkDUdfytb6iEZs1LnWJszqu5LLlEC823QL2iZL4RwkfkYm8F03O6kxiFL4
AFK/OtcfXgrMbitvpurrxywz/3YVMQBIkPbfHPGliswNr8ND94eE9g26j5AlMMyK
/GH8LBojXZ0bjbsJ9wNT3Y0kSGVTEtw62wu6v5X7R1lJR/6dMBB8+S71nFJLlfnQ
uamfEQwUcc+z9cPMN74+Rf0UGt9p16byg9F4RwuvDh2IclK0smL3bStbSVRh+R1x
ohpL767eZYX9MEGCRtDqhu8fw9mn7JedzT1Qw1CmMy9JJeTq1rf9wN3TfmQyVoib
YBqMsCqgTJ2K2c2BYMWwDiqfdZ0R5poOotRdkfnKWcuYQTdBMBki9/7N8jQEk3Hi
HsU5Np9EkbMunq7n4b8/xjl+zg9lDgmhfLSXe7NyrK7i9EAZPp3u9THjLNFY6enx
xHpodgIsX7/Lno+BmODVwd+ptLTm5Rz5AGY9WDY+9CLG/+A9CJeWH7V4S4w/ekF6
6q0IjYuQCtS+n3VTYGxqlz7iduCK9Si5w2E6FqnnypiP7KpZThQpk3WiwakEYgOJ
IUxzwuOa6YPRNyX+QC9UqtSrSxkfvHA4ugLkAybCFwPp9OPqaaM=
=XWj8
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
