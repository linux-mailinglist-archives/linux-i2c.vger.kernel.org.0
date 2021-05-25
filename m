Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E71F38FD6D
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 11:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbhEYJH7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 05:07:59 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:39141 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbhEYJH6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 05:07:58 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BD581806B6;
        Tue, 25 May 2021 21:06:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1621933576;
        bh=z9AcanDB7uBEg6i8BhlOXvW4Bek7oJS0k0RzT6vhvXI=;
        h=From:To:Cc:Subject:Date;
        b=Pn5nleWhgS3j26tLoGgeguISZ17QQqRQF6wP5Jeny02rBwWSsULyQcWtFMeHi1u8o
         d+9T8fJK0jCBTa4UBYNqgd6K0X9Syd4FRaquZe+Z89eDYO8lSs22N4rJWXF0O+fmnq
         JCz378umCLVnete7fs56H2VKubG0lvaVe+J1VZ8KvI3h8LSRTsPLocv/shGDhD3/Ia
         regXaPR1cvdfhN+f26EWPVmAktfltaQTDAZfb90IxjKCcqY4IUZXZnajHQTICxVR0q
         QXFCmqdp5eRjojHBQhS05Iy+MIE7Wpu1gDtB9BSgn7SIuXWqc/H3uZ1VucqXVCz7CH
         oqSvNM9b8Sw8A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60acbe080000>; Tue, 25 May 2021 21:06:16 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 7B44913EE13;
        Tue, 25 May 2021 21:06:16 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 76A11284505; Tue, 25 May 2021 21:06:16 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.de, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [i2c-tools PATCH] tools: i2cbusses: Handle bus names like /dev/i2c-0
Date:   Tue, 25 May 2021 21:06:12 +1200
Message-Id: <20210525090612.26157-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=WOcBoUkR c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=it4O53lm2bJ1oO4j-8UA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

File based tab completion means it's easy to do something like
i2cdump /dev/i2c-0 0x52. Accept this method of specifying the i2c bus
device.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 tools/i2cbusses.c | 12 ++++++++++--
 tools/i2cbusses.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/i2cbusses.c b/tools/i2cbusses.c
index b4f00ae..5cb6e93 100644
--- a/tools/i2cbusses.c
+++ b/tools/i2cbusses.c
@@ -25,6 +25,7 @@
 /* For strdup and snprintf */
 #define _BSD_SOURCE 1 /* for glibc <=3D 2.19 */
 #define _DEFAULT_SOURCE 1 /* for glibc >=3D 2.19 */
+#define _GNU_SOURCE 1 /* for asprintf */
=20
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -104,8 +105,10 @@ void free_adapters(struct i2c_adap *adapters)
 {
 	int i;
=20
-	for (i =3D 0; adapters[i].name; i++)
+	for (i =3D 0; adapters[i].name; i++) {
 		free(adapters[i].name);
+		free(adapters[i].devname);
+	}
 	free(adapters);
 }
=20
@@ -306,6 +309,10 @@ found:
 				free_adapters(adapters);
 				return NULL;
 			}
+			if (asprintf(&adapters[count].devname, "/dev/i2c-%d", i2cbus) < 0) {
+				free_adapters(adapters);
+				return NULL;
+			}
 			adapters[count].funcs =3D adap_types[type].funcs;
 			adapters[count].algo =3D adap_types[type].algo;
 			count++;
@@ -331,7 +338,8 @@ static int lookup_i2c_bus_by_name(const char *bus_nam=
e)
 	/* Walk the list of i2c busses, looking for the one with the
 	   right name */
 	for (i =3D 0; adapters[i].name; i++) {
-		if (strcmp(adapters[i].name, bus_name) =3D=3D 0) {
+		if (strcmp(adapters[i].name, bus_name) =3D=3D 0 ||
+		    strcmp(adapters[i].devname, bus_name) =3D=3D 0) {
 			if (i2cbus >=3D 0) {
 				fprintf(stderr,
 					"Error: I2C bus name is not unique!\n");
diff --git a/tools/i2cbusses.h b/tools/i2cbusses.h
index a192c7f..77e1b8e 100644
--- a/tools/i2cbusses.h
+++ b/tools/i2cbusses.h
@@ -27,6 +27,7 @@
 struct i2c_adap {
 	int nr;
 	char *name;
+	char *devname;
 	const char *funcs;
 	const char *algo;
 };
--=20
2.31.1

