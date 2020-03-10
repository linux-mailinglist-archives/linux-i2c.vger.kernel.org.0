Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9B117F61F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 12:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgCJLVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 07:21:00 -0400
Received: from sauhun.de ([88.99.104.3]:47584 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCJLU7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 07:20:59 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 90EFE2C1EB6;
        Tue, 10 Mar 2020 12:20:58 +0100 (CET)
Date:   Tue, 10 Mar 2020 12:20:58 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Robert Richter <rrichter@marvell.com>
Subject: Re: [PATCH v2 1/2] i2c: convert SMBus alert setup function to return
 an ERRPTR
Message-ID: <20200310112058.GS1987@ninjato>
References: <20200228171221.5412-1-wsa+renesas@sang-engineering.com>
 <20200228171221.5412-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="b2ktwntdbf0dPnbx"
Content-Disposition: inline
In-Reply-To: <20200228171221.5412-2-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--b2ktwntdbf0dPnbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 06:12:20PM +0100, Wolfram Sang wrote:
> Only few drivers use this call, so drivers and I2C core are converted at
> once with this patch. By simply using i2c_new_client_device() instead of
> i2c_new_device(), we easily can return an ERRPTR for this function as
> well. To make out of tree users aware that something changed, the
> function is renamed to i2c_new_smbus_alert_device().
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!

Thanks Luca for the review!


--b2ktwntdbf0dPnbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5neBkACgkQFA3kzBSg
KbafLQ/+NFe9akhWzyi8N4aZfEo1hngAx3SY5oDa06nV7uyI9MROmSu/JcKk5qOr
zeTBtyuCmbA1/hDj0VkYyWQ+c0bw5BX105+1D+0NCaASv8imwC8oucVjWCS3kV8x
jaxqEo8HSVU9GQXbmfalYlcCqTbLdPByBhi+JZfHa5JYMKrlV0VX18RhrEhpmold
eprdFhZS5lUwgfE/ApDWd/04AyVX1goCkjgDSTBOb4nmmfUYwPVqkneZ6KzxAtS+
4WFl6b+FKImd+FCDZgJlJN57ljzpHDwAl4IzhI7UH6Ln0cVjasrxqJIX7UCGEPkG
KBKsKWqlw3XTnS20E5nGyZdnSJoiUzNnS8fz9N3FGiA+NoDUp6rDQLZ1QaafPFM+
EOzIjstTs6c5dUNohiig5etH5iBAo+MeSTpIyWggJCSvDDRXc91LXNQnYWcJrj3P
vtQz1CLf760KfyhjHTK0dGQuo+hYdVeeAuv49nfzf5OsKe4aSN+7Dr4qQhoxSa70
V/C3g9xEUwt0UjBobIQPOuWmx38XutY4z9bvTCF6Q5aTqP8qlo7Ke7c9hC585cg6
Nre8u5rmaVTRQK25dN6vKj+FjgMp/7REJc9XRC3fDfqAxd8MMZmAuoYZats1UG53
jMI3av3a7yv66P3LkPLtdjV4z/FiX03vSHgW0Cbh7wgnr/X13cc=
=aRB3
-----END PGP SIGNATURE-----

--b2ktwntdbf0dPnbx--
