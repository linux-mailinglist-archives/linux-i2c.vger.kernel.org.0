Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0083C8526
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jul 2021 15:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbhGNNXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jul 2021 09:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhGNNXA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jul 2021 09:23:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21015C0613DE
        for <linux-i2c@vger.kernel.org>; Wed, 14 Jul 2021 06:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by xavier.telenet-ops.be with bizsmtp
        id V1L52500H1ccfby011L5pm; Wed, 14 Jul 2021 15:20:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo1-00193t-8r; Wed, 14 Jul 2021 15:20:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eo0-00AapU-Pw; Wed, 14 Jul 2021 15:20:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] dt-bindings: i2c: renesas,riic: Add interrupt-names
Date:   Wed, 14 Jul 2021 15:19:59 +0200
Message-Id: <cover.1626267422.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

The Renesas RZ/A and RZ/G2L I2C Bus Interface has no less than 8
interrupts.  So I think it makes sense to use "interrupt-names"
property, to make it easier to review the interrupt mappings in DTS
files.

Hence this series documents the "interrupt-names" property in the DT
bindings, adds the property to the DTS files, and marks it required in
the DT bindings. Obviously the last step cannot be applied until all
earlier patches are upstream.

What do you think?
Thanks for your comments!

Geert Uytterhoeven (4):
  dt-bindings: i2c: renesas,riic: Add interrupt-names
  ARM: dts: rza: Add I2C interrupt-names
  arm64: dts: renesas: r9a07g044: Add I2C interrupt-names
  dt-bindings: i2c: renesas,riic: Make interrupt-names required

 .../devicetree/bindings/i2c/renesas,riic.yaml | 30 ++++++++++++++-----
 arch/arm/boot/dts/r7s72100.dtsi               |  8 +++++
 arch/arm/boot/dts/r7s9210.dtsi                |  8 +++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  8 +++++
 4 files changed, 46 insertions(+), 8 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
