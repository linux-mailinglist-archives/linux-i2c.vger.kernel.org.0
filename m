Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE52929E4CD
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 08:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733189AbgJ2HrO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 03:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733219AbgJ2HrN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 03:47:13 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEC7C0613CF;
        Thu, 29 Oct 2020 00:47:12 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x13so1640006pfa.9;
        Thu, 29 Oct 2020 00:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V08PspyNA/Gd/mjf5dTuZbIBxLthbWMSkSzjG2zBo0o=;
        b=SG2X8CgsISg+8I/Lq0S7/HW98gq4rL+wuR+jZ2nrUH6do8lmt7Vq7N2hJdCSijkXrn
         mVNqUm6B3SaFqHDoEzvylvI+i9lclHzZd5p0SNMrIHTTwZBYUaeJLX9DTwft7sgTc83Y
         dwGohqw/6D1GjoeKawPA4RVlrLd+Pz1nSnM6lcLafhjCc0PTfYqeALZER8KZgcd3s/+j
         w8/nm4moV6Tfw90068cMIEXONYOsXXjMkJDCg+LZubWbIM+YTKdzukxM5EEfnuZ5UrmD
         74NjdWkEnDZrUxF4cbkaHWjNWrAJZFVG2/wJs4SCJbT0qwONNaapQhxSrRTnYXvod7q2
         JBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V08PspyNA/Gd/mjf5dTuZbIBxLthbWMSkSzjG2zBo0o=;
        b=doMUdxP60DRFnMGW8mS06TYK4JTOp6Fkjyr3Zk0W3uxXMAZ/yfgGAzHJmpDJvkE/7Y
         6BZfZU0NcPMmI26e2OsaUS2yxlXJeqUP0d5ZX6IlxxMpCwtG8/XbNirmCNrU7uSv13xC
         MTtSkB2ozJS9X9q/6N4z45/kLu3VerOF9fhIYmZZhXl26kApPItkyAUH+zz+Yhh1Hk9v
         og2xzqk4h43VdtC1xltjJVzNL3OWxLLczXqf3TyoTIw25etRs9MEmykbE7WbWVHlZHdI
         5/EjxGG8W8sM3HBKzvp8p7anmEOXJPCR+ehoELmw8h1sWrhGVIEj1XYZhEF0YPClTbQ1
         sg8g==
X-Gm-Message-State: AOAM532KdttVLZrwCtp6S7KtSvhvtyacBVO3FwQWHlMfTVjeTIty1hPX
        ZEunx2wM5sRrv6LeQQneAeYyN1ECsInVQskw
X-Google-Smtp-Source: ABdhPJyNXhvqb/kNPoP0bT3VqfcZ0W70z0M09OthqII7aEcE3f4rPU0NG/wWU/CIvU0ZQ4ihDKj10w==
X-Received: by 2002:a17:90a:aa91:: with SMTP id l17mr2964947pjq.198.1603957632406;
        Thu, 29 Oct 2020 00:47:12 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id b16sm1850091pfp.195.2020.10.29.00.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:47:12 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] i2c: qup: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:46:50 +0800
Message-Id: <20201029074654.227263-1-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index fbc04b60cfd1..bf63e4567705 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1940,7 +1940,6 @@ static int qup_i2c_pm_resume_runtime(struct device *device)
 }
 #endif
 
-#ifdef CONFIG_PM_SLEEP
 static int qup_i2c_suspend(struct device *device)
 {
 	if (!pm_runtime_suspended(device))
@@ -1955,7 +1954,6 @@ static int qup_i2c_resume(struct device *device)
 	pm_request_autosuspend(device);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops qup_i2c_qup_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(
-- 
2.28.0

