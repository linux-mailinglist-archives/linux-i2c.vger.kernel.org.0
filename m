Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828A422FA1F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 22:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgG0Ucz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 16:32:55 -0400
Received: from www.zeus03.de ([194.117.254.33]:60522 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgG0Ucz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 Jul 2020 16:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8gsJ297pj7FFCmcgZnqYcYx3yG/l
        Nvpq/AoRSzKWms0=; b=1ZhLCPpwkBW8fFp7CP1TVlIscEsgQDb/bUHD4QyAu5C7
        6r1h9qC4rjTORP2+xQOB+igVDn58WyyYgQjW3F+6HcPQxfwPEqxJIP6ELA4gZoQC
        r4icMpZzWy1tNWnNGJij4auO5WtwQj4BrkBEMcWx4MqtoEAzhN0B/e9/7u0h80k=
Received: (qmail 433977 invoked from network); 27 Jul 2020 22:32:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jul 2020 22:32:53 +0200
X-UD-Smtp-Session: l3s3148p1@Q68jOnKrWq4gAwDPXwZZAEO3WtL+/yzQ
Date:   Mon, 27 Jul 2020 22:32:53 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] i2c: core: do not use logical device when creating irq
 domain
Message-ID: <20200727203253.GB18997@ninjato>
References: <20200701082318.11174-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <20200701082318.11174-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2020 at 10:23:18AM +0200, Wolfram Sang wrote:
> Let's rather use its physical parent device to give proper namings and
> connections in debugfs.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8fOfQACgkQFA3kzBSg
KbbvgQ/+I6zWzyb+e/tiBoxB15LMxSDfyf1FxPxAgoyzdxHt4fmf/ZRoC6HRW6cO
aCaiw9FtHz6UCuj8ESLm8/pD1ZHB1wYWoR11PlOdHAvo/vHUudagAt+uMM0lKCiY
vz0Md5H36ktEDzfJ2slrMWbrIfzk0DIxMyDknlmyZ/PopAQaFzy+KZm6wkleTD40
56oUX1tdH1+68HRIkEX4E9scRZfX95ewPJbwBhZEWXzHh7dBE4Dc0L5QvXHE3J8U
UmJoWhbOcvgjZpmIHZx+owN2tUDd6dJWXnwGsJstALPWIW8ZUdpaV1heAGqWaObj
HGfwNWDmvar3ucSsePMiRBZWjiN5HKyDR4PnJdaUXzZf6ylKbVwz+shq6ddIg6S6
Uc3rYLxg0th5DoJhcLNN7otwAmqyNNt1W8NQh8mPbKvkR2ddvkmc+rv1pYsM69ba
1/TTtAKI/GNl9Y7Xoqjo+zgQR/QVCWzdQUBmKz4J688xD1Oqutgsv/fMBvm+9gP+
6cf9h+FC7sE7uO+erRB5qSA2RD9oZMmDY9GmACco3kb/LnMftO2WeT5lZirG/ZG0
PDN46JBdmN3/0KPPlhJh9rIcpneaOzsqwdaJ57hliBv4cvaXgHR/ppIeDMff/7kH
g3oWCfMJ9+nVs2iciQGLnVNNTYMO1FbvHrfFMy6qU5dd4Y/+Cjc=
=fbce
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
