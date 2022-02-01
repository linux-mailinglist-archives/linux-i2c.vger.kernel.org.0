Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040A84A631A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 19:00:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239043AbiBASAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 13:00:45 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:59810 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbiBASAp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 13:00:45 -0500
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 4.0.0)
 id 3d0df5093a58c7a9; Tue, 1 Feb 2022 19:00:44 +0100
Received: from kreacher.localnet (unknown [213.134.162.64])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 8D41766B390;
        Tue,  1 Feb 2022 19:00:43 +0100 (CET)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ACPI: Replace acpi_bus_get_device()
Date:   Tue, 01 Feb 2022 19:00:42 +0100
Message-ID: <4374434.LvFx2qVVIh@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.162.64
X-CLIENT-HOSTNAME: 213.134.162.64
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgeefgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecujffqoffgrffnpdggtffipffknecuuegrihhlohhuthemucduhedtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkggfgtgesthfuredttddtjeenucfhrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqeenucggtffrrghtthgvrhhnpefhgedtffejheekgeeljeevvedtuefgffeiieejuddutdekgfejvdehueejjeetvdenucfkphepvddufedrudefgedrudeivddrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddufedrudefgedrudeivddrieegpdhhvghlohepkhhrvggrtghhvghrrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepfihsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthho
 pehmihhkrgdrfigvshhtvghrsggvrhhgsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Replace acpi_bus_get_device() that is going to be dropped with
acpi_fetch_acpi_dev().

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/i2c/i2c-core-acpi.c |   17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

Index: linux-pm/drivers/i2c/i2c-core-acpi.c
===================================================================
--- linux-pm.orig/drivers/i2c/i2c-core-acpi.c
+++ linux-pm/drivers/i2c/i2c-core-acpi.c
@@ -236,7 +236,8 @@ static int i2c_acpi_get_info(struct acpi
 		struct acpi_device *adapter_adev;
 
 		/* The adapter must be present */
-		if (acpi_bus_get_device(lookup.adapter_handle, &adapter_adev))
+		adapter_adev = acpi_fetch_acpi_dev(lookup.adapter_handle);
+		if (!adapter_adev)
 			return -ENODEV;
 		if (acpi_bus_get_status(adapter_adev) ||
 		    !adapter_adev->status.present)
@@ -275,13 +276,10 @@ static acpi_status i2c_acpi_add_device(a
 				       void *data, void **return_value)
 {
 	struct i2c_adapter *adapter = data;
-	struct acpi_device *adev;
+	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
 	struct i2c_board_info info;
 
-	if (acpi_bus_get_device(handle, &adev))
-		return AE_OK;
-
-	if (i2c_acpi_get_info(adev, &info, adapter, NULL))
+	if (!adev || i2c_acpi_get_info(adev, &info, adapter, NULL))
 		return AE_OK;
 
 	i2c_acpi_register_device(adapter, adev, &info);
@@ -341,12 +339,9 @@ static acpi_status i2c_acpi_lookup_speed
 					   void *data, void **return_value)
 {
 	struct i2c_acpi_lookup *lookup = data;
-	struct acpi_device *adev;
-
-	if (acpi_bus_get_device(handle, &adev))
-		return AE_OK;
+	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
 
-	if (i2c_acpi_do_lookup(adev, lookup))
+	if (!adev || i2c_acpi_do_lookup(adev, lookup))
 		return AE_OK;
 
 	if (lookup->search_handle != lookup->adapter_handle)



