Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161873DF1FF
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 18:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhHCQBJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Aug 2021 12:01:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24956 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230334AbhHCQBJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Aug 2021 12:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628006457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mu6anSj/ipKUd3FO9ecZvr5VFBZFhfWI4lC0AL7jAKk=;
        b=XvmgbMt3iCdaEItwyUsvWV+PnavlktzqEKcpRuR2zT2BH5R5KAJjeR+63xTNX9xnJJp84y
        0rxSC/GwjICR/llrLgtryhs8Bb0yhBctbIxQpGvb5csV4be6E1C+r3L+YjzXHRWfD/xA3a
        Mau2qH3PVAtbTQs0STLaaQMx0qf9rhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-DEmSyiy5MymO2BEHFbl7lA-1; Tue, 03 Aug 2021 12:00:56 -0400
X-MC-Unique: DEmSyiy5MymO2BEHFbl7lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9D31009609;
        Tue,  3 Aug 2021 16:00:54 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4D31F60C05;
        Tue,  3 Aug 2021 16:00:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: intel_cht_int33fe: Use the new i2c_acpi_client_count() helper
Date:   Tue,  3 Aug 2021 18:00:44 +0200
Message-Id: <20210803160044.158802-5-hdegoede@redhat.com>
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
 .../intel/int33fe/intel_cht_int33fe_common.c  | 29 +------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
index 251ed9bac789..463222521e61 100644
--- a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
+++ b/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_common.c
@@ -16,33 +16,6 @@
 
 #define EXPECTED_PTYPE		4
 
-static int cht_int33fe_i2c_res_filter(struct acpi_resource *ares, void *data)
-{
-	struct acpi_resource_i2c_serialbus *sb;
-	int *count = data;
-
-	if (i2c_acpi_get_i2c_resource(ares, &sb))
-		(*count)++;
-
-	return 1;
-}
-
-static int cht_int33fe_count_i2c_clients(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-	LIST_HEAD(resource_list);
-	int count = 0;
-	int ret;
-
-	ret = acpi_dev_get_resources(adev, &resource_list,
-				     cht_int33fe_i2c_res_filter, &count);
-	acpi_dev_free_resource_list(&resource_list);
-	if (ret < 0)
-		return ret;
-
-	return count;
-}
-
 static int cht_int33fe_check_hw_type(struct device *dev)
 {
 	unsigned long long ptyp;
@@ -69,7 +42,7 @@ static int cht_int33fe_check_hw_type(struct device *dev)
 		return -ENODEV;
 	}
 
-	ret = cht_int33fe_count_i2c_clients(dev);
+	ret = i2c_acpi_client_count(ACPI_COMPANION(dev));
 	if (ret < 0)
 		return ret;
 
-- 
2.31.1

