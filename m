Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE0045DF35
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 17:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356626AbhKYRAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 12:00:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20905 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356631AbhKYQ6u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Nov 2021 11:58:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637859338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KZ7SiULw1bz9iR0a6trjSqZT1dIAIEINJ54riBhzJ8s=;
        b=hLW8Cr/78vk7/Z/07+ITEXS7A+QsSiIt+E1eVTTx4l7w9ukRsrYHjqScEXLgNxvC6MF9Qy
        Ko1xziMFfR4CbQKBjpUgQD9PwL632g3H21P3eLfQwdW3zP+89U7rNC13jWFMMmwIgKHWuv
        zVQFb030HoKwQPg18YHaHY9TsDVf9/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-l-rAJcE5OZSfLkqkWfhXbg-1; Thu, 25 Nov 2021 11:55:33 -0500
X-MC-Unique: l-rAJcE5OZSfLkqkWfhXbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 176561006AA0;
        Thu, 25 Nov 2021 16:55:30 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.195.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D11267842;
        Thu, 25 Nov 2021 16:55:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v6 14/15] media: ipu3-cio2: Call cio2_bridge_init() before anything else
Date:   Thu, 25 Nov 2021 17:54:11 +0100
Message-Id: <20211125165412.535063-15-hdegoede@redhat.com>
In-Reply-To: <20211125165412.535063-1-hdegoede@redhat.com>
References: <20211125165412.535063-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since cio2_bridge_init() may now return -EPROBE_DEFER it is best to
call it before anything else.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index e2874fee9530..0e9b0503b62a 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1713,11 +1713,6 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 	struct cio2_device *cio2;
 	int r;
 
-	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
-	if (!cio2)
-		return -ENOMEM;
-	cio2->pci_dev = pci_dev;
-
 	/*
 	 * On some platforms no connections to sensors are defined in firmware,
 	 * if the device has no endpoints then we can try to build those as
@@ -1735,6 +1730,11 @@ static int cio2_pci_probe(struct pci_dev *pci_dev,
 			return r;
 	}
 
+	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
+	if (!cio2)
+		return -ENOMEM;
+	cio2->pci_dev = pci_dev;
+
 	r = pcim_enable_device(pci_dev);
 	if (r) {
 		dev_err(dev, "failed to enable device (%d)\n", r);
-- 
2.33.1

