Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2175E52FABF
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233819AbiEUK4q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 06:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiEUK4p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 06:56:45 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FB72E9FD
        for <linux-i2c@vger.kernel.org>; Sat, 21 May 2022 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Ug9KAilHZG3ngVihbf5BtyjUXT0+
        GuD7bTab0Yw8FtE=; b=RtY5f1TgsoXt0CQeARvVge3JQU88WQl2XzfZca8eeg6C
        MfXajeaUCb39EMaMMW/F2cwn3JB9ydR32Pa8bYXoWxm+K+vFiBnP19oIK2HH2VYK
        +daHuRTbw6JNjWLy/Ospa+KRitmpYA418fVaeyBL1Z4j6aplxxdfSMEe1Cw1KCs=
Received: (qmail 4129024 invoked from network); 21 May 2022 12:56:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 May 2022 12:56:39 +0200
X-UD-Smtp-Session: l3s3148p1@ACwZdoPfwrAgAwDtxwyXAGMY7IbT6g6m
Date:   Sat, 21 May 2022 12:56:38 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: rcar: use BIT macro consistently
Message-ID: <YojFZvCcodpKuWJY@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
 <20220520202918.17889-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0xjlV80opfeMfQda"
Content-Disposition: inline
In-Reply-To: <20220520202918.17889-2-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0xjlV80opfeMfQda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 20, 2022 at 10:29:16PM +0200, Wolfram Sang wrote:
> Easier to read and ensures proper types.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--0xjlV80opfeMfQda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIxWIACgkQFA3kzBSg
KbZgBw//ZyrN05MheZ0C0Cru8CfSuYAURUZ7pwX+U9VvdL2FNEIiKulydpeIuKXB
ZbpKnyn+q3Lruy7Wwoe/UC1LCD1MIrF9g7ZYSvf6l3ZDdZOOzTij0bb2YFpvT5wG
58dVeQLzxstdOU0r+0660C3zH0MjqfK+J8ZpGO8RYDPELFp9SjGffL8yzfY3xk5l
Wyty4Pb1wbj5gZKsk8cCA9awYzbF6/QBt8Z6oFAzzuGmAHXpbazLjm8NRi2Ee6qZ
ZK5Iq/cLxI3fremDMjZ6h434bg3ZAvG6OX2QCbtBLjwQxibH/REY4k5g93q6WtRg
WaUOLcz22luoiyEmj5IHvLE05lG1PRRa/zRiZwFNNpTYb0XVt/thOe0EFSY+90ha
45CPA2FSxlCEa40UxjKb2cVSvSlatWHVcsppVRGH/Id0ugqEtunkJ+MupEpjSLnS
CaRhDj/0fHNRR4LqJBqIDYiG2vaYXUFy88YmM0nDnYq3gFUmvfRGdOVA+OVMXNYn
fGI5bSib/8PbPQuYkR8K2xfcmLMdmlGGBNUUghGKzT4VkHi6HoWSMwLP2yXKWsYF
md3T7fqnIqtnRV4y3UVe1TVZZNd2ukW0jSHUW9XKXmPJtiH8uJZemDoW2g1S7uJW
mIqNgNlZklNmrf/xu261G/2ZLAQgT9LGtRNG9BtlJsbXc/ewE08=
=olOd
-----END PGP SIGNATURE-----

--0xjlV80opfeMfQda--
