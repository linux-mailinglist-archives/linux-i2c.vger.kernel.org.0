Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0607D3072AA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Jan 2021 10:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhA1JUV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Jan 2021 04:20:21 -0500
Received: from www.zeus03.de ([194.117.254.33]:49440 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232435AbhA1JQ1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 Jan 2021 04:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Ce3BwYuGIywXjpBlp+osaGxqEMp0
        dpdIYyXZq2m7nmo=; b=aUkpaR/TjM15D/MW7HK4mN+yAObjpPPSTs15X6whYOMn
        OwTu19ZFHeQD877kBKTTZ0L1npM3Qz9OrvpNz83HAtZQxszEbRoE1Q9q0LK7DuHi
        Mof+8J1doCX/nQd0qWBEOHVD67q6aliwvVe7bbHMrqieWBsigoZF+PMqx8dwCLQ=
Received: (qmail 166700 invoked from network); 28 Jan 2021 10:15:43 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2021 10:15:43 +0100
X-UD-Smtp-Session: l3s3148p1@n4oMVfK5eJQgAwDPXyX1AEdA8SGgn5QT
Date:   Thu, 28 Jan 2021 10:15:43 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: smbus: don't abuse loop variable
Message-ID: <20210128091543.GH963@ninjato>
References: <20210112151230.46518-1-wsa+renesas@sang-engineering.com>
 <20210112151230.46518-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ik0NlRzMGhMnxrMX"
Content-Disposition: inline
In-Reply-To: <20210112151230.46518-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ik0NlRzMGhMnxrMX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 04:12:29PM +0100, Wolfram Sang wrote:
> Don't use 'i' to carry data, make a specific variable for it. After the
> move to memcpy recently, we can even remove 'i'.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--ik0NlRzMGhMnxrMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmASgLsACgkQFA3kzBSg
KbYEOg/+PKEgbRA2NiBtzk21Qa8j/cADvF5RMtig93vUTLkvBySAPfeadBiGo0DV
bJgAQR+P/UW9iudmYk8KufCsGVl94Ubh9ZR0+7M2Sio0iahWdfPdUclPec9klb4B
W5H4ejrjzyHDk5JWhTUE6+CWJWD+2GoUOg3F4c/DbQUm6hjy3wYyAsg4Z3P7Pc6E
B8beEUcGL8a6biiNniqpCwH5+O1Z15dW3le0WuPFryPtbQyMazwPQd4d5Y48AvwD
EsACtXHnBrLg81ArcA07GdPNZmsEwvaXu7aM0Bz+skjzf1qv43M2jylCw0W/4IN+
9/GMPAouiPqYO7RYylIK7e+/bQsZBLiMcmTXiQdOD9RH0+DnjVtXrSndYJqEZq/4
bBwsbs2LfAWKwA/zUpPGJrgYSZbmMkZPVv5lxb0uETRTR6BtrlpnhD6tm81WC54V
YvJd9YBp1APbdzPIK6nJBamDNH33k1MSfqeRtCD4yNuEzLQ8tloQV2z/AYc7lXa8
XsEY1814Gi5d6cBhE6JzAZvPgcWHZIIZJJhxBp1EGto2nFcb0zx1lpsstJ0Gs/fF
XK4qHtuhegyml/FjYBxs5g+ePfoDtJPx+kPMCdT7Ib9V7MBRql/Pme4bjSTqVNew
NVe/bn8zD+nQBXWBdZBc9loNnXbdts0AL0pgj1bM66cRUKc3zmE=
=9pGe
-----END PGP SIGNATURE-----

--ik0NlRzMGhMnxrMX--
