Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BD32AA3D8
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Nov 2020 09:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgKGIYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Nov 2020 03:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728153AbgKGIYk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Nov 2020 03:24:40 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D10EC0613CF;
        Sat,  7 Nov 2020 00:24:40 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id f21so2072546plr.5;
        Sat, 07 Nov 2020 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Bb5uWc74fawDMZfeCSpyHhLS7HqeMoYkfZSH2OoOj4=;
        b=V7uIudelQ4Zt0bkBfqPU3O0QuZUecvP+x7OOxZ1qrLwfWP+tCH4KoTk2fU6RynBH2t
         7G2XXnVsOiRLNNOuFuDnA9tzNnYuUjKLdeyrhFBMK981nYYDfzLgzHqQ0e5DOZYXxGDW
         2xo8J00Kz/UwBXXvrUcH5kcsQZrP6IxjXHJMXp0Khn68kdVmfOVs4Du/e/yBqSTX+mYR
         MAK0oymu8HHyRjvHlwJTUPJKl72t1hZ7LC5B68wKfKTT+168wbGX5yun5sqoCucmnAMi
         EZLHC8r16E6Vp8JYVHxs7AVHm5fS/luhjoElpCEKgInBeoNbUstsSdHHBWgICTGA0Ygm
         MkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Bb5uWc74fawDMZfeCSpyHhLS7HqeMoYkfZSH2OoOj4=;
        b=bv7Xk6DzBRjrkwI2bWzMTGs/KFAJyBPUAX5q0Gv1ePi5HZ4SwtcND1I6wSJXQEAdSY
         ravFFhFbjPCQuUpIf5F/AOXf4QawAStUVVB9F+gBGgM5wlxJrefl2ndXdgzh6dPprlN8
         uAoQX7RfSBerkFVNkTXP7c4LwV4ssxu5BQ1RzdRcscc+4+hfP8ae203adDjlqRQm9lom
         OABA7HBDFUJ2706QYb/WlJ6t9Y2uWu+TCN0Xv29z6VdVRLVd8W6sJiT31Mor/c+K2jRJ
         CGXe0dkKNHbX5A1P0/9eyqtPvRjz9Kv6WiRGAy/Zm9qgJoQu/NqtuQOCPbVzttrNrBZX
         vxEA==
X-Gm-Message-State: AOAM532eAV8mPpB2MzQrzF6qW4UHggUn3klBPPlDLVQvkH+XVN0mQqSc
        YUyFXuIg5Hl8lPVFo5171o8=
X-Google-Smtp-Source: ABdhPJx0d669hhtwHw24saahA7jiUTLKxRA8+MATUW5fT3FdIkG9XEVhB6Imb9XCMDNFb7o/dR9PVg==
X-Received: by 2002:a17:90a:9dcb:: with SMTP id x11mr3354550pjv.132.1604737480069;
        Sat, 07 Nov 2020 00:24:40 -0800 (PST)
Received: from varodek.localdomain ([223.179.149.110])
        by smtp.gmail.com with ESMTPSA id r12sm4577967pfh.213.2020.11.07.00.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 00:24:39 -0800 (PST)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Bjorn Helgaas <helgaas@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v1] i2c: nvidia-gpu: drop empty stub for runtime pm
Date:   Sat,  7 Nov 2020 13:51:51 +0530
Message-Id: <20201107082151.58239-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After the commit c5eb1190074c ("PCI / PM: Allow runtime PM without callback
functions") we no more need empty stubs for runtime-pm to work.

The driver has no device specific task(s) for .suspend() . The stub was
placed just for runtime-pm, which can be dropped now.

Reported-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-nvidia-gpu.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index f9a69b109e5c..6b20601ffb13 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -353,15 +353,7 @@ static void gpu_i2c_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 }
 
-/*
- * We need gpu_i2c_suspend() even if it is stub, for runtime pm to work
- * correctly. Without it, lspci shows runtime pm status as "D0" for the card.
- * Documentation/power/pci.rst also insists for driver to provide this.
- */
-static __maybe_unused int gpu_i2c_suspend(struct device *dev)
-{
-	return 0;
-}
+#define gpu_i2c_suspend NULL
 
 static __maybe_unused int gpu_i2c_resume(struct device *dev)
 {
-- 
2.28.0

