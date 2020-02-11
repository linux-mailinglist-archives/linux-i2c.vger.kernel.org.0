Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAC0159B88
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 22:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBKVrf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 16:47:35 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.102]:34870 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbgBKVrf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 16:47:35 -0500
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:47:34 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581457653;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=jlcXe1GGaAraVsZORKSVtw7OXag13VFOYmFZdQixrBw=;
        b=oWwjhBxbd9VeSdkfAgLrSuxC6foVWIZjrchz1+s1egciEoWGJDDliK3ASpOBH7FsgH
        r0QraqANoCUtsF3j4EmTuhGS3UXD/FvVnmn/MPphg9EgHrokEl1FI+pcNzoN7uS0deqj
        85NCqgsrQw61gfVJehyAkq8oGWb3VmgK/yNLMpvf67fgaO34i9aDnydKiKlJdZmnEyAy
        9BJGkM6EMbWyhIeNfnYoQyc6X9jIKMMms6Fwypb6uk9Xd5hUWwv+YSI+K9KiItdu9VPu
        FUgueEQHJsfT5+v+QWgw7auXmPkZG0OL+pGgFJosZ6S6vV1f7vYVESuWOA4flFr7MFSj
        Fv4A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1BLfY0EI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 11 Feb 2020 22:41:34 +0100 (CET)
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
Subject: [PATCH 02/14] drm: ingenic-drm: add MODULE_DEVICE_TABLE
Date:   Tue, 11 Feb 2020 22:41:19 +0100
Message-Id: <94e63f456954f4e0c9a3ee7349f97281241db2f5.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add MODULE_DEVICE_TABLE so that the driver can load by
matching the device tree if compiled as module.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 6d47ef7b148c..d8617096dd8e 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -844,6 +844,8 @@ static const struct of_device_id ingenic_drm_of_match[] = {
 	{ /* sentinel */ },
 };
 
+MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
+
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
 		.name = "ingenic-drm",
-- 
2.23.0

