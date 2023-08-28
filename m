Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A1378A6A2
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 09:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjH1Hhn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 03:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbjH1HhN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 03:37:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6FBCC
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 00:37:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8B5E62F76
        for <linux-i2c@vger.kernel.org>; Mon, 28 Aug 2023 07:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA37BC433C7;
        Mon, 28 Aug 2023 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693208230;
        bh=qHeY0HopPO24zbqDOHchslSSm+an42hK4J3eN1odAfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UDlwE7i6/AucfRCqQKs2xHumCH1btmA1bEzd13oD5sOzmrlsqX5g/r8lYheSUEPud
         Bz0erUKtfndJren9tZxe3zz8PxkxQ5rkElVQvGxH/5JC8XJedVeOwQUXPJT5K/LKdm
         TbvqrBCNEO2/3RHys2jm4YnRQZ9czapGWwSyCffnFaPUI/Ey2LcA9wp2aYOeqjUSbq
         FlkOImCE5w2IQf3JugHCo9kjzwB80zPzZi3y8D/sgQnb0Iv6379U1LE0xIo2oIz6kl
         OJDnTCsoL6M+nW36oQwwE9MyDmupNz036gOBdpjxBTCg8kqt89mQ2EGZPwgnFTzFzF
         X26Sq+PZniDBA==
Date:   Mon, 28 Aug 2023 09:37:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Hans Hu <HansHu-oc@zhaoxin.com>
Cc:     andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
Subject: Re: [PATCH v2 1/2] i2c: wmt: split out i2c-viai2c-common.{c,h}
Message-ID: <ZOxOo+3j46gMmWaI@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Hans Hu <HansHu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org, cobechen@zhaoxin.com,
        TonyWWang@zhaoxin.com
References: <cover.1691999569.git.hanshu-oc@zhaoxin.com>
 <fdd2968e0ae028ce3d4cf389e4e2d55a4641c0d7.1691999569.git.hanshu-oc@zhaoxin.com>
 <ZOkI62MZee+3HR6n@shikoro>
 <744e7a46-066f-738f-69cc-9f2374be2fba@zhaoxin.com>
 <ZOw3+3njP/p8Ned5@ninjato>
 <fa22abcd-c100-c633-4625-5a2324e3337f@zhaoxin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+MG/ougYw74QpONF"
Content-Disposition: inline
In-Reply-To: <fa22abcd-c100-c633-4625-5a2324e3337f@zhaoxin.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+MG/ougYw74QpONF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> i2c-zhaoxin-objs:=3D i2c-viai2c-common.o i2c-zhaoxin-plt.o
> obj-$(CONFIG_I2C_ZHAOXIN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D i2c-zh=
aoxin.o

Yes, exactly!

> i2c-wmt-objs:=3D i2c-viai2c-common.o i2c-wmt-plt.o
> obj-$(CONFIG_I2C_WMT)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +=3D i2c-wmt.o
>=20
> But I'm not sure which way is more appropriate:
> change file name i2c-wmt.c to i2c-wmt-plt.c.(I prefer this)

I prefer this, too!

Thank you and happy hacking!


--+MG/ougYw74QpONF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTsTp8ACgkQFA3kzBSg
KbYPKg/8CEiQScs8hka6kaMQinhk59ycvL/yL1x1FTiBFwnaSWNUgqlMEwgr5jhw
jZ8fKcnMPXdNv+zEte3KKRaQnmfjl+puMXusHaQNGL+1ThsQmQOpOMV3NF4+n9Tw
CchuvaawQiN7LoiF5w7iyxNo9DxkKMkNYfIhYKeww/xuJLanoILj8yFKTsHi7Wwm
oEPRf9RF6RkTC/5HD++jXu5De8VRa2Kxb6PinkY0BhcOMmkiRiL1dgyuvKA+h06p
Qpkb4qCD9Bs0Bo5eFVV3+OJ8eWJlfbm+kA2/B6AgHJ9hKw8qhg2KIzIyVUp+me8I
UXu4tXaN5J0nEInVnvV4rr20ibceostzxarSczVM10LQOkHBGxNjCa4eH0H42QkG
lj1kEatGU67PTFQxRA3hCBX+0Kp+kMUyhSXW9WC5hd/Mk5ha03jvpvEP+0GN3LhD
bmVzm3QVCVvbwZzZcQGwiJr7qztrBCKD55yelV1WMBfih9laCM4L6exekb2GVGx2
VFVQrSxVBL06tw2w9N5VOxfe0QBcoR7/pblg6IAmtR7Cx+YAPQAOXMfo5I7zpx+d
UXEW9wv05k1QFRfsFjNYDpPO83DDthwQSm8NcSd8MTOhCAs7L/jt74qCezgxPWOk
toUo/jicoFsNzBHOEDZwr5EeemFy/86KdPTVcMllB45MXijry88=
=+Gal
-----END PGP SIGNATURE-----

--+MG/ougYw74QpONF--
