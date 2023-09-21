Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587E27A9E8C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 22:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjIUUDI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 16:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjIUUCg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 16:02:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560E946A3
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 10:22:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367EAC4936D;
        Thu, 21 Sep 2023 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695287091;
        bh=7LjO4Oger0AIPke+jbBFoJx+i4p3im7EqI2ESrJrdK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TRQy5TvKoCL+kwOK3jCcTOyC4YgEHNTL5MwsUxGWnkxcnCO8yG1ryfzJlBT932wRL
         42xDgEvxqhLxgtk/bnBfJAiytxjrkU0xVxc2d+8unoHhTuAeIse3u6kE3S0ILRgUzI
         rHa1TUY8heF5Ij19nUCm4Wvwn6/i2BHyI5n2o4z2G+IWswK2ZTiHb1HESTh3F+LDNE
         S06AlBUEa1AOSO1IEUV6+zmUm8ktF2bpkKr5mT3s6FrUTb3uB85pGG2pdsH9wmbVBm
         ci74kDVacF8iMao0ReHHKD40cQvA5iOKJ2znkO6nAw/hb+ch5IirYg8E1cmoJbWq/I
         5jQzIUmaP6/1A==
Date:   Thu, 21 Sep 2023 11:04:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Liang He <windhl@126.com>
Cc:     peter.korsgaard@barco.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, evgreen@chromium.org
Subject: Re: [PATCH] i2c: mux: gpio: Add missing fwnode_handle_put()
Message-ID: <ZQwHMJKbG3xQl/FH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, Liang He <windhl@126.com>,
        peter.korsgaard@barco.com, peda@axentia.se,
        linux-i2c@vger.kernel.org, evgreen@chromium.org
References: <20230322042951.1857247-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OKYPqkLiQ/XlQSf/"
Content-Disposition: inline
In-Reply-To: <20230322042951.1857247-1-windhl@126.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OKYPqkLiQ/XlQSf/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:29:51PM +0800, Liang He wrote:
> In i2c_mux_gpio_probe_fw(), we should add fwnode_handle_put()
> when break out of the iteration device_for_each_child_node()
> as it will automatically increase and decrease the refcounter.
>=20
> Fixes: 98b2b712bc85 ("i2c: i2c-mux-gpio: Enable this driver in ACPI land")
> Signed-off-by: Liang He <windhl@126.com>

Applied to for-current, thanks!


--OKYPqkLiQ/XlQSf/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUMBywACgkQFA3kzBSg
Kba8dA/9HwUQKNhfn4n+wF6ZU4Wgnzcyc6jXJ9+zbYmFhRpEhqR1CtSyIok9PeU9
fhnKw3cpwiNCJgcbjiiCeIHCGjAFzMhIkM0WELd/yvFL0dF3GILGOodJ8ifub+5G
2XcFFyykNC7gupIAzhyZO3sMEy43ln60AYRUqZPGI/vs9FsiYeEdeRrnfauyPCZW
nh2kFIxMb9UYbreNLWWEjIwFxUINpnsawqQ3n+Yq8vHtK1uo/yRoWN0CLmmVJ7LA
QdJnUwbtvYcnUAJODbviJ7ZmkXDgUJ0oAhIj6DNb7/0ekD9CLuspV+Fq5N6qwB8O
KV+XLsRPUaOIG9EeoCgFCZEmMc/Y//KKNUAkQHcxplEeOaZOZBauRUlMXr1jnP+s
4cLlrrO2XP08e6sEs8cg00oP0yy0FAELE5ex2yN5pflNnOY2araeMkkxODHo5cn1
u/u8LVcD7WWkmIc3sqTLyyFcTgQCIs5snK2Stf63p05UHL86pXStglp+byg1HBdb
1ZSHamMUaWFy7Ei3tWttRt42l8BLdFzg6z5Zpah5hi2qL5+YEsAOy5Xm/3oauDdx
OFu/Y/d6hpD073GLcSszJtiuaz6Ba836sDDbCgmg5WDzIE7gEvEBwBJ5BZmxPjOU
4io/pW/gIF9isGPUHiFv7Zs/AYC9K9tOJFg5LHQTdGnPTHUk2lk=
=tG5y
-----END PGP SIGNATURE-----

--OKYPqkLiQ/XlQSf/--
