Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A57477B2E07
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 10:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjI2IlV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 04:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjI2IlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 04:41:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2981A8;
        Fri, 29 Sep 2023 01:41:19 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956BCC433C8;
        Fri, 29 Sep 2023 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695976879;
        bh=6tI6GpGFhOTZiIWcylA1AhrCzVR0BgdK+4RztK5pLi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aa5LXlJfvqf+lZEdlODQfYYyYKi57g4EvS0wKKoO8jsvbMQhklNodVvGQH/Ex0SCT
         /K6XG35O7QS4qLqxsb33lWJCtyXc4IIfNFb9wD9bo1/Wyqx+gZykSi6amOuDEsNBKC
         Z4WrMj1DYM9qndbLXDoW5qAu83q6i+URFet5maYvyjz3lSeVZ/PsMvgrnAU+M/jXho
         V+jsqyvHnNiYst7kWI8vMGAvnAca8bzoNptW8nN0oYzuETQXYMIxH5JsJPvT5CH8rr
         AZqWJ2LhXmC2MGcrWflEzwQCJQPRM1Ayf9W72jjAhx5QJJ9V1g7HkwdYKAK92wJcXU
         s3+WYevGWETPQ==
Date:   Fri, 29 Sep 2023 10:41:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     khali@linux-fr.org, gregkh@suse.de, lizeta1@huawei.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] i2c: core: Fix possible memleak in
 i2c_register_adapter()
Message-ID: <ZRaNrE3LZ/bl4OWZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Li Zetao <lizetao1@huawei.com>, khali@linux-fr.org, gregkh@suse.de,
        lizeta1@huawei.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230928012709.1247208-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="N52PRuWBL1vaUBvj"
Content-Disposition: inline
In-Reply-To: <20230928012709.1247208-1-lizetao1@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--N52PRuWBL1vaUBvj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 09:27:09AM +0800, Li Zetao wrote:
> There is a memory leak reported by kmemleak:
>=20
> unreferenced object 0xffff88818be6dcb8 (size 8):
>   comm "modprobe", pid 1022129, jiffies 4363911608 (age 43.838s)
>     hex dump (first 8 bytes):
>       69 32 63 2d 30 00 6b a5                          i2c-0.k.
>     backtrace:
>       [<ffffffff812f588f>] __kmem_cache_alloc_node+0x2cf/0x4b0
>       [<ffffffff81283c43>] __kmalloc_node_track_caller+0x53/0x140
>       [<ffffffff81604b0a>] kvasprintf+0x6a/0xd0
>       [<ffffffff81604be7>] kvasprintf_const+0x77/0xa0
>       [<ffffffff81a00173>] kobject_set_name_vargs+0x23/0x90
>       [<ffffffff817bf743>] dev_set_name+0x53/0x70
>       [<ffffffffa023ebb2>] i2c_register_adapter+0x112/0x6c0 [i2c_core]
>       [<ffffffffa023f268>] i2c_add_adapter+0x78/0xc0 [i2c_core]
>       [<ffffffffa0300182>] piix4_add_adapter+0x132/0x210 [i2c_piix4]
>       [<ffffffffa0300535>] piix4_probe+0x2d5/0x5f4 [i2c_piix4]
>       ...
>=20
> The root cause was traced to an error handing path in
> i2c_register_adapter() when device_register() fails. After
> calling dev_set_name() which called by i2c_register_adapter(),
> the put_device() should be used to give up the device reference
> in error handling path in order to free "kobj->name" alloced
> in dev_set_name().
>=20
> Fix it by calling put_device() when device_register() fails in
> i2c_register_adapter(). In addition, when i2c_adapter device
> is released, i2c_adapter_dev_release() is called, in which
> "dev_released" must be initialized, otherwise a kernel bug
> will be triggered.
>=20
> Fixes: b119c6c952a0 ("i2c: __must_check fixes (core drivers)")
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Applied to for-next, thanks!


--N52PRuWBL1vaUBvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUWjagACgkQFA3kzBSg
KbaNGg/9GEd3StwttDVwiwQMhnpF/G4aB1sdIvxeNWwPV0H2eSPYT+oe/BP3YtB5
NyY1MJZDtY7vGOxlb9OIb1wS00bMj+6i6mh8+h1Zxy88lKHZG9zrzegzJ/jEKh2R
Z+1r5d++NRQnuNTRm3bWqZP3x564Kmal8EkBaaHYEh5khKesWKmxxBu9wgDZfvBI
VQwa3n8XyA7lExRQeo2Sra+I8zWJeOls5P9Mr0HAYlnv2azJQ2VDDcq1omVON3s0
I/aWOHgAFqhpQzVZD3l/UyrhAs4DK/Aasl2iwaExglFRU2Eh9rBlSCuDGOlf4MxR
T6sT6VsNUeG/c7vv1FbM4VcH7CT+9hS2no8EG7QRryIvL2fexOXhrTs3qu7WoSfV
H836VJwMUwwRFYVunfMCrCRuVZ9VbWJAtABLlNGjzgTHzTBzhQgezO2I5ffPYz03
YCmzpvgQAhlYKJjqudWQJksfJAaKHwSbJ6n/abAWWWKT+ig9eUlskaLU248ZOLsV
2IjFwmSAqHfJ5br9a5xT76f61k03za5SDZTX7XMcwKXcLSdZHunYgmgRFHC3Qlca
GlhQP057BQ3vU10rEKzOBnq4aw8xBu8IwWIB+LeQ6RvTAKy1s25EH7CWKlaJlpfD
ktWhXDWg/of9DZLwfJxvPmwbHJbcsZ028eyw5dDigmoTJqGnPfw=
=1Cla
-----END PGP SIGNATURE-----

--N52PRuWBL1vaUBvj--
