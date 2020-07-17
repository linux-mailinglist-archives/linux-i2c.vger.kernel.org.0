Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BC6223793
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Jul 2020 11:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgGQJCS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Jul 2020 05:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQJCR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Jul 2020 05:02:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29CBC08C5C0
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jul 2020 02:02:16 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id q15so13891894wmj.2
        for <linux-i2c@vger.kernel.org>; Fri, 17 Jul 2020 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DQl00yYXYwsbpEtRwxsV9i6tqBPWGw0OYdTItL8Npos=;
        b=eKvpq7Vc+pWXLiZBlozFZ+/crmGW074XhcYNp3r4fmPCGI8tcs9WINywIQKdsPseE2
         8ANxuaBJTN/gfFuBoIKiKMD6t/RoizLQC/C5FpqaQuNzoK80pqOr/gkmFMoH6nt0lItv
         fwm7+63jhaXuoSSeEEcHzQQuQqzfAfoV62LvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DQl00yYXYwsbpEtRwxsV9i6tqBPWGw0OYdTItL8Npos=;
        b=eF1JO9+BfcAGZVpuIzrL3yPAF4PPALhQuMjAe/MctsKdwzz5vi4t1kMpUdxwQEM4XB
         iJJSVC9aV4UteujyIAAtsVZe6jccq7jAW9lz2qZo+/mg3WLj4EdN+4J/+WpshZAtSpxa
         EkELVRFcvQWP9hhelJz2SfIVwYHjHHi/XPcD0tffoLSl7vfUQhMrjSPGJxNvVmNhV6Pe
         p8PLhg3ppPDHibP4C992QdTTOKr3LkH/KNol9K20HZG4bVIgbCrm/DSvX1VTS9pz5bBn
         IWcemM6+wAA1rA+Davn8ja1udP62XivuGtSxX2BVi5KWV69AtIGIbJskH0H3/J3yQEI1
         Ripg==
X-Gm-Message-State: AOAM533KkhAxc47ZJ0dOhJo9Enzht7hcfc76zEo67n3+bOWeHz0ZgmY4
        gXIf966G/Sp0dqK8Ku5T3GMqQZvO/wU=
X-Google-Smtp-Source: ABdhPJxkxy6FlQOiuxDgHDw4Xc4tE6UUCy+720USQNgwde4/nwbXPW0bbDuGrlGPXgKWc23kFw+LHw==
X-Received: by 2002:a1c:48d:: with SMTP id 135mr8559807wme.102.1594976535435;
        Fri, 17 Jul 2020 02:02:15 -0700 (PDT)
Received: from rayagonda.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id w7sm12360705wmc.32.2020.07.17.02.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 02:02:14 -0700 (PDT)
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Robert Richter <rrichter@marvell.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Subject: [PATCH v2 1/2] i2c: add PEC error event
Date:   Fri, 17 Jul 2020 14:31:54 +0530
Message-Id: <20200717090155.10383-2-rayagonda.kokatanur@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
References: <20200717090155.10383-1-rayagonda.kokatanur@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add new event I2C_SLAVE_PEC_ERR to list of slave events.
This event will be used by slave bus driver to indicate
PEC error to slave client or backend driver.

Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
---
 include/linux/i2c.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index b8b8963f8bb9..e04acd04eb48 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -370,6 +370,7 @@ enum i2c_slave_event {
 	I2C_SLAVE_READ_PROCESSED,
 	I2C_SLAVE_WRITE_RECEIVED,
 	I2C_SLAVE_STOP,
+	I2C_SLAVE_PEC_ERR,
 };
 
 int i2c_slave_register(struct i2c_client *client, i2c_slave_cb_t slave_cb);
-- 
2.17.1

