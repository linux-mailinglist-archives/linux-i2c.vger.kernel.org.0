Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9D12059
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2019 18:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfEBQfh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 May 2019 12:35:37 -0400
Received: from sauhun.de ([88.99.104.3]:55706 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726300AbfEBQfh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 May 2019 12:35:37 -0400
Received: from localhost (p5486CF77.dip0.t-ipconnect.de [84.134.207.119])
        by pokefinder.org (Postfix) with ESMTPSA id 3CE642CF690;
        Thu,  2 May 2019 18:35:35 +0200 (CEST)
Date:   Thu, 2 May 2019 18:35:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?Q?H=C3=A5vard?= Skinnemoen <hskinnemoen@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: friendly takeover of i2c-gpio driver
Message-ID: <20190502163534.GC11535@kunai>
References: <20190425143555.29659-1-wsa+renesas@sang-engineering.com>
 <CACiLriS7C7D4XRjvrspLjU7VbSLioSxcnvHnQPS5xbEHZBWXEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <CACiLriS7C7D4XRjvrspLjU7VbSLioSxcnvHnQPS5xbEHZBWXEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 08:52:58PM -0700, H=C3=A5vard Skinnemoen wrote:
> Hi Wolfram,
>=20
> On Thu, Apr 25, 2019 at 7:36 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > I haven't heard from Haavard in years despite putting him to the CC lis=
t for
> > i2c-gpio related mails. Since I was doing the work on this driver for a=
 while
> > now, let me take official maintainership, so it will be more clear to u=
sers.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>
> > ---
> >
> > Haavard: please let me know if you agree to this patch, or want some mo=
re
> > discussion about it.
>=20
> No objections from me. Thanks a lot for keeping this driver in good shape!
>=20
> Acked-by: Haavard Skinnemoen <hskinnemoen@gmail.com>

Cool, thanks for all the initial work and reporting back now :)

Applied to for-current-fixed.


--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzLHFYACgkQFA3kzBSg
KbagKQ/+KYR7c9JtIvU5j1x6unRrw+r+yMhdGpwgp/DvGDmD5L3u+RoFFJ251P2Z
A5FNEsUYd/6LVwKAh8BAvUUdwiynm8mN2Sb4no5QpI0RsX443ZKLO5N1HceMb/CV
pV/U7UAuDozV8DyH8CeF6Rd4UPdroGFquf9fu8fiq+sUNt+XcxhIfYS2M9hjllDl
5EIZ8liE8nv02fPrPaCDNAgZSvTJffxnOGG5j27lj7sBHARrMBDiSoTKGSbxFrVq
9QKTNQGIp+6CSxfyWQgCrzrpGQanIpugaVTLOU1vShkAIpSey7JbyeM6D37F4eF5
XmCLGZgr8YW4g6n9Weudf0UovJuBsKhHz5/rL4Ru6lE3i9esPXTK0HitKRHPjGRu
UEIEELjpmpFfMINWhqKShMkKZ0tTmPwihdfVQ3soRzI2B6JME8zItCWVyzsF58Fb
VZfKbi/ptXiuiUqs0cc3RFGVFvxXnf72TAiPBVhGO1BSsjq92a9x5A6PsOXse0E4
iwY9zDEhX31oHZTuVGY/3hCQkURR6mZGZVqZvptizarl8aIEpn/RizNbOIPpO0Ej
F5XhRIVgb5RM+7UnHUuhIhmFVY3ihO3jeKEMwbROGbGnO78YJVwyE2HlgO77t58x
Iqr9EEPjDnQ+IU/LUmozkx6ay4lexb4zfem90acHw041Dl/4ojI=
=TKH2
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
