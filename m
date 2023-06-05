Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A81347222CF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 12:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbjFEKBW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 06:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjFEKBV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 06:01:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0072FB0;
        Mon,  5 Jun 2023 03:01:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 587DB621FF;
        Mon,  5 Jun 2023 10:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296D3C433EF;
        Mon,  5 Jun 2023 10:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685959279;
        bh=Ko2/E0JsGtzyMh6s/bA2jB4gL89ymBC0HzbiqVmHm8w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qKEuPh4N/0E6ogaA6woi0DrSZ1lv0SM9st5Sx2wLBSaBsMSWGksFp4Rxd+BRCYYUc
         1xjIKXiTvGb4LtySanS31Xa4MMcBtyMX0Xyq0CWeIQtF03udr3txs+cTeDBweQgxpr
         HR0vPzRDqypovgd15wAqN4Rdf1GAn2/OuYda2Sg+Ai0q91scy1dWpb9rS5r3ACbAK7
         FtuJBZMC9J62st2x+FF8gQ84D/WWn3xSfEeCwIzE3XgQHu3+dE4BqDugqtAybTkU13
         OH9CstsjAixBAShG8g8q9ZJbJcJAA3x8v/1i/w4RaDF6DeYaPdrlqf5WKGOrarKeax
         uRMpS4SJTK1Pw==
Date:   Mon, 5 Jun 2023 12:01:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: Add i2c_get_match_data()
Message-ID: <ZH2ybOmr8fyWOtmg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230601171711.221430-1-biju.das.jz@bp.renesas.com>
 <ZH2p7iWYizLsxZ1g@shikoro>
 <OS0PR01MB5922300F70EF37359C53D646864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JLdzwM2xJGM2lKSf"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922300F70EF37359C53D646864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JLdzwM2xJGM2lKSf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> You mean like below?? The new helper function will do both I2C and DT-bas=
ed matching??
> const void *i2c_get_match_data(const struct i2c_client *client)
> {
> 	struct device_driver *drv =3D client->dev.driver;
> 	struct i2c_driver *driver =3D to_i2c_driver(drv);
> 	const struct i2c_device_id *match;
> 	const void *match_data;
>=20
> 	if (client->dev.of_node){
> 		match_data =3D of_device_get_match_data(&client->dev);
> 	} else {
> 	      match =3D i2c_match_id(driver->id_table, client);
> 	      if (!match)
> 		   return NULL;
> =09
> 		match_data =3D (const void *)match->driver_data;
> 	}
>=20
> 	return match_data;
> }
> EXPORT_SYMBOL(i2c_get_match_data);

Yes. Not good? I thought a function named 'i2c_get_match_data' should
get match_data and find out itself where it is coming from. No?


--JLdzwM2xJGM2lKSf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9smgACgkQFA3kzBSg
KbZ1axAAnycfYzZMFdOjqRJZWwFKa1tm3NNHuPwXyQDqvpWr9gXecq+dWhcFs+I9
Di7IBdnwQ9W5CDtXGigQtkL8qH1NGkrprESQ62z6hJVZUYfOjOL2d7PwZGFSho/v
2lnySROhI+Bt1wR2MqKbe8xxNurrFdnS/pCy2KI3qOfRJRQrNOpbBXraI4aJJuVJ
gb+X7bcs1SLFue3oGoFLC4+uqOLPZ87qzPBYml7jgsrXhktcye6J/vmAJ6OsNXfy
eC0gFs0SQaz4mTsB/VeWlywx8/iIY6NOwRH41epf1VlAtmfzmLyEPoHBP3NwMIdz
gGfk7PiskUMrEtBz6RREIZ4sU498+OBZI5qSX65h6a8rQDQOOPST3svDqJxBeear
r0V6MX/mgsnzR46c3NIDtLIeY88eHv/v6iN/0AIDUVfedEyp+X1Y0kv27pPMPNr6
wVLanIUH/dVfis4dlUW62JII7AzmRh9u8vt2fgOTW0xhyGNF+O/U/qUi/O0dq4FT
xKmP/B3cKK1RC1AWswJW3G1jvLvwi0gpnI29NH3yTIhiowBE94bG41QryIzCpx+h
dBD8vp/03f61MCPxt0KYD4mHcbXJLkytYUJuz9ecWOhBWB1sTJTeqSc5tlrwEUqC
xUnvvwhvCW0mPyUfyJPKqhCtWrTNFF2lnvfcuBq7uyicC2GSpw8=
=byry
-----END PGP SIGNATURE-----

--JLdzwM2xJGM2lKSf--
