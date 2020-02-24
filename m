Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD4E316A196
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 10:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgBXJQE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 04:16:04 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42993 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727709AbgBXJQE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 04:16:04 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Feb 2020 04:16:04 EST
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 5BB97546;
        Mon, 24 Feb 2020 04:08:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=aifkvOv9zRXxq
        ekpFLQ5g38F+d5Q84waAiGnY1d0dKA=; b=zHSiWKUe7BUqGibMMMhnFdpnYy8Dx
        oByM038YZepKvUtdWuQOGr4vYJJH9F0OXpnbuIR8Oi9jApxP8tU/KhBqsTvvV0vv
        DBzJbXqetR8TFArPMUR4aAdst0uwvyqrEswOvxYjWBCMBlfJFLU/YXW9z7rKsAak
        3Hcdqbf/X3I1z4Wl15Pqc6U0YYJK/aSMuyGT5qcVlW1YA2uX7uSNW6ekTn7fi5CV
        8kWH1lNMF529NADRn/OZ3fK5b9Q1SVmPUoOFbAJyNTr5rKYJG3mJz27Ma/z9D634
        ipagutWNS5u8BY/ky45mBV9MkeqoTONvZuVFcT7YhP+UfpRoVorbj39TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=aifkvOv9zRXxqekpFLQ5g38F+d5Q84waAiGnY1d0dKA=; b=1xcIzN5f
        gOFRqaiMEamDf/QyBFmL3lGKaSkXDVmJ06S7KxJyJwWUB+e02yoWwp2dH07UIs7j
        wNYuDq5URg95zfqdoX0Y9ASNBL0yRpDFu/aDAHrclGclYCaEneolDmbF3UDwkjSb
        VE5q1lvq1lC89HOT15zID9Fp+Ius0vuU8uV9kL6aQN9fmO18FPR8qyb3LPwGZbgy
        T6Xcd51F8lY05CZk1Tx9q0nJ+TF6rex6ZJYjl5m0hrhk3qfTQ3CEnVzW144+wIlT
        sDZvj+cRAL6/GlOsGtJVbQirT7dggba8UdUEh4Cp4fKffVghdjHHT/lKkCXzMMHu
        5W2oIRe8JwfVUA==
X-ME-Sender: <xms:p5JTXs19rhtFYaY82D5yzQIgVw_brvbEr9V3ZjcvahqdWYbtQazwRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
    phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
    eikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:p5JTXrWzcu65fd7BNERv_UFmOuaodSuZEZXYkz_g9Gq58rIyBqpvRA>
    <xmx:p5JTXv4O0vZWktqygUmnO0ZcINf3962OKgvpqa68gqn4WiB58E-dEQ>
    <xmx:p5JTXqKfD_YNibKbolYbPLwtJTxnXmem66a4ya7ztWp2upEv2HM_3w>
    <xmx:qJJTXnWek_2MGiM6ogkQRZ99oSOfnPswzMty1JkG9z9WdVLowfdLRlYP4hw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 502763280064;
        Mon, 24 Feb 2020 04:08:55 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH 04/89] i2c: brcmstb: Allow to compile it on BCM2835
Date:   Mon, 24 Feb 2020 10:06:06 +0100
Message-Id: <0ec2a26c7492b1ef6554d3bdada7a6fb8b41ab1c.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The BCM2711, supported by ARCH_BCM2835, also has a controller by the
brcmstb driver so let's allow it to be compiled on that platform.

Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..9b8494de4a59 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -476,7 +476,7 @@ config I2C_BCM_KONA
 config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
 	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
-		   COMPILE_TEST
+		   COMPILE_TEST || ARCH_BCM2835
 	default y
 	help
 	  If you say yes to this option, support will be included for the
-- 
git-series 0.9.1
