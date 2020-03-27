Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A26E195A1C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 16:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgC0Pnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 11:43:51 -0400
Received: from sauhun.de ([88.99.104.3]:39010 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbgC0Pnv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 27 Mar 2020 11:43:51 -0400
Received: from localhost (p54B3358F.dip0.t-ipconnect.de [84.179.53.143])
        by pokefinder.org (Postfix) with ESMTPSA id 1F17E2C08B2;
        Fri, 27 Mar 2020 16:43:48 +0100 (CET)
Date:   Fri, 27 Mar 2020 16:43:45 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-i2c@vger.kernel.org, Derek Basehore <dbasehore@chromium.org>,
        Guenter Roeck <groeck@chromium.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] i2c: enable async suspend/resume on i2c devices
Message-ID: <20200327154345.GA3971@ninjato>
References: <20200327151951.18111-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
In-Reply-To: <20200327151951.18111-1-ricardo.canuelo@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2020 at 04:19:51PM +0100, Ricardo Ca=C3=B1uelo wrote:
> This enables the async suspend property for i2c devices. This reduces
> the suspend/resume time considerably on platforms with multiple i2c
> devices (such as a trackpad or touchscreen).
>=20
> (am from https://patchwork.ozlabs.org/patch/949922/)
>=20
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> Reviewed-on: https://chromium-review.googlesource.com/1152411
> Tested-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@intel.com>
> Reviewed-by: Venkateswarlu V Vinjamuri <venkateswarlu.v.vinjamuri@intel.c=
om>
> Reviewed-by: Justin TerAvest <teravest@chromium.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---

Adding linux-pm to CC. I don't know much about internals of async
suspend. Is there a guide like "what every maintainer needs to know
about"?

> This patch was originally created for chromeos some time ago and I'm
> evaluating if it's a good candidate for upstreaming.
>=20
> By the looks of it I think it was done with chromebooks in mind, but
> AFAICT this would impact every i2c client in every platform, so I'd like
> to know your opinion about it.
>=20
> As far as I know there was no further investigation or testing on it, so
> I don't know if it was tested on any other hardware.
>=20
> Best,
> Ricardo
>=20
>  drivers/i2c/i2c-core-base.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index cefad0881942..643bc0fe0281 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -769,6 +769,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struc=
t i2c_board_info const *inf
>  	client->dev.of_node =3D of_node_get(info->of_node);
>  	client->dev.fwnode =3D info->fwnode;
> =20
> +	device_enable_async_suspend(&client->dev);
>  	i2c_dev_set_name(adap, client, info);
> =20
>  	if (info->properties) {
> --=20
> 2.18.0
>=20

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5+HywACgkQFA3kzBSg
KbZk8Q//aQwuwBSXd1/62Rw4lg2C2KusB9AvoeB12oQM2KBFTu4Fdv3bRHSbzI04
+xvEiBjHU7d5p+xhUihNCxFieNzob1XUAsfbeAj4kdc8jyeROuGkMwmVfUrp7ELw
7fA7A6B7B9v2q1pUmfps7X5e9uq1jJ1HUZWdPAyQASNSUG6S48pxEIApsj3YSveB
ui0cgweyq40BjmJZwOT2JA0f3QZK6O4BcLpo4ILiYW8rCpub3T77VdJ7JGa2++8g
W7DMgJRnf+rM2lmKPsEoUrV1nNVGPzQ3xMIsyrM+00MEw3pX/cfrrcLtEaJJrPhI
gy5pyy6oNMo1dIuurYpesH2HOKU1iwrT9WHz3zOlhRrfT54P2KoLdCIhlQ5YbBfo
Fakq6V2eOpFTgqIDJ4uZHbHIQ92QojQm/aNV+E7q12lN18y7wz2PnQDpVSGyAAEU
0tesmwv238xl8wWhZgmtrhSf2nxl0F1pmYjzLyfnggW31xVB0q3YTLgeloaLeTFP
socKNEVulcHb8VuC5wnLGij2BtRF5TPUaQA38cy0aC6IpDixhjkmMR7l1pHlh+dj
EZcxzPxcb6AEEPbCgvBvkTZIfmaGPT5s/FRaHjmNo5OLpgy5EicMtl7pHYhlOA5K
0FcxE8aMUseEja04QChybCfG7QjWcucSIRBbSdQJPrUE4TxMt/E=
=hV3Y
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
