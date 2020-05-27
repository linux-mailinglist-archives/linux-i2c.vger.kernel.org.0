Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DB71E3E84
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 12:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgE0KEN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 06:04:13 -0400
Received: from sauhun.de ([88.99.104.3]:54822 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726603AbgE0KEN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 06:04:13 -0400
Received: from localhost (p54b33011.dip0.t-ipconnect.de [84.179.48.17])
        by pokefinder.org (Postfix) with ESMTPSA id D00ED2C2037;
        Wed, 27 May 2020 12:04:09 +0200 (CEST)
Date:   Wed, 27 May 2020 12:04:03 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, msavaliy@codeaurora.org,
        evgreen@chromium.org
Subject: Re: [PATCH V7 3/7] i2c: i2c-qcom-geni: Add interconnect support
Message-ID: <20200527100403.GA1161@ninjato>
References: <1590497690-29035-1-git-send-email-akashast@codeaurora.org>
 <1590497690-29035-4-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <1590497690-29035-4-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 06:24:46PM +0530, Akash Asthana wrote:
> Get the interconnect paths for I2C based Serial Engine device
> and vote according to the bus speed of the driver.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Acked-by: Wolfram Sang <wsa@kernel.org>


--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7OOxAACgkQFA3kzBSg
KbZevQ/+NcEUgwnmhUa8aEnp2UoVMX6Wlv05FuCrQxi0nZIjygKPEPZk37yJnfyV
PoMmuHleWfVuj38hY6Uk4MTpqgXGk73gNVBQdl0rMCnVX3lfBZTkITpg/afYnO2w
/xDD20Au2+yGZlax34Q0Ux1GMGmz5AgZTnz2BwM7T7BmnpEPRUNaibtUApL6gR4f
2IT7IDmDcuQrt7yl5zjN4PJOQlzYX8k/ltAclkeySaJgs6Txo5qYHY/RK0VxTg/5
VKyjrdpf6YC5/RoUJqEQaNxBFBSstgzqdTmqhjBkgR1cl0h42bywtcRYgH+2sFPs
xAldHIfYLHIjJGYE67YLUAhUBpeZ9Q5oIvRd/e7d18OeKoKNOUES2GZIB5SUE3hZ
p97DyqZPeDns/xwecSDimx6y7QlW82IFYgqprVV8DAE3psOhzjAm2qbe5POKIS70
jb5sa4LX741rzItM9tW6krBVN3YZk76P5nOYfAb1dX55RwzfKR0nTIUNt/QzwMhh
6ta1ZxHItJYB2BBNkOxle4KjIKlA2ic2lUBmBzoImL3UdZ7TYk9ggzvtIEN2DUyP
YAzz9pwwIV7O52gv/WVqM/Lz69qS+Mflog/pGKVi0QrLg2swLvPHohRc4Li+mjWv
YXd/cuH/u1lIbyEr0/8Al+HCHt8lsTKtUqGk4WZlOkbUxl43jqw=
=POQo
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
