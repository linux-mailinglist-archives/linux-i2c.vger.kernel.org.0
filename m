Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F987C0490
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 21:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbjJJT0V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 15:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343923AbjJJT0I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 15:26:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C120F1AB;
        Tue, 10 Oct 2023 12:25:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D001FC433C8;
        Tue, 10 Oct 2023 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696965954;
        bh=6aGhe1D5Wpj/8nF2yBk8kzHR/8H7Y4/7mQ/EMQzjmyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EOwfP2fov2jcIzLLP17wHLF+HmzM3aTpZLSBV39SGPOGCUVMLPfu/KPStQqQPTdI0
         jpU1qdXxy0odrCzyEmkl6iZdAepSOMBvejbxx/MaRbuOMA0j2PNWip+k16ymjKm3VJ
         /VezTXco3ori5AoHBTAqYE0BEJnCYCQemaNBxbD6IRANXhA5IFnHaHJemrO6cZ4bsD
         HUbP5lJ3Gb1hnhfbyQun7Eq42gyOco4Y5fLDWRtqDujKNwy98dJkjB4P7xtQbPap5N
         GhioGt8cD7+nyoF5EaurZmjJZ9Omn5jj9ivqXfZ5zhYCQbKjwP9ACNwrmfCN8xhg4U
         BMdGFdPFGRUMw==
Date:   Tue, 10 Oct 2023 21:25:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, oneukum@suse.com,
        andi.shyti@linux.intel.com, broonie@kernel.org,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/4] i2c: Add support for Intel LJCA USB I2C driver
Message-ID: <ZSWlPgSZi6uIxPGo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        oneukum@suse.com, andi.shyti@linux.intel.com, broonie@kernel.org,
        bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
 <1696833205-16716-3-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/TB0LcZbcuX4Yi1j"
Content-Disposition: inline
In-Reply-To: <1696833205-16716-3-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/TB0LcZbcuX4Yi1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 02:33:23PM +0800, Wentong Wu wrote:
> Implements the I2C function of Intel USB-I2C/GPIO/SPI adapter device
> named "La Jolla Cove Adapter" (LJCA). It communicate with LJCA I2C
> module with specific protocol through interfaces exported by LJCA
> USB driver.
>=20
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

I2C driver looks good. Waiting for the USB part to be applied.

Reviewed-by: Wolfram Sang <wsa@kernel.org>


--/TB0LcZbcuX4Yi1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUlpT4ACgkQFA3kzBSg
KbYxOxAAsDXYCq218NxgOF4H39GK+e75fDBqUtXaRoVRmMDuicJ7o2TgosOBATKp
28lDHoPzJRms2rspOSpYNREXtAIRXctqJk/74FgsxY9SsBnwoPaCN5CiQUutm3wM
PBkWYa4Z3fxm0wrh2xkyQ4a0l3aj18vviRaKOqrVnoiHleXPeyxPyVdD1q3gGlwy
b8PlFtn/bG2XwOWMs0YP8hnn0+GontIB2+JkgzMpZxZ5wZeL3vmxdAPGZYSUqMWt
0thfutaZjfOz0/0Chhm+3JyaUyziWtbdgRAGAI/jV5gq22hN89sKhQaFTBdMuSYo
de3ucneZivSjhGcHR4ABKGsisbn4tDQs6XRo5CkN/jbZH+FIWYuOTtux4gOJcAi7
hEPZdXmaL/1o7/usQWTXZY7D0241qrD5BYeyrQ9ljA5ME6UgNFlIhjGTucV6JxoM
5fXdS7F+HqkT+yWsZBll/FLWX6mrYnbK/brMpL9OGa/WUQt2WO6uoI3WAsYXW0uw
T5v3ldtvK0nYpPXoMiEp8P7hbzOZkn5J/1iaUpzisP5OkrAghl8Fa2FSlr3zcDRb
epIJQWOLi5MHQzEZT4XE0ub4yrRO+zFZTXmDiLmBGqxQcRPbPYCuVduh1OQ77hvX
puBFbTpnv5yKGMHAhRpfWOKwYGlX095XYfiuWkor6caGqM396wo=
=4737
-----END PGP SIGNATURE-----

--/TB0LcZbcuX4Yi1j--
