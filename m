Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 548B2393CDB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 08:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhE1GE0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 02:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhE1GDs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 02:03:48 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A3C061574;
        Thu, 27 May 2021 23:02:13 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id d25so3048304ioe.1;
        Thu, 27 May 2021 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIKsiA6+DMLHlkOcLKlnyxoQnxJIdOFeXeN3ppix/L4=;
        b=WcOyuZpLp8/NgLIQ4nqwWd4KXdbL259MTJbeb0eyFD28gXEt0DV0eLYwdeHVCAgWvH
         nRVo97cISue8EqqhlnBKbpNgJpGyOp4gf01JHA16SSh3N3JoOEPEndI+HqFebcviwWuY
         1VV9DdhXOX7KL7JxIB4w9dK2lE0hxy8rGheT7f79pgZiPFGabXJIorvUGBvllltH2GQp
         MBDig6CjzxpaFpQ4Ry6cy12cEz4Ix37wmmoiAEVV8gjzQdQgxB8SAHC2zklJO/CHWihE
         dv7PxsqNMdICYLWr2hG69BvuuUwxzUJbsv6G1nRnhoDjMIVadgFY7kzeUevyej7rNUHz
         Htmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIKsiA6+DMLHlkOcLKlnyxoQnxJIdOFeXeN3ppix/L4=;
        b=ZK9ig7xnaDH5dJs+NKS+I093iUDqfKSs7+XuZIwnzC4hCUw7KDWRyfpHwQPVYXMnvf
         hEx7zEyXIVJLFt5GbOi4Dl8KR5SUw2VKwJMf+NP/QcVuIlP1ky9E1/2Gxinp2M/IzU2o
         dSt+3cx+qMHdnEgEA0YzmJACt6joBLq27byq4vnwXpFgdzHuv3cTdmPEQBSbQAe2gSk/
         ccUwXbKBYlTtuqY6Mvazci1cd7mywyqG5de3lRTB2M+1ZJh2+IFxaPX/u2BEZPLx5IKu
         5zktk1zx6jziI+IsMtG+EgYIBSlBJP5J1vXhhqTh4cEIfVzBEm+fjy7lnb/Pwybz5g5g
         nIvw==
X-Gm-Message-State: AOAM533DaPRBpHlPbJHePk84T9qGDE9PW4ljwj4TvIR6NfVIsBOme5fO
        VNftmjFhQbGsMG+mfUXPJg3mhN2cnCkJokCS+/8=
X-Google-Smtp-Source: ABdhPJy/7qLyDzEHIvmiA1LxjfP77NXexXSqCA9JNBvDQXHSEFhVrZZWFXtqlefcsUWQ7Go6TECwG6uKcRQzudBsD6g=
X-Received: by 2002:a5d:9e0b:: with SMTP id h11mr5844650ioh.60.1622181732336;
 Thu, 27 May 2021 23:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Fri, 28 May 2021 14:01:36 +0800
Message-ID: <CAL9mu0KUwTiVqSymL-8MLTOMe2OuOBNtLecKaJt=EJfUY_drqw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix the i2c/clk bug of stm32 mcu platform
To:     Patrice CHOTARD <patrice.chotard@foss.st.com>,
        pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        linux-clk <linux-clk@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrice, Alain,

Could you help to take a look at this patchset, thanks.

This series is the rebase to the newest kernel commit:
88b06399c9c766c283e070b022b5ceafa4f63f19

according to the request from:
https://lore.kernel.org/lkml/ff2bc09d-1a17-50d4-d3ee-16fd3a86d7f1@foss.st.com/

The clk bug affects the kernel bootup on stm32f469-disco board
in case display config(CONFIG_DRM_STM, CONFIG_DRM_STM_DSI,
DRM_PANEL_ORISETECH_OTM8009A)
enabled.

If you want to test clk patch on stm32f429-disco board, the
panel-ilitek-ili9341.c can be
used for that purpose (CONFIG_DRM_STM, DRM_PANEL_ILITEK_ILI9341)

