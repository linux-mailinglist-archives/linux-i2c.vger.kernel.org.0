Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8DC1BC507
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 18:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgD1QV5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 12:21:57 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:56667 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728129AbgD1QV5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 12:21:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 1789E45C;
        Tue, 28 Apr 2020 12:21:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 Apr 2020 12:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=6RsYLmC1vyY3wSFNssKwJ2L/MUN
        wzbvXUCGq0yMW/3U=; b=AjfyeV7rIGpZLVl5GvE0bCkf+mc0dwGPRxlqpG29RXP
        ouTt/pVJhxfg+geVgWn6W6n3YY9tio/zN9u4pA45pPTl2DeUVPyuaKLDNT3XN/ol
        jUTzgrFUWr0O/zmFZdICMYG0i+KnYBT8eXMlP7Ncm50/v0vMlRNNMmrGla6qEVWg
        Q+h+m8za0MEBf90p8pILJnsdCJdShhw1sEho89xDk17IcL/4swZFPBCoL1xS+Vn3
        8/YwhJmqoUX5ODkz7XWRs0Gd6O3v/fK+8qvhKvsu5BhwRWPYbb9SbdTceEoCO9pw
        ThOUpyKSwwJyBW5p8Phoz4u9SO6EUlCrfIXGGIO/JHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6RsYLm
        C1vyY3wSFNssKwJ2L/MUNwzbvXUCGq0yMW/3U=; b=vlkFA1v4hB66Mk/bWap3Fz
        iSA7/Fb7EiKtNYCtrAVxeto9Ncs0UPd9e1ZT5OoEQn7aE7ArnTVjuoI+i3TQrdTQ
        lN9ybZxsWcQGY2xFc7ecbQrq9U8wcwEEwa0uIHcQP2FeAkAxcBLzjCVOJYCStxTR
        yFXPtZYXf+X55D8VVKdG5gXP0KJxuyCbNvOXhNA9DiyGG44QgdR8F0KLP0OwcUXU
        IK0DXpCAJZP6Rl0FyXyGsmQuOYzAs2DMeDHbnEXCOvJ6NAMq0TC3XzlHNYwhvcvJ
        ckGXtnenM5m8TvuJ83atIEJl84zbwxxlGFRP79GVILsegDP59e16N5RndeqzhREw
        ==
X-ME-Sender: <xms:IlioXp6XbuLmct2-AVgIKjv8g4d8vdOG2yYLCxcYqHcWwENwIYfGmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IlioXgUG45U3Tuegxjmv-PYEE4XrD9qpPwnIvpXnyuwhWpEVcoQMjg>
    <xmx:IlioXhRpkHvjygiMDoY4qryTDHiuPF3fHwyPd8LfUxoPgUnXASSSNQ>
    <xmx:IlioXtcKwO1QzygUTEzUM3Vo-goPAloL_mq_0vLDekr5w_i2ve20vw>
    <xmx:I1ioXlCKeoR77_UxDGpsKA4iHBqXA_A0iSwxZxpolfvS0BpuKs9K9n4BfdU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 581073280063;
        Tue, 28 Apr 2020 12:21:54 -0400 (EDT)
