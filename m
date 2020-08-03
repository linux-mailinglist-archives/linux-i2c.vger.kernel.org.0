Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8773E23ACCE
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Aug 2020 21:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbgHCTPB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Aug 2020 15:15:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:43140 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgHCTPB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Aug 2020 15:15:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TAWkoT7xhJtORCdGyRVmVaJ/1euH
        ilIPbIpV6QtmhJo=; b=NwVyeaA+fzKdEfyxrBCsrLOQ8Hgo+Wnml+O+/gywx1Tm
        4kQKCuldliKgwyiTT7gdu5EGGSgq1gBwpiBQ/ZCmJ65Y7wEX+0WLCfNDrOD0hYNJ
        4yuwA1xU7fO08CDMqHHFjlT4JSC4qLnTAPKWZe0A8oAgrOLO7u890ahj1h1DiqU=
Received: (qmail 2480487 invoked from network); 3 Aug 2020 21:14:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2020 21:14:59 +0200
X-UD-Smtp-Session: l3s3148p1@3xlx9P2rVsxQT+F6
Date:   Mon, 3 Aug 2020 21:14:58 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Daniel Stodden <daniel.stodden@gmail.com>
Subject: Re: [PATCH i2c-tools] i2ctransfer: add support for I2C_M_RECV_LEN
Message-ID: <20200803191458.GA2488@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Stodden <daniel.stodden@gmail.com>
References: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200802192842.13527-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> +		__u16 len =3D recv_len ? msgs[i].buf[0] + 1 : msgs[i].len;
> +
> +		if (flags & PRINT_HEADER) {
> +			fprintf(output, "msg %u: addr 0x%02x, %s, len ",
> +				i, msgs[i].addr, read ? "read" : "write");
> +			if (!recv_len || flags & PRINT_READ_BUF)
> +				fprintf(output, "%u", len);
> +			else
> +				fprintf(output, "TBD");
> +		}
> =20
>  		if (msgs[i].len && print_buf) {

This must be 'len', of course.


--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8oYi0ACgkQFA3kzBSg
KbZaeQ//Vstvx8V/Rc81Cxgq6WRhxpyd/fii/+d+9BckiHj63oPsO67vleO3s4bK
oqfIXZ3/VdA0xoMSQFYQrytBbgBEwO/AdCDQoCD1wcwb72kZUybjlQDwwRb+HE2t
Yg2hRFB5QZl8T0Le9x0tEecD7+kR80N8E3un8oC4NE74+Ya/utanYPTxGs6CK60W
S6EGMe62xetVAKe2qdNI2Cs7zU+ifIKSSkExHYn4c0pmhfg/cmwJtRo5AAo3iXgS
FmNeKnokOa8F4SWv7bGzux8n3hbieoI8D5eAv7pJbAg+vkloEh+/bBP+04wnbdio
69nSoRrFE7qIMUjEbyWI9IJjBMJcMauzJOBXou/ZzFpLzBB/SUbVOTBQVVdX2I4T
iIRmhpdVLJA/pEMl3BnTZVwWKm5ecc+0fkWhq6XNsFobevkcoRlAc0m2l/DAr+GU
92YBB7JAyczaBd/Fxu6C4OcHvNI94I1bpk9ANhg2+BYjOkQ2AsiFqr2Rx+kY9qEk
o/2Ybdt2b41IJLPZAK7GokkBX9T+Acryw7BZVBPpBwOeHPJk3OKMWHmanSi1bNij
ygRpjfMpVCep5RWzFKpxCNDZGVfTqXoa9Li9eMEfOjOtaJPpLtT6mVrholkvDT4S
0UrsuUIQQcI/13b134pU/XwRqyV5V+NejS+peI8z1x0wlmnCQlE=
=B94I
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
