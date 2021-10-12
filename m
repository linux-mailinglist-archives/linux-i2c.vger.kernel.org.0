Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F131942AB30
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Oct 2021 19:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhJLRxZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 Oct 2021 13:53:25 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:47782 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbhJLRxU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Oct 2021 13:53:20 -0400
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 3.0.0)
 id a23f0dacc78f34f5; Tue, 12 Oct 2021 19:51:17 +0200
Received: from kreacher.localnet (unknown [213.134.187.88])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id 6AC1C66A819;
        Tue, 12 Oct 2021 19:51:16 +0200 (CEST)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux ACPI <linux-acpi@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v1 3/7] i2c: i2c-amd-mp2-plat: ACPI: Use ACPI_COMPANION() directly
Date:   Tue, 12 Oct 2021 19:44:33 +0200
Message-ID: <3647069.kQq0lBPeGt@kreacher>
In-Reply-To: <4369779.LvFx2qVVIh@kreacher>
References: <4369779.LvFx2qVVIh@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.187.88
X-CLIENT-HOSTNAME: 213.134.187.88
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtkedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdejlefghfeiudektdelkeekvddugfeghffggeejgfeukeejleevgffgvdeluddtnecukfhppedvudefrddufeegrddukeejrdekkeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvudefrddufeegrddukeejrdekkedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehshihnihhurhhgvgesghhmrghilhdrtghomhdprhgtphhtthhopehnvghhrghlqdgsrghkuhhltghhrghnughrrgdrshhhrghhsegrmhgurdgtohhmpdhrtghpthhtohepshhhhigrmhdq
 shhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafael J. Wysocki <rafael@kernel.org>

The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
macro and the ACPI handle produced by the former comes from the
ACPI device object produced by the latter, so it is way more
straightforward to evaluate the latter directly instead of passing
the handle produced by the former to acpi_bus_get_device().

Modify i2c_amd_probe() accordingly (no intentional functional impact).

Signed-off-by: Rafael J. Wysocki <rafael@kernel.org>
---
 drivers/i2c/busses/i2c-amd-mp2-plat.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

Index: linux-pm/drivers/i2c/busses/i2c-amd-mp2-plat.c
===================================================================
--- linux-pm.orig/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ linux-pm/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -246,12 +246,11 @@ static int i2c_amd_probe(struct platform
 {
 	int ret;
 	struct amd_i2c_dev *i2c_dev;
-	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
-	struct acpi_device *adev;
+	struct acpi_device *adev = ACPI_COMPANION(&pdev->dev);
 	struct amd_mp2_dev *mp2_dev;
 	const char *uid;
 
-	if (acpi_bus_get_device(handle, &adev))
+	if (!adev)
 		return -ENODEV;
 
 	/* The ACPI namespace doesn't contain information about which MP2 PCI