i2c driver patch intent to fix the touch panel driver get data through
i2c bus timeout issue.

Best regards.
Dillon

On Fri, May 14, 2021 at 7:02 PM <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> This seriese fix three i2c/clk bug for stm32 f4/f7
> - kernel runing in sdram, i2c driver get data timeout
> - ltdc clk turn off after kernel console active
> - kernel hang in set ltdc clock rate
>
> clk bug found on stm32f429/f469-disco board
>
> Hi Patrice:
> below is the guide to verify the patch:
>
> setup test env with following files(link at below 'files link'):
> [1] u-boot-dtb.bin
> [2] rootfs zip file (used in kernel initramfs)
> [3] u-boot's mkimage to create itb file
> [4] kernel config file
> [5] my itb with-or-without i2c patch
>
> This patch based on kernel commit:
> 88b06399c9c766c283e070b022b5ceafa4f63f19
>
> Note:
> panel-ilitek-ili9341.c is the driver which was submitted last year, but not
> get accepted. it's used to setup touch screen calibration, then test i2c.
>
> create itb file(please correct path of 'data'):
> ./mkimage -f stm32.its stm32.itb
>
> HW setup:
> console:
>        PA9, PA10
>        usart0
>        serial@40011000
>        115200 8n1
>
> -- flash u-boot.bin to stm32f429-disco on PC
> $ sudo openocd -f board/stm32f429discovery.cfg -c \
>   '{PATH-TO-YOUR-UBOOT}/u-boot-dtb.bin 0x08000000 exit reset'
>
> -- setup kernel load bootargs at u-boot
> U-Boot > setenv bootargs 'console=tty0 console=ttySTM0,115200
>                     root=/dev/ram rdinit=/linuxrc loglevel=8 fbcon=rotate:2'
> U-Boot > loady;bootm
> (download stm32.dtb or your kernel with itb format, or download zImage, dtb)
>
> -- setup ts_calibrate running env on stm32f429-disco
> / # export TSLIB_CONFFILE=/etc/ts.conf
> / # export TSLIB_TSDEVICE=/dev/input/event0
> / # export TSLIB_CONSOLEDEVICE=none
> / # export TSLIB_FBDEVICE=/dev/fb0
>
> -- clear screen
> / # ./fb
>
> -- run ts_calibrate
> / # ts_calibrate
> (you can calibrate touchscreen now, and get below errors)
>
> [  113.942087] stmpe-i2c0-0041: failed to read regs 0x52: -110
> [  114.063598] stmpe-i2c 0-0041: failed to read reg 0x4b: -16
> [  114.185629] stmpe-i2c 0-0041: failed to read reg 0x40: -16
> [  114.307257] stmpe-i2c 0-0041: failed to write reg 0xb: -16
>
> ...
> with i2c patch applied, you will find below logs:
>
> RAW---------------------> 3164 908 183 118.110884
> TS_READ_RAW----> x = 3164, y =908, pressure = 183
> RAW---------------------> 3166 922 126 118.138946
> TS_READ_RAW----> x = 3166, y = 922, pressure = 126
> ....
>
> files link:
> https://drive.google.com/drive/folders/1qNbjChcB6UGtKzne2F5x9_WG_sZFyo3o?usp=sharing
>
>
>
>
> Dillon Min (4):
>   drm/panel: Add ilitek ili9341 panel driver
>   i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
>   clk: stm32: Fix stm32f429's ltdc driver hang in set clock rate
>   clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after
>     kernel startup
>
>  drivers/clk/clk-stm32f4.c                    |   10 +-
>  drivers/gpu/drm/panel/Kconfig                |   12 +
>  drivers/gpu/drm/panel/Makefile               |    1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1285 ++++++++++++++++++++++++++
>  drivers/i2c/busses/i2c-stm32f4.c             |   12 +-
>  5 files changed, 1310 insertions(+), 10 deletions(-)
>  create mode 100755 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>
> --
> 2.7.4
>
