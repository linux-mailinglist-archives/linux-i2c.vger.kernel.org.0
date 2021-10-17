Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE3A430A03
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Oct 2021 17:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242096AbhJQP3c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Oct 2021 11:29:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:52218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237062AbhJQP3b (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Oct 2021 11:29:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46A4260FE3;
        Sun, 17 Oct 2021 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634484442;
        bh=1IZIYpWcRRGo1hMpX747PkvJcepTsaddkzuhvsbA1ak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WDCTv9T2R6sikzDWkmR7Lvja37jP0rWvAfH25HQkG1c0oowVGnnz8HX7A0BCGH7Z8
         KcVtNB37xrIEKOumA4JrQ6DT0IJ4kSf/DC1VcL46GMc+cvkFrNUmNjhfDyalOMBma/
         CPSCZgrC5xUbqB/5Wt9pY9tgGd1LXvbR05Bcu8FAdptdXfELoBlYlmfIM53ZwPrQEG
         cibsORm1qGHsWjoagJZ9iLvPQkIXFmNuMBxV8A1pDSDsqdrVdePEui0S6DmhQvnWM2
         bOLk2mUycicG8Sr5GJu6vyBpOe5TVSqwojLqldKtKx2ca0er6bFtYNDzL+x/V0M4qQ
         hQd4bqSaqV5rQ==
Date:   Sun, 17 Oct 2021 17:27:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix possible memleak in
 i2c_new_client_device()
Message-ID: <YWxA1nyTdFbwFD4N@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20211015095541.3611223-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QU/iwWlS8CwwXil6"
Content-Disposition: inline
In-Reply-To: <20211015095541.3611223-1-yangyingliang@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QU/iwWlS8CwwXil6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> In error path after calling i2c_dev_set_name(), the put_device()
> should be used to give up the device reference, then the name
> allocated in dev_set_name() will be freed in kobject_cleanup().

I don't see it. dev_set_name does not call device_get, so why should we
call device_put on failure? No other user of dev_set_name seems to do
this. So, if this is an imbalance, where does the unmatched get_device
really come from?

>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/i2c/i2c-core-base.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 54964fbe3f03..190d4fd5e594 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1047,8 +1047,6 @@ i2c_new_client_device(struct i2c_adapter *adap, str=
uct i2c_board_info const *inf
>  	client->dev.of_node =3D of_node_get(info->of_node);
>  	client->dev.fwnode =3D info->fwnode;
> =20
> -	i2c_dev_set_name(adap, client, info);
> -
>  	if (info->swnode) {
>  		status =3D device_add_software_node(&client->dev, info->swnode);
>  		if (status) {
> @@ -1059,17 +1057,20 @@ i2c_new_client_device(struct i2c_adapter *adap, s=
truct i2c_board_info const *inf
>  		}
>  	}
> =20
> +	i2c_dev_set_name(adap, client, info);
>  	status =3D device_register(&client->dev);
> -	if (status)
> -		goto out_remove_swnode;
> +	if (status) {
> +		device_remove_software_node(&client->dev);
> +		of_node_put(info->of_node);
> +		put_device(&client->dev);
> +		return ERR_PTR(status);
> +	}
> =20
>  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
>  		client->name, dev_name(&client->dev));
> =20
>  	return client;
> =20
> -out_remove_swnode:
> -	device_remove_software_node(&client->dev);
>  out_err_put_of_node:
>  	of_node_put(info->of_node);
>  out_err:
> --=20
> 2.25.1
>=20

--QU/iwWlS8CwwXil6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFsQNIACgkQFA3kzBSg
Kbbd4w//Qs1pHbM/qY2Ll7hRxFMvEbAN3H5n/7HjEKk0mp+M03ZRfN/FwjaZrQex
FlsqfhGgJi4MA+ba4uV8mazCb5h7j6aXAT/BdEhaotjmNGoU3lmB5GGHNwyDO6Qv
CgCY/jLUUItiS+oa8rA20Wsyw4ayspuV1PjvirRsnWXptkaCRs/2OqfvVR9sO6k1
lVDRoLlDoojyg1xUCpgnh58BuX5FK9p85QhIPKXfvy4MrJZsLMqEVJuVICkLDx8p
2QCO5qRez1FMSCZ7mtYmQJKrLWAecIXixaglW3YUyt8SQyOnLYGyjc7ihstHErQz
fr5h6/tW2ll22ePe6C8Wge7vOHag48HFgKWXS61aEdoCyFXHBveExm5yOtY2po5p
3iSXqbBjHsnT3RpQBOFf8n52zvBDnPhpenPLF/e6vCSELh/6K4Z+v4QLeSRn4DYE
myb+QmyxRJAyINGAVEGP6f1gX+10imIyoQUqLNfwghsEyy3RAaWAzfxmc6dhHyE7
Z5U2ryEcQkjUHJNQ2SQ7jM/6HCZkkWyIwfOFBYJtI+u++dQfB+We6TXhlnpALVVK
QmG+x+W6qPB92imD6Ni2HFKFWyhiZzwhFmkL4hv5AHCxX3cBADeDfvd6aV3vQfmG
He/IMWOo1lDs4JD0TQOsyhm+6OwiusSFn54nUI6ncRPki/rIklg=
=Vos8
-----END PGP SIGNATURE-----

--QU/iwWlS8CwwXil6--
