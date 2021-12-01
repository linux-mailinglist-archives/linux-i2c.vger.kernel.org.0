Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C1B465845
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Dec 2021 22:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344052AbhLAVWw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Dec 2021 16:22:52 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:56928 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344040AbhLAVWs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Dec 2021 16:22:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C8FB1CE20EC
        for <linux-i2c@vger.kernel.org>; Wed,  1 Dec 2021 21:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698B6C53FCC;
        Wed,  1 Dec 2021 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638393563;
        bh=EvRiVt467TERmUfUfoYQmYFWADfor+JaOV4GCdnKSyo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jy1+RCaLrF71Kc8ZGZg9MosOnbniMwd/7MsLsR+f/FThxND3vyc66jvuoiud3H4Ex
         5Os5t6jTUuke1F3ZENkb0zRZAjDCXitTl261PAIGn8cy0GaxIv1h48dOGEGyJCcTjb
         qt7oamRqD/80Il4oQR1rVfrEi7wQHiDRD41pCCVKHKLk8Us8/NnFa0pFWbnLD8pKBF
         E1fn53vpW//vB4J3xnr7mWd6grXsn5GeYXBXx0QKGOjibORY5dOHaMb7R0tkGZiGCq
         Y8jRl3kSOtJ/EpIHbmuvojMjzzhk1ELWwyGXQZ0PycSNyVRZyscBNSNh7qvwU4Iwow
         r/EmBrZ5inrPg==
Date:   Wed, 1 Dec 2021 22:19:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Maxim Kochetkov <fido_max@inbox.ru>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-i2c@vger.kernel.org, bgolaszewski@baylibre.com,
        arnd@arndb.de, =gregkh@linuxfoundation.org
Subject: Re: [PATCH] eeprom: at24: Add support for 24c1025 EEPROM
Message-ID: <Yafm1UioIO7DqUUz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        bgolaszewski@baylibre.com, arnd@arndb.de,
        =gregkh@linuxfoundation.org
References: <20211018210039.129110-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dQ6Exgi5hj1EB5xz"
Content-Disposition: inline
In-Reply-To: <20211018210039.129110-1-fido_max@inbox.ru>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dQ6Exgi5hj1EB5xz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 12:00:39AM +0300, Maxim Kochetkov wrote:
> Microchip EEPROM 24xx1025 is like a 24c1024. The only difference
> between them is that the I2C address bit used to select between the
> two banks is bit 2 for the 1025 and not bit 0 as in the 1024.
>=20
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Adding Bartosz' new email to CC...

> ---
>  drivers/misc/eeprom/at24.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 305ffad131a2..6543ff6536aa 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -96,6 +96,7 @@ struct at24_data {
>  	 * Some chips tie up multiple I2C addresses; dummy devices reserve
>  	 * them for us, and we'll use them with SMBus calls.
>  	 */
> +	u8 bank_addr_shift;
>  	struct at24_client client[];
>  };
> =20
> @@ -123,6 +124,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Time (in ms) to=
 try writes (default 25)");
