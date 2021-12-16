Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B17477E92
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Dec 2021 22:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbhLPVRO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Dec 2021 16:17:14 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:58464 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241726AbhLPVRN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Dec 2021 16:17:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E699BB82322
        for <linux-i2c@vger.kernel.org>; Thu, 16 Dec 2021 21:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2F8C36AE7;
        Thu, 16 Dec 2021 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639689430;
        bh=lckjC5/gLKaDkB+vV1MVpBntVVh9CREWWNCT8oEJg/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=maqcY4Vkdtdo8RwAfV9bXpEGO53We8SRTLxlBggwcEdb66Qup1WMpAEY29N9Stk8F
         gUD794K8Th4tmChEw78C68qLWCCdD2txbCFypMy/3leTtCQEmSv46wRPOmhP0FAU5h
         fObgEP0W5OSfyfhre5w5eTgY1X9NC5hLve5XnV/qcr3dYdcjVCZ+XzkjDxZqjuIP1v
         qV7f0jMWHW2ZmD35OG5T10sQXt4Zjxluj5GvCSqcD5P4AjLAykpVHzXwDQ2zy4Osv3
         u6fZak2E0iJHRBMqbw5/xA4e4rIuAVWvG9FTj3tsUkM81/5ezqEtQObak2a62+/0Cd
         Z0A4xwxpNjiyQ==
Date:   Thu, 16 Dec 2021 22:17:04 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Tamal Saha <tamal.saha@intel.com>
Subject: Re: [PATCH 1/6] i2c: designware: Do not complete i2c read without
 RX_FULL interrupt
Message-ID: <Ybus0MVyyNU+GyeC@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Tamal Saha <tamal.saha@intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FkWHUZwsDAJ3Z5bG"
Content-Disposition: inline
In-Reply-To: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FkWHUZwsDAJ3Z5bG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 05:12:00PM +0200, Jarkko Nikula wrote:
> From: Tamal Saha <tamal.saha@intel.com>
>=20
> Intel Keem Bay platform supports multi-master operations over same i2c
> bus using Synopsys i2c DesignWare IP. When multi-masters initiate i2c
> operation simultaneously in a loop, SCL line is stucked low forever
> after few i2c operations. Following interrupt sequences are observed
> in:
>   working case: TX_EMPTY, RX_FULL and STOP_DET
>   non working case: TX_EMPTY, STOP_DET, RX_FULL.
>=20
> DW_apb_i2c stretches the SCL line when the TX FIFO is empty or when
> RX FIFO is full. The DW_apb_i2c master will continue to hold the SCL
> line LOW until RX FIFO is read.
>=20
> Linux kernel i2c DesignWare driver does not handle above non working
> sequence. TX_EMPTY, RX_FULL and STOP_DET routine execution are required
> in sequence although RX_FULL interrupt is raised after STOP_DET by
> hardware. Clear STOP_DET for the following conditions:
>   (STOP_DET ,RX_FULL, rx_outstanding)
>     Write Operation: (1, 0, 0)
>     Read Operation:
>       RX_FULL followed by STOP_DET: (0, 1, 1) -> (1, 0, 0)
>       STOP_DET followed by RX_FULL: (1, 0, 1) -> (1, 1, 0)
>       RX_FULL and STOP_DET together: (1, 1, 1)
>=20
> Signed-off-by: Tamal Saha <tamal.saha@intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Applied to for-next, thanks!


--FkWHUZwsDAJ3Z5bG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG7rMwACgkQFA3kzBSg
Kbb4Mg/+Kw8JFvggkWezuthDLrJk4QYPDa3zoHOdHpmzZcco2klpahBsX9piILCH
kKaq1aSHwzgqQJpv7J94vHzQlJd9v1T+YInZo6F0NdrcNbOlg4xSzl9i/OSegj00
PZ2LjlQ3lNVK5UyjP6U88yq3rXd3qMmYijYqvtpYGWQNdsyl818iBgQPtPylYGQg
jzw9Ih3nHQ6X72W2fN09oO92RHcfVvkl8BxaBZrxrKr+R6ajccJ4e2VIsPHNN5pZ
O5BY6VAoSPBYkzTr/emsyHrgo+T6YByMamqxndfQKVX39k5obp6YinSyz75MqizV
S80yUdF2g0+DLtR4UPowUnUl6rCbUigPLZB57Al+aE0Nf9OdENBIX3GKruNBGnN+
5x6f+TL3K6MHYfZxHxLU5ZIPeK+JYIgGTwb/nYhLigNSAiwfnm1uqa77zpagfg1y
7SEzBB09OAxI1Y/XUmfvD7fD9Vy4ZF+pwPR30fMj/YSYW9I+TCDxfBDzv6r4CfWT
pwzz8vVbo/YSo7JKyNRcv3hTKoVFD6xKJFmInCGmsqRGe0VgS2ZO6LQjxNr+07u+
CtMWseJAdZOYb/twos/OKHZBGcRXWT3JkWJcvHvZ+s8wqnBIbhFOPfX0YLGl0eTr
B2M0RuiYUF0lqNgDz2E3/PIDNU5aIgU9I+86NrgRnLnIjYPnU98=
=kOZ/
-----END PGP SIGNATURE-----

--FkWHUZwsDAJ3Z5bG--
