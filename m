Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1473186444
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Mar 2020 05:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgCPEyx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Mar 2020 00:54:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38676 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbgCPEyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Mar 2020 00:54:53 -0400
Received: by mail-pf1-f193.google.com with SMTP id z5so9240202pfn.5
        for <linux-i2c@vger.kernel.org>; Sun, 15 Mar 2020 21:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9Z2+6iLDWp3RJ4bB7RGT/0cC1cQYDTuNcNrDo7JamCQ=;
        b=apEifhWq0eZLVwBL5SvekwukLGJ344J427itKTRvYFQjR0hu1vxOScBeormiSGE6AZ
         9wrcRtLTmZKmkvbdlZbJzdZxaXnNNrLTZXcXE6FYkCJccZks0TC8yWQuBojQNLd4f7aa
         bQcqzBaAwpWtfsQZTQDKRzOzug8RFYsXJ0wJbyiG5NVhwcYs4ypQYKfI3gKa2KBkGpLk
         Q9PlPZSrbgBtJZqVfMaQr7nJ02/ECeelcLTJYnfnLoGkUWaKhGYroEZEHLQzWbYM870u
         FJQK3DSFT/YazLpQZ1zxpQIzCaiYCCyV88mDXb+8cl8tcR57tH3OrXWJVjVc1FHj0+9q
         /DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Z2+6iLDWp3RJ4bB7RGT/0cC1cQYDTuNcNrDo7JamCQ=;
        b=GD/lMHoP5zyyFN4q3ytoZERuOaGSFo5HkPXrprDUuAb7fTp4gDSs+Rb3eOZ/5Q6tpa
         ByuUC1ba6WlqG/BQ21oDA2LpuTxI8PgNo63KN07HCQ0lGNcxxzSLCC0Bw+szyyY2c5XO
         M9SpPgXoD16keqOCLgPlNOT0FuxCCz5pdpSYvj9HPuhJQ6gjrDJMm1A6WbxQIws5/HIq
         I1oDyx29J6WwobmpFfZdYVgvmafL6bPXTncPvordK32QlNN8MtHNfTWKXbY5qfBvE+TL
         OOLDyo31X8ChHaUhUpBdSfGsG4S/oh7zctAsVd8PszE1qHODLR8KgNlyRqyMjIXtwKDw
         uEUg==
X-Gm-Message-State: ANhLgQ2GK2KFSrhtkPzM/5miqr5AShRDrPFAj73a9XKf0ksLgVxVEXcJ
        pHq0vrDNLmF2OlqOxMgi1qA=
X-Google-Smtp-Source: ADFU+vuEaZnhIRtOMoes2PtyJPmprreQakYA6spCyyTCIVml/D9Y29UUl5YwNyhaPWgNcDm8Vqq9oQ==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr117473pgb.241.1584334489998;
        Sun, 15 Mar 2020 21:54:49 -0700 (PDT)
Received: from pek-khao-d2.corp.ad.wrs.com (unknown-105-123.windriver.com. [147.11.105.123])
        by smtp.gmail.com with ESMTPSA id 6sm24424468pfx.69.2020.03.15.21.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 21:54:49 -0700 (PDT)
Date:   Mon, 16 Mar 2020 12:54:42 +0800
From:   Kevin Hao <haokexin@gmail.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: dev: Fix the race between the release of i2c_dev
 and cdev
Message-ID: <20200316045442.GA3585076@pek-khao-d2.corp.ad.wrs.com>
References: <20191011150014.28177-1-haokexin@gmail.com>
 <20191125193204.GA14257@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20191125193204.GA14257@kunai>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2019 at 08:32:04PM +0100, Wolfram Sang wrote:
