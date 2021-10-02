Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2AB41FA4D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Oct 2021 09:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhJBHen (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Oct 2021 03:34:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:39652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232457AbhJBHem (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 2 Oct 2021 03:34:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9784161AE0;
        Sat,  2 Oct 2021 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633159977;
        bh=IndVpq6hUiMzT2bV+wFuq2sU67znH6QuPuNA09trYEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nFmjZ4tIvGH14L9R1TRE1b5j+6wGfrEdKmEliRxI3/jjANQtzvZJdBCUYJYWjS6pF
         mjEPmfrByYpVDhbb8iG9wmDutzEH/yNfumDvULbTNSjGdSkLgKBZrZPuztPpBC0n/5
         0fSfVNn8JSzr30BujE15FphYYx0VHpSbY4gO+NHG1y9/aPzg/uohIHAWLpY63qihxs
         gEVmVemA47MAkate3ttfwiiTgPg2W19O7xudzj/mfhsz2RA1ZK44a6OHtrwTl/Sc6H
         9mIWqxyu3C0/SJcP+ZYQfEyrmtICyHI7CV8vRHDnrSQhv9MpfTsfV0qEpq5dAuZurU
         lxKj2FXxBHrxg==
Date:   Sat, 2 Oct 2021 09:32:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: exynos: describe drivers in KConfig
Message-ID: <YVgLJlv1FE8Kuqd4@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20210924133550.112488-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mdAwzlWYyVcIFGg3"
Content-Disposition: inline
In-Reply-To: <20210924133550.112488-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mdAwzlWYyVcIFGg3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2021 at 03:35:49PM +0200, Krzysztof Kozlowski wrote:
> Describe better which driver applies to which SoC, to make configuring
> kernel for Samsung SoC easier.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to for-next, thanks!


--mdAwzlWYyVcIFGg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFYCyYACgkQFA3kzBSg
KbaXiA/9FwY1WOdqZl94IvrRD9CkuQ6LtGekM1x5NdIhPw/4s1LSHRhT+5xpbCPa
rGvvUBEiuCMK5YyFkoBl23EKyH5agEV0kWiamSe6e7jJG4OyQFgAhk6Me53FjnsY
V9aAuVVSGcErsPZxljU+fQmknxeZhK73qKvh9T1cMogFTJQf2qERVG7MesjJd3rs
/3en16RJDTCJm7FzIR3Pk66OW5CMKp5T6w99zJft0EepLxuwSu3G6KgYuud/Xgsa
ZobSRHaBU/AFJyhn9Q3nEOoKIAQeX23l3nYxsk3a4PyZ6CrtDCbIjdk1y28Scu9t
463bgsIV57luilrOiJelEKLGQd2tydWPAvqKcH/LE0O9DNAqvuNg9BQXOaYMTMXG
TNUaaDAf33ojvRCGHsR26ypo0d9a6eC8aMqt/iCTZHdpwTdoniFTAeHoqJzwgtdt
w/P/+QBW+3SxvMa6YBZB3KurzS6In0yfs4dPq+ynvTdOKhK/1NPr7fWVHk+LCwVw
H+ZsMGbKi/xcmUbiUc+9uhCuEh1YRZPDPPHTJ+3qWBDvw3CtuuaUxdYl8I7gf0vE
HDetcKCR+X8E95SrlnCOSN5nd37NnI0IDG1ZQ8VrGn18UbMbE0mi+sBhs7jePQi9
4NJH718oQ641kRHxgGGdmlkkmKI/NIXOsWUVO2jQARD4q3J/kIQ=
=Cg0K
-----END PGP SIGNATURE-----

--mdAwzlWYyVcIFGg3--
