Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E6C1B986F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 09:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgD0HYM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 03:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgD0HYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 03:24:11 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76ABFC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 00:24:11 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so7164043pjw.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 00:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XOcbyKgA0Bpvq+avYOz1rNm0o9oBZQ47QSXwocd5JDs=;
        b=KhkIJ1jjdAjc7I6o69UtZUncp44UuyyZDD/4xfQF8CirYMTf9cJeFRIellap23PRfm
         Ed//agPd2fbamkS4hNwvCoCC8NRPHuPKEYG7l9G4FvrsbfVqnJ8B5PFcqLUUUMxxb8yp
         0jfEUyV0ROpnkgmchA824E5slER3IVZ4493vNeNZEtvSboA81qZ/k0P7DEKDCN4N2/7+
         Yj+/tpZDGmES2G1MG1YAAW0FqdW/XisAk9EoRGyszIar3N9nhLwequneqKONdiSRKxsb
         pNV5YP0VFyGcTA/cVucnh3gT7ND/v71VY3sIMVhiCUeu/m5k73fyCzeWXX/OnLWKP/Qa
         wUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XOcbyKgA0Bpvq+avYOz1rNm0o9oBZQ47QSXwocd5JDs=;
        b=jxG1T4lXj9yS40KygMDUso9qFFN7HXJ3gMKacefVH8cIWU6r/YRN5KY43eH/Cwm0oA
         w6iNDlzSDwTmwYGIdz6F5j0/sDGulWeZDhpqmjTwsAVTZIvduMeigQVD5ieE8bwDMvJN
         GWloCr0IyBZa7hqs/+yopJZa/xxWtHveKC+Q29K+XITsQsNU/0QxP6kdBL6wjHNUHQRV
         HJJYapNNYL9sebE9+yK64dQj4hpUBUjmfQDjy9lX0uV3+aq0NyesJTgMNQ8RvtNtlMkD
         CiFh2j/VHuBaac+5NF/BD2/FqzHmzWje+bMLMX90+A8WPE217u6oUqtmubDv6C3x0gEW
         42dg==
X-Gm-Message-State: AGi0Puba8Z9hnpXV/PM3FcQYn7rbmwT7CcUIKgKeLrcvhO4Dz9v9hcOy
        UtYR9rrE7xCAiwyUU0AijELlcA==
X-Google-Smtp-Source: APiQypLZ1hE4GjmvgAhgyfKaFcwMZtgCX6AntRqvDptj+irvRENaKBgzUmWEYk/9JfJE78Am8sJHpA==
X-Received: by 2002:a17:90a:252f:: with SMTP id j44mr21962732pje.9.1587972250735;
        Mon, 27 Apr 2020 00:24:10 -0700 (PDT)
Received: from starnight.168.95.1.1 ([150.117.130.110])
        by smtp.googlemail.com with ESMTPSA id t3sm11570687pfq.110.2020.04.27.00.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 00:24:10 -0700 (PDT)
From:   Jian-Hong Pan <jian-hong@endlessm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Jian-Hong Pan <jian-hong@endlessm.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux@endlessm.com
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Date:   Mon, 27 Apr 2020 15:23:42 +0800
Message-Id: <20200427072342.5499-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Maxime,

Thanks for your V2 patch series!  I'm testing it.

This patch series is applied upon mainline kernel 5.7-rc2 cleanly and built.
System can boot into console text mode, but no graphic UI.

Get the error in vc5_hdmi_phy_init(), and full dmesg is at [1]:

