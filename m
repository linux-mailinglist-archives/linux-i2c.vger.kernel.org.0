Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EDD1A1E7C
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 12:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgDHKEO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 06:04:14 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34875 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgDHKEO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 06:04:14 -0400
Received: by mail-pf1-f195.google.com with SMTP id a13so2193499pfa.2;
        Wed, 08 Apr 2020 03:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0l2SgjQoUm9XZQWLHdahmUXmkeQjGbkw3tE+oZhCKVs=;
        b=pwnDjzJ9s4ltda4yGC5klCTFEE8QaNhAa/u7j3EP+/yIokVkfPKvEzGidqZ9FVAKJZ
         HCfIv8ygTMfIX1eUGAECmcdGhwDz+r6jpWNbjh08mlXTvBMIBCFmooPeEcgzlYrnSojo
         VGiqfDybdbRtQ3fYcE2WFZF74PH3CUDRyFbCn4Qx/kGBx6UgXuEBHa5GFQLXo8elHT5U
         u3ukDKJaUxtC/Avln35AQS0d/jskn9xPWtLLGorG5qEFYr3V0Oaow6gJZyUoiMV6GJ2T
         xHhQLdcxTLc5aPGa5yIfo+Ao3kuOnMp8dfTuMO0bi0y/zeV3wmR/+5GcfxXYSpK92v0j
         cwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0l2SgjQoUm9XZQWLHdahmUXmkeQjGbkw3tE+oZhCKVs=;
        b=YTrV0XSZTb/MOTDiqMfKrM6lRUEn2t53KVJdRIlhCb1F+LnIj2V8En319ZRulVwc6C
         TYFAZl6tOPwVh6t33jc/nP8vIcBiyZpDuhvBMDP1GpoJ5wcHnBH396/WgX3pbQJwoecT
         +WatbYBh+YesjzoXKL6FAEiB7XpYhz5CNDfd7HVlC0RSfldx3kx3q611raGbafnNGc2d
         0Q84ReeZY0RtsotXaXolh5R0wSiKAC1dolv5ZCede612ERXdnrwvssuznLTFA3JjyqwA
         U6p625g7belLhnPS5suudbg6SkWwIddz2eVKZrTBd0uc6EcOEBEDp2wPYz1J7Tbw0Z+G
         WSiA==
X-Gm-Message-State: AGi0PuZJBEPCn65Fwua8cMDBlrgkG1joe2p3RJZYVa79OyR5LD8Ccsu3
        rg0cV2RInIUdjbZI6y7Q4uI=
X-Google-Smtp-Source: APiQypJ2rtu2lzZorHDGO2Y9Nj8eRhkIqFK3//sK3EfN2KbEyI5rBMrG/z5wgIY4NOsELjd1ZatGLg==
X-Received: by 2002:aa7:93cd:: with SMTP id y13mr6736602pff.213.1586340253160;
        Wed, 08 Apr 2020 03:04:13 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:610d:c995:d0f2:9d90:2f2e:7df9])
        by smtp.gmail.com with ESMTPSA id i124sm16140306pfg.14.2020.04.08.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 03:04:12 -0700 (PDT)
From:   Aishwarya R <aishwaryarj100@gmail.com>
Cc:     aishwaryarj100@gmail.com,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: powermac: Simplify reading the "reg" and "i2c-address" property
Date:   Wed,  8 Apr 2020 15:33:53 +0530
Message-Id: <20200408100354.17782-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use of_property_read_u32 to read the "reg" and "i2c-address" property
instead of using of_get_property to check the return values.

Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-powermac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index d565714c1f13..81506c2dab65 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -207,18 +207,18 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 					   struct pmac_i2c_bus *bus,
 					   struct device_node *node)
 {
-	const __be32 *prop;
-	int len;
+	u32 prop;
+	int ret;
 
 	/* First check for valid "reg" */
-	prop = of_get_property(node, "reg", &len);
-	if (prop && (len >= sizeof(int)))
-		return (be32_to_cpup(prop) & 0xff) >> 1;
+	ret = of_property_read_u32(node, "reg", &prop);
+	if (ret == 0)
+		return (prop & 0xff) >> 1;
 
 	/* Then check old-style "i2c-address" */
-	prop = of_get_property(node, "i2c-address", &len);
-	if (prop && (len >= sizeof(int)))
-		return (be32_to_cpup(prop) & 0xff) >> 1;
+	ret = of_property_read_u32(node, "i2c-address", &prop);
+	if (ret == 0)
+		return (prop & 0xff) >> 1;
 
 	/* Now handle some devices with missing "reg" properties */
 	if (of_node_name_eq(node, "cereal"))
-- 
2.17.1