> Hi Kevin,
>=20
> On Fri, Oct 11, 2019 at 11:00:14PM +0800, Kevin Hao wrote:
> > The struct cdev is embedded in the struct i2c_dev. In the current code,
> > we would free the i2c_dev struct directly in put_i2c_dev(), but the
> > cdev is manged by a kobject, and the release of it is not predictable.
> > So it is very possible that the i2c_dev is freed before the cdev is
> > entirely released. We can easily get the following call trace with
> > CONFIG_DEBUG_KOBJECT_RELEASE and CONFIG_DEBUG_OBJECTS_TIMERS enabled.
> >   ODEBUG: free active (active state 0) object type: timer_list hint: de=
layed_work_timer_fn+0x0/0x38
> >   WARNING: CPU: 19 PID: 1 at lib/debugobjects.c:325 debug_print_object+=
0xb0/0xf0
> >   Modules linked in:
> >   CPU: 19 PID: 1 Comm: swapper/0 Tainted: G        W         5.2.20-yoc=
to-standard+ #120
> >   Hardware name: Marvell OcteonTX CN96XX board (DT)
> >   pstate: 80c00089 (Nzcv daIf +PAN +UAO)
> >   pc : debug_print_object+0xb0/0xf0
> >   lr : debug_print_object+0xb0/0xf0
> >   sp : ffff00001292f7d0
> >   x29: ffff00001292f7d0 x28: ffff800b82151788
> >   x27: 0000000000000001 x26: ffff800b892c0000
> >   x25: ffff0000124a2558 x24: 0000000000000000
> >   x23: ffff00001107a1d8 x22: ffff0000116b5088
> >   x21: ffff800bdc6afca8 x20: ffff000012471ae8
> >   x19: ffff00001168f2c8 x18: 0000000000000010
> >   x17: 00000000fd6f304b x16: 00000000ee79de43
> >   x15: ffff800bc0e80568 x14: 79616c6564203a74
> >   x13: 6e6968207473696c x12: 5f72656d6974203a
> >   x11: ffff0000113f0018 x10: 0000000000000000
> >   x9 : 000000000000001f x8 : 0000000000000000
> >   x7 : ffff0000101294cc x6 : 0000000000000000
> >   x5 : 0000000000000000 x4 : 0000000000000001
> >   x3 : 00000000ffffffff x2 : 0000000000000000
> >   x1 : 387fc15c8ec0f200 x0 : 0000000000000000
> >   Call trace:
> >    debug_print_object+0xb0/0xf0
> >    __debug_check_no_obj_freed+0x19c/0x228
> >    debug_check_no_obj_freed+0x1c/0x28
> >    kfree+0x250/0x440
> >    put_i2c_dev+0x68/0x78
> >    i2cdev_detach_adapter+0x60/0xc8
> >    i2cdev_notifier_call+0x3c/0x70
> >    notifier_call_chain+0x8c/0xe8
> >    blocking_notifier_call_chain+0x64/0x88
> >    device_del+0x74/0x380
> >    device_unregister+0x54/0x78
> >    i2c_del_adapter+0x278/0x2d0
> >    unittest_i2c_bus_remove+0x3c/0x80
> >    platform_drv_remove+0x30/0x50
> >    device_release_driver_internal+0xf4/0x1c0
> >    driver_detach+0x58/0xa0
> >    bus_remove_driver+0x84/0xd8
> >    driver_unregister+0x34/0x60
> >    platform_driver_unregister+0x20/0x30
> >    of_unittest_overlay+0x8d4/0xbe0
> >    of_unittest+0xae8/0xb3c
> >    do_one_initcall+0xac/0x450
> >    do_initcall_level+0x208/0x224
> >    kernel_init_freeable+0x2d8/0x36c
> >    kernel_init+0x18/0x108
> >    ret_from_fork+0x10/0x1c
> >   irq event stamp: 3934661
> >   hardirqs last  enabled at (3934661): [<ffff00001009fa04>] debug_excep=
tion_exit+0x4c/0x58
> >   hardirqs last disabled at (3934660): [<ffff00001009fb14>] debug_excep=
tion_enter+0xa4/0xe0
> >   softirqs last  enabled at (3934654): [<ffff000010081d94>] __do_softir=
q+0x46c/0x628
> >   softirqs last disabled at (3934649): [<ffff0000100b4a1c>] irq_exit+0x=
104/0x118
> >=20
> > This is a common issue when using cdev embedded in a struct.
> > Fortunately, we already have a mechanism to solve this kind of issue.
> > Please see commit 233ed09d7fda ("chardev: add helper function to
> > register char devs with a struct device") for more detail.
> >=20
> > In this patch, we choose to embed the struct device into the i2c_dev,
> > and use the API provided by the commit 233ed09d7fda to make sure that
> > the release of i2c_dev and cdev are in sequence.
> >=20
> > Signed-off-by: Kevin Hao <haokexin@gmail.com>
>=20
> Very good patch description! Thank you for the patch, lifecycle issues
> are subtle, so I am looking forward to get this fixed.
>=20
> The patch looks good to me, sadly I didn't have the time to test it
> properly yet. If other people could give their Tested-by or Rev-by, then
> I'll try to bring it into v5.5. Otherwise it will get priority for 5.6.

Hi Wolfram,

It seems that this doesn't go to v5.6, do you still have any concerns about=
 this?

Thanks,
Kevin

>=20
> Kind regards,
>=20
>    Wolfram
>=20



--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAl5vBpIACgkQk1jtMN6u
sXEqNQf7Bu4v4WJ7jP7g0SeALS4iNDt3pem2YPDXweeUQw1fnJjXXuAJlDg169kF
syDKGoRRgo5UrbRY+QiPyHMkJb4Ew196RLFJCUnsH3Hl7TThharztoLV5gtyn5kz
/4R0REvHAGvsEFe6+qrWh9+wZFkZZLkJRDqQmj09+WYH5hn8nmkDdab+jgVEa+Hq
cqiHfbp8NmoLxQGWPpHBh3P3pQsSr1LdSTWiS3MYIEpOID+ho37UyNGkna+/B7vq
IugBP3BgejZON47fTewSi52dmXVegD89Q/zsp3MhYKwJMOHGsZQXZg+TqIgGtpdN
7eSYZMFZm5A290sU9ZADTgHHlqpemQ==
=XK9m
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
