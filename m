Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D856E23EAA1
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgHGJmw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:42:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:50816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727053AbgHGJmv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:42:51 -0400
Received: from localhost (hotsplots-fix3-ip188.cust.syseleven.net [176.74.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C299B221E5;
        Fri,  7 Aug 2020 09:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596793370;
        bh=Ws7ktqGWfosc/wMLaZVeRuFChXuvhvvlICHUuznm2i0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WEe5v6DpRBNXUkqeZT/XOzT3n2QaP1tQ+T07Yh8CCaBIb6K9dNghXoDfZQy64iTIm
         5Bgu5v2FIQd8rSChfaHOAYoPVW0NfvqqHLgnHMPpAJIPjITmwXojf7Bsnu3IsmuQfJ
         ButwaYM3JuZdX/3ICjv+DAi1TsO7bwaD897hmzo0=
Date:   Fri, 7 Aug 2020 11:42:47 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools] tools: allow to preset TOOLS_CFLAGS and
 TOOLS_LDFLAGS
Message-ID: <20200807094247.GB1178@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <20200805220555.9050-1-wsa@kernel.org>
 <20200807114051.099ee040@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Content-Disposition: inline
In-Reply-To: <20200807114051.099ee040@endymion>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Sometimes I need to add some flags (like -static for the linker), so
> > allow this.
>=20
> Does USE_STATIC_LIB=3D1 not work for you?

For some embedded devices, I need full static because they use a libc I
don't have at hand.

> > Jean, what do you think?
>=20
> Fine with me. However for consistency I think it would make sense to do
> the same in eeprog/Module.mk and lib/Module.mk?

Sure, will add it.

Thanks!


--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8tIhMACgkQFA3kzBSg
KbZuxhAAodmIvwu6gXeTgW5zPtdAnkWvxxaG0h1zbUkBZ7RWseSzCKQwKlqMtvPM
vxzmD6xFLoXr70H5+u4WfuZa3Ey5vXLx5+DxA/w2hKbc0Mz2EasYXmCmkkYQsZqL
16taUQ634ouBT91NlbunZy4q4/uMMf55y4crC/xbimWZjEdnbd9z82Rw4Wh1AJdY
qjF486n+0yBZ3r5uutzymO+syyNEDCwuw4Za1Qcap3v4hDDxl3SO2q4H2nVmCKyP
FUN+mGkbyXW7xjWnx+YHe5s8llAGJk+ySRi+HBYtWasGMKW4Arqn57Wz3V0r1e/Q
rkJvrcJPLw/j6EKZQ5sb/G5sN2COCjhSL9uk6CRl4U+ibqNuxSyepR14E0AZjY6C
dFghWC1VvF+EHrAavyPIOpjMHG94y5tfyy2Dv3clWXL/N0p+azRYN82i50FRmtF/
unbogLWX+q3ejDcgfe6MOFb9t4AxydAUjrTbB+UTOZBP/apJQjAo8HinFSOeTzp7
IHvMNHIJ029kV4kzcNt06FOlRxe+7xhT0x0K0Wx3vMe1lM9SAyt7wtuhJL8tJax7
z2M+w1KSrY/6vq+g36NL+xeKBPU553EE6TmKVh1lY5QH1mnpnu+U7HU+dj0KrcYB
4/ExbysZkwRFUQvsp8SE9pJFU6+iXhDKwY4exQCqYw8bzeJv3sc=
=eSVl
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
