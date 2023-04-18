Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E80E6E578C
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Apr 2023 04:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjDRCio (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 22:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjDRCin (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 22:38:43 -0400
X-Greylist: delayed 324 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 17 Apr 2023 19:38:39 PDT
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D274340E6
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 19:38:39 -0700 (PDT)
Received: by smtp.bonedaddy.net (Postfix, from userid 10001)
        id 1DD3D30A786; Mon, 17 Apr 2023 22:30:44 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1681785044;
        bh=U0ZHPBuziqm8isev/rC1k/criV5GnAyaRP66vBTZxtQ=;
        h=From:To:Cc:Subject:Date;
        b=oaxWEgpbiMXothjI/3PgWGGLfJZQVr3q+9QBR09vSMhSNTrOSL5WDZ//kklhSSbhI
         SzDjgGBAfntufVpr2MLavQi6y1YGBOEJchN+viDIMpPd0uWP+GL3kSynBoYNX+dnsN
         XaOtMAAJSgY06zhtXZM0UI2X/bmx2px345R23O5QcvUjlQRlBZ9qpjnlXK3JGOxY6A
         bgH5T88EJg8jtO4xgSTgCECTFJiZV8Po5bLTEz+mnCfz7JzeGBpn9+Ve6BAKLxgFCa
         39Rm8MTtLBsgfb3LMh58ysPrT/B3KUWfaU6CCSZDboDgSszQCc1qxWG55cTOc6UruM
         7PquihP3aiLHQ==
From:   Paul Wise <pabs3@bonedaddy.net>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>, Paul Wise <pabs3@bonedaddy.net>
Subject: [PATCH i2c-tools] i2cdetect: add messages for errors during bus listing
Date:   Tue, 18 Apr 2023 10:32:46 +0800
Message-Id: <20230418023248.250685-1-pabs3@bonedaddy.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Include appropriate commands for fixing the errors.

This makes it easier for new users to understand what is going on when
they have a problem listing i2c busses that they do not understand.

Inspired-by: https://lists.debian.org/msgid-search/E1poMGW-0002KT-8Q@enotuniq.net
---
 tools/i2cbusses.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index d23ee7a..2b1ffe6 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -137,6 +137,24 @@ static int sort_i2c_busses(const void *a, const void *b)
 	return adap1->nr - adap2->nr;
 }
 
+static int dir_has_entries(const char* path)
+{
+	struct dirent *de;
+	DIR *dir;
+	if((dir = opendir(path))) {
+		while ((de = readdir(dir)) != NULL) {
+			if (!strcmp(de->d_name, "."))
+				continue;
+			if (!strcmp(de->d_name, ".."))
+				continue;
+			closedir(dir);
+			return 1;
+		}
+		closedir(dir);
+	}
+	return 0;
+}
+
 struct i2c_adap *gather_i2c_busses(void)
 {
 	char s[120];
@@ -144,6 +162,7 @@ struct i2c_adap *gather_i2c_busses(void)
 	DIR *dir, *ddir;
 	FILE *f;
 	char fstype[NAME_MAX], sysfs[NAME_MAX], n[NAME_MAX];
+	size_t sysfs_end = 0;
 	int foundsysfs = 0;
 	int len, count = 0;
 	struct i2c_adap *adapters;
@@ -199,6 +218,13 @@ struct i2c_adap *gather_i2c_busses(void)
 	/* look in sysfs */
 	/* First figure out where sysfs was mounted */
 	if ((f = fopen("/proc/mounts", "r")) == NULL) {
+		fprintf(stderr, "Error: Could not open /proc/mounts: "
+                                "%s\n", strerror(errno));
+		if (errno == ENOENT) {
+			fprintf(stderr, "Please mount procfs: "
+			        "%smount -t procfs proc /proc\n",
+			        getenv("SUDO_COMMAND") ? "sudo " : "");
+		}
 		goto done;
 	}
 	while (fgets(n, NAME_MAX, f)) {
@@ -210,15 +236,43 @@ struct i2c_adap *gather_i2c_busses(void)
 	}
 	fclose(f);
 	if (! foundsysfs) {
+		fprintf(stderr, "Error: Could not find sysfs mount\n");
+		fprintf(stderr, "Please mount sysfs: "
+		        "%smount -t sysfs sysfs /sys\n",
+                        getenv("SUDO_COMMAND") ? "sudo " : "");
 		goto done;
 	}
 
 	/* Bus numbers in i2c-adapter don't necessarily match those in
 	   i2c-dev and what we really care about are the i2c-dev numbers.
 	   Unfortunately the names are harder to get in i2c-dev */
+	sysfs_end = strlen(sysfs);
 	strcat(sysfs, "/class/i2c-dev");
-	if(!(dir = opendir(sysfs)))
+	if(!(dir = opendir(sysfs))) {
+		if (errno == ENOENT) {
+			/* Check if there are i2c bus devices in other dirs
+                           as when there are none the error isn't useful
+                           as loading i2c-dev also won't find devices */
+			int devices_present = 0;
+			strcpy(sysfs + sysfs_end, "/bus/i2c/devices");
+			devices_present = dir_has_entries(sysfs);
+			if (!devices_present) {
+				strcpy(sysfs + sysfs_end, "/class/i2c-adapter");
+				devices_present = dir_has_entries(sysfs);
+			}
+			if (devices_present) {
+				fprintf(stderr, "Error: Could not find dir "
+				        "`%s`\n", sysfs);
+				fprintf(stderr, "Please load i2c-dev: "
+				        "%smodprobe i2c-dev\n",
+					getenv("SUDO_COMMAND") ? "sudo " : "");
+			}
+		} else {
+			fprintf(stderr, "Error: Could not open dir "
+				"`%s': %s\n", sysfs, strerror(errno));
+		}
 		goto done;
+	}
 	/* go through the busses */
 	while ((de = readdir(dir)) != NULL) {
 		if (!strcmp(de->d_name, "."))
-- 
2.39.2

