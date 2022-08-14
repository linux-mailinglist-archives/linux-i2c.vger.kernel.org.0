Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CAE591D47
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Aug 2022 02:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbiHNAdy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Aug 2022 20:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiHNAdw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Aug 2022 20:33:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 859B777541;
        Sat, 13 Aug 2022 17:33:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2C26DB80ADA;
        Sun, 14 Aug 2022 00:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12837C433D6;
        Sun, 14 Aug 2022 00:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660437228;
        bh=QB6Nmti1L+awDYgapfI17MdYzjDYMriPAv0Lbhq4ad8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DznQhNreK9Teei2r6n1/IVHtYtePKobHTp58hypocqsKWC17SqOlT+ggRmHCrPGxO
         BJN1htcOPIpyVDSHL1oKh1eAiirjNqHo7ohaStn2T+7/yVihw+CTsYIT+CLyQtIsSR
         q+8kvJNvtyQTDto3SOVUDsy20I6067WdGQr70aaaL8rFTlZMZVxfEfV6DG/CmW5+nH
         XJblJaxbGP6NVcgxC8fYEPC02V5ByRmx9XBEYIbr89z4ds2vPDVb342M7QYFttaxGe
         Vu6/VacIT++Gtgf0JzTeRXCSk5Q+aUuTDdpPUo3jeK/XOOsWtwFAVpjE+4u4X/GRMw
         IqMXVAuY5bjFQ==
Date:   Sun, 14 Aug 2022 02:33:40 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Julia Lawall <julia.lawall@inria.fr>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
Message-ID: <YvhC5Orb+JeZFDEO@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Julia Lawall <julia.lawall@inria.fr>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
References: <YvfGY2qnl2YXrUgX@shikoro>
 <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uB+JR5ek71zdC9Wb"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGmhaE-Y8GqWKPtWYOi=bOarFgo7UkzHNoOVEKnkXXrQ@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--uB+JR5ek71zdC9Wb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>  (b) auto-convert (with a coccinelle script) all the 'strlcpy()' users
> that don't care about the return value, and leave a few broken users
> of strlcpy around
>=20
> I think (b) is the simpler thing, but I have no idea how to write a
> coccinelle patch that basically does "if return value of strlcpy is
> not used, convert the strlcpy to a strscpy".

That shouldn't be hard. I'll give it a try tomorrow.


--uB+JR5ek71zdC9Wb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmL4QuAACgkQFA3kzBSg
KbbYyA//WuigCTYDgAp7aKGcaVofA1eQe7h2iAA3Q5Jld2HLS00X4g7dYWqouoK4
Mv+kASr5sBQCqHyjDrsf4TzLUE7L/D4ZtHprRX/2C4sbEhsd/JxoubzuGxydXzOh
fa+nX8uWU01wGLryCb9RMxvRKGciQyOJNjsiRDoXlK40xkKNen/tLiXUvs8EvoFb
e3jgQ2LjaVy6zJY7pNZOgqn6H4gi2JVurvHwTjV37MF/WUrI2yDBq7cBL6smcP7N
4BvtsfDg9sxKeZaCbf0XukPfIbsKpt9v6ezBgzygQ4HLG+67FcIw+VQz+bX/XLxt
Y2hiWbc3Mm48lrbbSQKMsNme1R3AQyl3rJYmQNIqylqxvetdhTJQbvBnUL24wjb4
N7JACTwnq6f1nPGVqj1GdZI7h08JeyX7Wwl7fxR4j+KCwUX3NOUXLTNoYYnzasN8
5DoPShpLGtRpHzo0RTrohSNKWxuv+pQgO3xGdI7fJveci3HdcokEwKkMgYlIvngn
VCcSujkxAp4xcETKHy/xRsHQtKu+r02UaUD6k4+U4fnlQ5WHxg1mlReoXCFbKl33
I74SSFsnEfTrFt9o3G/YOl/tKO+Svni1bgpQhulbPI8AGhvR+iouxIuOzhj5w1bU
ZxvDdY0QIK11nvNdpqbJGD7ZqsR2r1KZ3hshjTz9ZC5itedXcvI=
=OGfg
-----END PGP SIGNATURE-----

--uB+JR5ek71zdC9Wb--
