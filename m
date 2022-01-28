Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB2C4A030D
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbiA1VnP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:43:15 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60936 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbiA1VnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 16:43:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 842FAB82712;
        Fri, 28 Jan 2022 21:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7198EC340E7;
        Fri, 28 Jan 2022 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643406192;
        bh=KrNLYI7l4Z2XWCVJOJncEdgDvKIrccJPtypzN9fcezQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6l++n7kHCLAhC1Fm4k3Qrnrwpg4T7So232rj00+/Vmsws7ozMc36wyySgWtfrNsC
         DnXC0GkXuNS7R0W6vk/otO0yhb7D7DS+FinHiwhFcRbT9qT8fCUn7HfZjdu94aP3g3
         AZh8lGX9gGeXcau+jLRpilt32qKZYKI9R7EPrZAWbZek4y8fINLleQiXt7UMnTzHIF
         J1G/Ncljg1+MScqcD3BJv+TGhx2L7KGvHyPMEoAqk+J44OwWZNeMcTb1a3eUM5Si2X
         5p8a20LQwKmUqRq9s1pw0BYpeobOl9I1Se1cWTvn8l5NUMWAyZcA/5Lr7eJwo5Tcdo
         +CVhFdUQXMUJw==
Date:   Fri, 28 Jan 2022 22:43:08 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v5 1/3] device property: Add fwnode_irq_get_byname
Message-ID: <YfRjbOM7kAab+o2a@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, u.kleine-koenig@pengutronix.de,
        andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
 <1643370267-31804-2-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GqFDkcnaiGdDfDXW"
Content-Disposition: inline
In-Reply-To: <1643370267-31804-2-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--GqFDkcnaiGdDfDXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 05:14:25PM +0530, Akhil R wrote:
> Add fwnode_irq_get_byname() to get an interrupt by name from either
> ACPI table or Device Tree, whichever is used for enumeration.
>=20
> In the ACPI case, this allow us to use 'interrupt-names' in
> _DSD which can be mapped to Interrupt() resource by index.
> The implementation is similar to 'interrupt-names' in the
> Device Tree.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied to for-next, thanks!


--GqFDkcnaiGdDfDXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0Y2wACgkQFA3kzBSg
KbZp+w/8C8HWFzM9oDqz/GAa2MEn53PUhLLcg1R8xieCo6jMAUWyt7qOWF9cfRxI
V9sBtd5Aslc+aWRdhOyIRaCdqhD2E770OVD+n1XUZXeO4sRcnGN4lL2lpHCUQSwV
WIeppXMjrQGGAMWk+dskq2y4M1eVMwCJnveHMxrUrSLc5uvEPUEK+/8w32ToJtrF
UBvsIATGRDnGCNo+jtEo3Vm/9hueeSdM0+vLnW3arsg4F3L+W4T98XPwJrMZVfaM
LqmwulaPB3EUEqa2Co7JcRHSbZtYUEbfgLZtiQafENWtqZPazyLYd9hlLYGf5Hii
EWB8rbm9ajT0Y/RTubiGWSxvuLPEUUk7OvQNLpLg2ZIrE88QD9puc3PzkK57N3nK
sI+sABinAGHsqkn0ywusnxNctaX1ZsjR8cIpNNwOpA5Cpwg4UCOJLSTn8emZZYPN
xZ1p/7VZwqz0XNBh4Wy3T1IbziTD16B6s9SbShPmg0FG5MswIGCY5Cn7duk8z8up
eqgK+Izb9dWKHmrPSD1JTbpJDaOSRZ78gv84VU/4x2kogb80M+HFWoJR/IZ1KBO4
BGPzXeJXCpfvGEUaem2OfOscumHIxpnlctRisF5mqtAN57D0r4D0m1V80VTAXwSD
vjUuyecJLCaztGV+uGw3/v6qtz3P/HC5/TZ+QtBY1uF4szenfr4=
=2VH+
-----END PGP SIGNATURE-----

--GqFDkcnaiGdDfDXW--
