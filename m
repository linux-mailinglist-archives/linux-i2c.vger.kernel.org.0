Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564FC7AAF1F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjIVKHk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjIVKHk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:07:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDDE91
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 03:07:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89215C433C8;
        Fri, 22 Sep 2023 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695377254;
        bh=61yyli1b+TB36mlGU4MRImwKwe43A3AAFbw7HbiYo4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K8NOjXQLNypTx+lKv2KhF5D44R/8w70MEIogcZl4us0wCpgrmQRD12KjxTLIwb+o4
         Q/nUORUqS5UfSA/SsE3qmQhtVikxtJr5sHRELvdWE5o9mE9lkS0avlEA5btZzaU7hO
         gbKa1euKiVDs6NKQ3htpkuWyd4I2AcXH77Wx8/kh4mz7wPFrlCG3Ld3mcHHL/vulUg
         7NhINzWTa9rcckjezTJlOy1fSHqZDAaGBlH08fI9E13pnrYIrtzX0v7bJkyPlicRUH
         6T2opBqElK4lnQV7+uMio9NXBbVW0JAE7vqeznShaaCCXDoCU452vh5Le7QZr+LFPk
         5XWpUXptqdFRw==
Date:   Fri, 22 Sep 2023 12:07:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Subject: Re: [PATCH] i2c: xiic: Correct return value check for xiic_reinit()
Message-ID: <ZQ1nYkSe+e/D2c7s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>
References: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HhmUBSpH2Bkg5dom"
Content-Disposition: inline
In-Reply-To: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--HhmUBSpH2Bkg5dom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 02:41:09PM +0100, Daniel Scally wrote:
> The error paths for xiic_reinit() return negative values on failure
> and 0 on success - this error message therefore is triggered on
> _success_ rather than failure. Correct the condition so it's only
> shown on failure as intended.
>=20
> Fixes: 8fa9c9388053 ("i2c: xiic: return value of xiic_reinit")
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

Applied to for-current, thanks!


--HhmUBSpH2Bkg5dom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZ2IACgkQFA3kzBSg
Kbb10BAAi5dF8kPA1ACtZhc6vVe0VCPwKlGJ1VMYYzaIjAPm5+jXbKHrTCxnbKsa
FLH/gFqGn9jwtccrrt7mdtIW1WRJqMoqmqDw4E+/A76/XYSF4xNjwCCbloQvpsDX
Lp9mYd2DY+t1mOlkxECtVB7b9dfMPRISzMLO3bWYKDRaXnXzMExFSxC2Dz5mvO7e
jPT85u839WtvpHPPMFBzVHgXwJ89FoPwM649RbcpcEiLp13bZycYMSNm5xhlI+Jn
nGS4TYyHvnSAyEZmSjtbGasipKom7f7yux+jlrDm8DuMkOD+LKGuPAq7I7oLnLXu
ohMzg/cwoNkgj3D5XuaDpLUUpZLzELmz5zv4bD0bauuVdN6WJ/xSvTTscEGofL3P
oY168nPeaP1Nkd4PkdeRCXCglPQX8DNxKU4EMMts5qeNgaB64M4StUCt/fqWyTOQ
ZDaJyp1tGYNYk1a7czOI5mxlItvoey7I+Xl8t1Z96pUdMaKjYcvb+A4IF/lWp83Q
p9mIGne6byS4KwgYD1NkJgVrwDgs2ihgJ8ucR4qbD6lTdIl9zh0jRs9JM94E2jFu
9wSG1cQNK9h8uD4LPS4OBUsFBJ5TRxnVg5xE+ajjAh3sUrH7iBs6OaIw1qHbEKq6
HISm5HO+GMAbr4fmR/rQJLN5/CvOgJaj6DOJQLhiK5oWZ5LOZc0=
=ipwC
-----END PGP SIGNATURE-----

--HhmUBSpH2Bkg5dom--
