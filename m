Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0400234FADF
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbhCaHz2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234108AbhCaHzT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 03:55:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9470061582;
        Wed, 31 Mar 2021 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617177319;
        bh=EzitGg86srFNwq2ybWNTNEkYH5cOxpBgx7ICUgiY5yo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HoEE25OE8avfFADAgHRysi5TbL9Q2GJYNdipPYMDvqhA1KarMfxqZpV9Uoyafa0bG
         RZLpwqxufdgARkTFbMWqqqv2xkNdcdUfakfMbdxfguce9XtIrsT70N3gtFEWQw9yod
         2RVA9yaHSQqHXt+rgqdBf0Zg2mU/cfzWyBDRcGiLFiPFWeLztE88cFMSAYtvYVoMXZ
         MHwyzwGQkiGOSuirfKPNj57lYlHvQB1QNoW1frAPZ0eHOiY7HSPl9DSSJewmjlpW/e
         zHUarypb4raAyvxr/hPfPXifCNGp5XZtEuq7+jL3gMXaw1342sCMA3FmLaNgztXyXq
         aBZlCjym0+BFg==
Date:   Wed, 31 Mar 2021 09:55:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org
Subject: Re: [PATCH] i2c-stm32f4: Mundane typo fix
Message-ID: <20210331075516.GF1025@ninjato>
References: <20210324140610.32385-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Content-Disposition: inline
In-Reply-To: <20210324140610.32385-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 07:36:10PM +0530, Bhaskar Chowdhury wrote:
>=20
> s/postion/position/
>=20
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied to for-current, thanks! Please check older commits to this
driver for the proper subject prefix, i.e. "i2c: <driver>" in I2C.


--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkKuAACgkQFA3kzBSg
KbZcNg/+Kgz6fUXwT8UG1T6AI2mSbxrDvEf1HZabVoWUXqfAUzW70AOuupu6rANv
ZALbbp5LgXqd9mlB6SsLgZb2Fu+KH2HHfb8Vb+3MoyVPRPxY4hz0ISqGohy4cWH0
3WRpT7ZKYwxjHj/0YFaQxrVSa3Vxpy/iifohlnezxqWYcKm/WVoRvpUXPAqT53w5
buqBb+CY133IjNtPg3GVrV/7yPuPM2hQAapY0PsbwPz4Krq2G6jsuhQ8V5vHIaTm
Y8DJiRDvAzgDgTUKu/Ndi4JD1g8InykBnLRqAbdk84ktM1vuGEpvk7/LbbybBKj3
ZezZCW9Ux/1X69t17Z8l/R8S85xRXiRcXjO04+rVHjnsMMPVyiarGQEptejqY3CH
nQjiVNdCUh6uzkQcD6zdUgIeqrdq/IAConxpk5BAKmMqQfVkM85oY20AMZP/gEtg
yBVkQdXVpvltbIvxtcP7Zxf2X90PpSVfexJpqHBx45MGy7FkEnu29gwo4SZ+q81S
Y+sXwxxuyL3KvxFibgnLTLf2lcpTVGpcC5N6VZjOrAf3pfWxgx3QvJ0LqtQrYcwB
lNZiq1C+a5eGpOdBEnEmpc69YTTs40ry4fBkTnnzOdPCJVkDsdn4ZTDp5cAnyy2E
VKGky1q77+EEI2EIjmquoP6f/u+yQNf3In2VZbaYZjXz+kckDPM=
=P84I
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
