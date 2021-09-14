Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6FC340ABB1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Sep 2021 12:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhINKbB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Sep 2021 06:31:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229591AbhINKbB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 14 Sep 2021 06:31:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75E646112D;
        Tue, 14 Sep 2021 10:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631615384;
        bh=BqRlwlLmvPpbNMvEKPkll5i7bfPrVsZFH9AHWj7K6e8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jwtuEovU2Ph6gNstYoUCrFzsSzHr+MxbjomDC3IJx7i9x0lFHB+z/EnaDXI8feXCA
         Owcc+XneIDUux5RbPfN6SVu2LwvScliOg7egcOvuTcJj5L+yJ8wcLmk+P3pP7VyZzh
         rZpQmqSnMEgNhExNzd304hfNS/qAvDGumvEnqqzfJZOfF9yeDxStZvtt33XLCOOCMu
         NiSNoPr15PXz5bAi/szunDkbGZW0E1DwEUHBr48/V6D0IKKjBmyJUuaEwBvWlxoiMT
         DqZQ2alDiOe2pGWyrPg8Jsr3KS+MyOjUZxnAEEDtELBigd1F9IegtuFJj2QNAqEsaw
         GTiSUekbusBfQ==
Date:   Tue, 14 Sep 2021 12:29:36 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-i2c@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v2 0/6] i2c: xiic: Fix broken locking
Message-ID: <YUB5kIM3CtuOIPeq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Tb+GeuzTXjb5r6Ry"
Content-Disposition: inline
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Tb+GeuzTXjb5r6Ry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 23, 2021 at 11:41:39PM +0200, Marek Vasut wrote:
> Booting ZynqMP with XIIC I2C driver shows multitude of race conditions
> in the XIIC driver. This is because locking is completely missing from
> the driver, and there are odd corner cases where the hardware behaves
> strangely.
>=20
> Most of these races could be triggered easily when booting on SMP
> machines, like the ZynqMP which has up to 4 cores. It is sufficient
> for the interrupt handler to run on another core than xiic_start_xfer
> and the driver fails completely.
>=20
> This does not add support for long transfers, this only fixes the
> driver to be usable at all instead of being completely broken.
>=20
> The V2 fixes a few remaining details which cropped up in deployment
> over the last year or so, so I believe the result should be reasonably
> well tested.
>=20
> Marek Vasut (6):
>   i2c: xiic: Fix broken locking on tx_msg
>   i2c: xiic: Drop broken interrupt handler
>   i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in
>     xiic_process()
>   i2c: xiic: Switch from waitqueue to completion
>   i2c: xiic: Only ever transfer single message
>   i2c: xiic: Fix RX IRQ busy check
>=20

Applied to for-next, thanks everyone!


--Tb+GeuzTXjb5r6Ry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFAeY0ACgkQFA3kzBSg
KbaFlQ/3UWb5WYQZA6lzPp1LhzDmYOTRKy7wAzXe88H42Tn1IZ71oWTaVLWErIwW
uNgT/vcRRkSwsGnOpkDTDc7Ql2n1fFKZkDQbpTpPPWTrnwaf7we2Etgyjee0aI/T
aadP/JWzGegyMo2Gtaqgvf+mUOuf2GZMsvmy5kxjBE63dI6n874AJ4UXVX2fpA5V
GthsyWd7UjxDtfr1oQeC5ftRO9iNDMkMKsdP2ZBOEDFtPZjJYlqPt7KLPqjoQpn1
uQVw9FzJbLAeAaq4rjmvpaI5RY+SzzcYTAmn+eUE56eSfzm91QmR6/A/Li/BvQBb
b/j0TjzvsSTA4y51vv754umeF9sOMNQcORbvuL6KA1GOXFlZjqTBGkQOlfw0gUgb
16O1dfVbMSB2H4FrsSgMvLw1UKDYGO+mMuwYV9/6VDEN+R2IrnwMg1AR+4m+qTdi
lHXHhUL1/OV00Sck9QQ68Oehc+WPmriHMx/7S5pb5ZhybXUE3KvCs4xFUsV6JByj
dwZVDlGmBjOX421jMfAT6CJS0S2e50D2MVlk1ZaqafUopEQirYDYMyekHF8hn12k
+yZEE4x2vmd3DcBrFeARX6CTsfRXl54fcQcKBRXeU5WWXCdg7P7L48yaXwPoJ4+i
2kz1Yn2tu+FBfZtz1vwP1CTuhptnJc/g7owo7z52t9QwgalYuw==
=/b4p
-----END PGP SIGNATURE-----

--Tb+GeuzTXjb5r6Ry--
