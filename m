Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4E22A7879
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Nov 2020 09:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbgKEIA3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Nov 2020 03:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44838 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729862AbgKEIA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Nov 2020 03:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604563227;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QexiIGh65OkVEakRusDkQrbb7GvquS9RxDdYOuUFhO0=;
        b=NXyWz2R4StlCyg4hifdMFieH7vTIlCHJvh290YJAWuq75TUFwddPzsHmUwZKcL0EDN6hZu
        qCSdZtml+SqK8+x6fI1u7U8old3gjIh2Rja9BeVqcqKyWOTP3+ZZCW1SNURKf8Pt9rrnZY
        6+5yGlP98fLwsVbmBtalM3ONS5qJMRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-C9DdjN0dPPGYzPhvx0ALig-1; Thu, 05 Nov 2020 03:00:25 -0500
X-MC-Unique: C9DdjN0dPPGYzPhvx0ALig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67F9D64158;
        Thu,  5 Nov 2020 08:00:24 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-73.ams2.redhat.com [10.36.113.73])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E91C65D98F;
        Thu,  5 Nov 2020 08:00:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [RFC 4/4] platform/x86: i2c-multi-instantiate: Add IRQ_RESOURCE_GPIO_OPTIONAL IRQ type
Date:   Thu,  5 Nov 2020 09:00:14 +0100
Message-Id: <20201105080014.45410-5-hdegoede@redhat.com>
In-Reply-To: <20201105080014.45410-1-hdegoede@redhat.com>
References: <20201105080014.45410-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Most I2C-drivers treat IRQs as optional and in some cases ACPI
devices managed by i2c-multi-instantiate.c may have a GpioInt resource
specified on some systems, while it is not there on others.

Add a new IRQ_RESOURCE_GPIO_OPTIONAL IRQ type, which still tries to get
a GpioInt IRQ, but does not consider it a fatal error when this fails.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index cbccfcbed44c..55c6d6e8d576 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -15,10 +15,11 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#define IRQ_RESOURCE_TYPE	GENMASK(1, 0)
-#define IRQ_RESOURCE_NONE	0
-#define IRQ_RESOURCE_GPIO	1
-#define IRQ_RESOURCE_APIC	2
+#define IRQ_RESOURCE_TYPE		GENMASK(1, 0)
+#define IRQ_RESOURCE_NONE		0
+#define IRQ_RESOURCE_GPIO		1
+#define IRQ_RESOURCE_GPIO_OPTIONAL	2
+#define IRQ_RESOURCE_APIC		3
 
 struct i2c_inst_data {
 	const char *type;
@@ -64,6 +65,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	struct i2c_board_info board_info = {};
 	struct device *dev = &pdev->dev;
 	struct acpi_device *adev;
+	bool irq_optional;
 	char name[32];
 	int i, ret;
 
@@ -94,10 +96,14 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 			 inst_data[i].type, i);
 		board_info.dev_name = name;
 		board_info.fwnode = dev->fwnode;
+		irq_optional = false;
 		switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
+		case IRQ_RESOURCE_GPIO_OPTIONAL:
+			irq_optional = true;
+			fallthrough;
 		case IRQ_RESOURCE_GPIO:
 			ret = acpi_dev_gpio_irq_get(adev, inst_data[i].irq_idx);
-			if (ret < 0) {
+			if (ret < 0 && (!irq_optional || ret != -ENOENT)) {
 				dev_err(dev, "Error requesting irq at index %d: %d\n",
 					inst_data[i].irq_idx, ret);
 				goto error;
-- 
2.28.0

