Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB61825FEB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 10:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfEVI7r (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 04:59:47 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38719 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbfEVI7q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 May 2019 04:59:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id v11so989708pgl.5
        for <linux-i2c@vger.kernel.org>; Wed, 22 May 2019 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=csdVERX8dSQ7qyBeUMoSzLfDNYik/H197bs1aUHpWEE=;
        b=Yfz27RdeWay5eXTrkNYzPidWfd1s5Nxyvs2H5Kq5i0xkKQrLOgLeKpE9lAgXxRfbR4
         MNKDjq3c22egxUNKz3/I44a0VD7WA32q3CLY/pqOVMMWfS442/5r16T5rkoME2VJXy68
         dw+n0m8NKOPyXgzhXq8fmqCIR6GOMocxTs/iPS45cvwmSgLVzvh0m1lTeUAvOaDnhet2
         8xfrtQsiDsyPMIOy1eK4MwJwYrg9c452iD1SRSyd+YpYVYbEUEwry36HeHnr9N6PFYQN
         Lv7B73ooWsMXmdeKLHMyc+5rngow4IDFgfW1Nwg2pQL7lE/D8E+nGYirKURrvjiRb7IY
         oaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=csdVERX8dSQ7qyBeUMoSzLfDNYik/H197bs1aUHpWEE=;
        b=hRHkhdkGYGMIUSEdVvY6GZep0m5ndsu9OkS32CqNBdsD7rJeBoYG4HGrFo980Cr4sR
         HBVUHD/b4KrmST7bZwNBDjnthUik9MFu+ug448Gvh+nqRJHGw5kCi2vr0SGQn9pIKq4h
         WQNo80p/OzcCOxCmVIBHQz5h9QgVMRMjD8ciGNbMT2vYVqzXVAi0Gik2i6AUbX5rxxVL
         LcwbSNFzY6onfUvRFhutWGPzPP4UA7xWap/8FnsZQgzJLssmI7sqZZ5yaUNoHRAirahM
         t4wI8NlcFFl5wQ3fX/OaVGjXsp53TgyC0XMaGvWZV6LP8CT8u3/vDnp5hUqy434VgSBu
         s63A==
X-Gm-Message-State: APjAAAVrKkqY9LYtUfymsbBoehEg5homZ1yOR4fHCA/enhJciZC0qUzl
        m7vs1eqbQOSV0dxfa6BqEGgYXA==
X-Google-Smtp-Source: APXvYqzrS8Uu+raOf+5M2t7dHWXbMQZRQgl34nRj+XRx9eTVexFa5TS9MoWstoGp26MSi8ECnOxjhA==
X-Received: by 2002:a63:1354:: with SMTP id 20mr87126477pgt.356.1558515586071;
        Wed, 22 May 2019 01:59:46 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id z6sm42465905pfr.135.2019.05.22.01.59.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 22 May 2019 01:59:45 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Wed, 22 May 2019 14:29:31 +0530
Message-Id: <1558515574-11155-1-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The patch is based on mainline v5.2-rc1 and extends DT-bindings for Opencore based I2C IP block reimplemented
in FU540 SoC, available on HiFive unleashed board (Rev A00), and also provides a workaround for broken IRQ
which affects the already available I2C polling mode interface in mainline, for FU540-C000 chipsets.

The polling mode workaround patch fixes the CPU stall issue, when-ever i2c transfer are initiated.

This workaround checks if it's a FU540 chipset based on device tree information, and check's for open
core's IF(interrupt flag) and BUSY flags to break from the polling loop upon completion of transfer.

To test the patch, a PMOD-AD2 sensor is connected to HiFive Unleashed board over J1 connector, and
appropriate device node is added into board specific device tree as per the information provided in
dt-bindings in Documentation/devicetree/bindings/i2c/i2c-ocores.txt.
Without this workaround, the CPU stall's infinitely.

Busybox i2c utilities used to verify workaround : i2cdetect, i2cdump, i2cset, i2cget


Patch History:
V6<->V7:
-Rectified space and tab issue in dt bindings strings.
-Implemented workaround based on i2c->flags, as per review comment on v6.

V5<->V6:
-Incorporated suggestions on v5 patch as follows:
-Reformatted compatibility strings in dt doc with one valid combination on each line.
-Removed interrupt-parents from optional property list. 
-With rebase to v5.2-rc1, the v5 variant of polling workaround PATCH becomes in-compatible.
 Till kernel v5.1 the polling mode was enabled based on i2c->flags, wherease in kernel v5.2-rc1 polling mode is set as
 master transfer algorithim at probe time itself, and i2c->flags checks are removed.
-Modified v5 to check for SiFive device type in polling function and include the workaround/fix for broken IRQ.

v4<->V5:
-Removed un-necessary checks of OCORES_FLAG_BROKEN_IRQ.

V3<->V4:
-Incorporated suggestions on v3 patch as follows:
-OCORES_FLAG_BROKEN_IRQ BIT position rectified.
-Updated BORKEN_IRQ flag checks such that if sifive device (Fu540-C000) is identified,then use polling mode as IRQ is broken.

V2<->V3:
-Incorporated review comments on v2 patch as follows:
-Rectified compatibility string sequence with the most specific one at the first (dt bindings). 
-Moved interrupts and interrupt-parent under optional property list (dt-bindings).
-Updated reference to sifive-blocks-ip-versioning.txt and URL to IP repository used (dt-bindings).
-Removed example for i2c0 device node from binding doc (dt-bindings).
-Included sifive,i2c0 device under compatibility table in i2c-ocores driver (i2c-ocores).
-Updated polling mode hooks for SoC specific fix to handle broken IRQ (i2c-ocores).


V1<->V2:
-Incorporate review comments from Andrew
-Extend dt bindings into i2c-ocores.txt instead of adding new file
-Rename SIFIVE_FLAG_POLL to OCORES_FLAG_BROKEN_IRQ

V1:
-Update dt bindings for sifive i2c devices
-Fix broken IRQ affecting i2c polling mode interface.



Sagar Shrikant Kadam (3):
  dt-bindings: i2c: extend existing opencore bindings.
  i2c-ocores: sifive: add support for i2c device on FU540-c000 SoC.
  i2c-ocores: sifive: add polling mode workaround for FU540-C000 SoC.

 .../devicetree/bindings/i2c/i2c-ocores.txt         |  9 ++++--
 drivers/i2c/busses/i2c-ocores.c                    | 33 ++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)

-- 
1.9.1

