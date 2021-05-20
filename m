Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1780A389F9B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 10:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbhETIQe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 04:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhETIQc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 04:16:32 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB42C061760
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 01:15:11 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s19so15643621oic.7
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nMDQIGNN2athUw77QzoxbIIxTVnjEUXN1gVmGUELkVE=;
        b=SsQfc1zR+XeSGQo7ATvGLAygCqAoQdAKJ10BQbNRTAdGZbHXkP5E2SeBTa/fmozrtr
         BW1ch1lrmrOquATIbjBBJQ3qB7nz2vMpT+teZq42SgeJ1AlWZPQW7JZSQePDVYDQhZNQ
         /3xuFjIu65ZqHjnqpsHTH4b61QayocPTbNdrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nMDQIGNN2athUw77QzoxbIIxTVnjEUXN1gVmGUELkVE=;
        b=omOmJhLwwfnQvPOA0DQj74lgnKtkRJO2o/UtXJpYWqrreHNwvEgiy7ucWwOxNS6FR7
         GqWOvT9obIL8D1CUQ9cAVXj4VWa5fma4FGDxGl4okZMwVbvQZlsNRuZDZvKFYJd2kXbu
         wZc9UOE0/9J4yV/xtQWWzQMQPlV6IVJFOVaqQx4VjosWenEdL7xCC1JywvB1PdpUSjnc
         5yulRkBASkiZK2MsWyiaU0EcSn+jxTYL1j3DAa6/63KKl192HeBWP4jTIEx3uvyAp08S
         ljLcwQI94uax8vysQMkMSyTLjvMpSLwECSPYf6SuhbFBh2zieloDglrFKTendiB8026Z
         VsrQ==
X-Gm-Message-State: AOAM53025nDEhDY2Xl+fkMMQf+pu0HLL5iwywZVvzWIxp7eaPtF8xVEK
        EMVjwMNxY9BDl56FxImqFI5xcGYDXTlqYQgZePlp1A==
X-Google-Smtp-Source: ABdhPJwxsXmfJTVN1Dt1DE1hOOnvh3huMgzuBaqFM49Psm1tLnZS6IREr/TfQ24FfmOw3l4L4vqvrWbtroEWNUiP9Ek=
X-Received: by 2002:aca:654d:: with SMTP id j13mr2566246oiw.125.1621498511160;
 Thu, 20 May 2021 01:15:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 May 2021 04:15:10 -0400
MIME-Version: 1.0
In-Reply-To: <70a90d229551bcec21ed74cfd1350b9b@codeaurora.org>
References: <20210512082220.7137-1-rojay@codeaurora.org> <CAE-0n52D-K1T0QgxA-S7BXxE3Qk807F9edNyR+2RL4YxRyigMg@mail.gmail.com>
 <70a90d229551bcec21ed74cfd1350b9b@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 20 May 2021 04:15:10 -0400
Message-ID: <CAE-0n50o1XRnV3HSAM7uhfS8M3kf_m0DrTkqCfYGdnSjpF6Xfg@mail.gmail.com>
Subject: Re: [PATCH V10] i2c: i2c-qcom-geni: Add shutdown callback for i2c
To:     rojay@codeaurora.org
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting rojay@codeaurora.org (2021-05-16 23:32:50)
> Hi Stephen,
>
> Now, I have made the changes, calling i2c_mark_adapter_suspended() in
> shutdown() and i2c_mark_adapter_suspended()/_resumed() from runtime
> suspend/resume also and validated the changes. I have also picked
> your patch [1] for this validation.
>
> During the device boot up I am seeing multiple traces shown below.
> Are these expected now and needs to be fixed from rt5682/respective
> client driver?
>
> Trace1:
> [   11.709477] i2c i2c-9: Transfer while suspended
> [   11.905595] Call trace:
> [   11.908124]  __i2c_transfer+0xb8/0x38c
> [   11.911984]  i2c_transfer+0xa0/0xf4
> [   11.915569]  i2c_transfer_buffer_flags+0x68/0x9c
> [   11.920314]  regmap_i2c_write+0x34/0x64
> [   11.924255]  _regmap_raw_write_impl+0x4e8/0x7bc
> [   11.928911]  _regmap_bus_raw_write+0x70/0x8c
> [   11.933301]  _regmap_write+0x100/0x150
> [   11.937152]  regmap_write+0x54/0x78
> [   11.940744]  soc_component_write_no_lock+0x34/0xa8
> [   11.945666]  snd_soc_component_write+0x3c/0x5c
> [   11.950242]  rt5682_set_component_pll+0x1e4/0x2b4 [snd_soc_rt5682]
> [   11.956588]  snd_soc_component_set_pll+0x50/0xa8
> [   11.961328]  snd_soc_dai_set_pll+0x74/0xc8
> [   11.965542]  sc7180_snd_startup+0x9c/0x120 [snd_soc_sc7180]
> [   11.971262]  snd_soc_link_startup+0x34/0x88
> [   11.975557]  soc_pcm_open+0x100/0x538
> [   11.979323]  snd_pcm_open_substream+0x530/0x704
> [   11.983980]  snd_pcm_open+0xc8/0x210
> [   11.987653]  snd_pcm_playback_open+0x50/0x80
> [   11.992049]  snd_open+0x120/0x150
> [   11.995462]  chrdev_open+0xb8/0x1a4
> [   11.999056]  do_dentry_open+0x238/0x358
> [   12.003001]  vfs_open+0x34/0x40
> [   12.006235]  path_openat+0x9e8/0xd60
> [   12.009913]  do_filp_open+0x90/0x10c
> [   12.013587]  do_sys_open+0x148/0x314
> [   12.017260]  __arm64_compat_sys_openat+0x28/0x34
> [   12.022009]  el0_svc_common+0xa4/0x16c
> [   12.025860]  el0_svc_compat_handler+0x2c/0x40
> [   12.030337]  el0_svc_compat+0x8/0x10
> [   12.034018] ---[ end trace 745ead557fcbb5dc ]---

