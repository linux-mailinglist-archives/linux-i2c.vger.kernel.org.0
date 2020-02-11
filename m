Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966E0159BB8
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgBKVxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:53:38 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([81.169.146.176]:23467 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgBKVxh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581458015;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=l2ioSw/GBEgoEsJDqdX898kUDDw9CYiqWmti4ETUA48=;
        b=bu8KkI9hIzWf0Pbr1ExLGXwv8IBZGVTFyeEM/F0CQFj1ZkjepEBc/tdSJAI1VYwdiO
        ItNlMiTzTiTyHBkDE9kov76ydjAdTArST3OAPC093wHH1VDEI2KogUlTQnJSb8/rIeY8
        kbzok9Cr7lokB1nyDkuFJUPa49bMuwhlUfL1QQZOuBc77KU8Bg70nOs4vBFtuPRW22nw
        Wq8rCOzP5mM4tarq9WaXYDOAfZuq+uKFqIqyruU3blEonuoj8P2BG7MtiU5GdavpGMKd
        iyydeyyhF0g0CnBKgWOXlJqV9cLXuu+r0ziKSdw4p7kz7V0PhPkgNa3YJSTNy6u0Bjqh
        z/iQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLfa0EL
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:36 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        Alex Smith <alex.smith@imgtec.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH 05/14] MIPS: CI20: defconfig: configure for supporting modules
Date:   Tue, 11 Feb 2020 22:41:22 +0100
Message-Id: <b490287210e46565733209197ffdae3bc90137dc.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Not all drivers need to be compiled into the kernel.
Support building and loading of kernel modules.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2a81fb..e0d3c9d4c2ae 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -1,4 +1,5 @@
 # CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_MODULES=y
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-- 
2.23.0

