Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B1D234714
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 15:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgGaNkv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 09:40:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:42690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgGaNkv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 09:40:51 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06C37208E4;
        Fri, 31 Jul 2020 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596202850;
        bh=riof81UgLdZ5axTp6J4xR8oi2LabGN/mqTM5OX3Fh/M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g8ysFyQqaVcSpSIdvRUMr5R3BABkOWypD4M46SccCky92oCrgUL0d8ko3C7hJ3suQ
         jQg+Si2gK2vktoLknjAhepLhg/bCwOmE/GaVetbU6fUJXMtwh9S/lsr3PtHTX596AE
         uH4Cf7z+G9TI3XrCziJuOC1ryxB1Pz/IlourZU20=
Date:   Fri, 31 Jul 2020 15:40:45 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v6 00/10] Support for Tegra video capture from
 external sensor
Message-ID: <20200731134045.GA1679@kunai>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Content-Disposition: inline
In-Reply-To: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 02:02:39AM -0700, Sowjanya Komatineni wrote:
> This series adds support for video capture from external camera sensor to
> Tegra video driver.

No need anymore to CC me or the i2c-list, I think? Also, is this series
really still RFC?


--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8kH1kACgkQFA3kzBSg
Kbb2/A/9FLStog9+LDCFSypkjVVSofsann8AzQpWSWrl/rE78UpM4cNWs1erhcYM
1UicYFZvmc6AGZHH6hFWx5prq+gyZzAhu26zNbRzscwtiOraCYE/6PvIvMKoqGVE
HVwqQEQ6692jRLl8xvGqUfYmk7LfW7hpyAjK7CzHcrm3OIat6VBKmpoKX+K9J/ZV
n9OH/eQW73rguUmq7R4NppeZzPXiDET8J22gqI9i3Pd0JEzFZs/5H7D/+B1UwaSU
Nbb+BPGd0sXcp1Zhk93lNfFAPrkEv+GbMGtKgucqNoD5qYe7A7IvYxkM9e2+Zv61
L+eM0pP/LM9esWIRxiFYVEQKw70X0ADQYICFgbgttn8gWnNoD6E74ZxhCopO1xM+
LFHacxKl6kqy1pgQqRwh7Q8w9PbsdIQJf8gD2g8GvQpSjtKKa/yj+p26waMZSjQy
513ETISiNAOh1Cz0fRgKr9NpmU/PuF1U7JH8tsqdjHl17A/v/q7+aElf5f55Me67
wzwG/wXdTJXBycxXlrXxzP++NcFMKkhZ1tdFYuwxk4gdSLM+OSu9cIqsc6zXfNx6
ZurpLW9TwAi8HoYu7A3k9ECcj2k5Xt/V4PrsCfnkFRxxr78dv70HYUclowzrOuPM
k2q1a4dISCqVsHPATs6hdmiDGnvJVFWxKxD8jnVVhlIOgfdt+X0=
=y7Wv
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
