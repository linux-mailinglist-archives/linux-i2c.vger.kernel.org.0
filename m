Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48DE52D4B2
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2019 06:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfE2E1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 May 2019 00:27:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35647 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbfE2E1p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 May 2019 00:27:45 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so486513plo.2
        for <linux-i2c@vger.kernel.org>; Tue, 28 May 2019 21:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:subject:date:message-id;
        bh=E/FfJ9JkdQ/HCjWM9Sz23LCVJi+YnVXF/seA9CC8MAo=;
        b=KugZ1oePx2CstNh1GXd0AZ+8Fuc2uWVFyrynjgaCGyNYNrVtA2IlXtHD1XJDoBgHXn
         uCWNLO85u1g/zk/nGK4pfssE1/y62iAE5ZcVYe/Tn3pxy9RpnUvtBE1+hkBg3lli16CG
         nTY6+IfB7xZpSCzSp6S0yZyzAZxa3To9FBHF0eAUsMdTg6u5TlwcXiSJfqfe/M9tBysF
         bAYyt3E93Msxlbpjb+8FFVRQ0T2q7gS7Nc7bQEleRSdhLXZ5pPkps23KQcrtNaRafpMB
         wnrnRx99I8T6nYI4+pAnNfWv4OvuUcYl0LM0zHsLArKwRwwaVAMpPo8cTN0Nf1siPkTY
         tk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=E/FfJ9JkdQ/HCjWM9Sz23LCVJi+YnVXF/seA9CC8MAo=;
        b=JT+O2mC6pcjof99Qrim4D7SNX1PL0AH2z5vRQUknt3vN5IT9WsdJctjOEGin1J0kqq
         0KQU+UDui22l3J0crqLGpjIRNlerVyu9WvPFeu2a2gEjyGTOePHHWi2SRkogn9r7UpBl
         UVe8XZZmdGe2eXhapDn8BllIF9RIGF8dVBSwIoLD4Ldm1R8ufutgfSwy4U03wikEJvFb
         uzhhF68+coMmKIO5RVX4JKNQHtrSYWIdNq/Inf081pzrtGlTACLiov0MVIejllVmLE53
         13e4mwrvxSRUMDca+8+26NTnwOiOeLGri21ooeUVqES/Dljlb8Zn5h9G0CgesO/Ff5v7
         hnBQ==
X-Gm-Message-State: APjAAAUgZPWYnepU7Mz1WWbXctYbE/CFDdTI5/C98uU7dX1DoLOgaMLM
        lz451nPAkJ8FbDI0Afc6g4gmbA==
X-Google-Smtp-Source: APXvYqwnbELoqSJmyJKVAIjJfQY31S7rm+WEh1T4FZbyNWDf6pVyw0tDbPJOlLLOf8znM1oEu9R9tQ==
X-Received: by 2002:a17:902:b606:: with SMTP id b6mr141195207pls.100.1559104064751;
        Tue, 28 May 2019 21:27:44 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
        by smtp.googlemail.com with ESMTPSA id c15sm16444591pfi.172.2019.05.28.21.27.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 21:27:44 -0700 (PDT)
From:   Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, peter@korsgaard.com,
        andrew@lunn.ch, palmer@sifive.com, paul.walmsley@sifive.com,
        sagar.kadam@sifive.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] Extend dt bindings to support I2C on sifive devices and a fix broken IRQ in polling mode.
Date:   Wed, 29 May 2019 09:57:24 +0530
Message-Id: <1559104047-13920-1-git-send-email-sagar.kadam@sifive.com>
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
V7<->V8:
-Incorporated review comments for cosmetic changes like: space, comma and period(.)

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

