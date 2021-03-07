Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30E7132FEFD
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Mar 2021 06:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhCGFms (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Mar 2021 00:42:48 -0500
Received: from www.zeus03.de ([194.117.254.33]:50500 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229619AbhCGFm2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Mar 2021 00:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=U6lXETupTp0O00QRiImB3ygl1PsF
        T5toXhvOUzWJZj4=; b=n+6dWHBeNlgHRH65GkfjGKB/OwlhBDRthB/WEQLdhQhW
        9th0CfKKrZ/Ee2MCHVcIcYNmJZaBDyVlLnKZqdGC6B4ZqfN0xqTs+IrPfWBLWE/U
        TIAn+JZsbzaaX2rR3tBwJRZXkCXrxY5nwA2Sg+lE4vPlo4nCBSgzcOa3qMOszhY=
Received: (qmail 2725566 invoked from network); 7 Mar 2021 06:42:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Mar 2021 06:42:27 +0100
X-UD-Smtp-Session: l3s3148p1@KilEyOu8tpMgAwDPXywtALY32ShiDR6i
Date:   Sun, 7 Mar 2021 06:42:26 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools] Revert "tools: i2ctransfer: add check for
 returned length from driver"
Message-ID: <20210307054226.GB977@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
        linux-renesas-soc@vger.kernel.org
References: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <20210209110556.18814-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 12:05:56PM +0100, Wolfram Sang wrote:
> This reverts commit 34806fc4e7090b34e32fa1110d546ab5ce01a6a0. It was
> developed against an experimental kernel. The regular kernel does not
> update the new message length to userspace, so the check is always false
> positive. We can't change the kernel behaviour because it would break
> the ABI. So revert this commit.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to master.


--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBEZ8IACgkQFA3kzBSg
KbbJORAAr08QtwOfS0Ai9+jG3L82nqd1H/PMoUUf7MuMwqIY8TCWuHnASpp3i9Fl
Zg18JKXiXhzg/hCIB3JQBLyKPwvqsRTknqqBxSw9U+F1+JRZg6aN7xsJHzjNk8oo
Dte73hnGAnxTVqKqsWQsYmkRULjTlajLuajHVmyvSEKq5dVxJ7ohgiVzKXFjUJfX
4Mvp4buhpUTe1AOfeF6naW9PVsTUrl5RYC+iYHKEIWsIsdc+sdNIjAGapaSNBF6J
HV/RCiRoR8GQOcH6O/PmPSsIlZDAQFUSuigGtKhiqzr2w+eL/0yAhy2vTQrdnNCC
DxWt7XJfc7ZPV6XaiURcj50RKcHuLSVx8QwFEfGyMQLFgZ9JriytOt+tbtnb0Joq
VSIH/XVAnTCSMPczy+8VowTVxMnLWIjxpdROYESKgyXKjtsQFm3ShP9aYeSThFTp
aEGF/NZZWEjcUhN4Eq+TbiScJFsFqdKQhOpw/kBeWfj0z/SVluD9stDcdFc2TFU/
QeOwyD1JXOsW2Rfr5mesxhgn2DlH1FwofQeitiopSEa7tUdy89tXOMggfkIyeMLv
Hx3BqgLJk5HR7zO4SnlkBy+fbyqcktSoWHgy5iNyNq54f84bCSlDPP8ZtJWSeDlH
PZWn4tFZyhVA62EAfhYGWwk8kUpftjLHXCmdz80UUK7SyXIbTmk=
=sP9D
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
