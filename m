Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4A646E481
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 09:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235127AbhLIIs1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 03:48:27 -0500
Received: from www.zeus03.de ([194.117.254.33]:58466 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235123AbhLIIs0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Dec 2021 03:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=cEHgaCv0N69lo2hyEfcT4ETMeNgL
        4tp9IasmUhtWmxc=; b=rKcfWEbPij9INKoB+NCMWau95U9JVshALj4qNaaq1X6D
        kL33676V/a3hAAaNDrL2/H79/TVJ1kREvXzsH+jHCtVs5nvoTVS+kUAxxZwb9yPT
        IFsUjPDZOsA2j2Df7p6BnkB5/SNPB/7p1Lw0D0uFZigqUAMThzJgpGaHwqcMD4o=
Received: (qmail 996588 invoked from network); 9 Dec 2021 09:44:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Dec 2021 09:44:51 +0100
X-UD-Smtp-Session: l3s3148p1@XEmFnrLSoOsgAQnoAHz+AAHm967oIe70
Date:   Thu, 9 Dec 2021 09:44:49 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Do not dereference fwnode in struct
 device
Message-ID: <YbHCAURU5bR3XFL2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211207162457.18450-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="d6ueVbI/hhwBjqBr"
Content-Disposition: inline
In-Reply-To: <20211207162457.18450-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--d6ueVbI/hhwBjqBr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  	client->dev.parent =3D &client->adapter->dev;
>  	client->dev.bus =3D &i2c_bus_type;
>  	client->dev.type =3D &i2c_client_type;
> -	client->dev.of_node =3D of_node_get(info->of_node);
> -	client->dev.fwnode =3D info->fwnode;
> =20
>  	device_enable_async_suspend(&client->dev);
>  	i2c_dev_set_name(adap, client, info);
> =20
> +	device_set_node(&client->dev, info->fwnode);
> +	client->dev.of_node =3D of_node_get(info->of_node);
> +

I am basically OK with this change. I'd just move the code block a
little to have the same behaviour as before. Something like this
(hand-edited preview version):

>  	client->dev.bus =3D &i2c_bus_type;
>  	client->dev.type =3D &i2c_client_type;
>  	client->dev.of_node =3D of_node_get(info->of_node);
> -	client->dev.fwnode =3D info->fwnode;
> =20
> +	device_set_node(&client->dev, info->fwnode);
>  	device_enable_async_suspend(&client->dev);
>  	i2c_dev_set_name(adap, client, info);

Are you okay with that?


--d6ueVbI/hhwBjqBr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGxwf0ACgkQFA3kzBSg
KbZq7Q//U0gunWZ66PRtFtMwYXwxpzBJ2B+007qKT2y+UV9GploOmojRzr4SQ0ps
FLtGJh+f5wnTECEyxHB2VTZWxUdYPGtYSEw5gr3J15XBnrT5cI3DY/jmGc1cGTkv
pNDIvQprchE++xKZzJdAxDp1ETrbPxtoL6iDyY3ukDliCpA3gjkeYgIZ2RXQ98GO
N91Dv3gqNQ0MkbVkVYgojpA0k/8XlpAnP6vVqSErFi+LrZz/LPcMQehWSyeMoTYi
D8fc575MbVrWU2nPpk3rn6wr3696DE6Y5YI0r8qjlOUg7TkljyjoPzIBwoPcjBIy
Uty4ULzhcwrEGLcDJep2u+5ZBXPyySzy5r1vw7eofF+iRNxkErNhyX0hGr+CcaXI
XHf684BeqfHjonvx5YUrWQGswPLq9JSNjsyzctg1ybCKNgpRsinAKqW1KC3mZi+x
4mXCn5F8rJ8iRzGDLC7KpVEEHmd+4UyTdOuUnNB+nQKYw49yhEh2KnQoYSbz+qXb
8UubyOr1g/ZF6YUFy23Z8Y3i7Q45I5isDh3v23vaqUajRjXUWb1ZCs5+pR5p843a
spj7lSZP5fx24dVLjibgzESDuRyr3d+AT2Fb0hIOZPQoF2FXuHYDX8AtrIEqbner
MR1gSV5UzcKoIBM/eTh6+VnoJH26tQm/nPmqzEwJw4lHq2gtduU=
=vKGY
-----END PGP SIGNATURE-----

--d6ueVbI/hhwBjqBr--
