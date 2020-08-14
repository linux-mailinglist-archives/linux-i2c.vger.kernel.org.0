Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF04A244CBD
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 18:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgHNQbm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 12:31:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgHNQbl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 12:31:41 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3B5C061384
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:31:41 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id x7so4540198qvi.5
        for <linux-i2c@vger.kernel.org>; Fri, 14 Aug 2020 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mab-labs.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=lmHN5SYy7Em5JNLxnzV60nxQXT6FV/Za3kdptXG21KY=;
        b=LHXupami4ZFNrbxgCJB7/ChTI8YGpGqkzWZWEH1tc6kMPXg4bMI9pA0Tm74NsnZJE2
         QwVjmJM3ndHBeDA3cjK0iT3xtcHmrMj1+7NzbGuXNHs3fsXC3beSE1NVCj7fnhcMFDTI
         fJxRoT39hM6FfzBpFXc+5P++Ow5ln1dkKu+gQ2/9o/i5zSqAEdjP5Br3u2HUjfO7XAJ6
         uAf3YPGRwFBFPSiiI15Bu9+Cy2grxSz5cgJtaZdt8y/CKWH93OtTWjvVICuqzF7oAl4u
         CTfT37s3JGvsJiF5lSIjk1wDSUqqaqdLaFK08gDRYJF94zgXF7Yo19s9cTstLHJHoZXa
         ftVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lmHN5SYy7Em5JNLxnzV60nxQXT6FV/Za3kdptXG21KY=;
        b=YddWLC8Y5BcdH8sr+0TFzGQWONLR60YREeLxEEdUJqZNuU3+XrWkJhDqxCvqfR2vhM
         ozlYJG1sVjNHwsQo62LuBXjrPY4fMTjpWmeiQukHE8CxbzKRotjZ+6Z2l6TgfGdwvc4H
         q/Vqux1k4hvt29EyOxtoJWRyU5oofV+Zpw0NSN84MggumITzGruV8vmsBJ7w+U4Ah+66
         qJEznp3fteFHVMDISZLBsA3Yp9S/sS7yImjgl+huXC38dxY4xQsUC1O33K+Lexaqwlu3
         C3UPuPS6PwBdRs/ecmRDkpQ61+xVGBFKLzJjiTcjd+jjYX+1bKiGcGFXI8NOIFx/60aW
         vfPw==
X-Gm-Message-State: AOAM532UEpBCa2x1PXfCvX5FocD0DyOLJlz0wOsM/3SCrlIkHySYfdJq
        O//kJlksZHSzvAtA87Y6IOigFFnIdKyxpmlP
X-Google-Smtp-Source: ABdhPJx28oxYWCrJ0I1jbUDtUjSfyXNFL9g3P/4OPRfXevZzKNnfrZ3MhR6KMsqLWbgGVDkkoaiKvg==
X-Received: by 2002:a0c:8c0e:: with SMTP id n14mr3504096qvb.86.1597422700912;
        Fri, 14 Aug 2020 09:31:40 -0700 (PDT)
Received: from localhost.localdomain (ool-45752a48.dyn.optonline.net. [69.117.42.72])
        by smtp.googlemail.com with ESMTPSA id f39sm11649843qta.59.2020.08.14.09.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 09:31:40 -0700 (PDT)
From:   Mohammed Billoo <mab@mab-labs.com>
Cc:     Mohammed Billoo <mab@mab-labs.com>, peter@korsgaard.com,
        andrew@lunn.ch, linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: ocores: add gaisler to platform data
Date:   Fri, 14 Aug 2020 12:31:33 -0400
Message-Id: <20200814163134.29493-1-mab@mab-labs.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There may be instances when the device tree is not suitable to interface
with the ocores implementation. For example, when the FPGA/ASIC is
not on the same silicon die (e.g. the communication between the CPU and
the FPGA/ASIC is over PCI), information about the ocore implementation,
such as whether the gaisler implementation is used, must be determined
during runtime. In this case, the client driver would prepopulate the
platform data during device instantiation. Thus, a boolean needs to be
added in the platform data, to instruct the i2c-ocores driver whether
the gaisler register callbacks should be used.

Signed-off-by: Mohammed Billoo <mab@mab-labs.com>
---
 drivers/i2c/busses/i2c-ocores.c          | 4 ++++
 include/linux/platform_data/i2c-ocores.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
index f5fc75b65a19..0975f6797069 100644
--- a/drivers/i2c/busses/i2c-ocores.c
+++ b/drivers/i2c/busses/i2c-ocores.c
@@ -647,6 +647,10 @@ static int ocores_i2c_probe(struct platform_device *pdev)
 			i2c->bus_clock_khz = pdata->bus_khz;
 		else
 			i2c->bus_clock_khz = 100;
+		if (pdata->gaisler) {
+			i2c->setreg = oc_setreg_grlib;
+			i2c->getreg = oc_getreg_grlib;
+		}
 	} else {
 		ret = ocores_i2c_of_probe(pdev, i2c);
 		if (ret)
diff --git a/include/linux/platform_data/i2c-ocores.h b/include/linux/platform_data/i2c-ocores.h
index e6326cbafe59..8a5849f1e267 100644
--- a/include/linux/platform_data/i2c-ocores.h
+++ b/include/linux/platform_data/i2c-ocores.h
@@ -14,6 +14,7 @@ struct ocores_i2c_platform_data {
 	u32 clock_khz; /* input clock in kHz */
 	u32 bus_khz; /* bus clock in kHz */
 	bool big_endian; /* registers are big endian */
+	bool gaisler; /* use grlib accessors */
 	u8 num_devices; /* number of devices in the devices list */
 	struct i2c_board_info const *devices; /* devices connected to the bus */
 };
-- 
2.17.1

