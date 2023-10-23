Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EDD7D3AAE
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 17:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbjJWP0X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 11:26:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWP0W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 11:26:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4157793;
        Mon, 23 Oct 2023 08:26:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F46EC433C7;
        Mon, 23 Oct 2023 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698074779;
        bh=MUWfkAY6YNZNnR9Rk3h3FC500r24diJXi8qGt5DBCVw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DGJl7WJeNjFOzAWvcLZJgiFrY6+i5L3c/Tf8tL4CgtMldYVXHsjGmpWMdiwzlwnMK
         Xdkyk+cGTLrj4FL/fa/SYMarzia+yw8/gjeyzC/62QiaSkTBGpbfmkgIGGzwDQIqLQ
         Yxd15ykwhW94vdOU42pZvGf4fET+W0nJhuUni0BpR3H8xg73pOVzS4zvztFneDrLR4
         kW5mWmR6HgGlH7FzC4nVlULi72+yDMLTRA4PsqwI/ZLNIZMwQMKayCCLhQhtNArAe3
         6nlhFnK+/bIVG4jC9riUy/YWp7lh/BSS+wnM6JGO8wk3s7MXOgFSBozUIUNNrMAeXP
         TF5nNlYVxWEYQ==
Date:   Mon, 23 Oct 2023 17:26:16 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: fix memleak in i2c_new_client_device()
Message-ID: <ZTaQmK2omo6XWbg2@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230929091952.19957-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l5HgbAzMGwyq4s6P"
Content-Disposition: inline
In-Reply-To: <20230929091952.19957-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--l5HgbAzMGwyq4s6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 11:19:52AM +0200, Wolfram Sang wrote:
> Yang Yingliang reported a memleak:
> =3D=3D=3D
>=20
> I got memory leak as follows when doing fault injection test:
>=20
> unreferenced object 0xffff888014aec078 (size 8):
>   comm "xrun", pid 356, jiffies 4294910619 (age 16.332s)
>   hex dump (first 8 bytes):
>     31 2d 30 30 31 63 00 00                          1-001c..
>   backtrace:
>     [<00000000eb56c0a9>] __kmalloc_track_caller+0x1a6/0x300
>     [<000000000b220ea3>] kvasprintf+0xad/0x140
>     [<00000000b83203e5>] kvasprintf_const+0x62/0x190
>     [<000000002a5eab37>] kobject_set_name_vargs+0x56/0x140
>     [<00000000300ac279>] dev_set_name+0xb0/0xe0
>     [<00000000b66ebd6f>] i2c_new_client_device+0x7e4/0x9a0
>=20
> If device_register() returns error in i2c_new_client_device(),
> the name allocated by i2c_dev_set_name() need be freed. As
> comment of device_register() says, it should use put_device()
> to give up the reference in the error path.
>=20
> =3D=3D=3D
> I think this solution is less intrusive and more robust than he
> originally proposed solutions, though.
>=20
> Reported-by: Yang Yingliang <yangyingliang@huawei.com>
> Closes: http://patchwork.ozlabs.org/project/linux-i2c/patch/2022112408544=
8.3620240-1-yangyingliang@huawei.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--l5HgbAzMGwyq4s6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU2kJgACgkQFA3kzBSg
KbZeFxAAtaw5Gxe+6T4y2k0dRd0xpmykFob/LvLad0tktcxTXTICU0Os1UyzgaNh
Z/oYCy1AXGDchAVqYdwmwANfH3jRPwaC0cnR1VkhAXkRgZCOBYWjmp9LMpb5lwIy
6ERm4BYm3hXAervo2hBVxf13bQlz8NbR7W5tbnhbh0lS1UOsco099zBnl7vQQ4MT
UC1AI4NSfoPSgHJyurgOWhETCsycsLU0OG6jXo2ITiZJ+8Ui4RCQ2piHNp+SBLhF
Sy8wgYgOOYqYdoP7v+Jx3H56tfYGROCjz5u3o+/Tbq0hHTsiBjC+LDioKlvjia/x
MhPZifBkSa2chisIrjoYs+iRfDfoLKsjav8UxKxRD4RWFZIPTjTkYyeRD/T/5FAT
ZbLP9ShTcGOAq08iP53OeqHiGNBCtILB13PxIvJSuorJp/l0eDZU4fgZoTwwhEOv
gWVfghR7/NY1EgBKsDZzBg3sS7mzGqIc0Hy5w+hPIIH6BwbpYm/IXbnmB1Qd8gjW
b/0sDloNoYg4ZLgcx7+n/PaE3uvBjK0Se+SeMASFsBKnasXLjelyefwElhIOWTa1
EP1yCXCPUFcHSJ+N6K5xT3rB22SQP6FEjU8rfg/V7dKqtkebmVJr+Ie/gGgZKLou
boWQaSBd7M2QpiPFzQZinOnZZZIrhalx1S6dz4o/7gEsrt8fZlM=
=Riax
-----END PGP SIGNATURE-----

--l5HgbAzMGwyq4s6P--
