Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD65230F77
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jul 2020 18:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731552AbgG1QeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jul 2020 12:34:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:49110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731422AbgG1QeJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jul 2020 12:34:09 -0400
Received: from localhost (p54b330d0.dip0.t-ipconnect.de [84.179.48.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A79D20792;
        Tue, 28 Jul 2020 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595954048;
        bh=uXUumP2+sNTXnE6EHRt6PUDgwtUeHTn5j+dNJH7KOVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cgrVwCnMxj91VP8xHGJ7740Jinf4MxWMNJ3NEkmqJ/yCMP4Dv2nlppxBjd3sCU4v6
         CYFGKgh/oAIlXBgvSjuyyHcTn5tEK3k1OtiztCbtU2pcqzMDgv3CofEG+R75TuusMP
         qvBF2E1miBiyOvrRv3rZ8yIwTrVjnBIfw5MNasxs=
Date:   Tue, 28 Jul 2020 18:34:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org,
        helen.koike@collabora.com, digetx@gmail.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [RFC PATCH v5 05/14] i2c: tegra: Avoid tegra_i2c_init_dma() for
 Tegra210 vi i2c
Message-ID: <20200728163405.GE3736@ninjato>
References: <1595883452-17343-1-git-send-email-skomatineni@nvidia.com>
 <1595883452-17343-6-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Content-Disposition: inline
In-Reply-To: <1595883452-17343-6-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 01:57:23PM -0700, Sowjanya Komatineni wrote:
> VI I2C is on host1x bus so APB DMA can't be used for Tegra210 VI
> I2C and there are no tx and rx dma channels for VI I2C.
>=20
> So, avoid attempt of requesting DMA channels.
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied to for-next, thanks!


--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8gU30ACgkQFA3kzBSg
KbbAPg//ehPzd9wKNGR8liN8/pgm4FABYGaxyQIuEG4paVvdgwUOoQ0ZW+itZsTJ
svnQjlamrbF65Yq1whqDLBiPMwfowGK6DUb9S2s9tyo4X2qsNJY9c2QTDZCnHqA2
DOM52p7v1lN1wTb8bSFCgxA59TEkKuWpkJSvjN0fAXQ7mpq1ioH4su7+SQ6aqNVQ
eg6XZPhsmg9uoneHBpaAT4irs7fR1X+GWppEwn2vMAGxcLEf5HaI/yhY2aalIpxu
lAHfXBJK5Jreqn497B7WXT5WMJ97a/IXPbvW51S7Y0OAKpsrBgG/w4ga2Wqltj0C
QfMY8aCukQhGRhlmUeC+kULlrcY1bhVAI20cIjNxLhaFCnymGAjCKU14MO75tfwl
PdsyVnd/OvKhAKW/7lLXZyWNJK41xQ0sRgOT3C3Mg1+KdfWFJB9c8hqynjBnvuZb
J0bdYJ1mNRVOEFn3QXOOb3BnYFdUhl03LYJYax+NEzZxbiZYyn7NjoPW+J1eBsjL
cxOtzP12AbIXDj+EWVBGn2B0HrTIQhQMovsdgaDS7tW7ahUGnESO3EdpH0yF6Jk2
+LnVRpFB1aHxze/dFahBmjBPtODTJQrsmHz5b93Nw5bjHWm10c+ro+IQF19V3/qW
47na6KqnvslbLzHUiWW4WX5GMKYQYHbWY+dSwB8X7MEjAU/aysw=
=cUam
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
