Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3498A27AF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 22:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH2UFj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 16:05:39 -0400
Received: from sauhun.de ([88.99.104.3]:43036 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfH2UFj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 16:05:39 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 9630C2C001C;
        Thu, 29 Aug 2019 22:05:37 +0200 (CEST)
Date:   Thu, 29 Aug 2019 22:05:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     jdelvare@suse.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: taos-evm: Make structure tsl2550_info constant
Message-ID: <20190829200537.GM3740@ninjato>
References: <20190819074601.326-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UeXZ3FjlYZvuln/G"
Content-Disposition: inline
In-Reply-To: <20190819074601.326-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UeXZ3FjlYZvuln/G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 01:16:01PM +0530, Nishka Dasgupta wrote:
> Static structure tsl2550_info, of type i2c_board_info, is referenced
> only twice: the first time in arguments to dev_info() (which does not
> modify it) and the second time as the last argument to function
> i2c_new_device() (where the corresponding parameter is declared as
> const). As tsl2550_info is therefore never modified, make it const to
> protect it from unintended modifications.
> Issue found with Coccinelle.
>=20
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied to for-next, thanks!


--UeXZ3FjlYZvuln/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oMBEACgkQFA3kzBSg
KbZSQQ//di+8rmLPvc032P8ftdICqECCVIbEeqkIm2QiWYy0T5ev01Xk/76pedC0
TaqZD7zfFe2cK/TB3IhbiIRC/fp6t3LVKo9Lft/onvmxeHVFTjW7yBfYC6VD7YqP
/8f9FAEv/VjWv+XNelFv82z1foCkYlq5dpdk12GLVc+cGT4qxhn6NEe4s1ni/5jd
xIp9flKNEbGqfY7BkdwGyV8NUQpiy0Fw7GeXXxVPpGG1HbsH0kVfWNW2xQ9jT2Zm
36Reavt2X02kjqgXfPArks9Y2Yi90FCa4BDoGRNyk/6Mwr0OsQ98lGsMi+1i9WyZ
aOSNo/L7BCgTG3tlemZLO24CLzsj/kisnc42iDYYfjZmlxjQX8N4vAhyZEBsaQef
nGkOYFi/2boS3lgtgbkPjf4Gv/k1fTZ7dcSLcB58TEpQaOblyKXqzAQVpfmUruJ/
FJ6izdn8HFPx2Gffns6S6hfc2fK3Bu8IrMIfxI4JQ0tsBQ0puMXZPiiV5KDSrnqJ
7CRmalCH42cxmwPadokdO4JTr6IwaS+4rB1bFLmeI+8ZH9L2BTXEjKuWRcFyx0K9
HCzqcJJA+5n+4kKjI6TPDq0qEBvG+qTFWK5Z7ZfaO72EBZlLyUxLgF+QGmFzOsiN
ZdzyDnXAMIXveLpaVDDiCs4Fu/1Ex+mPcNbZprZavzredLRFB14=
=2QN1
-----END PGP SIGNATURE-----

--UeXZ3FjlYZvuln/G--
