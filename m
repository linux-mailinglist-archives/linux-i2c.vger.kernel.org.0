Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCEB6496A6
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 23:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbiLKWQF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 17:16:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiLKWQE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 17:16:04 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFF5CE2E
        for <linux-i2c@vger.kernel.org>; Sun, 11 Dec 2022 14:16:02 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id b189so9525910vsc.10
        for <linux-i2c@vger.kernel.org>; Sun, 11 Dec 2022 14:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oPelsZlxvcKeNmCPYjKoM1n9vle+Nzh62mwwTeuK5I=;
        b=hz61PjA7mTIGXJVnKBaLmB7Mm1K2L4l7KlwIAybBR2FkXTThCHXXUmAOo5rvbuu0Yh
         TUNj30fws2ihsl5JxmJl8FeLNIb35nPZs1Nh57EBVcSfKJP9DqsD5YTgXiBNb1DpQd4J
         QL9O0H/BtHhFTKkViUpry2Uuigv2Tk1ab+YbBxydh7bptCZw8VGhgWZB/D0JRsPYmiGP
         Rom3wQz1XGenTPQcKEbwSHHjehOkOKtwkwg9OoxYaB1ZpkZeDH0nTBU6+B9f4s9XVSm4
         E5Mf/G2118Gmhv9SL+KECc3Qi+p+CKKMTAIp4f0Jn9ugKDWYT7TvesKQSZodFysK72/V
         asPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oPelsZlxvcKeNmCPYjKoM1n9vle+Nzh62mwwTeuK5I=;
        b=S9MOBWBwxCsPKPX5tUKdPAU36ox0DQB2LQCM65NL8NiwyVf56BMI8u4GezzVqdApAj
         tP8LfqLK02ugt8X87vxGAkvyeaBaauweIm3eSPH0T6pbQnYGgkfbDxGIMu3JUlW9RCnl
         FjZ7AMCI+sz1q9tsQyAYBB35xvSuQrkFctW6FzdE1e/LWXVT/SGaAKuMIKOesiL24O25
         4AhVGLT9FUrR7vPIdSLknuWEKc1Rm+pfxiqG9iqfAQcX4SCYSZ0CI/FfvsCKxXn1lddI
         jOQUnsv7H5ImUVxFI6qyjsAN8pQ8A2AMUS5p4zDRnQP10Dn3GrMrl2A1JYfUSvZyi+Ex
         kXtA==
X-Gm-Message-State: ANoB5pndjoEZof72AUNB44g+TixRPeQLcauvO3y/QLkygfnIj27s2rFO
        wqGS+jsFUKq09uZUT2vZ0vEGVW/m81uGKoT3H8YXDw==
X-Google-Smtp-Source: AA0mqf7g/O+iW/9EW9dQoVnIkGIpzP0TvNOx/GXaFHvkp3t/nfPDesug1gJdE7XcEdSHd3NqnHZUnO9cTZ5fM0VcLeo=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr29969600vsc.9.1670796961279; Sun, 11
 Dec 2022 14:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20221208182142.250084-3-brgl@bgdev.pl> <202212120010.6de17419-yujie.liu@intel.com>
In-Reply-To: <202212120010.6de17419-yujie.liu@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 11 Dec 2022 23:15:50 +0100
Message-ID: <CAMRc=Mcg-fYd18Nm_eU8-GLS0g3-Pdy50-7kpLFWyP1mazdVyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: dev: don't allow user-space to deadlock the kernel
To:     kernel test robot <yujie.liu@intel.com>
Cc:     oe-lkp@lists.linux.dev, lkp@intel.com, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Dec 11, 2022 at 5:32 PM kernel test robot <yujie.liu@intel.com> wro=
te:
>
> Greeting,
>
> FYI, we noticed WARNING:at_drivers/base/core.c:#device_release due to com=
mit (built with gcc-11):
>
> commit: 22f82cbe7636f59cc21f6837c500d704e3b412a5 ("[PATCH 2/2] i2c: dev: =
don't allow user-space to deadlock the kernel")
> url: https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/i=
2c-fortify-the-subsystem-against-user-space-induced-deadlocks/20221209-0224=
50
> base: https://git.kernel.org/cgit/linux/kernel/git/wsa/linux.git i2c/for-=
next
> patch link: https://lore.kernel.org/all/20221208182142.250084-3-brgl@bgde=
v.pl/
> patch subject: [PATCH 2/2] i2c: dev: don't allow user-space to deadlock t=
he kernel
>
> in testcase: xfstests
> version: xfstests-x86_64-5a5e419-1_20221128
> with following parameters:
>
>         disk: 4HDD
>         fs: xfs
>         test: xfs-group-07
>
> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
>
> on test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30=
GHz (Ivy Bridge) with 8G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> kern  :warn  : [   35.378637] ------------[ cut here ]------------
> kern  :err   : [   35.388198] Device 'i2c-7' does not have a release() fu=
nction, it is broken and must be fixed. See Documentation/core-api/kobject.=
rst.
> kern :warn : [   35.401052] WARNING: CPU: 1 PID: 195 at drivers/base/core=
.c:2332 device_release (drivers/base/core.c:2332)
> kern  :warn  : [   35.410178] Modules linked in: x86_pkg_temp_thermal int=
el_powerclamp i915(+) sd_mod t10_pi crc64_rocksoft_generic crc64_rocksoft i=
pmi_devintf crc64 coretemp ipmi_msghandler sg kvm_intel drm_buddy intel_gtt=
 kvm irqbypass crct10dif_pclmul drm_display_helper crc32_pclmul ttm crc32c_=
intel ghash_clmulni_intel drm_kms_helper sha512_ssse3 syscopyarea ahci mei_=
me rapl intel_cstate libahci sysfillrect wmi_bmof sysimgblt i2c_i801 mei in=
tel_uncore libata i2c_smbus lpc_ich fb_sys_fops video wmi drm fuse ip_table=
s
> kern  :warn  : [   35.455372] CPU: 1 PID: 195 Comm: systemd-udevd Not tai=
nted 6.1.0-rc8-00063-g22f82cbe7636 #1
> kern  :warn  : [   35.464544] Hardware name: Hewlett-Packard HP Pro 3340 =
MT/17A1, BIOS 8.07 01/24/2013
> kern :warn : [   35.473036] RIP: 0010:device_release (drivers/base/core.c=
:2332)
> kern :warn : [ 35.478405] Code: 48 8d 7d 50 48 89 fa 48 c1 ea 03 80 3c 02=
 00 0f 85 89 00 00 00 48 8b 75 50 48 85 f6 74 13 48 c7 c7 60 f0 ce 83 e8 6c=
 1c f2 00 <0f> 0b e9 0f ff ff ff 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48 =
c1
> All code

Ah yes, the .release() callback must stay and while the adapter
resources are handled by the bus driver, we still need to free the idr
at device release time.

I'll fix that in v2 but I also want to wait for some comments.

Bart
