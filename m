Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A4018C115
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Mar 2020 21:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbgCSUMj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Mar 2020 16:12:39 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35024 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgCSUMi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Mar 2020 16:12:38 -0400
Received: by mail-lj1-f195.google.com with SMTP id u12so4036229ljo.2;
        Thu, 19 Mar 2020 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wkLX2s1nqC4/s2saqipeX2z/4ELPxY+SBvbFqtjm2hU=;
        b=TwydsAJj8fSLn1Uj3o2Haivq/oiV2I2M1hW88D/4YfUQq559qApPr/vx91lKXFlRgy
         uHBz9/vM5/FYTdnQ71kEZksPThe0VMRZ9ciUuQ/3Iua8Of4BubAkPcHsVbUPqg9gHwUP
         KWIo2HXFGuoD6hxCOtU8S5C0ZDUkSEknTl61QzUl5obvo/sjgLBUVorEGADx95ICPssc
         Z6As6Y7spouFWqt93csCiGhD/SInV/g27n2gZEhNfZewJYX5mqsB7UrHsfmvSImzp5O5
         0A0LY3Vs7Fbl4edAWwTbJbVUKfmuvVZwqafLAOjM73wW0GzTP2tceZTu3ZoesttbJQ0T
         z61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wkLX2s1nqC4/s2saqipeX2z/4ELPxY+SBvbFqtjm2hU=;
        b=Vr5xGtXMkPhuPWoIGgtgy6KwHhHjQhvtCPFLNWYOHvfmwzKrPBphTk/hudc1rTjzpR
         zqMNavfmgFIPxL9t6tdcb2WfzsbhV6/pQOhwZXGokn54cYHJIEZScUcJnN2nnbd/OrD4
         fnKudblsjmkza6k1bdiQlv2/teJKZavBB/JSnvCPd6PqjyUsw5j4kLtYeKtvmgAg2o4V
         cRdYYMPWbhXTGpDybv6nW3XizrCDh1IzyqGfs9+r1QbC+HXKmFslwFqzvWxphy9ReNG4
         s6P8N741YUfEVYAQ8G8sIkxFXhpl+X03y6fva0Km62UXcscGNz9h5Ph58cFDOvUDRhwf
         yA/w==
X-Gm-Message-State: ANhLgQ3o2m0d0sG0QWlDXUrHQY7HOK7GeCSekW3cp7lwyxN1ZJphoRJo
        gBMR2MFrJ2lX5UlQIarP4co=
X-Google-Smtp-Source: ADFU+vsJ1IvYqKOAsalgCu/GNkuLPf8EfUK4hU2fz7zgktmlhFHKLUClSRydu3/ewT8BvJgwFzZ6DA==
X-Received: by 2002:a2e:b4e5:: with SMTP id s5mr3240453ljm.190.1584648756385;
        Thu, 19 Mar 2020 13:12:36 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru. [94.29.39.224])
        by smtp.gmail.com with ESMTPSA id z21sm2059317ljz.49.2020.03.19.13.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:12:35 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: tegra: Better handle case where CPU0 is busy for a long time
Date:   Thu, 19 Mar 2020 23:11:39 +0300
Message-Id: <20200319201140.17451-2-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200319201140.17451-1-digetx@gmail.com>
References: <20200319201140.17451-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Boot CPU0 always handle I2C interrupt and under some rare circumstances
(like running KASAN + NFS root) it may stuck in uninterruptible state for
a significant time. In this case we will get timeout if I2C transfer is
running on a sibling CPU, despite of IRQ being raised. In order to handle
this rare condition, the IRQ status needs to be checked after completion
timeout.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cbc2ad49043e..dabb9223990c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1034,14 +1034,18 @@ tegra_i2c_wait_completion_timeout(struct tegra_i2c_dev *i2c_dev,
 		disable_irq(i2c_dev->irq);
 
 		/*
-		 * There is a chance that completion may happen after IRQ
-		 * synchronization, which is done by disable_irq().
+		 * Under some rare circumstances (like running KASAN +
+		 * NFS root) CPU, which handles interrupt, may stuck in
+		 * uninterruptible state for a significant time.  In this
+		 * case we will get timeout if I2C transfer is running on
+		 * a sibling CPU, despite of IRQ being raised.
+		 *
+		 * In order to handle this rare condition, the IRQ status
+		 * needs to be checked after timeout.
 		 */
-		if (ret == 0 && completion_done(complete)) {
-			dev_warn(i2c_dev->dev,
-				 "completion done after timeout\n");
-			ret = 1;
-		}
+		if (ret == 0)
+			ret = tegra_i2c_poll_completion_timeout(i2c_dev,
+								complete, 0);
 	}
 
 	return ret;
-- 
2.25.1

