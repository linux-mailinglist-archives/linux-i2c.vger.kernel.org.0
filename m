Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F74F1E6713
	for <lists+linux-i2c@lfdr.de>; Thu, 28 May 2020 18:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404770AbgE1QGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 May 2020 12:06:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:42680 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404688AbgE1QGe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 28 May 2020 12:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=LGuBY1WPnjXfXJMpbWR8cnVcLbUf
        zCbTr9uma8hqNRI=; b=aqC+aim2gnDne9golaimQVDZ577mbIgjBB+jiUYKlmeu
        LpHZrOiKE5W/MYlPmJM2aYMJKZ6WKKd3Ma6yNIUTSVe3+ufdn2O8BUJvgOB1pgE3
        XzN+j+v0uB6SVLE/VbmD3xMZxwWOKEFRcdJOfSHPOiqnY65BqA7aKI9VmYWmtXw=
Received: (qmail 3613354 invoked from network); 28 May 2020 18:06:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 May 2020 18:06:32 +0200
X-UD-Smtp-Session: l3s3148p1@4iYWg7em1MQgAwDPXxGPADozvWpVH4oj
Date:   Thu, 28 May 2020 18:06:31 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Subject: Re: [PATCH 1/2] i2c: slave-eeprom: skip useless initialization
Message-ID: <20200528160631.GB2875@ninjato>
References: <20200525095934.3058-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <20200525095934.3058-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2020 at 11:59:33AM +0200, Wolfram Sang wrote:
> We have a kzalloced struct, no need to init to 0.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7P4YYACgkQFA3kzBSg
KbZ7QxAAlcbUMIgi0HwIJTd3SMaDvrQufeofFeg+qqUYE30eI/YgUWOyn+sut/+9
0EZ2zMTRQ+M7mUXxVwyGFred3ohBr4P0I2tb6iZcEF4LrJK+oY1ojV8eDBxHFHFB
QPIg+sS83HygenBGFOxHPeei3kAak05x7i8hDHE0Lq3OufIVyCmgdMVcB1iJqND5
uFuJl9aonxZj3p9oy92230OP7ABYUELJhTODQV7xFU/Q0IKUWW3BEYm24WxS+/M5
0k4qmQc7jrABUZxjtoXD10xaf13UVyzjLdcumbxCBgVsw2Uto+VoW/kkePGAvVGA
uc9cCLLCfEX92ebj+T4svlwVvb3cmvyyCMRlrrBL7j3bof6y3NvuLe0Y/CMLItm1
qRhWMBa1xSTCZ5dX4XKpABIlWfXiMMaeCXGIHvWGnwkKeBtuFJdy104ZBw4sEO7G
HSlMewnsyhn8TcKUFWy/E6m/RKdJH0m4StIzL8nl9+ZOfA70wXfZXhh9uMwXWv1S
HCzJciNQSWzYU9uLu33m08tfURh4N6bo2y1cNuG2uXNJz6vLIIUQZDaJ/FHhmjiy
sQGbJ1vAoRzFBZI9Gze+wmQhNBCEUYPOMgCcFIAUH+RQPwGGYCeWHHTYbhqr9BhZ
sv1n3X5p+onmPKcK6FSLLtx0qqFc435FKnRNOMTZ9awPQ91RYLk=
=J8/D
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
