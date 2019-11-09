Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60283F5DE8
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Nov 2019 08:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfKIHyw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Nov 2019 02:54:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42244 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfKIHyw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Nov 2019 02:54:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id s5so6672858pfh.9;
        Fri, 08 Nov 2019 23:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mPCx3dt7L4+Sxa/DONQDeDjnRO2fk5CH6fIAfPKIeKc=;
        b=KbrarZ+gxlm7i0YuQGmtJ81SHX9O5b/1yDzZtgV+pdISRlreEmG0aoicooHkdyvqqe
         fVLvAobTgvH2KGj5IuTy5SYye47NwZuqBOt2/LcMIPfxitRfvTM8zR9Nx0mSW1q1CZlN
         s+qbJCuboexsaaGs6mz/9QIBDS2wez33YgimC9U11AYJyn2RcSB9hNXLPy2MuEomL7Pk
         fPmrqiHJcrnkYVHiTMK7J4diAvj+v0p+rPVeL0lJ4MoF/VZG3Cdz1JB/onXqL7gcjmu+
         C+I1j9pNNNKP+uuTQB2FsHoHMgFGDk+KtFTmQQchoZNiuO1QcBXNrJL02Z6SjdifRbk8
         nnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mPCx3dt7L4+Sxa/DONQDeDjnRO2fk5CH6fIAfPKIeKc=;
        b=MHNQu1VSHGIHu0Ul2k/Ha2tA4/rJN0xyaaAv33wjgVYCOKBQFohEjME8sGkg1BaOic
         uACQe/eJMNhPfJTgXNoTz+fCwY/XR9JTki01y8o/kEGYHINcFx5QJgt74MaAWd4il79B
         hj61k9hV4Pyvyg1v0wpwGy0BMlpI7Tw/aqXUU2JqsQ7oFiCT9vQ+0vM3dM9SbTTUcd2D
         5+B3XU7uLxd2ESFehHFUaq8J/wtlWdD27bpK2IsJje6Up645O787OByFrYAZvWkO2xn6
         R7nXnKVIgubEQRV3euwHucsNLwHf8reTXd3QIzeGQt0tE1q2ZnU1iAwiv0MLMEQjA4ts
         Mo7A==
X-Gm-Message-State: APjAAAWBCZ7QuK1WHHx1Q02jnXKgARM/21ggUBWF1/oAAP9OcnWxjONn
        KTG3EpCabZ10WVUahCcQzh9n4SyZquY=
X-Google-Smtp-Source: APXvYqy6YdxmnmcE9nVX3RhpoK0vXri5Kvx3RRsLnR2KBi9MSQBuZQTpefBVjzP3I0FiP4CI7JuXAQ==
X-Received: by 2002:a63:2151:: with SMTP id s17mr4595981pgm.46.1573286090104;
        Fri, 08 Nov 2019 23:54:50 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id y22sm8914091pfn.6.2019.11.08.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 23:54:49 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] i2c: ismt: Add missed pci_release_region
Date:   Sat,  9 Nov 2019 15:54:35 +0800
Message-Id: <20191109075435.29871-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ismt_remove forgets to call pci_release_region when remove.
Add the call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/i2c/busses/i2c-ismt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index 2f95e25a10f7..c393e629cac3 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -943,6 +943,8 @@ static void ismt_remove(struct pci_dev *pdev)
 	struct ismt_priv *priv = pci_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adapter);
+
+	pci_release_region(pdev, SMBBAR);
 }
 
 static struct pci_driver ismt_driver = {
-- 
2.23.0

