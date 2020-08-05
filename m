Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C548223C954
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 11:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgHEJhs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 05:37:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728134AbgHEJhE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 05:37:04 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CE66B2067C;
        Wed,  5 Aug 2020 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596620224;
        bh=RYjfRuQ+zoktB3q8pEwiPSeB5u4sea/SWqiPKs+NKcE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HCle8FAt2Ia6fV7AVy9ad4/9jNY8fO6CEbLzIpVc64cbSKsHeKf2y9E33RH1LY1Zc
         Uoj4npveU1PgdlnS7GPlsUfUTzsiRMMHU5pNzr6pPz9P0mty3mnqUWURAu8DgMOzce
         n1XfXgiBDK27oGqbD7p4LEqKWBJLVmPubKduBj8w=
Date:   Wed, 5 Aug 2020 11:37:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake PCH-H
Message-ID: <20200805093702.GO1229@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
 <20200618134240.4091271-2-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XMHqbYJb993HXwLR"
Content-Disposition: inline
In-Reply-To: <20200618134240.4091271-2-jarkko.nikula@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XMHqbYJb993HXwLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 04:42:40PM +0300, Jarkko Nikula wrote:
> Add SMBus PCI ID on Intel Tiger Lake PCH-H.
>=20
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--XMHqbYJb993HXwLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8qfb4ACgkQFA3kzBSg
KbaB9Q/+KGxJbN4zGOxE5psDW85EXQ8p1+UP9XBIMGi77rVDW8dEESOsvsiVKoGF
uQ0q4VDr1qbpjPkVuhWzmYS+Tkb45NtfM0o8GcAXc0cPk2fP408LRUDhMuoXRLXm
aTVP5nWP0ewkveGK2XTxumZVa74rTJ9cwl96K7EpcBm8BsArWL8l/b3eSpFSBref
5sfRBZ0CQdfHIreId5GH5cw/Edm+pmjO9aRLS7Qz8r0xk4xpmQ1tQMrqCdnOUirS
sIrLC2GvJhC2A/ORDzMim2KKBgpNdr9tOvSID8UewfS1hTk08AhuNsYNUTvNdoIC
YT4G26tB5vLN6Ro0yMbMMEA7QoHML7d7y0WAu2GO59f4f8U4+6g9Yy0NzsD7hnor
BVh0Wn0RxnZonU/xlTpZstQ5BgJo4x47yNLyinKp8oHSOD6nz1u0DjLLQHnCun/p
qUupBQII2wm9uPhXokAnjQOwzmRqGXvr5zbD0A+RRbfFU5S4Opn86FtrXaC3Y/vy
8ID7wRG2x6qntB1pdfAwptI2gIk4otLfp4QJFH3ZbytZBPbUg5tFPA62WXHTuUG0
ztWQJeV+6aOUq7xh8XpY3956ZwCqchD/Kwyx3UJoxx2QMCzwlIDM/koED/3A43xA
FXc6qAcTQPaWEO4Ysiq6GZ393beGlYl4DnvuZEhTDpuyQK21S0c=
=TiNo
-----END PGP SIGNATURE-----

--XMHqbYJb993HXwLR--
