Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD60711B4B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 02:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbjEZAfF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 20:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEZAfE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 20:35:04 -0400
Received: from smtp.bonedaddy.net (smtp.bonedaddy.net [45.33.94.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C56D1A2
        for <linux-i2c@vger.kernel.org>; Thu, 25 May 2023 17:35:03 -0700 (PDT)
Received: by smtp.bonedaddy.net (Postfix, from userid 10001)
        id 31899306824; Thu, 25 May 2023 20:22:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bonedaddy.net;
        s=mail; t=1685060522;
        bh=ANCOp+7ejo1fG6moYRvUsphN+SB2X8Aemg0TDzhIY50=;
        h=From:To:Cc:Subject:Date;
        b=On4HRO8siTki1OfZiM55BNGM751uYeu6QPAEqG0ypmwpgFzarLBT+PUDSZXp3Mfcm
         doT6OQC5ZN2kvK4m02D/LrYvk1ng/A5DSovXM4Pl5UCnyc+3fjZ5eFLkOQnAP03C6O
         R39Rof5/tg4vixI3Aw6QGA55ynbVBBR8/KvbikfIJA+dI35oZOvGfkMeabf8abfjMO
         6CtSCerMBkFMbOprKRu3jE4BTMj25bt0pW/Z9o+fgkZVgt7Rm7hF/uVK7zBkQ2AHj3
         McfGX7hRSoGuc2alWWxc69iPEDBDQKJ3g0SGkzTOfVx0RyiuPHSh4LAugUB09S1giE
         N8yC8Tnh02atw==
From:   Paul Wise <pabs3@bonedaddy.net>
To:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Paul Wise <pabs3@bonedaddy.net>
Subject: [PATCH i2c-tools v2] i2cdetect: add messages for errors during bus listing
Date:   Fri, 26 May 2023 08:24:31 +0800
Message-Id: <20230526002445.57064-1-pabs3@bonedaddy.net>
X-Mailer: git-send-email 2.40.1
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

v2: fixed some whitespace styling, updated recipient addresses
diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index d23ee7a..8d16905 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -137,6 +137,24 @@ static int sort_i2c_busses(const void *a, const void *b)
 	return adap1->nr - adap2->nr;
 }
 
+static int dir_has_entries(const char* path)
+{
+	struct dirent *de;
+	DIR *dir;
+	if ((dir = opendir(path))) {
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
+	if (!(dir = opendir(sysfs))) {
+		if (errno == ENOENT) {
+			/* Check if there are i2c bus devices in other dirs
+                           as when there are none the error isn't useful
+                           as loading i2c-dev also won't find devices */
+			int devices_present = 0;
+			strcpy(sysfs + sysfs_end, "/bus/i2c/devices");
+			devices_present = dir_has_entries(sysfs);
+			if (! devices_present) {
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
2.40.1

