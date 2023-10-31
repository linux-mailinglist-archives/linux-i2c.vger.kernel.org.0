Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3C597DC643
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 07:08:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbjJaF5X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 01:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjJaF5U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 01:57:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62055F3;
        Mon, 30 Oct 2023 22:57:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9037C433C8;
        Tue, 31 Oct 2023 05:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698731502;
        bh=usZBYnTUk0ykhFBfCDC+Ys+GNSaorDPYEDFFej21gcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ze48Z+0o36Bku/J8nOeAZlOYuAz4YVnSUKmF2NsVopBjgrzidG8i8p+UFteYuVBiH
         XACMimUOEfiOhbrhEA7sS9RScMD+ryDRn1CHUsQFSNWYsnBdBeRS/Q57NLqTAkNEw7
         R9h46j49wtmmkNdHbfeTgS/+H8hAjTzIiSjxyRSymBY0ySSFi0lUHIfp2p79LP2tSw
         djPFuX4NPe9A6ct1zAt93/syJKb0b/a2yPHrPEJlH88deyveUCgUN3AzCuq2P118w6
         h5nesr/rdxeChHUt6Pr3vKJ0M+7nW6/GuzyOdIwzitFCQUF5lIIRWY74uoBk2ohi3z
         zMdlscfS8DziA==
Date:   Tue, 31 Oct 2023 06:51:39 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jan Bottorff <janb@os.amperecomputing.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: designware: Fix corrupted memory seen in the ISR
Message-ID: <ZUCV69icaJWd7AdH@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jan Bottorff <janb@os.amperecomputing.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Yann Sionneau <ysionneau@kalrayinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yann Sionneau <yann@sionneau.net>, Will Deacon <will@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <p7wl7fk4cdyhvw2mfsa6sfc7dhfls3foplmzwj6pzstargt2oh@33zuuznup2gq>
 <ZQq2cT+/QCenR5gx@shikoro>
 <ba6d4378-b646-4514-3a45-4b6c951fbb9c@kalrayinc.com>
 <9219ad29-b9a3-4f07-81b5-43b4b6d9d178@os.amperecomputing.com>
 <d65lwrkji3rvw6r4jdcumo4zu3hbu6zpv6xq73hw6hcshvhtkw@jvuohb3f3loo>
 <3a305e74-2235-47ab-8564-0c594f24dc0a@os.amperecomputing.com>
 <ZRSEntqne/1y1ozq@shikoro>
 <1d56ceef-6573-43b9-a050-124c341a0698@linux.intel.com>
 <ZTpLHZZYtd1WgBu6@ninjato>
 <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XdLib1UvTIhfJYpr"
Content-Disposition: inline
In-Reply-To: <ab57ba73-ce62-43fc-9cb1-d2db1bd13cd9@os.amperecomputing.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XdLib1UvTIhfJYpr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'm personally in camp #2, safety first, performance fine tuning later if
> needed. Latent missing barrier bugs are difficult and time consuming to
> find.

I agree.


--XdLib1UvTIhfJYpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVAleYACgkQFA3kzBSg
KbYSkxAAo9U4sKaI+WcpX2ADcoWfiegNRC4uydhD7ymON8sFdG9Op8XTAl2HXba9
5yeYGO5vEjBgVCS5mdsVb36eI59o22peU3cA4rrEOs1NXz2RLXLs6x/LzmtOP8XM
g7Pw0mo/UpwBANOMmRCCv2SqQmyVLQcmiVn5n4OkMviq4mAE06sAlQ9AlAkgytkj
wpWdlMm7ziy2oO22DJeYUHHuZXtU4EaPtCdP/3kUMkupA66oZRL+lB6Cx8Hymniq
EHQdWU2kNSdi7ABbPS8htvtJduj3rJ8gCzvqE/hw1DDaQRJpgOHa3cjAjTeDlI81
OAeHOQEa6JK+DgArQUUrTfMDbwwsyp1v+AO41k/LjTIN35z/cMJGjczRtL5MqGtY
CRND/ZV5Pti/ocaS06KAT8mKxhd63xqGtPO68MecTxbrY96PRraDvMr7vtzaTDoo
A3laoWWHS0ghMSyjOiZCArDX+uzRWwVa+hPu0o2iM4GbaHXGiMPSY9SOBQsjO5f3
sj+7eTcsrQcJAZYCV8B9FiFNLQeWS4Y+bcDM0o5f6ruEX8/NzjKQj6g4gR1V95un
ihgqux9pyM9kGh7hScZv4FcU6hrvU0MoUZnjIVn6CJYf4usnIVmHzEkE4s/UVnR/
ZTuU9mbig/wdvrK6HZE4GA24rW/z911NhAD8zTqSx2OlWHkBWNs=
=QJ8b
-----END PGP SIGNATURE-----

--XdLib1UvTIhfJYpr--
