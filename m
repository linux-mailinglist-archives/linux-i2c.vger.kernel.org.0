Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B103F14D225
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jan 2020 21:54:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgA2UyY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jan 2020 15:54:24 -0500
Received: from sauhun.de ([88.99.104.3]:41556 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgA2UyY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Jan 2020 15:54:24 -0500
Received: from localhost (p5486CF2C.dip0.t-ipconnect.de [84.134.207.44])
        by pokefinder.org (Postfix) with ESMTPSA id 374E02C06AB;
        Wed, 29 Jan 2020 21:54:22 +0100 (CET)
Date:   Wed, 29 Jan 2020 21:54:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Colin King <colin.king@canonical.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V3] i2c: xiic: fix indentation issue
Message-ID: <20200129205421.GB7586@ninjato>
References: <20200127111336.114501-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline
In-Reply-To: <20200127111336.114501-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 11:13:36AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a statement that is indented one level too deeply, remove
> the extraneous tab.
>=20
> Fixes: b4c119dbc300 ("i2c: xiic: Add timeout to the rx fifo wait loop")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-next, thanks!


--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4x8P0ACgkQFA3kzBSg
Kbbg2A/9FJqyn9ks99JLD7qHs0n9X2XQCLXkv5Cw1HMad+934DZIfm3o9v7ABgoS
hLQnxGCFOxBr4BrCehiPc+WKCOw455ux7yqt8enFpMZ9nEBPBBsAuwJmPwfTH/jP
R5xBosv1l9uRHQWEDeExsmWZpv5gHgJVPDd+I2S7aES4kBAj8uUOUmfTvF0ofMLV
8cabXa9AGG3ZTKt51aad0PIMGphQVtDNlmDYe7wqVMqymjDGX/RbDstNsKvxoG2D
GVNm2KqsYGveZX5vHZRjlzNSfMUpnN79Py6YouzOVgomZjLUY3+3DWbu2BH3gs7R
Z1DgmjPSbvWyQw3ktka9D0WHPG6rq4lX5YuJcxksBN77C+LMXyAWo2eH50ZBLSB5
MsVMXsb1eEP8gWs54y+emDngVadIk8ui8Q2kCEoEtHmnWFkfOteUocDWOHbrA0ax
duju7H9Wx7iHAVxStVFOAigBzDEZRQv3YwaOSu1E+MCyGjR5UEDKC4Z6wnOQ/WGd
JehJLyp0h9VZOYbAY4HUfYv5WETtD1iPDAD1aWTvihs1oA/47HHzAgEQ1opfZ4Ax
Q0WwNCEjXcvoUSPFJzX5k3uJpm61Gv4gFaY2JLNPz9jOUI1E/6rik+gY+DxC07qP
JaDdL1LcipBrT+r6Hof6p4k9+5aY8GhB9/t72trlO2RDXkTqVis=
=t8lY
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--
