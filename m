Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E30ABA2702
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 21:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727673AbfH2TIl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 15:08:41 -0400
Received: from sauhun.de ([88.99.104.3]:42434 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbfH2TIl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 15:08:41 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id B261A2C001C;
        Thu, 29 Aug 2019 21:08:39 +0200 (CEST)
Date:   Thu, 29 Aug 2019 21:08:39 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3] i2c: axxia: support slave mode
Message-ID: <20190829190839.GI3740@ninjato>
References: <20190819090700.GA17091@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u/L2/WlOHZg+YGU4"
Content-Disposition: inline
In-Reply-To: <20190819090700.GA17091@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--u/L2/WlOHZg+YGU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 09:07:07AM +0000, Adamski, Krzysztof (Nokia - PL/Wr=
oclaw) wrote:
> This device contains both master and slave controllers which can be
> enabled simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has separate control and status registers.
> Controllers also works in loopback mode - slave device can communicate
> with its own master controller internally. The controller can handle up
> to two addresses, both of which may be 10 bit. Most of the logic
> (sending (N)ACK, handling repeated start or switching between
> write/read) is handled automatically which makes working with this
> controller quite easy.
>=20
> For simplicity, this patch adds basic support, limiting to only one
> slave address. Support for the 2nd device may be added in the future.
>=20
> Note that synchronize_irq() is used to ensure any running slave interrupt
> is finished to make sure slave i2c_client structure can be safely used
> by i2c_slave_event.
>=20
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied to for-next, thanks!


--u/L2/WlOHZg+YGU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oIrcACgkQFA3kzBSg
KbYZjhAAlXzIIz+qJlUEUSK3U7aUD0eL4KP7OyGq2KHlON52jJTIWajXZOGg7WZP
pvPCB2vS1Yn9NgftCEZwVPiTDCjbrIhF1fycRZXpR+Mz2E63DY1xjjRn7/fjrQw3
xZXSsGzyXgBt9cTRX0YZXTJuUM8mmJBqnva47rfk0zS3vWyZ9Cb/XxnS4HP6eMRf
4o0H9+GPBtAqBOfyYXmQvDmjMtjJWgUG2+K3Ft+M/ULhciOTCfmTHKaAMg1h6CaR
eB3csvSA/8TtphPPu/ycKSk2ioEuNj2Gd7Ew2oNuC1TtjiWeHHfzsB1FOqNZZgU4
IpR4of6Al1trHhkKyl9pn62CZJxmS5ojZuNcFe3r8OSCZoVShx8yqSlOsVMUfisv
rEWFoIH5A97eYTSS376CeparKQs6iLVBm8g6y7qScJWdAeqves1AlKq6tdN2GvAt
tOy2EHHMXp1SPALzFY7a8aeSCdvTF9D6eIHhT0ax8Nr2oZEeZkg9fjDeSNexHZ+W
sLYr958QYLPQm6OA15RgS4qFDIHXSgERsvf9nlyKWZ587pgFkbonPa313GqKR7ax
GMfposmfVDTHOGfn+U8G/F5EXptD6S4J+Dh9LVflqnr4BVTMdZcavjl/b81CRtDl
LEce94Sau6Ot0XMwA0cCjnUTUchKtJkrtu4XAVgneHmhi/xWomQ=
=TGu6
-----END PGP SIGNATURE-----

--u/L2/WlOHZg+YGU4--
