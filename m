Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3864A865A
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Feb 2022 15:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351237AbiBCOdk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Feb 2022 09:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351246AbiBCOd1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Feb 2022 09:33:27 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74069C061751
        for <linux-i2c@vger.kernel.org>; Thu,  3 Feb 2022 06:33:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:15aa:ab80:d2f:edb])
        by albert.telenet-ops.be with bizsmtp
        id qeZN260024dXKBW06eZNii; Thu, 03 Feb 2022 15:33:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdAn-00D0Xk-VG; Thu, 03 Feb 2022 15:33:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nFdAn-002sqy-Bt; Thu, 03 Feb 2022 15:33:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] i2c: rcar: Add R-Car S4-8 support
Date:   Thu,  3 Feb 2022 15:33:15 +0100
Message-Id: <cover.1643898531.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

This patch series adds support for the I2C Bus Interfaces in the R-Car
S4-8 (R8A779F0) SoC, to both DT bindings and driver code.  It has been
tested on the Renesas Spider development board.

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: i2c: renesas,rcar-i2c: Add r8a779f0 support
  i2c: rcar: Add R-Car Gen4 support

 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml | 6 ++++++
 drivers/i2c/busses/i2c-rcar.c                               | 1 +
 2 files changed, 7 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
