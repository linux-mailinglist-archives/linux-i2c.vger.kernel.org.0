Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46143171FB
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Feb 2021 22:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhBJVI0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Feb 2021 16:08:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbhBJVIY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Feb 2021 16:08:24 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E81C06174A
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 13:07:43 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id b16so4720352lji.13
        for <linux-i2c@vger.kernel.org>; Wed, 10 Feb 2021 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=5IZy1tTb5QrGSCjEpQwfhfoAh7oSoWmEioCsrQZMQJg=;
        b=vLUGlWjoFbWmmLVrst+jTFrWX19MdxyqeLBC2dKloPK9fQjiOWQmpwvPBD8/Nr6FDM
         mleDykT7fa5NCdw2cJ4IAJi7dFpqI9kfsahSfSTO9mmsmqXIXj3SlgmBkjrMTJW8F3wP
         Tb81QcpE8F1LD5fjmaV00tw5IftVM6zUrUGUSWPFIVpGcIfzXZID49VxI4Smg6xlA7BD
         vEsE9tpoqduKXwBlh6BPeHwAPdv0lWSGJtPGGRKe9Jw0qemanhm20/THxq2+WTC0wNSz
         ZiOAPEhaqhY0ugoWAUZHPN6nro0dVPtz+XzCrKghAiAjWlhI6hgyxN17AzuPga1fhCN/
         8JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=5IZy1tTb5QrGSCjEpQwfhfoAh7oSoWmEioCsrQZMQJg=;
        b=glt7dTAx2p429P+2B5ybiy4u4kfqGYC/9iInq8SpnoaFbebdJTvp6uQzJ9GCqi/FvX
         ZJLh8YKe2SesWxwaF2YdElIuAk8k8Muk08I6bT+MrDIisE2tdMVwMp/soF5fwv2GT2c6
         NS3JdAWmdoReML4ikG1R4ADlJz0ZEKNyOPkeE6Tw5VrNlpHc5scgjWY61GDYvOCKjDMS
         tGmjmJkd7wVuPw2+LOTz5Brvt35xzJxzjCOfl01j4aEA29YS0AMO7EY6jiabyCbHuQ68
         Bkp3ONw/9LAzY2mttnqK0YLGCCKeDCEPhL2bBK3Y+awivrFS7Ip3WlZuIW1TKaorlio+
         KC/g==
X-Gm-Message-State: AOAM5304pRftXPyo5Pghjqd59xMHW4tZgx1PwkuGgtjJBsLAE1VX7GgC
        5h+oB9RmBAwyT970uftl2/yuO59twbiq/mwFN7h8uVPht6Vggg==
X-Google-Smtp-Source: ABdhPJx0H3pRBmfEdHQuzt0pZeAZ+zGoLOs4TH70lG6Olq7b955+epC78jixCIkCtMbUTTflsDtYs4GFXdg33YE0np4=
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr3004504ljo.401.1612991262258;
 Wed, 10 Feb 2021 13:07:42 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@gmail.com>
Date:   Wed, 10 Feb 2021 22:07:31 +0100
Message-ID: <CACCVKEGC5paBTzFW5vZGPcKHgxS4v6B8Hk=tjxiGVuCfExUrkQ@mail.gmail.com>
Subject: [PATCH 1/2] Adding i2c-cp2615 to Kbuild
To:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For a hardware project, I need the I2C master of SiLabs' CP2615 chip
to be visible from under Linux. This patchset adds i2c-cp2615, a
driver which sets up an i2c_adapter for said chip.

This is my first contribution, so forgive me (but do let me know) if
I've broken habit.

Signed-off-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>
---
 drivers/i2c/busses/Kconfig  | 10 ++++++++++
 drivers/i2c/busses/Makefile |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a49e0ed4a599..7a0dd18140d3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1227,6 +1227,16 @@ config I2C_DLN2
      This driver can also be built as a module.  If so, the module
      will be called i2c-dln2.

+config I2C_CP2615
+    tristate "Silicon Labs CP2615 USB sound card and I2C adapter"
+    depends on USB
+    help
+      If you say yes to this option, support will be included for Silicon
+      Labs CP2615's I2C interface.
+
+      This driver can also be built as a module.  If so, the module
+      will be called i2c-cp2615.
+
 config I2C_PARPORT
     tristate "Parallel port adapter"
     depends on PARPORT
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 683c49faca05..63179a148aab 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -127,6 +127,8 @@ obj-$(CONFIG_I2C_ZX2967)    +=3D i2c-zx2967.o
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)    +=3D i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)        +=3D i2c-dln2.o
+obj-$(CONFIG_I2C_CP2615) +=3D i2c-cp2615.o
+i2c-cp2615-objs :=3D cp2615_drv.o cp2615_iop.o
 obj-$(CONFIG_I2C_PARPORT)    +=3D i2c-parport.o
 obj-$(CONFIG_I2C_ROBOTFUZZ_OSIF)    +=3D i2c-robotfuzz-osif.o
 obj-$(CONFIG_I2C_TAOS_EVM)    +=3D i2c-taos-evm.o
--=20
2.30.0
