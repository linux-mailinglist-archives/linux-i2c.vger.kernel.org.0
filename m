Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CCB6A80E7
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 12:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjCBLRC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 06:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCBLRA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 06:17:00 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221F230E6
        for <linux-i2c@vger.kernel.org>; Thu,  2 Mar 2023 03:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677755794; x=1709291794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiWy5k/6xFwP/r2lA3U76koHVT0d5qDWSMq2/Bg0+Gc=;
  b=SELiAwL2Wnd63JlANjTng6n+oYc1DVIlsKJDyLbB1v7z0wSlFjaDM3vA
   RElfM4elmIdGjJg8hS9FnQFBnN1gI0BvjjXMTgd8pahSgN7JNp1E4J37j
   RBKlafR6uNUUlsgcW+65YXnS4XJlNUrut4/rqaaWpA9+AqaWV6vtFwbMZ
   0Eg+NiyWCK3tPp1LeUWYyFE3Cy1lxWAtgFWTs1UkU8Ph8qkWL82IhjeMD
   t+Qd5UC2wuUgf8VMDGSqOrH+j/z0nRgjfTC6uyMD/h7yDFjz6/pOk1cfN
   MlndwUlfIYMf1EbcapWgo4oBXuZFPJebkH8BdVE2Q81+s+TJgbjGV9ufm
   w==;
X-IronPort-AV: E=Sophos;i="5.98,227,1673910000"; 
   d="scan'208";a="29422641"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 02 Mar 2023 12:15:53 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 02 Mar 2023 12:15:53 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 02 Mar 2023 12:15:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677755753; x=1709291753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oiWy5k/6xFwP/r2lA3U76koHVT0d5qDWSMq2/Bg0+Gc=;
  b=Hk4amG/syeQsOOFYdpKkDNSAB+za6K8HhwX9sy30UUV4QCMT8XuLkuF5
   eN5bdcxtsCE9Ueksq+YuELWwHAbFFo2NxRyWOk9kFmSYCiNZkaJ2UMvo9
   TH0Wj2ekHcFB4vjk4I0JvFd8Mnbtatyhb2cjqhKXDU8O9GIAFof2dj+j/
   x0vPb/MX0iA1Jc+Py+Lk4GONcucy/57yj0fWDJmkxR0S1cF07IN/JcF+W
   zqbryUaFWzSuvvfVX3OCEAjJvNhmaP6Cm5+HkSNsT7vWbqmSBDhWfNtxT
   pKMf4cN92ii1UiYkcLnel/TEzhs+G3WwI39UPBY5aQpnFnFtj3bpDxqEx
   w==;
X-IronPort-AV: E=Sophos;i="5.98,227,1673910000"; 
   d="scan'208";a="29422640"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 02 Mar 2023 12:15:53 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 21C64280056;
        Thu,  2 Mar 2023 12:15:53 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     NXP Linux Team <linux-imx@nxp.com>,
        Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: clean rx/tx buffers upon new message
Date:   Thu, 02 Mar 2023 12:15:51 +0100
Message-ID: <2672031.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <4d06ffe5-3ff6-241e-b35b-794c075f288e@gmail.com>
References: <20230130153247.445027-1-alexander.stein@ew.tq-group.com> <4d06ffe5-3ff6-241e-b35b-794c075f288e@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Emanuele,

