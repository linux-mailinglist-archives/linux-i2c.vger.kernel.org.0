Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B878B834
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 21:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjH1TYp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 15:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbjH1TYi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 15:24:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1691411A;
        Mon, 28 Aug 2023 12:24:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9ECF064FE9;
        Mon, 28 Aug 2023 19:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82665C433C7;
        Mon, 28 Aug 2023 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693250673;
        bh=oO7Hnc8vjJIujNtucRloJMsZPg4jDEEzZi+T0wLOka4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tqruw12qT4a9cuifJ7lGZI49Lzmaftwq4BwYMR6D5rVbX9azYJW6weL908DXeNfoQ
         eIMijvNSmBAylNGy7xJmWtF/nELen6vpZaKUOfvU2XfNjuAd450HC2Ce0H+BpRdAMy
         4OTb0AYw2xjbTyx3GAUvPTKizEwFnkeAZmrUqy+zHMXu9E5HTv745Jl49hX5TfpyU5
         uyEGnqbxIHyagLp5BKBM78YahD0GjBmm9999GiGUA4uxfK4qDt4QOwNr6FZNgIS5Z1
         dKDy9mr6hUkqB5BNMf1bh1ETWgWG8XoJtoUhp6+NoEKyUDXx7NBYVscL7OuZfmC01t
         OO1zwHEtOIABQ==
Date:   Mon, 28 Aug 2023 21:24:30 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, kfting@nuvoton.com,
        broonie@kernel.org, linus.walleij@linaro.org, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
Subject: Re: [PATCH v10 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZOz0bgJUZuAcUBWf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
References: <1693091643-20867-1-git-send-email-wentong.wu@intel.com>
 <1693091643-20867-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JghyezFaQDHryAZP"
Content-Disposition: inline
In-Reply-To: <1693091643-20867-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JghyezFaQDHryAZP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

thank you for your patches!

=2E..

> +static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
> +			  enum ljca_xfer_type type)
> +{
> +	struct ljca_i2c_rw_packet *w_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> +	struct ljca_i2c_rw_packet *r_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> +	s16 rp_len;
> +	int ret;
> +
> +	w_packet->id =3D ljca_i2c->i2c_info->id;
> +	w_packet->len =3D cpu_to_le16(sizeof(*w_packet->data));
> +	w_packet->data[0] =3D (slave_addr << 1) | type;
> +
> +	ret =3D ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, w_packet,
> +			    struct_size(w_packet, data, 1), r_packet,
> +			    LJCA_I2C_BUF_SIZE);
> +	if (ret < 0 || ret < sizeof(*r_packet))
> +		return ret < 0 ? ret : -EIO;
> +
> +	rp_len =3D le16_to_cpu(r_packet->len);
> +	if (rp_len < 0 || r_packet->id !=3D w_packet->id) {
> +		dev_err(&ljca_i2c->adap.dev,
> +			"i2c start failed len: %d id: %d %d\n",
> +			rp_len, r_packet->id, w_packet->id);

All dev_err look more like dev_dbg to me. They are not helpful for the
regular user, I'd think.

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +

=2E..

> +static int ljca_i2c_pure_read(struct ljca_i2c_dev *ljca_i2c, u8 *data, u=
8 len)
> +{
> +	struct ljca_i2c_rw_packet *w_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> +	struct ljca_i2c_rw_packet *r_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> +	s16 rp_len;
> +	int ret;
> +
> +	if (len > LJCA_I2C_MAX_XFER_SIZE)
> +		return -EINVAL;

You can remove this check. You already have a quirk structure, so the
core will do it for you.

=2E..

> +static int ljca_i2c_pure_write(struct ljca_i2c_dev *ljca_i2c, u8 *data, =
u8 len)
> +{
> +	struct ljca_i2c_rw_packet *w_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
> +	struct ljca_i2c_rw_packet *r_packet =3D
> +			(struct ljca_i2c_rw_packet *)ljca_i2c->ibuf;
> +	s16 rplen;
> +	int ret;
> +
> +	if (len > LJCA_I2C_MAX_XFER_SIZE)
> +		return -EINVAL;

You can remove this check. You already have a quirk structure, so the
core will do it for you.

=2E..

> +static u32 ljca_i2c_func(struct i2c_adapter *adap)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}

Have you successfully tried SMBUS_QUICK (e.g. with scanning a bus with
'i2cdetect')?

=2E..
=20
> +static int ljca_i2c_probe(struct auxiliary_device *auxdev,
> +			  const struct auxiliary_device_id *aux_dev_id)
> +{
> +	struct ljca_client *ljca =3D auxiliary_dev_to_ljca_client(auxdev);
> +	struct ljca_i2c_dev *ljca_i2c;
> +	int ret;
> +
> +	ljca_i2c =3D devm_kzalloc(&auxdev->dev, sizeof(*ljca_i2c), GFP_KERNEL);
> +	if (!ljca_i2c)
> +		return -ENOMEM;
> +
> +	ljca_i2c->ljca =3D ljca;
> +	ljca_i2c->i2c_info =3D dev_get_platdata(&auxdev->dev);
> +
> +	ljca_i2c->adap.owner =3D THIS_MODULE;
> +	ljca_i2c->adap.class =3D I2C_CLASS_HWMON;

Just to make sure: you want class based instantiation here because you
have no other way of describing clients? I guess it makes sense for USB,
just wanted to ask.

Other than that, it looks good!

All the best,

   Wolfram


--JghyezFaQDHryAZP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTs9G0ACgkQFA3kzBSg
KbaXrhAAnD+ANaPFvZLW0bURxLj0iE/tsZJc9Cn+4yE719RBdzvLLg9rY2oCN4TU
pkft37jYRyjwTVG3V3ZpzMqjtKPAWTuREPUl20OfE1FojYQzk3dyiwx1yZRkEurW
LSd634QsdI49fdJv3WRzcxZsm4UgPXREkp6MpOONGx/yhDoWNc2VglmK5taXD/Mb
R/ug/oKuEEw+5ogpGDimHhY/kAvMaDmnjwke00yyeB+b0tp1ep49Jl9L8HzQm7HN
M1EWxYxtETFmanjs5ro1czyDBP88YyFzpv7HzU8KbO7qw0XWvRqwlcq3W1qyHjxQ
8P0w2I5A3ID6T2S2/BNYIYNAAljYWyCb4nNqNba8CcYm+qzoFdULDp5O9LR0wX/2
SDCRCHyB+0qf69tpd/ht9LyZp9LcunevDT1UiPEqLvRdEEJqlmFwIndSMhJ4SfsL
Wa8MOzZvF2z9DwGjQ/AgIfNBG4Kb1tBa9XSzd7EKEnCKtrRY45qHNCNqSWkpTDqi
7xpqBIJf/dKlMMuPUf86cAwQRQHnO3OvHgBb8Pn5V9skxU52ycOx3YxcLEgej4Qy
4aed5AKHDxvYRnB5AdnNnltcA0Bnkz/azawSBJZqjjvfk7wYW3Px9naXFU2eELuB
Sp/X4ggHCj7YbsO6qucShg5yBHtn8BxHawMxWJFH/dGMK25Ly/0=
=FryW
-----END PGP SIGNATURE-----

--JghyezFaQDHryAZP--
