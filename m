Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B1E4F078
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2019 23:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfFUVY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jun 2019 17:24:29 -0400
Received: from sauhun.de ([88.99.104.3]:56232 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725985AbfFUVY3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jun 2019 17:24:29 -0400
Received: from localhost (p5486CF54.dip0.t-ipconnect.de [84.134.207.84])
        by pokefinder.org (Postfix) with ESMTPSA id 89CAB2C077A;
        Fri, 21 Jun 2019 23:24:27 +0200 (CEST)
Date:   Fri, 21 Jun 2019 23:24:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] i2c: i801: Add Block Write-Block Read Process Call
 support
Message-ID: <20190621212427.GE950@kunai>
References: <20190617161951.56510723@endymion>
 <20190618170633.14774-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline
In-Reply-To: <20190618170633.14774-1-alexander.sverdlin@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:06:50PM +0000, Sverdlin, Alexander (Nokia - DE/U=
lm) wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
>=20
> Add SMBUS 2.0 Block Write-Block Read Process Call command support.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied to for-next, thanks!

Please send new patches as new threads. It makes adding them easier.


--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0NSwsACgkQFA3kzBSg
KbZrFA//X94QwLt3H7g+z44AglDBQrgRqRjttwJLFT6suajwpqHehvVEaLxnP1Ph
DR5lCduyA9P2oXhfT3a5VtBwhBAW30qDPrwoc5ymFrYGGL9tVG5AptPCq1u6uHi4
j389J1eX52DWscw/BdDjnCeDxlQ9dpLI8gM25dIEhQic8TiJkUfQZ1flEe7bTe73
WUCglbAfZgrcxCl03lXq99IVWK6q3F5pBzYsl+o6hW5WIpLf5dNXJx47OehU73ky
/23XSQF0Dr1eNcun/RzzD0HCOzZM0mFTNWhC08sdJNLSNNuYJAZTu/bY4el/ckgM
7jkukXzX+A+kT9oilRKYmqUso24YiOKkH4XSrLns2lPFCB/6IPqLyyQzXPf+Go7/
sUn+51Z9Y/JO+ynNszFeQwTS7XVwBusn+aJsFrd0ND6bOOHRrkdTHmuMaCRLYzYC
CmG70piiG4rppKLYeT6wo8f/MPP+c8w9xsiQsb0ljzFGlp0t4oapPAIMGkleMtwy
ZSNAlx9kBnOL9Hx798L00GxEpWBSdRFsn5SK6DOl9MImn6TW8pQz/GrlF0/EEpCy
PuH2Dfd/6jht41tJgJvUXiRvyuTIhNmAORSLe5ydaTiMl2yx56QpD0XIL0mRxrBS
ZrJQ6+1VHJiQ3MV3hkLm1A5sY97pmL2Ki5lpETFcd2r8DimimB0=
=O8A2
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