Ah I see. Maybe it isn't correct to mark the device as suspended in
runtime PM operations because the bus will be resumed during the
transfer? So only mark it suspended during system wide suspend/resume
transitions?

-Stephen

> [   12.040151] rt5682 9-001a: ASoC: error at soc_component_write_no_lock
> on rt5682.9-001a: -108
> [   12.049055] rt5682 9-001a: ASoC: error at soc_component_write_no_lock
> on rt5682.9-001a: -108
> [   12.057742] rt5682 9-001a: ASoC: error at
> snd_soc_component_update_bits on rt5682.9-001a: -108
>
> Trace2:
> [    3.515390] i2c i2c-2: Transfer while suspended
> [    3.606749] Call trace:
> [    3.606751]  __i2c_transfer+0xb8/0x38c
> [    3.606752]  i2c_transfer+0xa0/0xf4
> [    3.606754]  i2c_transfer_buffer_flags+0x68/0x9c
> [    3.639599] hub 2-1.4:1.0: USB hub found
> [    3.644375]  regmap_i2c_write+0x34/0x64
> [    3.644376]  _regmap_raw_write_impl+0x4e8/0x7bc
> [    3.644378]  _regmap_bus_raw_write+0x70/0x8c
> [    3.644379]  _regmap_write+0x100/0x150
> [    3.644381]  regmap_write+0x54/0x78
> [    3.644383]  ti_sn_aux_transfer+0x90/0x244
> [    3.650695] hub 2-1.4:1.0: 4 ports detected
> [    3.655288]  drm_dp_dpcd_access+0x8c/0x11c
> [    3.655289]  drm_dp_dpcd_read+0x64/0x10c
> [    3.655290]  ti_sn_bridge_enable+0x5c/0x824
> [    3.655292]  drm_atomic_bridge_chain_enable+0x78/0xa0
> [    3.655294]  drm_atomic_helper_commit_modeset_enables+0x198/0x238
> [    3.655295]  msm_atomic_commit_tail+0x324/0x714
> [    3.655297]  commit_tail+0xa4/0x108
> [    3.664985] usb 1-1.4: new high-speed USB device number 4 using
> xhci-hcd
> [    3.666204]  drm_atomic_helper_commit+0xf4/0xfc
> [    3.666205]  drm_atomic_commit+0x50/0x5c
> [    3.666206]  drm_atomic_helper_set_config+0x64/0x98
> [    3.666208]  drm_mode_setcrtc+0x26c/0x590
> [    3.666209]  drm_ioctl_kernel+0x9c/0x114
> [    3.701074] hub 2-1.4:1.0: USB hub found
> [    3.703347]  drm_ioctl+0x288/0x420
> [    3.703349]  drm_compat_ioctl+0xd0/0xe0
> [    3.703351]  __arm64_compat_sys_ioctl+0x100/0x2108
> [    3.703354]  el0_svc_common+0xa4/0x16c
> [    3.708499] hub 2-1.4:1.0: 4 ports detected
> [    3.711588]  el0_svc_compat_handler+0x2c/0x40
> [    3.711590]  el0_svc_compat+0x8/0x10
> [    3.711591] ---[ end trace 745ead557fcbb5db ]---
> [    3.772120] usb 1-1.4: New USB device found, idVendor=0bda,
> idProduct=5411, bcdDevice= 1.04
> [    3.794990] ti_sn65dsi86 2-002d: [drm:ti_sn_bridge_enable] *ERROR*
> Can't read lane count (-108); assuming 4
>
> [1]
> https://lore.kernel.org/r/20210508075151.1626903-2-swboyd@chromium.org
>