>  struct at24_chip_data {
>  	u32 byte_len;
>  	u8 flags;
> +	u8 bank_addr_shift;
>  	void (*read_post)(unsigned int off, char *buf, size_t count);
>  };
> =20
> @@ -137,6 +139,12 @@ struct at24_chip_data {
>  		.read_post =3D _read_post,				\
>  	}
> =20
> +#define AT24_CHIP_DATA_BS(_name, _len, _flags, _bank_addr_shift)	\
> +	static const struct at24_chip_data _name =3D {			\
> +		.byte_len =3D _len, .flags =3D _flags,			\
> +		.bank_addr_shift =3D _bank_addr_shift			\
> +	}
> +
>  static void at24_read_post_vaio(unsigned int off, char *buf, size_t coun=
t)
>  {
>  	int i;
> @@ -197,6 +205,7 @@ AT24_CHIP_DATA(at24_data_24c128, 131072 / 8, AT24_FLA=
G_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c256, 262144 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c512, 524288 / 8, AT24_FLAG_ADDR16);
>  AT24_CHIP_DATA(at24_data_24c1024, 1048576 / 8, AT24_FLAG_ADDR16);
> +AT24_CHIP_DATA_BS(at24_data_24c1025, 1048576 / 8, AT24_FLAG_ADDR16, 2);
>  AT24_CHIP_DATA(at24_data_24c2048, 2097152 / 8, AT24_FLAG_ADDR16);
>  /* identical to 24c08 ? */
>  AT24_CHIP_DATA(at24_data_INT3499, 8192 / 8, 0);
> @@ -225,6 +234,7 @@ static const struct i2c_device_id at24_ids[] =3D {
>  	{ "24c256",	(kernel_ulong_t)&at24_data_24c256 },
>  	{ "24c512",	(kernel_ulong_t)&at24_data_24c512 },
>  	{ "24c1024",	(kernel_ulong_t)&at24_data_24c1024 },
> +	{ "24c1025",	(kernel_ulong_t)&at24_data_24c1025 },
>  	{ "24c2048",    (kernel_ulong_t)&at24_data_24c2048 },
>  	{ "at24",	0 },
>  	{ /* END OF LIST */ }
> @@ -254,6 +264,7 @@ static const struct of_device_id at24_of_match[] =3D {
>  	{ .compatible =3D "atmel,24c256",		.data =3D &at24_data_24c256 },
>  	{ .compatible =3D "atmel,24c512",		.data =3D &at24_data_24c512 },
>  	{ .compatible =3D "atmel,24c1024",	.data =3D &at24_data_24c1024 },
> +	{ .compatible =3D "atmel,24c1025",	.data =3D &at24_data_24c1025 },
>  	{ .compatible =3D "atmel,24c2048",	.data =3D &at24_data_24c2048 },
>  	{ /* END OF LIST */ },
>  };
> @@ -548,7 +559,8 @@ static int at24_make_dummy_client(struct at24_data *a=
t24, unsigned int index,
>  	dev =3D &base_client->dev;
> =20
>  	dummy_client =3D devm_i2c_new_dummy_device(dev, base_client->adapter,
> -						 base_client->addr + index);
> +						 base_client->addr +
> +						 (index << at24->bank_addr_shift));
>  	if (IS_ERR(dummy_client))
>  		return PTR_ERR(dummy_client);
> =20
> @@ -689,6 +701,7 @@ static int at24_probe(struct i2c_client *client)
>  	at24->page_size =3D page_size;
>  	at24->flags =3D flags;
>  	at24->read_post =3D cdata->read_post;
> +	at24->bank_addr_shift =3D cdata->bank_addr_shift;
>  	at24->num_addresses =3D num_addresses;
>  	at24->offset_adj =3D at24_get_offset_adj(flags, byte_len);
>  	at24->client[0].client =3D client;
> --=20
> 2.32.0
>=20

--dQ6Exgi5hj1EB5xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGn5tEACgkQFA3kzBSg
KbZJNhAAoYLqA+JoftngH4dJC/0Ty3NvYX6NxFSzflJzlKILsABP2tpG0rzbGg80
6XGSKxU9zBtdD2IWK6XjGj76OdaBRW8/tagrfBpbU0gAY3EYDXx9XJW9Nd0g/w/R
qYui8ctTUpqYg+iJhYTis9UyLi+LTYOmcqEjHYZ+yjvWcgPwLZHoALtVGrV/bw0R
Zx3qh59dMMuR0pGONbQSNqb4WzsMkkEt40Oa+9SKCqe71eY9E0r/HPHGiVyTaYxV
8QU0POXk10nDhah5uyLou4SpNcLAFNz3i/I5STvJq7R3SUB2QsUHAYuxhRyshkc8
1AhOA45Gt5W1MyiocQ9Iwg0qgYHYvUBkYluUfxOp7LdzvsMSjpCVgnqmls+NzMI2
mTcqesCOp1fp1iXKMS3UljQPYYGWhx9SjFlfqgyhwQAK7Z+iyTZqLzb2GEySdjtX
lqryHNCChzXjsOjZp/kJRjDLRi/+L0wwpmk7AkZEHrbrtTVfuqoYrDx/UuxxCcYM
XeWJWKHty7idyxqpuWypNgRLHGtLE2Uyhtbxo0sCVjR5o2drveUeDUP140L8Q4fp
aJ5tH34Jy+oxtfmAZYtpuumPR459xgZJewi12R67AAaFY2JPSfMzBa1WHWUX1Cf0
Qmcticjs949hUQ2COLs7VmqaC/QCNuCi68XpTkRnjLGUrdpLg14=
=ti1p
-----END PGP SIGNATURE-----

--dQ6Exgi5hj1EB5xz--
