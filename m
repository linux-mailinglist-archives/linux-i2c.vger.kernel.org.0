Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117E2271E85
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 11:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgIUJFX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 05:05:23 -0400
Received: from www.zeus03.de ([194.117.254.33]:35474 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbgIUJFX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 05:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Gv7xlTATONSjJAHN19A25wtHZ0LO
        KQ0L+VB+9aY8UWg=; b=y9dr0NxPcnkJrq+23UjiMoloWCMhzfLo7vGOQDwFE+Yp
        WIqnAvr3Dzilot8ibFey7/XkUEksnUy3cGwggfcA/7iZsVNDNrLmZeuV0PpQhuLf
        iFfj4xcwvtdSHUIi5RU0hb/RanDbBK3LRbRbFasYjkFGnq1GwFpfU7/al+OP/Hc=
Received: (qmail 68691 invoked from network); 21 Sep 2020 11:05:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2020 11:05:20 +0200
X-UD-Smtp-Session: l3s3148p1@6a1lJs+vXrIgAwDPXwWzANnLaz0lJiia
Date:   Mon, 21 Sep 2020 11:05:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH v2 1/1] i2c: add slave testunit driver
Message-ID: <20200921090517.GA1840@ninjato>
References: <20200914071737.6354-1-wsa+renesas@sang-engineering.com>
 <20200914071737.6354-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20200914071737.6354-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 09:17:37AM +0200, Wolfram Sang wrote:
> Here is an I2C slave backend driver which allows to test some uncommon
> functionalities of the I2C and SMBus world. Usually, you need specific
> devices to test e.g. SMBus Host Notify and such. With this driver you
> just need the slave interface of another I2C controller.
>=20
> This initial version has testcases for multi-master and SMBus Host
> Notify. Already planned but not yet implemented are SMBus Alert and
> messages with I2C_M_RECV_LEN.
>=20
> Please read the documentation for further details.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9obMkACgkQFA3kzBSg
Kbbw5A/9HNx+rM9lBR3cxVPy3D3zWFaK7Uf352LoTl+svu9vU4NZ2COhsRpK1UcS
fdWQ/lF+1rHUDfh4g/QXGgt56lJ6SYmoxkjP2qEh/DNvU/WvawotC9GrkUJlx+fA
/eBiWcbHPBdHvOUf3XRz2akc8LpRKWftBwnXqzHrwTe9MCodDoqEOy5xi0BAd6B5
BsXKQksWynqluWZ1rsdyNsFRqZyepQ4o/yvwqTrroxJb4Ylq20luMlxTYaDn0tVf
cWlLVG5fMxCtCAN72cb9Jaa4GgmxnXLXevdO5fbqbtmwrPt9YCgyg42GUiSQ7b1W
RlQMETW6qraTKIbyTA5Oc+stvurRntZ4qDKy/lmhRhLu+WSIUwBw1qAAGZnIJ3CS
jpoCQTITujlm93Z6ym9acLM2fsTyWCScwJOMLlxd9ROsNVDcXtQgvUFGHmQhvHUm
eIlvMOqivjh56GInW8hrDqUjt2BwIIt9nZ/YCRPwn9Z2v2bAxjNWTmtVkBapWcNC
br9ClHYZdaNdIZvIjD6k9+ab08eGs8fKmBb0ryewrfDn7Et4gDmjsjTmejcOXfKu
ZPRyqn89msxqnIiZRUFoLTD0j0CNGEryI7KsPzaiGpIzazPgKuiQznCZuSFpYhwM
W0gu99daYbTMCZpI8r+A7RS2RgSxI0JkmGUhwUaZjuqukK2Q/vY=
=X0W6
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
