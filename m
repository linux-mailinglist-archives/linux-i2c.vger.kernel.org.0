Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEAB372C73
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhEDOwW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhEDOwN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:52:13 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78739C061763
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:51:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by xavier.telenet-ops.be with bizsmtp
        id 0erG250033aEpPb01erGFl; Tue, 04 May 2021 16:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-002nxa-KN; Tue, 04 May 2021 16:51:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-00HQUP-3M; Tue, 04 May 2021 16:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] dt-bindings: i2c: renesas: Convert to json-schema
Date:   Tue,  4 May 2021 16:51:07 +0200
Message-Id: <cover.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

This patch series converts the DT bindings for the various I2C
controllers found in Renesas SoCs to json-schema, after a small cleanup
to ease the conversion.

The trickiest part is the conversion for renesas,iic, as it's not clear
to me which IIC instances have the automatic transmission registers and
which don't.  Whatever the outcome, passing validation for this variant
will require DTS changes.

Thanks for your comments!

Geert Uytterhoeven (6):
  i2c: rcar: Drop "renesas,i2c-rcar"
  dt-bindings: i2c: renesas,i2c: Drop "renesas,i2c-rcar"
  dt-bindings: i2c: renesas,i2c: Convert to json-schema
  [RFC] dt-bindings: i2c: renesas,iic: Convert to json-schema
  dt-bindings: i2c: renesas,riic: Convert to json-schema
  dt-bindings: i2c: renesas,iic-emev2: Convert to json-schema

 .../devicetree/bindings/i2c/renesas,i2c.txt   |  67 --------
 .../bindings/i2c/renesas,iic-emev2.txt        |  22 ---
 .../bindings/i2c/renesas,iic-emev2.yaml       |  54 ++++++
 .../devicetree/bindings/i2c/renesas,iic.txt   |  72 --------
 .../bindings/i2c/renesas,rcar-i2c.yaml        | 158 +++++++++++++++++
 .../devicetree/bindings/i2c/renesas,riic.txt  |  32 ----
 .../devicetree/bindings/i2c/renesas,riic.yaml |  83 +++++++++
 .../bindings/i2c/renesas,rmobile-iic.yaml     | 160 ++++++++++++++++++
 MAINTAINERS                                   |   8 +-
 drivers/i2c/busses/i2c-rcar.c                 |   1 -
 10 files changed, 459 insertions(+), 198 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,i2c.txt
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
