Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47D2B29E4D2
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 08:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387714AbgJ2Hre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 03:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387645AbgJ2HrY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 03:47:24 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3364C0613CF;
        Thu, 29 Oct 2020 00:47:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s22so1646531pga.9;
        Thu, 29 Oct 2020 00:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0W6J6dQDZxnMRhIOOwL7oLVTMIIYbTyNlCsB21rcBk=;
        b=OlGmewJenhX/mmGDW75rDk3F8AjZpR/d9rnM5UgpGQhGxuBDXvGw63ef3rjww19L6Q
         ESt2M2dYaJjsCOdmwhkjeFm9MRNz4vVH3bR6VYp3yuHBjJ2lbXugw40wyvL1uRoARjkR
         cfqWDGZYPrO3gBj9bAyXFcjEX0G3K7QU6dszoNEcMdMVuZld42xWMHVwQ5zMfYT1lhIf
         kOsu9hrzO0fCxiVmNX08jShehbInHHR18rusI4n4k+ZKsjzAzA0N0W44YCu3nhJIY65Y
         Sk4vA9rrMZxSYVUuZCeAhzcphw3M92V15HvcOxrSbokjLsQ8MnzYjT1VBXFfnMveLK6Y
         Wy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0W6J6dQDZxnMRhIOOwL7oLVTMIIYbTyNlCsB21rcBk=;
        b=h1uHDCw9m//k48iyAs3mdZjpBc8IZD4HMoPRlDu8en3h0AtT7ohUFNxyq/5yKRYBrw
         q9kfUIUSLy+reaS5vHHXAGTktvWMED2uppawFCZPL4CVvIJp+r4XQQKXLG0aPyHt/wgg
         9LpkEkw2k6zB3PMB29gLhREBZU4x8VOsXz3kLSK0HNBfIp7MJIlQ9e2lmL0ADaXFHrKK
         8XL4L5zsY+B06sqMs74AGKjDdsGU9Hsvn4p/ux3qTCMrDRMUeLlb7s7Bp3tMgydU1bKo
         SkWMJIuPRNzj03Wn0SFs9MY6NrOaxrsBNf9hTr9kxHFnw6jK/3YETbSOLnprxMaK9An9
         vJtg==
X-Gm-Message-State: AOAM533gn3dfJL8UXm22FcP9k8+lCdQn4zXusOUeY3LSvJi55iavuI1e
        bepF/wmzKB0Ca1mPtMzw3Ogk1QYo4FnFAnJx
X-Google-Smtp-Source: ABdhPJx4Re44du3Bh3Glq4CSig96yOmK+68wRj+nQEGxRRDmY2AMI3ECHaSLrXOw+4B68z/UXhAl8A==
X-Received: by 2002:a63:d946:: with SMTP id e6mr2999557pgj.113.1603957643315;
        Thu, 29 Oct 2020 00:47:23 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id w123sm1972428pfd.34.2020.10.29.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:47:23 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] i2c: brcmstb: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:46:52 +0800
Message-Id: <20201029074654.227263-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index d4e0a0f6732a..16f688e115be 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -713,7 +713,6 @@ static int brcmstb_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int brcmstb_i2c_suspend(struct device *dev)
 {
 	struct brcmstb_i2c_dev *i2c_dev = dev_get_drvdata(dev);
@@ -731,7 +730,6 @@ static int brcmstb_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(brcmstb_i2c_pm, brcmstb_i2c_suspend,
 			 brcmstb_i2c_resume);
-- 
2.28.0

