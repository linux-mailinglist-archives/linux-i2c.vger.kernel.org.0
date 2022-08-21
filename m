Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D82059B2BE
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Aug 2022 10:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiHUIZB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Aug 2022 04:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiHUIZA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Aug 2022 04:25:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A6D13D2E
        for <linux-i2c@vger.kernel.org>; Sun, 21 Aug 2022 01:24:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A72BBB80BA7
        for <linux-i2c@vger.kernel.org>; Sun, 21 Aug 2022 08:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1FAC433D6;
        Sun, 21 Aug 2022 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661070297;
        bh=jnHMasxey6pNFCJHIYODwuBXRvS8fXUZZpuqaybvWGo=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=AFCamUsjPu2prdFaKrS4oreaOPCsugMuzA/Kd2dQCd2Lz25qE9bssMJI+Q0UH72wQ
         1F48OWlyYgXu/Noz3V+Dzcr28Z3vTqkCUXvJ4LfKEu4R5hk6TKZaOuuM/JWkTurUcZ
         Jjjabqb56xzbNuRPuAjwYCUmseHEm53WzfVjKPQYRsQywY1QldUVYYNZfQStPXluC5
         TRcT+ulXzc8qf2S8kF27WcyhvTzJhFpJg2KN+LcAJ+eyV/+0kKUab/cqzdotetkflP
         keQ0J9PhFY59e44FAAIGia4lKn+6z+/Y2c/8c3HReVNlWJj64Bc4+IoSFt6v1zf5U8
         8qU3G/Y00LSVg==
Date:   Sun, 21 Aug 2022 10:24:48 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Josef Johansson <josef@oderland.se>
Subject: Re: [PATCH] Revert "i2c: scmi: Replace open coded
 device_get_match_data()"
Message-ID: <YwHr0F2c/+I+l27V@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Josef Johansson <josef@oderland.se>
References: <20220818203113.1745-1-wsa@kernel.org>
 <YwB9p+q6rllB9KFF@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZeWFIx4bST6IGreB"
Content-Disposition: inline
In-Reply-To: <YwB9p+q6rllB9KFF@shikoro>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZeWFIx4bST6IGreB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Link: https://lore.kernel.org/r/4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@od=
erland.se
> > Signed-off-by: Wolfram Sang <wsa@kernel.org>
>=20
> Applied to for-current, thanks!

Added Reported-by tag from Josef, well deserved!


--ZeWFIx4bST6IGreB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMB680ACgkQFA3kzBSg
KbYp3RAAhyNJwK9K2UKwzCD/KKfo/3y3UWJiuLcuQl+LdAgI/tYxnSYAI07dVmLy
dvsnjizcSM3Da50omYc9yY2tOPYGOUtLeV4r5QRrA1J+B7QY55Bz0o/Yq30bXzSV
ng9ZuWMh5apKFY/jHlfDW1G8OE7IBPnd8Z5XmmPOuQEL9UhlBBrSWJgdfo2sPE6l
Fl7lPa+TauuJhsXjebrE0gLV6H3gKqJvIc7zFAVOU7C9sykeb2cc7X81u5PqVOHW
TiPJ9s7sodLNuT4bKkd9NXpCltlOM6eC6tfGM6se1YbldUWxwJaMMzrqElvlqEkj
5qFsiuqtfcI4HQY8gRWF0I4+DIKeU2E4idUcZH/8Me+25tWJwpcbfcAF3uyqB1k7
syRNYuxA1UbTkkXuFHfgdomXarmk1WM/LYcetCu+/45BySRskubWO0V79CKphUcv
A0mPi/T+Je37o6pgKdWfe6PZDgpH1oMeetw+YEoD71jJ3+AIRj426i+4MJHz+E5W
iyH3tZ4/6elUqPkH6nB1vUqmyHuEfEYPsXeGGN0zyLUF3CkmOOm8f8pleYfXpC6r
XbgUZHQA8wJcsnJgGQAumpxkFInaSu8a0ApFD8pmV8ko7bGy79UO7gAh80i2mA7t
zo4Bf5U0b0ruvvLi2jLIn6H6kLkp0gwjZ17HsHXb84Ihs/Hmpec=
=YQPF
-----END PGP SIGNATURE-----

--ZeWFIx4bST6IGreB--
