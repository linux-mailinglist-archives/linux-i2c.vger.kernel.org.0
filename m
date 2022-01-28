Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71F44A0312
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 22:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350903AbiA1VnY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 16:43:24 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:32780 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232513AbiA1VnX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 16:43:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5238EB82715;
        Fri, 28 Jan 2022 21:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BCDC340E7;
        Fri, 28 Jan 2022 21:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643406201;
        bh=UWurNMJn3x5Y8QSUhP/ZFXwkOJaBYELozYv4X81fGz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lugKuOevI537H1LD+6/uPUq0YlIZo40bpuds9m4ibOpULHUvsknIPR5gnYFNqO3ZN
         Cuix+WxiXtnkipOCF8iGam03EBWvvh14wnMZOt5IEU2V09b3NwCR0sZIFtJ70FagjS
         73WgtbM1GFPntTFPgc3I1cq6rgb7ZVbCFTfN8OtU2TSFQtwEB8nRQcajZdl4Hs+12Z
         xYvLoPJm+HCFrlFeIc3sODzia5BZXWDinmvNJpAi85mRK9oyG71RTcbRVMv7G8Q2sx
         w+qAmQ2HHLHIGTVVlF9kXR6L2UwcOlhsMW4/MIjom/ndIkbyg1k3XRxXX62zz/vs6J
         07/3mnwa2mNsQ==
Date:   Fri, 28 Jan 2022 22:43:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     u.kleine-koenig@pengutronix.de, andy.shevchenko@gmail.com,
        christian.koenig@amd.com, digetx@gmail.com,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
Subject: Re: [PATCH v5 2/3] docs: firmware-guide: ACPI: Add named interrupt
 doc
Message-ID: <YfRjdTX8FjmVQEfh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Akhil R <akhilrajeev@nvidia.com>, u.kleine-koenig@pengutronix.de,
        andy.shevchenko@gmail.com, christian.koenig@amd.com,
        digetx@gmail.com, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        ldewangan@nvidia.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, rafael@kernel.org,
        sumit.semwal@linaro.org, thierry.reding@gmail.com
References: <1643370267-31804-1-git-send-email-akhilrajeev@nvidia.com>
 <1643370267-31804-3-git-send-email-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="L/muJSDFh6beUqML"
Content-Disposition: inline
In-Reply-To: <1643370267-31804-3-git-send-email-akhilrajeev@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L/muJSDFh6beUqML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2022 at 05:14:26PM +0530, Akhil R wrote:
> Add a detailed example of the named interrupts in the ACPI table.
>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied to for-next, thanks!


--L/muJSDFh6beUqML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmH0Y3UACgkQFA3kzBSg
KbYO+g//SvmwLafA5XGHrb9l88Obn8nHvG+L/5ve6rRQtjLyGbUy5pe83AzROS/z
oFEWz7H4Nm8Su5/7oiGblLs5Pb75tJ0prkEzwDxW4tJQHXzgBTuwoEESIS4+hT3P
68OBNai4egsAlgu76utSDWxEoYZS2wCrSCrtpzjMjR/U9c0uhMx+t4s0PMNUT2Em
KGsXg6vyTE8LShr0qX22CUgnlnZaqQIU2yIEvShOw+0jUXC+h25eA/eP5nIwKcTx
a/vcx8sConrLl7gwl5f8jNUAzz3txvQtLUt7FY29enWY/uY0JVx+rp9oklMT/Kp9
6BtziYM7nsth7pcU0o84xivHWcNsKfeSG8CfidZmI1KyqtS/2eMTS6zXzJCUuVz7
85N0QCbnilF8MOJYP0vjtuTS4YO52hoY67DBFmQHIkY8TBIsItIoDOruaMcilWZN
lMbwj30Mq5KZ/FyIzmufLBw5WcagMFabiMWwW6IsL8fHlAmogN9I5iNPEbprczdZ
m4RJN8+4qcRuwsr95igvTY8uHE7p01R1/hhy5nK0N3vom1XpMqE0qN5IwqvUKXur
KIG+MK1LVtlfKnYeDdrhEkxM0UZdZhwZDM6UrL78gwpGrwyOVhLSWjJRhVdwEgtF
3SUVSm5GwfbZZ/hZauDkgXlJ0k6BVNdWCjh3FKOwCybMI8s+p0k=
=Km2e
-----END PGP SIGNATURE-----

--L/muJSDFh6beUqML--
