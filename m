Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5689E35B04B
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234668AbhDJUNV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:13:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234439AbhDJUNV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 16:13:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A39C610A6;
        Sat, 10 Apr 2021 20:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618085586;
        bh=Guk9ZX60Q80653TRrPCy85Qd3vZd+SQXZ1x/M/c0tB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tZhIw33UqppP/xKmC0bV9lkTeRGxlu1r8ekkqxmf1Ddv/+cWYaDgTYpyuhfa/63C4
         hqpMDlEhW460JTivK3JyVU7Qu2HDc2rFGPCP4oxOpYGmxG3PwvZNk8+XiEFPrYFUuH
         AAFor6RBS8/ZKY0bI0JF7WosuaC0eBobPpKHKJmySUGtcOSHc55dCGvbCvIJla/O2j
         1AcStvbNkOVZaT4HwgeDqDs5FT3ulAyAhD5/UBpdlXOqg7DfnugkF4n21Pawh5K2rj
         T30AmXeP+b87vs12pf/CHC9AdGYOU+5goCGMs61Rdb9T0md0kHuy4vmbJHRZCOW2C7
         wkP3S9tgh88oA==
Date:   Sat, 10 Apr 2021 22:13:02 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] i2c: mpc: Interrupt driven transfer
Message-ID: <20210410201302.GC2471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-7-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <20210329015206.17437-7-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 02:52:06PM +1300, Chris Packham wrote:
> The fsl-i2c controller will generate an interrupt after every byte
> transferred. Make use of this interrupt to drive a state machine which
> allows the next part of a transfer to happen as soon as the interrupt is
> received. This is particularly helpful with SMBUS devices like the LM81
> which will timeout if we take too long between bytes in a transfer.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Okay, this change is too large and HW specific for a detailed review.
But I trust you and hope you will be around to fix regressions if I
apply it for 5.13? That kind of leads to the question if you want to
step up as the maintainer for this driver?

Only thing I noticed was a "BUG" and "BUG_ON" and wonder if we really
need to halt the kernel in that case. Maybe WARN is enough?

I'll apply the first five patches now, they look good to me.


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmByBs4ACgkQFA3kzBSg
KbbBJxAAsW07ykMExY2JTtBGweEr2vjNc1a5TEE9gw1Id8wLV6lRCcs9Cpdrs+8x
T5udKmoXq0DtOB3OUfgP8/rB1xnHDX7SeONw1RAmCGECLZmYMR+J6pTjb34uzfw0
+e3TnR6J3J9B6c+p6Hv5VHKTW226AQ1Ay81n9YFls1m6yqk0PVsaKUcaWbGflqZy
KC0rOEHGxxpLUqW0kj7gt8mEP2hQURf2vmpy3CdRmvHnEuoiN5MASBWH7zAUn3bH
RF+WyRzMyIcH6cOW0ysiy9xlcikfMmVPkUeM6/pZnL3VI/lNw873n0XoSqG3CSSY
Z2E4vg7CzPWqjWsfYlBNJtO6wIsCkwdBx++g0NB30f+tzxeicFNwyk9nznIpNMq7
7NoqLURtP0amLEJh6/7mIdH0xK4CjgBbNP3t4xCljRfLnpy8S88ENosdUgnr92eY
Hv07MIMOc0qpQFjk9WdFFoBM57nXigJtA3ZCE3RuWWIEsJm0DP9vVeDLGXGeECzh
n5MfyQvyttA86K1/IqF76HnEl6nBZzCenmxEtSUI09vpnj73gg4pCObyj4K9s772
LlNV3OFONtJwsSo1cFy3ciCj7di7uOybWMF4d33hUxhfiKoqTYFNj273THmRDtA3
3sSWSTGQMu+bWiKr2L0ixDAZMFMltiPtmxcG9yu/B7YykqAI/9g=
=Dg/c
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
