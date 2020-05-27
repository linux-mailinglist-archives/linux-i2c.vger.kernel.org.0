Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECABC1E3E8E
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 12:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgE0KGq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 06:06:46 -0400
Received: from www.zeus03.de ([194.117.254.33]:53722 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725294AbgE0KGq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 06:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=R/DX/aAAi2nkb3qT/jWfTO38q39i
        0ee+v8RRNu0fuak=; b=yar31p/2iAo1DarEeSINS8ftdHQfSTbR+nULCN3lb9eX
        nGi8ubeKkm0oKEPY5+18gwj0/amjiNJ5QNZAXFDPQaWYcA3bNwPt5z6aFeMqjzvC
        j5AiIttrdd7224GcHan9nPdTZ4bXF5yYDpCFzdeiDgm7jqtoikYY436KEYFf5U0=
Received: (qmail 3108777 invoked from network); 27 May 2020 12:06:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 May 2020 12:06:44 +0200
X-UD-Smtp-Session: l3s3148p1@PhCDXp6maoggAwDPXwcUAGXYC40/aiEi
Date:   Wed, 27 May 2020 12:06:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: save a variable in i2c_detect()
Message-ID: <20200527100643.GB1161@ninjato>
References: <20200519114809.15304-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline
In-Reply-To: <20200519114809.15304-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 01:48:09PM +0200, Wolfram Sang wrote:
> No need to populate a variable if it is used only in debug output which
> may get compiled away anyhow.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7OO7MACgkQFA3kzBSg
KbbaTA//Y0gzQj5dzugZV6rgNTxgfojE0jgv2lg6TJASiFKnLpMif3gaE/E0UCwL
jaM8L2KTt3UlkT9WY3tIgUdpv+3kx39AQ2l4Red51rBhrOKLm7l+h6FgF4nnzeyx
Z6vzkpwxWB7mMt9DyHNiwQZok+SF9VVSbH4HgdgQwIfwSWNH8Z1nYMk2P9k6I2CW
2cMEIO7o3f6tmj4/2duloeD7fsvB38sdNW5poediUFp6L8Mc8Fu89PPWOBeZzC+7
cRCkjFcT9JvnK6pNBEtmQ9woNX+Xx8uh00ZhdK9Mcfj99uYeBt6sSncRww20JiEH
xWMvT+fhVn9gZAjXNyIXIqH2jQkTlVr6c0BYI31FFas84x1JTqH9z7JsNdpfE8Z8
UYz0gCkZhx3plZAUrC9wgNHigKpzm0SmZz8aWk6Wr6NsPdf15N9eaqpHNZJDt7yU
Id5V4JAqGZyXfwgb1xR1VT8GLgNN7AvUIrmMhRgzT651y1e7M5yr1vbHp9PzezNF
RrT/QNQRuhBceDT0aG4FeSHgf/0Iqzg8TXhHXFxDMpQdHGXkkYGW1rRk9+/K0LKo
/gD8KvzyJqBbgIc9E7HOkO96bQuypA8vXU8B48Eze6OWfytyezsmiHM6I9zl0pVm
Huc8zwYCZ2mgWqVnZiAdnXuN/Z0psWqauB8q8ORyzvoyNXL4Qtg=
=Ywo6
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