[    5.587543] vc4_hdmi fef00700.hdmi: Unknown register ID 46
[    5.587700] debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi' already present!
[    5.588070] vc4_hdmi fef00700.hdmi: vc4-hdmi-hifi <-> fef00700.hdmi mapping ok
[    5.588076] vc4_hdmi fef00700.hdmi: ASoC: no DMI vendor name!
[    5.588263] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops)
[    5.588299] vc4_hdmi fef05700.hdmi: Unknown register ID 46
[    5.588373] debugfs: Directory 'vc4-hdmi' with parent 'asoc' already present!
[    5.588673] vc4_hdmi fef05700.hdmi: vc4-hdmi-hifi <-> fef05700.hdmi mapping ok
[    5.588677] vc4_hdmi fef05700.hdmi: ASoC: no DMI vendor name!
[    5.588809] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops)
[    5.588854] vc4-drm gpu: bound fe806000.vec (ops vc4_vec_ops)
[    5.588897] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops)
[    5.588934] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops)
[    5.588990] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops)
[    5.589030] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops)
[    5.589074] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops)
[    5.589106] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops)
[    5.589145] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops)
[    5.589294] checking generic (3e513000 6d8c00) vs hw (0 ffffffffffffffff)
[    5.589297] fb0: switching to vc4drmfb from simple
[    5.589433] Console: switching to colour dummy device 80x25
[    5.589481] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.589816] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
[    5.601079] ------------[ cut here ]------------
[    5.601095] WARNING: CPU: 2 PID: 127 at drivers/gpu/drm/vc4/vc4_hdmi_phy.c:413 vc5_hdmi_phy_init+0x7ac/0x2078
[    5.601097] Modules linked in:
[    5.601103] CPU: 2 PID: 127 Comm: kworker/2:1 Not tainted 5.7.0-rc2-00091-ga181df59a930 #7
[    5.601105] Hardware name: Raspberry Pi 4 Model B (DT)
[    5.601112] Workqueue: events deferred_probe_work_func
[    5.601116] pstate: 20000005 (nzCv daif -PAN -UAO)
[    5.601119] pc : vc5_hdmi_phy_init+0x7ac/0x2078
[    5.601123] lr : vc4_hdmi_encoder_enable+0x1b8/0x1ac0
[    5.601124] sp : ffff80001217b410
[    5.601126] x29: ffff80001217b410 x28: ffff0000ec6370f0 
[    5.601129] x27: ffff0000f650d400 x26: 000000008a500000 
[    5.601132] x25: ffff8000113b4ac0 x24: 0000000000002060 
[    5.601135] x23: 000000000a500000 x22: 0000000000000300 
[    5.601137] x21: 0000000008d9ee20 x20: ffff0000ec535080 
[    5.601140] x19: 000000010989e7c0 x18: 0000000000000000 
[    5.601142] x17: 0000000000000001 x16: 0000000000005207 
[    5.601145] x15: 00004932ad293c92 x14: 0000000000000137 
[    5.601147] x13: ffff800010015000 x12: 0000000000000001 
[    5.601150] x11: 0000000000000001 x10: 0000000000000000 
[    5.601152] x9 : 0000000000000000 x8 : ffff800010015038 
[    5.601154] x7 : 0000000000000001 x6 : ffff80001217b368 
[    5.601157] x5 : 0000000000000000 x4 : 000000000000004c 
[    5.601159] x3 : 0000000000000000 x2 : ffff8000113b4ac0 
[    5.601162] x1 : ffff8000120c5f44 x0 : 00000000dc8984ff 
[    5.601164] Call trace:
[    5.601169]  vc5_hdmi_phy_init+0x7ac/0x2078
[    5.601172]  vc4_hdmi_encoder_enable+0x1b8/0x1ac0
[    5.601176]  drm_atomic_helper_commit_modeset_enables+0x224/0x248
[    5.601179]  vc4_atomic_complete_commit+0x400/0x558
[    5.601182]  vc4_atomic_commit+0x1e0/0x200
[    5.601185]  drm_atomic_commit+0x4c/0x60
[    5.601190]  drm_client_modeset_commit_atomic.isra.0+0x17c/0x238
[    5.601192]  drm_client_modeset_commit_locked+0x5c/0x198
[    5.601195]  drm_client_modeset_commit+0x30/0x58
[    5.601201]  drm_fb_helper_restore_fbdev_mode_unlocked+0x78/0xe0
[    5.601204]  drm_fb_helper_set_par+0x30/0x68
[    5.601208]  fbcon_init+0x3d4/0x598
[    5.601212]  visual_init+0xb0/0x108
[    5.601214]  do_bind_con_driver+0x1d0/0x3a8
[    5.601217]  do_take_over_console+0x144/0x208
[    5.601219]  do_fbcon_takeover+0x68/0xd8
[    5.601222]  fbcon_fb_registered+0x100/0x118
[    5.601226]  register_framebuffer+0x1f4/0x338
[    5.601229]  __drm_fb_helper_initial_config_and_unlock+0x2f8/0x4a0
[    5.601232]  drm_fbdev_client_hotplug+0xd4/0x1b0
[    5.601235]  drm_fbdev_generic_setup+0xb0/0x130
[    5.601238]  vc4_drm_bind+0x184/0x1a0
[    5.601241]  try_to_bring_up_master+0x168/0x1c8
[    5.601244]  __component_add+0xa4/0x170
[    5.601246]  component_add+0x14/0x20
[    5.601248]  vc4_vec_dev_probe+0x20/0x30
[    5.601252]  platform_drv_probe+0x54/0xa8
[    5.601254]  really_probe+0xd8/0x320
[    5.601256]  driver_probe_device+0x58/0xf0
[    5.601258]  __device_attach_driver+0x84/0xc8
[    5.601263]  bus_for_each_drv+0x78/0xc8
[    5.601265]  __device_attach+0xe4/0x140
[    5.601267]  device_initial_probe+0x14/0x20
[    5.601269]  bus_probe_device+0x9c/0xa8
[    5.601271]  deferred_probe_work_func+0x74/0xb0
[    5.601276]  process_one_work+0x1bc/0x338
[    5.601279]  worker_thread+0x1f8/0x428
[    5.601282]  kthread+0x138/0x158
[    5.601286]  ret_from_fork+0x10/0x1c
[    5.601288] ---[ end trace cfba0996218c3f3d ]---

[1]: https://gist.github.com/starnight/2236cf350737e3b0e9f05135fc7c910e

Jian-Hong Pan
