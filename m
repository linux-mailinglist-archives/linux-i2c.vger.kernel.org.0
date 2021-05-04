Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DA2372C68
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhEDOu2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhEDOu2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:50:28 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C02C0613ED
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:49:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by andre.telenet-ops.be with bizsmtp
        id 0epX250013aEpPb01epXJb; Tue, 04 May 2021 16:49:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwMc-002nva-He; Tue, 04 May 2021 16:49:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwMc-00HQRj-4g; Tue, 04 May 2021 16:49:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM: dts: r8a7745,r8a7794: Remove generic compatible strings from iic blocks
Date:   Tue,  4 May 2021 16:49:24 +0200
Message-Id: <cover.1620139307.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

	Hi all,

This patch series fixes the first issues discovered by[1], and removes
the generic compatible strings from the IIC blocks on the R-Car E2 and
RZ/G1E SoCs, as they do not have the automatic transmission registers.
More follow-up patches are expected, when IIC will have dislosed all of
its secrets...

Thanks for your comments!

[1] "[PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema"
    lore.kernel.org/r/ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  ARM: dts: r8a7745: Remove generic compatible strings from iic blocks
  ARM: dts: r8a7794: Remove generic compatible strings from iic blocks

 arch/arm/boot/dts/r8a7745.dtsi | 8 ++------
 arch/arm/boot/dts/r8a7794.dtsi | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
