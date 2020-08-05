Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA7823D033
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 21:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHETpK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Aug 2020 15:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728982AbgHETpG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Aug 2020 15:45:06 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C651CC06179F;
        Wed,  5 Aug 2020 12:38:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f9so4995530pju.4;
        Wed, 05 Aug 2020 12:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8aaXnFcZ4AT3389+t0qxS8pbT28OEw3qAsjmqDR3UE=;
        b=BBOMnrtNFHReBjXDeCiLjMl9olE1dPUW9Qju+IcKdTK3+9GmtDNFNKlHOTHl1uT1iX
         12vARS7LIHCPWquRGW42vrmScp10LsjoaOh9dHQ0Pkwx6nGWmfupqAO5cqk3TQjtZmCA
         3oS96NPE7nvwK/tdJK7yxY+05tEuNJleTWQCgSqMAwuIj5P/Qk9yOFwq3zOF5SwGGSLs
         O0lGc7m4Bo+I0Tr3PxKczoeIxuQx9Hh+UnUpM11dJDvm2RCMSS/ybQ/vscp7poo+tUki
         0tZuc7tMl6Dyxb7+Vld7soicjuNyNE4iZb5B4jKe5m+yXmNDZGm6KyeWicaoco0Y7lYQ
         splQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8aaXnFcZ4AT3389+t0qxS8pbT28OEw3qAsjmqDR3UE=;
        b=PY0dVr8T9InAQJqs9He8WY+Cq7lm8vNrRxFFEWQzB4fEMZGqw8ZxmmiM7iFC0tXa/2
         9MmKU9jyCvsUYVu8Dk1beGo2C4fs++Cn8fVvdSwqDiLShE0MB3x50DPMUWtyqGYN20gD
         yCAoiAIOM5WwBBrLbm1kj7/SFVjTKGdE66LpNV4hQHA6ZeVx+kZXLTf2tmsQNl5A34x4
         j0Bc06pSX/0Q9QzNRq3gD7Pz+FhcmP+kWJxeZGpqlHxqg+ahvKjYevV4f88Zbm/rlXjq
         nPNZ36/C0C1fcK1co2BmpL6q3hStuVSq7fAKrrv0hK1lmC8eJnb0ZRrYCCx2OJ7eAIkv
         H3dA==
X-Gm-Message-State: AOAM530/VixFErxqBzIJZaCqznO72jJrzUGOZuAKTaS8oqnybZzxxpBz
        aIcvb1ZIUJ+DKzy6zlcXbgI=
X-Google-Smtp-Source: ABdhPJzn7Bj7lt8lc5KhEfI4kSkNrIrHdD2blN71urAzi5cr8ZEUcmTH30mCT37gF5bvmXT1w9iMYA==
X-Received: by 2002:a17:902:6bca:: with SMTP id m10mr4508470plt.210.1596656330165;
        Wed, 05 Aug 2020 12:38:50 -0700 (PDT)
Received: from varodek.iballbatonwifi.com ([103.105.152.86])
        by smtp.gmail.com with ESMTPSA id f20sm4901764pfk.36.2020.08.05.12.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:38:49 -0700 (PDT)
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 1/2] i2c: eg20t: Drop PCI wakeup calls from .suspend/.resume
Date:   Thu,  6 Aug 2020 01:06:15 +0530
Message-Id: <20200805193616.384313-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805193616.384313-1-vaibhavgupta40@gmail.com>
References: <20200805165611.GA516242@bjorn-Precision-5520>
 <20200805193616.384313-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver calls pci_enable_wake(...., false) in pch_i2c_suspend() as well
as pch_i2c_resume(). Either it should enable-wake the device in .suspend()
or should not invoke pci_enable_wake() at all.

Concluding that this driver doesn't support enable-wake and PCI core calls
pci_enable_wake(pci_dev, PCI_D0, false) during resume, drop it from
.suspend() and .resume().

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/i2c/busses/i2c-eg20t.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 73f139690e4e..eb41de22d461 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -879,7 +879,6 @@ static int pch_i2c_suspend(struct pci_dev *pdev, pm_message_t state)
 		return ret;
 	}
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
 	pci_disable_device(pdev);
 	pci_set_power_state(pdev, pci_choose_state(pdev, state));
 
@@ -899,8 +898,6 @@ static int pch_i2c_resume(struct pci_dev *pdev)
 		return -EIO;
 	}
 
-	pci_enable_wake(pdev, PCI_D3hot, 0);
-
 	for (i = 0; i < adap_info->ch_num; i++)
 		pch_i2c_init(&adap_info->pch_data[i]);
 
-- 
2.27.0

