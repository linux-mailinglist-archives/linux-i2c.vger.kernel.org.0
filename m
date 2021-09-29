Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5483E41CCB8
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 21:39:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343723AbhI2Tk2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 15:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:59510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245483AbhI2Tk1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 15:40:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9F916142A;
        Wed, 29 Sep 2021 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632944325;
        bh=F88NNtI+PeVcStsVCxT6i4k8CISWZPKr1tEf/WrFh+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IEIxhzYJwckD7No53vbleXyNR+bIJ1U1sn+y7KIQAGT6Vg1OW79tC+WqjJIlED7k9
         DsG2mI5pJawMsYHzw6vy2dm/xON+jd0k13jNVyHUCMSyfouz6XpFyNFGrcYqpArsR6
         GX121ySx+O6M7uKS41SbxM/lqFG+f7n3Z/zHyCau0n8yCfpEndM5xy2Nv0W15sFYrg
         ZipXvckHbTKByP2WHIIalAIWTKmxexnGtQcnHt++JQ1+D0cL1NbpA5bZjU28EpWOb9
         hOuJjXcLRXjZVaSLiHQMUIL3XI5QWTSJ0M+u86KzJkyl04R3TamqYAv1oPQ2sCcanN
         UX5dBgcC5gSoA==
Date:   Wed, 29 Sep 2021 21:38:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 6/9] i2c: i801: Improve i801_acpi_probe/remove
 functions
Message-ID: <YVTAwo/t9M1127d5@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <a9a630af-e979-72df-d254-568878dc7ee6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mVKhbK/Unx92bdLl"
Content-Disposition: inline
In-Reply-To: <a9a630af-e979-72df-d254-568878dc7ee6@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mVKhbK/Unx92bdLl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:16:33PM +0200, Heiner Kallweit wrote:
> By using ACPI_HANDLE() the handler argument can be retrieved directly.
> Both address space handler functions check the handler argument and
> return an error if it's NULL. This allows to further simplify the code.
>=20
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> Tested-by: Jean Delvare <jdelvare@suse.de>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--mVKhbK/Unx92bdLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUwMIACgkQFA3kzBSg
KbbsTg//Sow9MHIz9F7/x0x6Q/+Ri2gREekexmA/L4buBDQeiQ6PwSfh5GYNT5kk
uhyJayFwp8ES9LJmTI6llNu0lJu+bXy+EPKTAVAGfdhFJKe1StWcjX0c1Gze/+MF
kvN6uwgXi0w3x1Dk9qKwqfHsfdHTmFROuotba9/8Pol4k4F91nGeBp989bvkEb61
NAxFgFO7qvrBTylzJxyZSicBslnNJ3kGZaKq8rkaWqkmd9MWCd/16TCH/AdHXLTj
OlsPzxTDFRtcis9cyYoYtWlrHjWXZVnSdB7crrInaVibjswAnImujoP9MUFkvC9Y
A4EXvHfe3BdRbLXwmHYKMVyQTl+URYTjgVEWA2A/CklfgBnV60ejx0/hWQiUYaBY
KVVhlQcZMmZjGTbUC6I6JN+CyTV2Yl5I166Me1C00dIpDzIDNRcHyPOFBTRNg3ew
3/A8riOlEq+GmPQuRrSj6XFqlEdSSHJdxP/G+Z6wKswLmtRwp4A45VTTrowLj5Jw
iMMYkLtJI3GwQQYd6kL/u2q1Dd8YfWYrhk7lgux7rvpsFz7uk9jE/2MPdNv3SLnK
GB1zsmVB23NVxFX7//movfGvfFlX98jifBjNnCOEGokhj/nxW4SR0Q+FWgJIv71b
tqPe0au9bUFGBeiS++I3pIVMCs68ol+Bs55jedwPTo2twCXwoD8=
=nvbo
-----END PGP SIGNATURE-----

--mVKhbK/Unx92bdLl--
