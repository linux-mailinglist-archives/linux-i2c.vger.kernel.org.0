Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609A31B79D1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 17:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbgDXPf2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 11:35:28 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:43581 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726849AbgDXPf1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Apr 2020 11:35:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 99300D4C;
        Fri, 24 Apr 2020 11:35:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=c0Cq8AgsYHTOO
        +aKa7NtdasFIoTnbBQjl8WHb1AcNco=; b=AIgM//qhbQnqcGZd6ypjsTr0h4cA4
        P9moePqISdJM4fa0mFETksJlM9nh7fkiATFVzQbZAcxYRIAdt8xwLGcMB5aYUELg
        cgjUEdQwNqOjvqX/DpMdeToSFY9SJ0xaspOjQJ1hBbBnwdyFapnv06O9EPMxsFZa
        6wD2R3ukL2/WLZM3qWOiFgK0Ab7P5PWBcTY4GVa24cBwtHMKUKAXwnZVT0PPqU4c
        GVBECWcFVHnGM51dQrP0MA1by4Tt7uR4LUm8l/pJlUROogxVs6TxGolA8kOEEeic
        yRHM4Q7lhzP9X3cj7PqdqTfDRQXNXaYSiCVP9NP2WlEgLctbo1Zx7xQTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=c0Cq8AgsYHTOO+aKa7NtdasFIoTnbBQjl8WHb1AcNco=; b=rTJv9lGS
        l/Pah3UDoWJ8NJaUp9LhURu1LSEDjraxbuzf/S5yoS3N1Jk1AfMmwRJxU2gl8cg2
        VJDyXTRl4DvpWIbgFdUE53cX9EdFVhSvdbf80vf+fm6EfhOYZUaJqarwUgDkSoFE
        3nLJKtMtKdHOLGdewtLDi4W9SqkB46O8149I0gyVv0YjxB8kv59L3WJadKALEryh
        61NMk8jCLT9lXLF9jQ5mYe5QOVF3bbpN7u0HaaytMljApzQmA1hzPlCISVBub2Jy
        ZATPbNzgz+hMUTA35t9xSuLVS61deV2dItdwVhlIJxXt219L2Ley6dcOAhR8H+/B
        SMeeylBUEDEd3A==
X-ME-Sender: <xms:PAejXhFJcy9keLEvH-F1EkiBrfwLT6KUl0O1oQAXeDclq-nJQY_Pag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PAejXszuuchr5JKJspuQw8qBdu98B01y-tXS-AD5DUn1s3KQNQWPAg>
    <xmx:PAejXkfCgGKU-Nd6cx5nVg0QUFMw0MC3f1d-0lHDQedXv__RLftUyw>
    <xmx:PAejXi_5QXGSaDj0Bh8O-W_eXCUTWPbZI3m6h_N4qIsKc8fscRLSJg>
    <xmx:PQejXnVFBw61Tij7uieRQ3X9vLfkHNTA52yl6RpJnUvdq97bRxMqDrIGpeE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id BC8043065D87;
        Fri, 24 Apr 2020 11:35:23 -0400 (EDT)
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
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
Date:   Fri, 24 Apr 2020 17:33:42 +0200
Message-Id: <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The BCM2711, supported by ARCH_BCM2835, also has a controller by the
brcmstb driver so let's allow it to be compiled on that platform.

Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/i2c/busses/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2ddca08f8a76..6644e0faa3df 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -475,8 +475,8 @@ config I2C_BCM_KONA
 
 config I2C_BRCMSTB
 	tristate "BRCM Settop/DSL I2C controller"
-	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
-		   COMPILE_TEST
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
+		   ARCH_BCM_63XX || COMPILE_TEST
 	default y
 	help
 	  If you say yes to this option, support will be included for the
-- 
git-series 0.9.1
