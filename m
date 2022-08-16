Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB565959EC
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 13:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbiHPLYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 07:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbiHPLYH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 07:24:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D4D5A82E
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 03:38:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9DD560FAD
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 10:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912A4C433D6;
        Tue, 16 Aug 2022 10:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660646290;
        bh=imlLoYsRKo4fQyRnMRawLoG1N2SfaghYxi/Cj4YlqS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q6f5Gv5de8B0sXgRKyM15E2SMC/FtLQh4KjpAOBatSHSc3ItmL1yE50QXyyx3TWgV
         jP/8ywxU6PbemjyZqWJN7RG6F1h1ouJeXdSF10GDxy+0o3ABhka9Jva+KgA0RcidAw
         hqfZ6mmA6CjlXVgrMdYtuFJxOGfWAqI0jOhT5PkC6M/9cDCiBMHomzJOFWpO9jhfkQ
         DXqpzf7yywaIzdtjdFR3Tq4PMnd+db7+AaIhzYm57/VMn1Iq6vItSrcjMrzGvxuksC
         BB5r7wqo+pQMqxfVNcylXyWw1nlB5NhRHLOh646+38KvV1fEzQeEnK/8Z2E5bwsL4S
         MYC/bd5ETrIVg==
Date:   Tue, 16 Aug 2022 12:38:06 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 3/6] leds: lm3601x: Don't use mutex after it was
 destroyed
Message-ID: <YvtzjqL3KhmkVuVr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="waE2WTf9LbpCwGAE"
Content-Disposition: inline
In-Reply-To: <20220815080230.37408-4-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--waE2WTf9LbpCwGAE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 10:02:27AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The mutex might still be in use until the devm cleanup callback
> devm_led_classdev_flash_release() is called. This only happens some time
> after lm3601x_remove() completed.
>=20
> Fixes: e63a744871a3 ("leds: lm3601x: Convert class registration to device=
 managed")
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Applied to an immutable branch, thanks!

--waE2WTf9LbpCwGAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL7c44ACgkQFA3kzBSg
KbbJ1RAAtVyhQFQ13Dv/Yt0oI2qePlySnIEsh+RSusGVm44D06tU5ByxfbHfDD1b
SXqZelglG71yp/AHv+X2tFATak+tkMS7NjMjJmwVnuiZftHvAsbFA9xfbPWVJX7T
IqQfCOp7PAVmqIPUCDj0iDj4satnTDw+5+EXzaDYbjgj0AyMTNEutE8gmIsnzljM
9a9jsaXDYYPV9fJ2yqCCLe+MiroWtZyS8nWvZUsdvNRSJjBgHex0Gy0RCRvAgK1/
TWcQMFImGP/8zJSruCS3sPuh13nQ6cpQBjlw9fVD022K+kTPiZMORqmgXV+p8K7N
/yxgC9qaI/Sf9LvHJ5VnTvN5YU1/jUZd51sSJ/P2z5mlYZuG3I9Q5rPZrA3YrQC9
PWR4BxOPkv1DDkOH+v2KJYPAM3mXxX8HU4S75EiZsmY7IsJtyMbKr6gEBqWmLo6J
vuLvX/LVlMUSnuHCenWT65PF8boZoHdRxZcOCdBjcGwVSrH1wf4pQ9vOzkeu16tc
PCJLzx+ZArc51lbereRLVdG6ZkR8/iHaZKtYJeVlrBu1koIir1y/Cb0TaAVAO7KX
VClg1PoRPkCGZTPVgAebklLOUuO8djAL9FjXEBksjin8l0s1o1+bR8edljmplzU2
jPMR8JczKDwBWYnRYLWjgoDHch4B52FjPIcOiXQo+ulr4CGJqP0=
=i4sZ
-----END PGP SIGNATURE-----

--waE2WTf9LbpCwGAE--
