Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399916B2F76
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 22:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjCIVT5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 16:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbjCIVT4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 16:19:56 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3CCF82BD
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 13:19:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C1DE0CE25AE
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 21:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6580DC433D2;
        Thu,  9 Mar 2023 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678396789;
        bh=VMs2NVbCakt1WiRcOCpHCZIptGHa9dsVhYX+/38neRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dpYgmPh2gcmYhmUKZqxbIxyC+BV693uteHPqjh4SRyhd7kRjmyDRsX5iqyoDBl7VS
         Ye5DCNtSTGYfgbYoEVmN9epIhDZc1+gr/I3wQNAUbWaVwrZZNGix/M2S+lep2b90Ec
         PdCBCMIE35q68zM4PFGfUooq+M3eCf8+9+BL87ZRJxifpE96bhwsQr2HhJzDYxmWZf
         fWBnBwhbxIgLQI8e84nF025EjnAEFVd3HB1X/+/SvkxPVjoh0Y2/S/MTPp2D4mxtL/
         n0yF+aRvWKG+WDoAbKsWB74VN44J5NbR4Z1L0XPE+FQanwCHUV1NQ13qt1fwLlqEzP
         Ew3cjYdYqNFUA==
Date:   Thu, 9 Mar 2023 22:19:46 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Message-ID: <ZApNcov1X+hV5a1s@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="szhEKSLSI9dEAK/4"
Content-Disposition: inline
In-Reply-To: <20230130153247.445027-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--szhEKSLSI9dEAK/4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 04:32:46PM +0100, Alexander Stein wrote:
> When start sending a new message clear the Rx & Tx buffer pointers in
> order to avoid using stale pointers.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Dong Aisheng, what do you think of these patches?

> ---
> I noticed an ambigous stack corruption once my rtc-pcf85063 driver probes.
>=20
> [    2.695684] Kernel panic - not syncing: stack-protector: Kernel stack =
is corrupted in: pcf85063_rtc_read_time+0x10/0x100
> [    2.706669] CPU: 1 PID: 63 Comm: kworker/u8:2 Not tainted 6.2.0-rc6-ne=
xt-20230130+ #1185 ca067559321ae817c063baccdba80d328f10f73
> [    2.718331] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
> [    2.724866] Workqueue: events_unbound deferred_probe_work_func
> [    2.730712] Call trace:
> [    2.733161]  dump_backtrace+0x9c/0x11c
> [    2.736914]  show_stack+0x14/0x1c
> [    2.740232]  dump_stack_lvl+0x5c/0x78
> [    2.743907]  dump_stack+0x14/0x1c
> [    2.747225]  panic+0x34c/0x39c
> [    2.750283]  __ktime_get_real_seconds+0x0/0xc
> [    2.754653]  pcf85063_ioctl+0x0/0xf0
> [    2.758232]  __rtc_read_time+0x44/0x114
> [    2.762081]  __rtc_read_alarm+0x258/0x460
> [    2.766095]  __devm_rtc_register_device+0x174/0x2b4
> [    2.770986]  pcf85063_probe+0x258/0x4d4
> [    2.774825]  i2c_device_probe+0x100/0x33c
>=20
> The backtrace did not indicate the actual cause of it. Checking the code =
the
> RTC driver seemed to be ok, so it has to be in the i2c bus driver.
> At some point I noticed that I see both Rx and Tx interrupts at the same =
time,
> which is odd. Also both rx_buf and tx_buf was set simultaneously. Clearly
> a bug to me.
> Clearing the buffer pointers upon each new i2c message triggered a NULL
> pointer dereference:
>=20
> [    2.694923] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000001
> [    2.703730] Mem abort info:
> [    2.706525]   ESR =3D 0x0000000096000004
> [    2.710278]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [    2.715595]   SET =3D 0, FnV =3D 0
> [    2.718653]   EA =3D 0, S1PTW =3D 0
> [    2.721798]   FSC =3D 0x04: level 0 translation fault
> [    2.726680] Data abort info:
> [    2.729556]   ISV =3D 0, ISS =3D 0x00000004
> [    2.733387]   CM =3D 0, WnR =3D 0
> [    2.736358] [0000000000000001] user address but active_mm is swapper
> [    2.742719] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    2.748990] Modules linked in:
> [    2.752051] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.2.0-rc6-next-2=
0230130+ #1184 44a8abebca6bfabc93e20ac52bce
> 47da7f92cec1
> [    2.763368] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT)
> [    2.769902] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [    2.776868] pc : lpi2c_imx_write_txfifo+0x44/0xb0
> [    2.781585] lr : lpi2c_imx_isr+0x60/0x8c
> [    2.785512] sp : ffff800008003ef0
> [    2.788831] x29: ffff800008003ef0 x28: ffff8000099c1ec0 x27: 00000000b=
fe632c8
> [    2.795980] x26: 0000000000000000 x25: ffff800009b935ed x24: ffff80000=
9a4d4c0
> [    2.803130] x23: ffff00000365e800 x22: 0000000000000128 x21: 000000000=
0000000
> [    2.810280] x20: ffff0000033f4080 x19: 0000000003000103 x18: 000000000=
0000000
> [    2.817430] x17: ffff80003688a000 x16: ffff800008000000 x15: 000000000=
0000000
> [    2.824579] x14: 0000000000000000 x13: ffff8000099d1db8 x12: 000000000=
0000000
> [    2.831729] x11: ffff800009503180 x10: 0000000000000a80 x9 : ffff80000=
99b3d20
> [    2.838879] x8 : ffff8000099c29a0 x7 : 00000000000000c0 x6 : ffff00000=
2838028
> [    2.846029] x5 : 0000000000000002 x4 : 0000000000000000 x3 : 000000000=
0000000
> [    2.849626] imx-scu system-controller: RPC send msg timeout
> [    2.853178] x2 : ffff800009c88060 x1 : 0000000000000001 x0 : ffff00000=
33f4080
> [    2.858764]  enet1: failed to power off resource 252 ret -110
> [    2.865897] Call trace:
> [    2.865901]  lpi2c_imx_write_txfifo+0x44/0xb0
> [    2.878443]  __handle_irq_event_percpu+0x5c/0x188
> [    2.883151]  handle_irq_event+0x48/0xb0
>=20
> $ ./scripts/faddr2line build_arm64/vmlinux lpi2c_imx_write_txfifo+0x44/0x=
b0
> lpi2c_imx_write_txfifo+0x44/0xb0:
> lpi2c_imx_write_txfifo at drivers/i2c/busses/i2c-imx-lpi2c.c:364
>=20
> This now clearly pinpoints the wrong access which previously corrupted the
> stack. The error leading to this wrong access is addressed in the
> following patch.
>=20
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index 188f2a36d2fd..c6d0225246e6 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -463,6 +463,8 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
>  		if (num =3D=3D 1 && msgs[0].len =3D=3D 0)
>  			goto stop;
> =20
> +		lpi2c_imx->rx_buf =3D NULL;
> +		lpi2c_imx->tx_buf =3D NULL;
>  		lpi2c_imx->delivered =3D 0;
>  		lpi2c_imx->msglen =3D msgs[i].len;
>  		init_completion(&lpi2c_imx->complete);
> --=20
> 2.34.1
>=20

