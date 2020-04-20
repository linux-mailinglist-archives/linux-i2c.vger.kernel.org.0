Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52FEE1B1216
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Apr 2020 18:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgDTQnf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Apr 2020 12:43:35 -0400
Received: from sauhun.de ([88.99.104.3]:47772 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgDTQne (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 20 Apr 2020 12:43:34 -0400
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
        by pokefinder.org (Postfix) with ESMTPSA id E17B52C1F4C;
        Mon, 20 Apr 2020 18:43:32 +0200 (CEST)
Date:   Mon, 20 Apr 2020 18:43:32 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjornar@axis.com>
Subject: Re: [PATCH] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200420164332.GC3721@ninjato>
References: <1567781706-2191-1-git-send-email-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline
In-Reply-To: <1567781706-2191-1-git-send-email-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 06, 2019 at 04:55:06PM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> If the slave eeprom has a "firmware-name" in devicetree, then
> pre-load the data in the eeprom with this file.
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

Sorry that it got postponed so many times :(

> +static int i2c_slave_preload_eeprom_data(struct eeprom_data *eeprom, str=
uct i2c_client *client, unsigned int size)

I totally agree with merging the patch "i2c: slave-eeprom: initialize
empty eeprom properly" [1] into this one, so we get proper memory init
at the end of this function. It should be renamed to
"i2c_slave_init_eeprom_data" then, probably...

> +{
> +	if (client->dev.of_node) {
> +		const struct firmware *fw;
> +		const char *eeprom_data;
> +		if (!of_property_read_string(client->dev.of_node, "firmware-name", &ee=
prom_data)) {

Can you switch to device_property_read_string() and friends? I think the
ACPI world may also be interested in this feature.

All the rest looks good, thanks!


--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6d0TQACgkQFA3kzBSg
KbZ0fg//atFigVD5tr/CBoRRZE10rhevuHNbn4bCJmMJDNpqOCIKT8QHOndXsc9U
6vi7mQbxGGmWau8a16qgQVxdYtKlp2MH9VEtUkCZwrEkC9RzDG/r7Q03XsOTjuNj
8nYON9uB7Jk07zhsxtm8O3Bw4EGFzeIDYk69uV/UbSHn1DLcVSNr5Ev5zIT69nWv
VfloioQY8G8wPFvge7lXKIQ5adWu6/7/yhn6PQ3rFhaC+Wgk4Gj/Oikz0/UNSuL8
W/1G63Iux9DZu7syHl2+6V8/hW8L+Y7xZY44r8y0epyHZBQVlGWNh8DF6wVNn7nY
XG/X1QgddmRK9U64DVRViVWZ/g2z5wEjab+qtYbwFsqaCh+lVR2QvHIkEaAB6HSz
MlGQFySUKjW/dt2l/3NbZpIj5U02XnOIpEMUuhJyzYHyRT/QPk0MPmYn8BjZLLqT
47ddcRZhGidLOqiZRxTQsOvCFLSuHDp0SK7Y3uuLSeyS02ByWUAdrl0NHLTpPiym
ZZVR73y+9LEvUr/l3s5musXUDffEIONR75DKMb0XpAUo1ObJZp5skB6jR069y9Xl
Ukoa158vW/uyhKDCcSYZBuT3mCStKDhLCnwedEfvOysVPlWBzYwnBtc8HqRDqDYq
ttVIVj+cK/49+uioKd81dcc+5jHA9R0PnGzCcm2wKtEtwwyYCBY=
=DQdQ
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
