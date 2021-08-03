Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298F73DF200
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhHCQBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28610 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229762AbhHCQBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628006458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gQs3hWAkdvFb3v2R651a5ik8VThxXwD1UFIpN7zKLAo=;
        b=ZkI6P1if/SpiihBSBAqWM+vSA9cxcc/jSuP16Bv3HN2/COqj7Bj2IdF6gAQjSWdRXs0OsY
        glIXnMEfLhVXxf7ZVf9e9RkkW17ZoaUDipFZBGyGyZzimDnarpDvs+oFA3WG2PZYmBCvkl
        podOCDCRk956mKXa88MY4OI17VI4Q18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-3bwh4hlLP_yTaIQmrYvhHA-1; Tue, 03 Aug 2021 12:00:54 -0400
X-MC-Unique: 3bwh4hlLP_yTaIQmrYvhHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D0D80196C;
        Tue,  3 Aug 2021 16:00:53 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 758E560C0F;
        Tue,  3 Aug 2021 16:00:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: i2c-multi-instantiate: Use the new i2c_acpi_client_count() helper
Date:   Tue,  3 Aug 2021 18:00:43 +0200
Message-Id: <20210803160044.158802-4-hdegoede@redhat.com>
In-Reply-To: <20210803160044.158802-1-hdegoede@redhat.com>
References: <20210803160044.158802-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the new i2c_acpi_client_count() helper, this
results in a nice cleanup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/i2c-multi-instantiate.c | 27 +-------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index 2cce82579d09..a50153ecd560 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -32,31 +32,6 @@ struct i2c_multi_inst_data {
 	struct i2c_client *clients[];
 };
 
-static int i2c_multi_inst_count(struct acpi_resource *ares, void *data)
-{
-	struct acpi_resource_i2c_serialbus *sb;
-	int *count = data;
-
-	if (i2c_acpi_get_i2c_resource(ares, &sb))
-		*count = *count + 1;
-
-	return 1;
-}
-
-static int i2c_multi_inst_count_resources(struct acpi_device *adev)
-{
-	LIST_HEAD(r);
-	int count = 0;
-	int ret;
-
-	ret = acpi_dev_get_resources(adev, &r, i2c_multi_inst_count, &count);
-	if (ret < 0)
-		return ret;
-
-	acpi_dev_free_resource_list(&r);
-	return count;
-}
-
 static int i2c_multi_inst_probe(struct platform_device *pdev)
 {
 	struct i2c_multi_inst_data *multi;
@@ -76,7 +51,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
 	adev = ACPI_COMPANION(dev);
 
 	/* Count number of clients to instantiate */
-	ret = i2c_multi_inst_count_resources(adev);
+	ret = i2c_acpi_client_count(adev);
 	if (ret < 0)
 		return ret;
 
-- 
2.31.1

