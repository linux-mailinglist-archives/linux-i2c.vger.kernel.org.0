Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816601F3796
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jun 2020 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbgFIKHA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jun 2020 06:07:00 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:50584 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726286AbgFIKHA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jun 2020 06:07:00 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 059A61L0028296;
        Tue, 9 Jun 2020 13:06:02 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id 99A1E639BE; Tue,  9 Jun 2020 13:06:01 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     mchehab+huawei@kernel.org, davem@davemloft.net, robh@kernel.org,
        gregkh@linuxfoundation.org, avifishman70@gmail.com,
        tmaimon77@gmail.com, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v1] MAINTAINERS: npcm7xx: Add maintainer for Nuvoton NPCM BMC
Date:   Tue,  9 Jun 2020 13:05:18 +0300
Message-Id: <20200609100518.239570-1-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add maintainer for Nuvoton NPCM BMC
I2C controller driver.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b..3a7365664676 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2143,6 +2143,7 @@ F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+F:	drivers/i2c/busses/*npcm*
 
 ARM/OPENMOKO NEO FREERUNNER (GTA02) MACHINE SUPPORT
 L:	openmoko-kernel@lists.openmoko.org (subscribers-only)

base-commit: 9cb1fd0efd195590b828b9b865421ad345a4a145
-- 
2.22.0

