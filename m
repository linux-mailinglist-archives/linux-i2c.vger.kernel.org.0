Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59D1E11433B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Dec 2019 16:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbfLEPFU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Dec 2019 10:05:20 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36788 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729662AbfLEPFU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Dec 2019 10:05:20 -0500
Received: by mail-pg1-f194.google.com with SMTP id k3so1091471pgc.3;
        Thu, 05 Dec 2019 07:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7bEhOG/2EY2mJWxk7Xm4exoHqU8RZOoMa2hQWDN+lQs=;
        b=YEoeSk2gVSG/NiA/aEiud3jjEBRH9fNXqvKHwhE3o0+B/gB1bpLc8awHMs0LHasyzV
         2dt5ezXj/UaNrrYwuibkCaR3pFEAxM8C3LHvp24K3dAD+D86ll7lMoR/vCXXFfjCGTo/
         jpb/DnGj/jPERjFVLAUQ/RFWWYMlCEAlV6LstWQa1oHD88oXEFUCaDaCWT5wSqvovAeG
         VoKoax+EarF1tRo1fqTPjeWN1w29CPVFVcp6Mq8/GH5rP+71HyWfwNdHJpjHTuvKOlHG
         SI5HR/1XMha3hwQKldS5Y/xSSMzB+l/MwjiC5IXRvSugB/D6yPbkMJ6XQOAw961Fe1DX
         ZC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7bEhOG/2EY2mJWxk7Xm4exoHqU8RZOoMa2hQWDN+lQs=;
        b=s812pXeWQHsVkf0Ln1hiDJ4vTmdNvmd/emISPhtl5RxDi40sjt1P6GfgwvjjBbDetA
         Rg4Z36cdVbi9zybD2ctf1tdGgW4LZJ26V0FsxLN4c+vJR9UOvYT/0EASM3XvmOYthCmE
         zHTcNS8syUAT0zcp6lbPXRWuUPSw3KkczrWGrHhlSUYyloxmRZnQ+3+PddrVydmKYGt2
         pYLnfQsWLKzFjiou8XYA/U9cCuGrAXlheU5B3DyFirpGD4tInp2bKbjYFaYmiWltX+0G
         VlEcs28bYqbDrJU5MaF9Ugy1GKHkY8pxAaJ22dxa8ykn8HMmhQUT/isNezvzzDtitDAV
         seAg==
X-Gm-Message-State: APjAAAVpnlG74PqWeJGPUR9VT5b92o/crclCj0/2UuD+jE5ih/yPkdOI
        ryRy6zotAik/phgjvUfUehI=
X-Google-Smtp-Source: APXvYqzPBGy7vhlj1xp/CVXQM1TZerI1zsHPjK8tLeZzMnMnoG+pNDijOrqVGATYnVMv04y9SdNdUw==
X-Received: by 2002:a63:1a11:: with SMTP id a17mr9692495pga.126.1575558319634;
        Thu, 05 Dec 2019 07:05:19 -0800 (PST)
Received: from localhost.localdomain ([211.243.117.64])
        by smtp.gmail.com with ESMTPSA id h128sm13606742pfe.172.2019.12.05.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:05:19 -0800 (PST)
From:   Hyunki Koo <hyunki00.koo@gmail.com>
To:     wsa@the-dreams.de
Cc:     Hyunki Koo <hyunki00.koo@samsung.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>,
        Baolin Wang <baolin.wang@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ANDROID: i2c: exynos5: remove default enable in Kconfig
Date:   Fri,  6 Dec 2019 00:04:58 +0900
Message-Id: <20191205150500.21762-1-hyunki00.koo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Hyunki Koo <hyunki00.koo@samsung.com>

There are many exynos device and not all exynos device does not have
HSI2C controllers. Thus remove select this by default

Signed-off-by: Hyunki Koo <hyunki00.koo@samsung.com>
---
 drivers/i2c/busses/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6a0aa76859f3..3955315f48c7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -612,7 +612,6 @@ config I2C_EMEV2
 config I2C_EXYNOS5
 	tristate "Exynos5 high-speed I2C driver"
 	depends on ARCH_EXYNOS && OF
-	default y
 	help
 	  High-speed I2C controller on Exynos5 based Samsung SoCs.
 
-- 
2.17.1

