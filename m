Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC741313B3
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jan 2020 15:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgAFOfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jan 2020 09:35:18 -0500
Received: from sauhun.de ([88.99.104.3]:39296 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgAFOfS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 Jan 2020 09:35:18 -0500
Received: from localhost (p54B338AC.dip0.t-ipconnect.de [84.179.56.172])
        by pokefinder.org (Postfix) with ESMTPSA id C0F512C0686;
        Mon,  6 Jan 2020 15:35:15 +0100 (CET)
Date:   Mon, 6 Jan 2020 15:35:15 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     robh@kernel.org, Ludovic.Desroches@microchip.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 2/4] i2c: at91: fix clk_offset for sam9x60
Message-ID: <20200106143515.GD1290@ninjato>
References: <1575886763-19089-1-git-send-email-eugen.hristev@microchip.com>
 <1575886763-19089-2-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BZaMRJmqxGScZ8Mx"
Content-Disposition: inline
In-Reply-To: <1575886763-19089-2-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--BZaMRJmqxGScZ8Mx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 10:20:02AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
>=20
> In SAM9X60 datasheet, FLEX_TWI_CWGR register description mentions clock
> offset of 3 cycles (compared to 4 in eg. SAMA5D3).
> This is the same offset as in SAMA5D2.
>=20
> Fixes: b00277923743 ("i2c: at91: add new platform support for sam9x60")
> Suggested-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-current, thanks!


--BZaMRJmqxGScZ8Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4TRZ8ACgkQFA3kzBSg
KbZD2g//eV3AhB8wlN/36GjEs1MJvsA2qKyPEJ3/JSCxkTKVzSmCKlaSI+1m+Tru
gN/sS4PgGkX3U6K77jkaSNALzKysK0cxjwcRThveO5sm6DxSsF3uckT7ZNoFDqlG
+etqwW0B82L8vwL4GoylkTt5VkeRm0QVwR+agvBiMYcU4FskcpUWf/jHtJrPd3eq
YasS3WIr0IDNxl62S3MNDUCYo9MnF/6HX8fS9oSnO0FwkeUiB+MthODPDTxt3GtZ
J+Mpmg4bvgJqcuMflVLfB28R0pijHnaIC6rUH2kHftCx7sq5qZmsU6LApkrFl2kL
b8YTlEvRlfDSB+f288W1eDsSAJmIQm2/EIDfPthoVUyHGkYos6yFDh9wwMgjS9Xp
6iiDAHiek4Rr8JKjVIo92lnFgs7X6Xmcjcw2IO0TsqltjgTsKimyDxscz+Bhn4MZ
Yv3uL6KxisenKoergopCx9U4LWIBFJEvcSJT+jBYf6p7/kwdRuQfGf1RsJU42d22
7mrp6Pc/zvJQ9xRGT8DtBWhdKFTc6rQ9rojMtBwsvbtUDzxgKCYJM0q68n0V8ito
p9HmfCvqoSU1KdLnaQdYPsmrIJ4siL8GR6ReXqffqspyRnnd4+/gTVt9235IbUpp
EUFcYCaguYrtSyWE8Y0Vc8DMmm38gDA6LyvGwIlsP2o864xlPjA=
=iI+X
-----END PGP SIGNATURE-----

--BZaMRJmqxGScZ8Mx--
