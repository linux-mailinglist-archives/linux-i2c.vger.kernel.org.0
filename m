Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243DF78623A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 23:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjHWVVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 17:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232359AbjHWVVO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 17:21:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A411728;
        Wed, 23 Aug 2023 14:20:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 139CD6347C;
        Wed, 23 Aug 2023 21:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A609C433C8;
        Wed, 23 Aug 2023 21:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692825622;
        bh=nI2OhOTb1Qgbc6HkfkkxCJRA1rkPKJZ6GYyJIF0MLi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASWqsq/ibrWBtDSg/O9H1EqcUOKsVqZkpoOgz/yAk+q/cUMuhNBYYXH6Y72jHv7Tf
         +dqZpSxT5gUInuUTkxkjS5UjKoCPu6UlLUrti+PLlSKSiRnlq8Kr24/DRYkKGJS3Uq
         KmfQk8TontWl2O6YbdOt/qRdbUSi+cTTGpHziNpxvqtu9/gL6ohbLgs8Tft5pHkbpR
         ShnuVgWjZIuAXlBvhvl9AJV7Q4rc/XKft7goa+zgZdlGHt4bqarMIn6R3oFk0MAA25
         /byZ+tJfUyQaf9FxyAjNy6gVdOL22kI0RVej+zEXirvL7OeFLyFw/3HQ/SDDKweYxJ
         mBpo+RUcjj8+A==
Date:   Wed, 23 Aug 2023 23:20:18 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 4/4] i2c: muxes: pca954x: Add regulator support
Message-ID: <ZOZ4Es6inxxC/1+Q@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-5-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ccRFqxw5gulr/hp0"
Content-Disposition: inline
In-Reply-To: <20230817071056.2125679-5-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ccRFqxw5gulr/hp0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 09:10:53AM +0200, Patrick Rudolph wrote:
> Add a vdd regulator and enable it for boards that have the
> mux powered off by default.
>=20
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

There is devm_regulator_get_enable() which maybe simplifies the code
here. But we can do this incrementally. Thank you for keeping at it!

Applied to for-next, thanks!


--ccRFqxw5gulr/hp0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmeBIACgkQFA3kzBSg
KbbqEg/7BraWaS+vBbXE9L/AX95Y0r0S/zjtbQrL4KxBIWElHWBUx7qoSqFmYTKx
m29MG7j5+zXloLOJm+ONt92fo8fCma+GV6YvtjxouzhuTOwlBA4Dwju+U+Li63fo
fKqFSeHMWeG3On5IjXxV+ccBGiyoGarO8ucWgf1IMuGctTapeaCp7DMK50Vh3MFk
CEGhy+Y2WgIQwQxviRtznj2iv0blrLAhvqY/20is2Pj4E4M/IVm8KiRTVBh+3ZNb
0w2jRQHHgozPlYFYnUJynQ57HX1sGNieIt8Lh3/nmTO+Z2zLBnTKDYPwbLFlnK4/
QekzrlfgpAcCpdkOqlQyG3Ydb07t7b/uw2xBz5sbd7yTxv6GoZdf11ahqgR8Wh/K
aswxCjDuBLduLUk312l3C0rQak6e4Ee4kk5zyios+5rkoLm0wWUZZrGjFH/9rXhk
sbab1sdJgVa9uhfAVJZ+L9cpVMC7ROmlTtiohLq8QggnyPRPJCa0AuJ9k29NJBkv
7gIevjQHeHvvYYABuSozc66tDgKZuK/lW0C4bAGthho2d7tnlmNmb4T4jLahdssN
90O8kPp2oNFj0XyhRLcKzUOzMZEgdfDW40WstmM75qS2bQI7AGiTZ6ve+cyN9iQO
6ZgKxqNCH9U60aJSPM/ugLoOwSkZzmq73mxnwpVlR4/yfyuIDdw=
=j2+o
-----END PGP SIGNATURE-----

--ccRFqxw5gulr/hp0--