--szhEKSLSI9dEAK/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQKTXIACgkQFA3kzBSg
KbZDQxAAletwxpT1f48tIrppFeJywSM48T416fC4KfBeUoUk15GkRLKf2IbJr4FP
mPZqiqq+lBJL9mbViVJ8veX639czw+mgyrOcUmphu2b7sRL5CXq0HWQUsk6jTCZi
9z1Ea3qTt00yjY7w+Cb9bjQYHwcZPHjZzDSNjfpS1TYe2HiPx3rhdtcDlJ+I3r5b
MOj3FitdMJ3BOAOsemJooxw91Hy8L1Dub/VGZ3/I+JNDXbKta8IQCqG4asFUKBzh
+Yoppj0laaFVdsAzyoiiKZQx28OY4uS1xexaiEouVKSnGwWheD/di7IOxw+Z0Te1
aK7RszzMpEZsb9BtGG9uBVf7GdFN0CJmU5gwJNWwtPMDPZjid77i2s+r1omwDk2h
ItXwCyOYHmrC5rlFjGoCOLHc1z1oXatHrazlYctEDVEYJuXqpE4uJwbqZefH/l4p
dzU7XLOx29TGvKxmvVzatnEI59Mluc91pt9lfrXXNvae3kXS1zxv2uha3JAplfgn
LwZtDWtVIcrs/O6Oe4wxmonoMlq1RdB0uexmfl6gTMoZ/wjTBXigHtfz0TfsECIn
9oWGa5xOz4+/kpJW5wjkl+WWI43AbJmIjopNG9NSD37hfS/CQPf/a3MKIhf5S7Oz
7T4Ah/rAUblUQZ13iGeOK2JDq/VRQfQ+kdN8KJB3ybcIn8bzscU=
=dnA7
-----END PGP SIGNATURE-----

--szhEKSLSI9dEAK/4--