Date:   Tue, 28 Apr 2020 18:21:52 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jian-Hong Pan <jian-hong@endlessm.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux@endlessm.com
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zd4mbncwtlfa7l77"
Content-Disposition: inline
In-Reply-To: <20200427072342.5499-1-jian-hong@endlessm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zd4mbncwtlfa7l77
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 27, 2020 at 03:23:42PM +0800, Jian-Hong Pan wrote:
> Hi Maxime,
>=20
> Thanks for your V2 patch series!  I'm testing it.
>=20
> This patch series is applied upon mainline kernel 5.7-rc2 cleanly and bui=
lt.
> System can boot into console text mode, but no graphic UI.
>=20
> Get the error in vc5_hdmi_phy_init(), and full dmesg is at [1]:
>=20
> [    5.587543] vc4_hdmi fef00700.hdmi: Unknown register ID 46
> [    5.587700] debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi' =
already present!
> [    5.588070] vc4_hdmi fef00700.hdmi: vc4-hdmi-hifi <-> fef00700.hdmi ma=
pping ok
> [    5.588076] vc4_hdmi fef00700.hdmi: ASoC: no DMI vendor name!
> [    5.588263] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops)
> [    5.588299] vc4_hdmi fef05700.hdmi: Unknown register ID 46
> [    5.588373] debugfs: Directory 'vc4-hdmi' with parent 'asoc' already p=
resent!
> [    5.588673] vc4_hdmi fef05700.hdmi: vc4-hdmi-hifi <-> fef05700.hdmi ma=
pping ok
> [    5.588677] vc4_hdmi fef05700.hdmi: ASoC: no DMI vendor name!
> [    5.588809] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops)
> [    5.588854] vc4-drm gpu: bound fe806000.vec (ops vc4_vec_ops)
> [    5.588897] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops)
> [    5.588934] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops)
> [    5.588990] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops)
> [    5.589030] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops)
> [    5.589074] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops)
> [    5.589106] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops)
> [    5.589145] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops)
> [    5.589294] checking generic (3e513000 6d8c00) vs hw (0 ffffffffffffff=
ff)
> [    5.589297] fb0: switching to vc4drmfb from simple
> [    5.589433] Console: switching to colour dummy device 80x25
> [    5.589481] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    5.589816] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> [    5.601079] ------------[ cut here ]------------
> [    5.601095] WARNING: CPU: 2 PID: 127 at drivers/gpu/drm/vc4/vc4_hdmi_p=
hy.c:413 vc5_hdmi_phy_init+0x7ac/0x2078
> [    5.601097] Modules linked in:
> [    5.601103] CPU: 2 PID: 127 Comm: kworker/2:1 Not tainted 5.7.0-rc2-00=
091-ga181df59a930 #7
> [    5.601105] Hardware name: Raspberry Pi 4 Model B (DT)
> [    5.601112] Workqueue: events deferred_probe_work_func
> [    5.601116] pstate: 20000005 (nzCv daif -PAN -UAO)
> [    5.601119] pc : vc5_hdmi_phy_init+0x7ac/0x2078
> [    5.601123] lr : vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> [    5.601124] sp : ffff80001217b410
> [    5.601126] x29: ffff80001217b410 x28: ffff0000ec6370f0=20
> [    5.601129] x27: ffff0000f650d400 x26: 000000008a500000=20
> [    5.601132] x25: ffff8000113b4ac0 x24: 0000000000002060=20
> [    5.601135] x23: 000000000a500000 x22: 0000000000000300=20
> [    5.601137] x21: 0000000008d9ee20 x20: ffff0000ec535080=20
> [    5.601140] x19: 000000010989e7c0 x18: 0000000000000000=20
> [    5.601142] x17: 0000000000000001 x16: 0000000000005207=20
> [    5.601145] x15: 00004932ad293c92 x14: 0000000000000137=20
> [    5.601147] x13: ffff800010015000 x12: 0000000000000001=20
> [    5.601150] x11: 0000000000000001 x10: 0000000000000000=20
> [    5.601152] x9 : 0000000000000000 x8 : ffff800010015038=20
> [    5.601154] x7 : 0000000000000001 x6 : ffff80001217b368=20
> [    5.601157] x5 : 0000000000000000 x4 : 000000000000004c=20
> [    5.601159] x3 : 0000000000000000 x2 : ffff8000113b4ac0=20
> [    5.601162] x1 : ffff8000120c5f44 x0 : 00000000dc8984ff=20
> [    5.601164] Call trace:
> [    5.601169]  vc5_hdmi_phy_init+0x7ac/0x2078
> [    5.601172]  vc4_hdmi_encoder_enable+0x1b8/0x1ac0
> [    5.601176]  drm_atomic_helper_commit_modeset_enables+0x224/0x248
> [    5.601179]  vc4_atomic_complete_commit+0x400/0x558
> [    5.601182]  vc4_atomic_commit+0x1e0/0x200
> [    5.601185]  drm_atomic_commit+0x4c/0x60
> [    5.601190]  drm_client_modeset_commit_atomic.isra.0+0x17c/0x238
> [    5.601192]  drm_client_modeset_commit_locked+0x5c/0x198
> [    5.601195]  drm_client_modeset_commit+0x30/0x58
> [    5.601201]  drm_fb_helper_restore_fbdev_mode_unlocked+0x78/0xe0
> [    5.601204]  drm_fb_helper_set_par+0x30/0x68
> [    5.601208]  fbcon_init+0x3d4/0x598
> [    5.601212]  visual_init+0xb0/0x108
> [    5.601214]  do_bind_con_driver+0x1d0/0x3a8
> [    5.601217]  do_take_over_console+0x144/0x208
> [    5.601219]  do_fbcon_takeover+0x68/0xd8
> [    5.601222]  fbcon_fb_registered+0x100/0x118
> [    5.601226]  register_framebuffer+0x1f4/0x338
> [    5.601229]  __drm_fb_helper_initial_config_and_unlock+0x2f8/0x4a0
> [    5.601232]  drm_fbdev_client_hotplug+0xd4/0x1b0
> [    5.601235]  drm_fbdev_generic_setup+0xb0/0x130
> [    5.601238]  vc4_drm_bind+0x184/0x1a0
> [    5.601241]  try_to_bring_up_master+0x168/0x1c8
> [    5.601244]  __component_add+0xa4/0x170
> [    5.601246]  component_add+0x14/0x20
> [    5.601248]  vc4_vec_dev_probe+0x20/0x30
> [    5.601252]  platform_drv_probe+0x54/0xa8
> [    5.601254]  really_probe+0xd8/0x320
> [    5.601256]  driver_probe_device+0x58/0xf0
> [    5.601258]  __device_attach_driver+0x84/0xc8
> [    5.601263]  bus_for_each_drv+0x78/0xc8
> [    5.601265]  __device_attach+0xe4/0x140
> [    5.601267]  device_initial_probe+0x14/0x20
> [    5.601269]  bus_probe_device+0x9c/0xa8
> [    5.601271]  deferred_probe_work_func+0x74/0xb0
> [    5.601276]  process_one_work+0x1bc/0x338
> [    5.601279]  worker_thread+0x1f8/0x428
> [    5.601282]  kthread+0x138/0x158
> [    5.601286]  ret_from_fork+0x10/0x1c
> [    5.601288] ---[ end trace cfba0996218c3f3d ]---

Thanks for testing!

Do you have a bit more details regarding your setup? Was it connected to an
external display? If so, do you know the resolution it was trying to setup?

Thanks!
Maxime

--zd4mbncwtlfa7l77
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqhYIAAKCRDj7w1vZxhR
xRKPAQDPuqTyOtkiFOYQkNe6rHxuKgerDYJhXggrtdvJ/1V3pQD/aJ6zCU+BYOtN
9JJcdLQGT3Re2BKx/CD2AXd8tdVxQws=
=KPAO
-----END PGP SIGNATURE-----

--zd4mbncwtlfa7l77--
