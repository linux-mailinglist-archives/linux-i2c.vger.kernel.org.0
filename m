Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0A47B484
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Dec 2021 21:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhLTUnh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Dec 2021 15:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhLTUnf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Dec 2021 15:43:35 -0500
X-Greylist: delayed 967 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 20 Dec 2021 12:43:35 PST
Received: from hall.aurel32.net (hall.aurel32.net [IPv6:2001:bc8:30d7:100::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B52C061574
        for <linux-i2c@vger.kernel.org>; Mon, 20 Dec 2021 12:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
        ; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
        Content-Description:In-Reply-To:References:X-Debbugs-Cc;
        bh=Ugh0zjC1qi63rDwyCy3TDViE17Mvvv1rNKH7QCO7EyY=; b=wUc9Iv2IWVtU9UywBQb9WndqRZ
        R7d2x4CSM4gZBsn9tnSScktVccV9bwMydj5/I0G5CV68gKm8YXKAWiJ9GDBYXPBdQRKcRajmfErZH
        3eq92MoT+Tr/L8XxVXggqK0XJhMV24woweQMgsOUIn2v4BV40DquMKfu6hlLULPJKblOPyEOZFsnW
        aj2rCa0bVC7NTrWoxNJxnDS0yeoysU57zOGa1yPvAs88mNPbkW6+/DXNZhoHal971SjqIGx3PeN76
        SZCpPRZJOPcn7kGnOUwJJwFalTZmnmk7bg6c1p1mZ9acxNWsNv3aznWWkmbdnjF7ZBiXT01gZAaOD
        X/34w+hA==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
        by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1mzPFl-0007to-Fv; Mon, 20 Dec 2021 21:27:25 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
        (envelope-from <aurelien@aurel32.net>)
        id 1mzPFl-005n6w-2A;
        Mon, 20 Dec 2021 21:27:25 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] i2c-detect: fix a typo argment -> argument
Date:   Mon, 20 Dec 2021 21:27:18 +0100
Message-Id: <20211220202718.1380408-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 tools/i2cdetect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index 0b9af48..1f34b56 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -278,7 +278,7 @@ int main(int argc, char *argv[])
 
 		tmp = strtol(argv[flags+2], &end, 0);
 		if (*end) {
-			fprintf(stderr, "Error: FIRST argment not a "
+			fprintf(stderr, "Error: FIRST argument not a "
 				"number!\n");
 			help();
 			exit(1);
@@ -293,7 +293,7 @@ int main(int argc, char *argv[])
 
 		tmp = strtol(argv[flags+3], &end, 0);
 		if (*end) {
-			fprintf(stderr, "Error: LAST argment not a "
+			fprintf(stderr, "Error: LAST argument not a "
 				"number!\n");
 			help();
 			exit(1);
-- 
2.33.0