Am Donnerstag, 2. M=E4rz 2023, 12:06:18 CET schrieb Emanuele Ghidoli:
> On 30/01/2023 16:32, Alexander Stein wrote:
> > When start sending a new message clear the Rx & Tx buffer pointers in
> > order to avoid using stale pointers.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > I noticed an ambigous stack corruption once my rtc-pcf85063 driver prob=
es.
> >=20
> > [    2.695684] Kernel panic - not syncing: stack-protector: Kernel stack
> > is corrupted in: pcf85063_rtc_read_time+0x10/0x100 [    2.706669] CPU: 1
> > PID: 63 Comm: kworker/u8:2 Not tainted 6.2.0-rc6-next-20230130+ #1185
> > ca067559321ae817c063baccdba80d328f10f73 [    2.718331] Hardware name:
> > TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (DT) [    2.724866] Workqueue:
> > events_unbound deferred_probe_work_func
> > [    2.730712] Call trace:
> > [    2.733161]  dump_backtrace+0x9c/0x11c
> > [    2.736914]  show_stack+0x14/0x1c
> > [    2.740232]  dump_stack_lvl+0x5c/0x78
> > [    2.743907]  dump_stack+0x14/0x1c
> > [    2.747225]  panic+0x34c/0x39c
> > [    2.750283]  __ktime_get_real_seconds+0x0/0xc
> > [    2.754653]  pcf85063_ioctl+0x0/0xf0
> > [    2.758232]  __rtc_read_time+0x44/0x114
> > [    2.762081]  __rtc_read_alarm+0x258/0x460
> > [    2.766095]  __devm_rtc_register_device+0x174/0x2b4
> > [    2.770986]  pcf85063_probe+0x258/0x4d4
> > [    2.774825]  i2c_device_probe+0x100/0x33c
> >=20
> > The backtrace did not indicate the actual cause of it. Checking the code
> > the RTC driver seemed to be ok, so it has to be in the i2c bus driver. =
At
> > some point I noticed that I see both Rx and Tx interrupts at the same
> > time, which is odd. Also both rx_buf and tx_buf was set simultaneously.
> > Clearly a bug to me.
> > Clearing the buffer pointers upon each new i2c message triggered a NULL
> > pointer dereference:
> >=20
> > [    2.694923] Unable to handle kernel NULL pointer dereference at virt=
ual
> > address 0000000000000001 [    2.703730] Mem abort info:
> > [    2.706525]   ESR =3D 0x0000000096000004
> > [    2.710278]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [    2.715595]   SET =3D 0, FnV =3D 0
> > [    2.718653]   EA =3D 0, S1PTW =3D 0
> > [    2.721798]   FSC =3D 0x04: level 0 translation fault
> > [    2.726680] Data abort info:
> > [    2.729556]   ISV =3D 0, ISS =3D 0x00000004
> > [    2.733387]   CM =3D 0, WnR =3D 0
> > [    2.736358] [0000000000000001] user address but active_mm is swapper
> > [    2.742719] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> > [    2.748990] Modules linked in:
> > [    2.752051] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> > 6.2.0-rc6-next-20230130+ #1184 44a8abebca6bfabc93e20ac52bce 47da7f92cec1
> > [    2.763368] Hardware name: TQ-Systems i.MX8QXP TQMa8XQP on MBa8Xx (D=
T)
> > [    2.769902] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS
> > BTYPE=3D--) [    2.776868] pc : lpi2c_imx_write_txfifo+0x44/0xb0
> > [    2.781585] lr : lpi2c_imx_isr+0x60/0x8c
> > [    2.785512] sp : ffff800008003ef0
> > [    2.788831] x29: ffff800008003ef0 x28: ffff8000099c1ec0 x27:
> > 00000000bfe632c8 [    2.795980] x26: 0000000000000000 x25:
> > ffff800009b935ed x24: ffff800009a4d4c0 [    2.803130] x23:
> > ffff00000365e800 x22: 0000000000000128 x21: 0000000000000000 [  =20
> > 2.810280] x20: ffff0000033f4080 x19: 0000000003000103 x18:
> > 0000000000000000 [    2.817430] x17: ffff80003688a000 x16:
> > ffff800008000000 x15: 0000000000000000 [    2.824579] x14:
> > 0000000000000000 x13: ffff8000099d1db8 x12: 0000000000000000 [  =20
> > 2.831729] x11: ffff800009503180 x10: 0000000000000a80 x9 :
> > ffff8000099b3d20 [    2.838879] x8 : ffff8000099c29a0 x7 :
> > 00000000000000c0 x6 : ffff000002838028 [    2.846029] x5 :
> > 0000000000000002 x4 : 0000000000000000 x3 : 0000000000000000 [  =20
> > 2.849626] imx-scu system-controller: RPC send msg timeout
> > [    2.853178] x2 : ffff800009c88060 x1 : 0000000000000001 x0 :
> > ffff0000033f4080 [    2.858764]  enet1: failed to power off resource 252
> > ret -110
> > [    2.865897] Call trace:
> > [    2.865901]  lpi2c_imx_write_txfifo+0x44/0xb0
> > [    2.878443]  __handle_irq_event_percpu+0x5c/0x188
> > [    2.883151]  handle_irq_event+0x48/0xb0
> >=20
> > $ ./scripts/faddr2line build_arm64/vmlinux
> > lpi2c_imx_write_txfifo+0x44/0xb0
> > lpi2c_imx_write_txfifo+0x44/0xb0:
> > lpi2c_imx_write_txfifo at drivers/i2c/busses/i2c-imx-lpi2c.c:364
> >=20
> > This now clearly pinpoints the wrong access which previously corrupted =
the
> > stack. The error leading to this wrong access is addressed in the
> > following patch.
> >=20
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 188f2a36d2fd..c6d0225246e6
> > 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -463,6 +463,8 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapt=
er,
> >=20
> >   		if (num =3D=3D 1 && msgs[0].len =3D=3D 0)
> >   	=09
> >   			goto stop;
> >=20
> > +		lpi2c_imx->rx_buf =3D NULL;
> > +		lpi2c_imx->tx_buf =3D NULL;
> >=20
> >   		lpi2c_imx->delivered =3D 0;
> >   		lpi2c_imx->msglen =3D msgs[i].len;
> >   		init_completion(&lpi2c_imx->complete);
>=20
> Hello,
> I have same problem with rtc-ds1307 driver and NXP imx8x (using
> ic2-imx-lpi2c.c bus driver). I do not have the full stack trace but I'm
> sure is very similar:
> [   10.750015] Kernel panic - not syncing: stack-protector: Kernel stack =
is
> corrupted in: ds1307_get_time+0x2a4/0x2c4 [rtc_ds1307]
>=20
> Your patches are fixing this too and they seem good to me.
> About the [2/2] patch your approach sound better to me than the downstream
> approach.
>=20
> Emanuele Ghidoli

Thanks for the feedback. Could you provide then a Tested-by tag?

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


