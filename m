Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C301D3777B
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfFFPMM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:12:12 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:40300 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728812AbfFFPML (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:12:11 -0400
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9DBF9C0B59;
        Thu,  6 Jun 2019 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1559833942; bh=+7+5ObOc7gxS4v0EaTYk0LsyMtKGB6jikkVK2HcAVnU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=bwshtbRgM1A3pmPkIenFpKszEIHXHty90zKvVrCs9P8ZrOutl1tmnXQyCP5qNoMJ1
         K12aDk3pPTLUOkygUkq9oYTgQZV7vnPt7P+L1cJ3+Maol3iKz3AEenl6WooXAM8Ist
         GJlHzOnqKh69Dcc9iV9f5BbXQ5szeKp97e+ptvxp+TfMBM3P9qPfhLra8r+YgQILtY
         elN5BSZGTc/XkkrjWg4nSil53usiI9rvovi08/5du6YOCrPvWjBGZ0Q9XykclDUkl2
         WB8WZ3983Nx7EuJ1U/VDCsDFCb3NxV8bzatxYdI5tSMD+qodxvKbunoKdOsHfRF17w
         LnnMO+NhWxIYw==
Received: from de02.synopsys.com (germany.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id B34A3A022F;
        Thu,  6 Jun 2019 15:12:08 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 98F4C3FED2;
        Thu,  6 Jun 2019 17:12:08 +0200 (CEST)
From:   Vitor Soares <Vitor.Soares@synopsys.com>
To:     linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        bbrezillon@kernel.org, Joao.Pinto@synopsys.com,
        lorenzo.bianconi83@gmail.com,
        Vitor Soares <Vitor.Soares@synopsys.com>
Subject: [PATCH v2 2/3] i3c: add i3c_get_device_id helper
Date:   Thu,  6 Jun 2019 17:12:03 +0200
Message-Id: <eaa9eb66df6b4c9b577aec46fd440b99d763a5a2.1559831663.git.vitor.soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559831663.git.vitor.soares@synopsys.com>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
In-Reply-To: <cover.1559831663.git.vitor.soares@synopsys.com>
References: <cover.1559831663.git.vitor.soares@synopsys.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This helper return the i3c_device_id structure in order the client
have access to the driver data.

Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
---
Changes in v2:
  move this function to drivers/i3c/device.c

 drivers/i3c/device.c       | 8 ++++++++
 include/linux/i3c/device.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 69cc040..a6d0796 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -200,6 +200,14 @@ struct i3c_device *dev_to_i3cdev(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(dev_to_i3cdev);
 
+const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev)
+{
+	const struct i3c_driver *i3cdrv = drv_to_i3cdrv(i3cdev->dev.driver);
+
+	return i3cdrv->id_table;
+}
+EXPORT_SYMBOL_GPL(i3c_get_device_id);
+
 /**
  * i3c_driver_register_with_owner() - register an I3C device driver
  *
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 5ecb055..e0415e1 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -187,6 +187,7 @@ static inline struct i3c_driver *drv_to_i3cdrv(struct device_driver *drv)
 
 struct device *i3cdev_to_dev(struct i3c_device *i3cdev);
 struct i3c_device *dev_to_i3cdev(struct device *dev);
+const struct i3c_device_id *i3c_get_device_id(struct i3c_device *i3cdev);
 
 static inline void i3cdev_set_drvdata(struct i3c_device *i3cdev,
 				      void *data)
-- 
2.7.4

