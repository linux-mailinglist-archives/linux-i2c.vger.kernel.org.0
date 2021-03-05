Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB1F32F2BC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Mar 2021 19:36:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhCESfs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Mar 2021 13:35:48 -0500
Received: from cloudserver094114.home.pl ([79.96.170.134]:57786 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhCESfV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Mar 2021 13:35:21 -0500
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 13:35:20 EST
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 0.83.537)
 id 0bb24afc64953fb6; Fri, 5 Mar 2021 19:28:33 +0100
Received: from kreacher.localnet (89-64-81-9.dynamic.chello.pl [89.64.81.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 3A712663A29;
        Fri,  5 Mar 2021 19:28:32 +0100 (CET)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] i2c: i2c-scmi: Drop unused ACPI_MODULE_NAME definition
Date:   Fri, 05 Mar 2021 19:28:30 +0100
Message-ID: <6660750.UgobAMfxrE@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedguddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgggfgtsehtufertddttddvnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvedufefggeeutdejvdfhteevgeeludevueevvdejkeelfefhudfhfeehkefffeevnecukfhppeekledrieegrdekuddrleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekledrieegrdekuddrledphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrggtphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-DCC--Metrics: v370.home.net.pl 1024; Body=4 Fuz1=4 Fuz2=4
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The ACPI_MODULE_NAME() definition is only used by the message
printing macros from ACPICA that are not used by the code in
question, so it is redundant.  Drop it.

No functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/i2c/busses/i2c-scmi.c |    2 --
 1 file changed, 2 deletions(-)

Index: linux-pm/drivers/i2c/busses/i2c-scmi.c
===================================================================
--- linux-pm.orig/drivers/i2c/busses/i2c-scmi.c
+++ linux-pm/drivers/i2c/busses/i2c-scmi.c
@@ -18,8 +18,6 @@
 /* SMBUS HID definition as supported by Microsoft Windows */
 #define ACPI_SMBUS_MS_HID		"SMB0001"
 
-ACPI_MODULE_NAME("smbus_cmi");
-
 struct smbus_methods_t {
 	char *mt_info;
 	char *mt_sbr;



