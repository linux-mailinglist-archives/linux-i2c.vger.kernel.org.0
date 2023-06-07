Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A182F725B78
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 12:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbjFGKUe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 06:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239450AbjFGKUY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 06:20:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4464E1BDC;
        Wed,  7 Jun 2023 03:20:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E20E630F2;
        Wed,  7 Jun 2023 10:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF91C433D2;
        Wed,  7 Jun 2023 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686133221;
        bh=b3vSbHeHOJIjqYkB+PfhGhloojhkLAsRq5fFqo+8tk4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=chpQ8hLtAOxT3tgcGQy8V6VnJUefzDl3+Cl15vWHuIl/k/lfIR9txDlTQCZptx9FF
         DykUwYpzH7baVwlhBKhtVNPBqjduj/J1R4c6MeT7W4VZBliMzBEDkxvPdoVFGv/kTZ
         qzXassjfIcYkjIIu0SAOWnNqX1JWq70LF7nGZZkrZC0d8vUcSzq9/SacXMAigfCYdI
         U6zbiUaZoALeru9LyjvUB+rWYwMoPYKnspqwTDdDlwEULnCQGm3ot2zca1I+EEapc1
         BK5Myc6lVu67sjaGhd678/7uSnEl3N7EbwO+5aHAoFDZC+ngmmTpNI9Lis4moCcdIg
         mChuIz5Bv7+QA==
Date:   Wed, 7 Jun 2023 12:20:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: Add i2c_get_match_data()
Message-ID: <ZIBZ4RzFvLN368nQ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20230606130519.382304-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB592282658E36A14D0A762BBB8653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ArSYnhEy2YRLKnCd"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXekgea3biJXXNb3fa-8Fe3iUJ=K51jKnu9ew_+Fq69g@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ArSYnhEy2YRLKnCd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +const void *i2c_get_match_data(const struct i2c_client *client) {
> > +       struct device_driver *drv =3D client->dev.driver;
> > +       struct i2c_driver *driver =3D to_i2c_driver(drv);
> > +       const struct i2c_device_id *match;
> > +       const void *data;
> > +
> > +       data =3D device_get_match_data(&client->dev);
>=20
>     if (data)
>             return data;

I like Biju's version a tad more. Except for errors, and especially
within small functions, I think single exit points are easier to
understand.


--ArSYnhEy2YRLKnCd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSAWeEACgkQFA3kzBSg
KbbEPw/5AQWOxmhUDl5BM3hz0sVcfZBH780GCZPXC925lLHUj/gjfgkWYA7Pqv8w
A5bT/b8Z4Es3vQaKV7gtg+v6dniONQLfqV6icQpliRw22jds3gR6fLr3A59ithSp
Ga2Q3vvI9wihCXTt7Gwuht9eCABPRcIgFjbwdGjZuqSbB50w3hI0Ew+xeeq37+XK
duYymbgG6CoIDsK0SLxU7TB2AUGXLWrD8s41bXTAgZdg2ZUkvsbAZ9KzLPgWC4k7
UibDr831q997s39HIxlUD2eB7FBdOlaXegxf0LaKqIbU0ib3bOLUTiHyfOVA61av
uIq2ZqpAqV1pLfauSGZ297Ry9N9RZ9w8n9gmDrz+jnS8ZCMdgVSqWzWVCCYAt/sY
9dTHTyNFEOshPsCEk6vDzz6UTeRBFTvjNd5a5bXOG+ZjvnOYjXbwwq5g7voEti0o
3bozVaQ0CwJgtb0WWboXMjr56KWBnm3abjYmiUoidwyARETjeI9WjRC1YbyjMV7x
OOAlVf97oplJZb/F/3k8PVwJcKuF5gFnO2aMJg2+llCqu7lxtPFPFOH9Uiltv5yr
hyVVvdA4XwF5CRuJV7iZToK8vtQn/elFSPw0uXg0033I1nIWej7WObo/cj3v5XOy
6GKvNrlFGLNdHM6pXgk/jh9eiVmNSiGhpEXn+ROc6xOtOEEvCQk=
=TxIj
-----END PGP SIGNATURE-----

--ArSYnhEy2YRLKnCd--
