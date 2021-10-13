Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C9E42C60D
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Oct 2021 18:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237193AbhJMQSr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Oct 2021 12:18:47 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:45710 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236390AbhJMQSm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Oct 2021 12:18:42 -0400
Received: from localhost (127.0.0.1) (HELO v370.home.net.pl)
 by /usr/run/smtp (/usr/run/postfix/private/idea_relay_lmtp) via UNIX with SMTP (IdeaSmtpServer 3.0.0)
 id e673114f1b2a8378; Wed, 13 Oct 2021 18:16:37 +0200
Received: from kreacher.localnet (unknown [213.134.161.244])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by v370.home.net.pl (Postfix) with ESMTPSA id E6D8E66A871;
        Wed, 13 Oct 2021 18:16:36 +0200 (CEST)
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Linux ACPI <linux-acpi@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 3/7] i2c: i2c-amd-mp2-plat: ACPI: Use ACPI_COMPANION() directly
Date:   Wed, 13 Oct 2021 18:09:39 +0200
Message-ID: <1823250.tdWV9SEqCh@kreacher>
In-Reply-To: <3647069.kQq0lBPeGt@kreacher>
References: <4369779.LvFx2qVVIh@kreacher> <3647069.kQq0lBPeGt@kreacher>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-CLIENT-IP: 213.134.161.244
X-CLIENT-HOSTNAME: 213.134.161.244
X-VADE-SPAMSTATE: clean
X-VADE-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeljedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfjqffogffrnfdpggftiffpkfenuceurghilhhouhhtmecuudehtdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpedftfgrfhgrvghlucflrdcuhgihshhotghkihdfuceorhhjfiesrhhjfiihshhotghkihdrnhgvtheqnecuggftrfgrthhtvghrnhepvdejlefghfeiudektdelkeekvddugfeghffggeejgfeukeejleevgffgvdeluddtnecukfhppedvudefrddufeegrdduiedurddvgeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepvddufedrudefgedrudeiuddrvdeggedphhgvlhhopehkrhgvrggthhgvrhdrlhhotggrlhhnvghtpdhmrghilhhfrhhomhepfdftrghfrggvlhculfdrucghhihsohgtkhhifdcuoehrjhifsehrjhifhihsohgtkhhirdhnvghtqedprhgtphhtthhopehlihhnuhigqdgrtghpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehshihnihhurhhgvgesghhmrghilhdrtghomhdprhgtphhtthhopehnvghhrghlqdgsrghkuhhltghhrghnughrrgdrshhhrghhsegrmhgurdgtohhmpdhrtghpthhtohepshhhhigr
 mhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DCC--Metrics: v370.home.net.pl 1024; Body=6 Fuz1=6 Fuz2=6
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
macro and the ACPI handle produced by the former comes from the
ACPI device object produced by the latter, so it is way more
straightforward to evaluate the latter directly instead of passing
the handle produced by the former to acpi_bus_get_device().

Modify i2c_amd_probe() accordingly (no intentional functional impact).

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

v1 -> v2:
   * Resend with a different From and S-o-b address and with maintainer ACK.
     No other changes.

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



