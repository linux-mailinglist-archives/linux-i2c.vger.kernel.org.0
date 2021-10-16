Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCF3430285
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Oct 2021 14:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240245AbhJPMKj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Oct 2021 08:10:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236141AbhJPMKi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 16 Oct 2021 08:10:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA536105A;
        Sat, 16 Oct 2021 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634386110;
        bh=N/An2hHDyYVhAY5/vUGLYGhv+oSfwr2fGUVESqhMN38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fwXgOzyGseSsA0zMHCelcKcJwdAod8XSpJYu8NsUp4X2fk76xms4iMcGvYFkpVvZk
         /XHgyvlnEt0oPHScWHF/uo+65GanjiOdfbMmpOIk65/9tpRneSpSHw4jJuiD4DavVO
         oT1iEQkP4vUmMWvLsTc/8BzQ+q3JaGjz8qDOcATiSA9S6+q2+0k1dw6Vk31Cd1lcuQ
         XL2OFW3If6F1Ab086w8JbSKV895Zr+giFQ00XJWHUeRKsJnHxgV2Sk3rOGhNnp0VRD
         RpEvWeksw545qbzKC5d7GlIfro9P78S73xyYJ6KR1ERWuGbJHX++jYHs/rY8Huv90n
         RkkdoRK1HtW1w==
Date:   Sat, 16 Oct 2021 14:08:23 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sven Peter <sven@svenpeter.dev>
Cc:     Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add pasemi i2c to ARM/APPLE MACHINE
Message-ID: <YWrAtwrLSXeghevM@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211016110344.53509-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EqEHXONl3bH5v8nF"
Content-Disposition: inline
In-Reply-To: <20211016110344.53509-1-sven@svenpeter.dev>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EqEHXONl3bH5v8nF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 16, 2021 at 01:03:44PM +0200, Sven Peter wrote:
> Add the pasemi i2c platform and core files to the ARM/APPLE MACHINE
> entry in MAINTAINERS.
>=20
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

Acked-by: Wolfram Sang <wsa@kernel.org>


--EqEHXONl3bH5v8nF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFqwLMACgkQFA3kzBSg
Kba5sg//TyWlvt+BXzq7IBe+pLk6gkasRA+ixvbGly2RZrQrDaTLExUKhTQKIUvt
a20jJ10M3UASJPartFfVM6z9Qo/opmQr8/j8PEJ8YVpbTtCxGsr5pcXGH1c9E8gZ
Kt1tlkPs11+kPMflclJAJ945zdH0vzIRA0RgiaEuONGU0pf6gE8MI/0VHmNkCeM3
urCRXqyTD3xIUzhljwjFP4UTkqDOb0Oom/lsHtnPdhvXtA9K5Z2kHivai2hUhfnq
kiT+sV7JIGQF+cdiV2li6H10EuhP+jqkjEtLufalvVmmyXiD0OdoyK52nYm3SCXx
OC0W3eBFWYvvhIuQViK//Zo60Lr6x1nlgdvkp1vRkS8wRKd8yKgKz8piJucDKsdX
wDnLpHHxQtMIzn47+Id/0to9DAVXWhv+G52HTe4EbHH1wiNvAAZi0YDSd3DH6S4n
OQZjhkjO5hJkOtWvsDV1YwU2Ze4rR5CqFW8if1YtoyX4hwnrgVs+pkXIXbJYpVfi
isgqmAA/xqke9ffXzGqOA8AjVIJe28il0lhJi9GDmp5SYUIEx32WwXOrBDob0T9a
ieXnv5JD+CSjh4GSVNmMR7OzDcDCjTwS40kwU3hqQaR53D3djv8KuDqwQOeA2CU8
bFN9a76fjIA8St+PWwOOGegmKbFPi29kghMeGsUZwokm8RQFouM=
=PnRB
-----END PGP SIGNATURE-----

--EqEHXONl3bH5v8nF--
