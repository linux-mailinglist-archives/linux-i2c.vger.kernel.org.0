Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5CB54BAE7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 21:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236643AbiFNTrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 15:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbiFNTrP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 15:47:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A122FE44;
        Tue, 14 Jun 2022 12:47:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B383F60C50;
        Tue, 14 Jun 2022 19:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40500C3411B;
        Tue, 14 Jun 2022 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655236034;
        bh=qFbuCIsfPpXMZRYImOgkSEy3pc68C6QdOwOGtnfSuZY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hz1EI71xTbivf2jzYogfVmqv1NKguvFYMNwVtFxA/dFGUpRqUyExHi/bSFAV/XFqL
         b4HNYptWKL8Ywii5tijk/KIIO7q+ul6MH0vsefZZ7+m/hI/3u5ZTLDGF1wRnA4dHbu
         TgYU+w3emhFEnpoa+4n2giGq/Zy2VwxJBX5rEn6CtRr+3D6fXHDY5AAwmq7O5mI8yK
         /dWWSClcXNLzc625i7AImQ6cHyBwmjj3KLuBfMDFpaAGa7rSDEfc9X+K3iaVcTCfYK
         TPdH/upM9laBok+yLvwbkb4rTCEKyozuWSbveo2EFjaq6by9mtY/B9pQNvBjHsIUj7
         Mo1dxJbrC1Q9A==
Date:   Tue, 14 Jun 2022 21:47:09 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     syzbot <syzbot+509a39149506f9c2fe34@syzkaller.appspotmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in i2c_put_adapter
Message-ID: <YqjlvenfDHjY0ziL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        syzbot <syzbot+509a39149506f9c2fe34@syzkaller.appspotmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <00000000000028ae8305db731533@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zjTmT/Y7l2VOuQa7"
Content-Disposition: inline
In-Reply-To: <00000000000028ae8305db731533@google.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zjTmT/Y7l2VOuQa7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hiya,

> syzbot found the following issue on:
>=20
> HEAD commit:    f022814633e1 Merge tag 'trace-v5.18-1' of git://git.kerne=
l..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10f37405700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8ca27d4f6e8fc=
fba
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D509a39149506f9c=
2fe34
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binuti=
ls for Debian) 2.35.2

We have now a patch under review fixing this.

Thanks,

   Wolfram


--zjTmT/Y7l2VOuQa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo5b0ACgkQFA3kzBSg
KbZsXhAAg++CjoEfhIs/SvR5oE9T1kCjPu15G/SDTgfS00rb3gldWUOjO2Apvrvb
ii10alQpc/Ey1/6He9WKJfe6/ydrJx/3fpA2c7HG6oDZbSRUjhFJ+yUv5zGw1eFB
djlnImL01nA6TA+dz6o9cVbJYu18PejkKh6uWWTe4naYih2r3u2YnSEKO6eWLe1d
iT6ukMPJM28Mkqbufh6LnuzFAoytO0gCx5YK0Rzysf+iP5m6U7PRWRo2LWjaWf9z
50aL4D5Y8PHc4FDv4T6t4L3LLwSN/OZvpgMDkylQ1fvJCouCk7HXPew0TFiVEEI9
0UOUncQHPSDVUfpYNOIl0JjC/jYfcuuJwXy7mBh8VrZsPY12zcmtdSEMTOMiyrHN
ZPDSWhl+Lb4a/1qiw+OhHXkFlrzHYFMLaDBcSfLFgjc2IEe9FHQVns8G5GIQMea1
R4DgdSd0f+JhSp4EjtZbqbmQW/mWovDSLvajOY7SoQQ64/8oshLQVDax+ABYbqZF
63gS+468zvjBo0yeDDM6DB86nvSKS8crDM4TIrsBG8Bf/CPYgcXsPheDnGMAW+ue
hU32DAd9UfrWBQW+c9Y7EtPBEay9k7YHoBkks0x04/kBYiwhueGgax+tKZYEAB/L
Fcqx0VMYdaknn2oxw+Tz7RjK3qsyaHw6YItT09lXKeNUgxCT+n8=
=Pnir
-----END PGP SIGNATURE-----

--zjTmT/Y7l2VOuQa7--
