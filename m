Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 888DC191BC0
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 22:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVJl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 17:09:41 -0400
Received: from sauhun.de ([88.99.104.3]:55146 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727088AbgCXVJl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 17:09:41 -0400
Received: from localhost (p54B3339A.dip0.t-ipconnect.de [84.179.51.154])
        by pokefinder.org (Postfix) with ESMTPSA id 3ADAF2C08EF;
        Tue, 24 Mar 2020 22:09:40 +0100 (CET)
Date:   Tue, 24 Mar 2020 22:09:39 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Alain Volmat <alain.volmat@st.com>
Subject: Re: [PATCH v5 4/6] i2c: =?utf-8?Q?stm32f7?=
 =?utf-8?Q?=3A_switch_to_I=C2=B2C?= generic property parsing
Message-ID: <20200324210939.GE7641@ninjato>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
 <20200324123216.78113-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="a+b56+3nqLzpiR9O"
Content-Disposition: inline
In-Reply-To: <20200324123216.78113-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--a+b56+3nqLzpiR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2020 at 02:32:14PM +0200, Andy Shevchenko wrote:
> Switch to the new generic functions: i2c_parse_fw_timings().
>=20
> While here, replace hard coded values with standard bus frequency definit=
ions.
>=20
> Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Alain Volmat <alain.volmat@st.com>

Applied to for-next, thanks!


--a+b56+3nqLzpiR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl56dxMACgkQFA3kzBSg
KbYxEQ//TKyHfuPgOPUDbpuGthdwkbXxBvtjSHv9byVCiVUuSZE7/bwwzUsz3s2A
tsRK3E7WJrI2nH20MMZS+QrsY/Q7czVi0LcA45tg2Mf2+4WQoYbGBhW1Aet7uLYA
cTB1sP/n5O5tlgvpNpdFaKGOxzUmrZibZMJV2I70WH0RWCbo0yLhl++wQFD2Z6d+
I1X02uwUlPZkUP74mzKbmvoIydu5kmyS1Ossu4jV06IO36Rxs+wEZQ4iCzOd+Kil
kK3cdpFVeOJgSOGeeOg7AUEx7nOgq6+CEynid9bGEPCdAa+9BJ1/UmpwcRtj0iu8
mGuZUIl3mZtwLMsnJ8XaMBdMN2+wd8awiMzAvVz2oHO1cD0yOka/JmR7BQiA/D6t
beM7hJeormt+3Qbqf36kpM1aI+K9bEqyjkmXDVT3Ez/fibm3WBVTIPm9389PO5s5
JiZ/weh66wAj0oFTAUr8LASe759UbVW3xAA3aXnrSF7Gipk17orGZ2ITEsiEXGg1
RwTOBcSPbLIYZ6Jq3Ck+tg87WzcQ7AKReMjcI90FwrdBytQb/YZf4wrSGnp94NrV
5sC/kr/+9wFmfxnE80wumh/nom4FHx7z0NFNzuRXmJ6+0pz/5mzlHDj04WFfuNrV
A1ukcq3Su2uzkzMIFskvG+PIH/bZa1fRZF7fDpyYMaFFleeQDpY=
=Zcxm
-----END PGP SIGNATURE-----

--a+b56+3nqLzpiR9O--
