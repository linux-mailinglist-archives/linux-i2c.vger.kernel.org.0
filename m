Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FFF193FA
	for <lists+linux-i2c@lfdr.de>; Thu,  9 May 2019 23:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfEIVEq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 17:04:46 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43124 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfEIVEq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 May 2019 17:04:46 -0400
Received: by mail-pf1-f193.google.com with SMTP id c6so1931302pfa.10;
        Thu, 09 May 2019 14:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PXOftG3/6YrbgosB/Tyod4caSVXtKhg8wDNSGkZ5bv0=;
        b=ZNrv2KQekf2+/q3ILwAE77MgwqImbEpT87eBY/d5YyVuf4e7bD4nK5bL1XJdglu5kY
         cbGJWBXP8KNcec/eBtP50guZC8FzrKzhLgieoSRpPS4AGEan4taDW7a6mmtJZFxP/gW8
         waL82qZRwop/8Q4nav+fDjgSWMrnaWXHH2cxHSd20FMcoDzsGrm5PeqPMl1cE5M7k+sy
         W10EZp7sPe8fw9umaEDnAI97QwFy/TdW5c0Bv4bZseBEDdx/cS9S2rwlBoVO0JnW1ml0
         hsTNsoQbfS4fNI25DdIjhX1qTomjLTLKD59S5v8HIA2spMxDoBcEaMlKH+tgNONB/0cN
         dbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PXOftG3/6YrbgosB/Tyod4caSVXtKhg8wDNSGkZ5bv0=;
        b=gTjI4y06cpediG6UBRhaiZo8hWjJSjbzT25b5gepS31/NpA54tRVSSPWYFhDVh25CM
         Tj5yauCs2h0iKF+5nm0f8C4ZNxjhAPHWfa9XqFoPfDXNequzgqTxGMnP57uYTWWB8WcV
         COf/tjOGWLfOvlwMPf1z2bDunfeZ4Z49aT7bitrjcIP6VMhlh1YGU7x6bgXpucLNTuv8
         +D/5PZAR7KYzOyOd1AJQswXyXDCEA4acDijUDBh4oLS/exlEGbbupaqtHLOYCkyIipRp
         cu+SHBNS/sxw3XRaJpmbgjyqyFZOXIBzaO3bLAYRpTQ9NoGU5yo6AuQ9Zk/iKi5gvANv
         e3bQ==
X-Gm-Message-State: APjAAAXur1bUMHhPqaMuTlYY1SPrarVknFjxBO9HP0AjLEsEkSDdl3Ry
        fqoGYnTX+waF5VSB94F0fE4=
X-Google-Smtp-Source: APXvYqxr3PpAzcv8um0n5MiENHdZ04NnND0L7pY74JcKcDwFJyjOygQVhzi1RhBosXWZcKmfe6PfPg==
X-Received: by 2002:a62:5286:: with SMTP id g128mr8275883pfb.226.1557435886054;
        Thu, 09 May 2019 14:04:46 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id l129sm6510430pfc.61.2019.05.09.14.04.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:04:45 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vignesh R <vigneshr@ti.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] i2c: Allow selecting BCM2835 I2C controllers on ARCH_BRCMSTB
Date:   Thu,  9 May 2019 14:04:36 -0700
Message-Id: <20190509210438.28223-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Kamal Dasu <kdasu.kdev@gmail.com>

ARCH_BRCMSTB platforms have the BCM2835 I2C controllers, allow
selecting the i2c-bcm2835 driver on such platforms.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 26186439db6b..7277c1051ca2 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -435,7 +435,7 @@ config I2C_AXXIA
 
 config I2C_BCM2835
 	tristate "Broadcom BCM2835 I2C controller"
-	depends on ARCH_BCM2835
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB
 	help
 	  If you say yes to this option, support will be included for the
 	  BCM2835 I2C controller.
-- 
2.17.1

