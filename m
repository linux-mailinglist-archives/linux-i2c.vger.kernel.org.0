Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84BB2EB01A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbhAEQcH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:32:07 -0500
Received: from www.zeus03.de ([194.117.254.33]:37398 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbhAEQcH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=LnkLlHTxDKWlNwbW3R/CfzZv6kER
        VWAMuXxWehUePUA=; b=2Rrdz1b5YCeFHzpDmTytEZYCmiRVGD53VydJyJmPfylX
        qJi/pSSLRXxFAnf5ePaRHATw4pZSyAo42RhwDtPGj6Yenm4DG+kf+ly+Mw0wDcFR
        a4A3Jrog9t2zCpimTpdy2h/FqUVU6HjavPZHfiN8UkAoVZjePYX81A4nqodNLs4=
Received: (qmail 122965 invoked from network); 5 Jan 2021 17:31:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jan 2021 17:31:25 +0100
X-UD-Smtp-Session: l3s3148p1@ItPgvCm49OUgAwDPXyX1AEdA8SGgn5QT
Date:   Tue, 5 Jan 2021 17:31:25 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: fix MODULE_LICENCE
Message-ID: <20210105163125.GJ1842@ninjato>
References: <20201214160044.3378-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BghK6+krpKHjj+jk"
Content-Disposition: inline
In-Reply-To: <20201214160044.3378-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BghK6+krpKHjj+jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 05:00:44PM +0100, Wolfram Sang wrote:
> Let MODULE_LICENCE match the SPDX header which is correctly based on the
> previous textual description.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--BghK6+krpKHjj+jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0lF0ACgkQFA3kzBSg
KbaQtg//bzCsIRG/jhBsyModm/+QBCSWBwf0w281qrchQ9Mo9znkzb7H5DirExtG
quFt3WjI3lSjBWHtrZsQofxQnY3QNgpm2Mdzv2RYtpyvPB+plHigXQywRIn7LV4J
LhokdH3MXtt370WtdLmlQ5g4B8xL0qRZSbF8ZZGM6MeMHLhhZYsPtj2zF9G+33fs
S+V9Reng5m7LNNTam/7zj7c5/0r7gTB10zHT7G3ES7HitHH3JjEsYbo/SveZaRp4
1rfYu/glbvqM33btEFswyG5NRd+F79mdNMqKhgWTt2bUNdavm7v+B8HUzFtJhiKa
ErQ6TBrj+Tjfdfl2wk6bSsz5KpTqDP8xosIfbGMg21lmSpA5p/p1ij47zFfXN8RI
QPMA70W/1k5lJNRkPLUBd2ZEqiTqXoPrg72rALKxlIS3T1HnJjTXj110/livPhnS
ffrHzT0ivmF5FwIEMIu7DewoQbecr/5k4rNRsakMac+HUR+o6pVN1n5ze2KCc/Uc
FYsnA8gIdNk8lzQ5nmCh6ndos8qfo9gE59bLIQLVZg8+eRonr/9ZT+tm+7CfRDx8
YJMdml6nIoDgIM9vJmzFubc+zm6Oi2Hjf+9n1vnJlJPQbl3fvLCYXFC9/LlncJQp
H9dskm+zUrB6LfFKVS790AO7gTPv4dGIX2C/F1qmH+iGF7xQEJQ=
=Onse
-----END PGP SIGNATURE-----

--BghK6+krpKHjj+jk--
