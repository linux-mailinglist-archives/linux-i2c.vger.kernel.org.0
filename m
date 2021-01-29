Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C651308C7F
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 19:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhA2S3j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 13:29:39 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:50353 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbhA2S2v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 13:28:51 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MZkxj-1lRECV3mFj-00WkPa; Fri, 29 Jan 2021 19:26:09 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] Removed unused work_amd_i2c_common macro
Date:   Fri, 29 Jan 2021 19:26:06 +0100
Message-Id: <20210129182606.41518-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129182606.41518-1-mail@richard-neumann.de>
References: <20210129182606.41518-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:d03RDHPUaJXzaIy1FsR3sZXShPOkmxH6kkpS3ZCF/jGjNjPkW0T
 UM1+SH4O8wUugTybxKQsew9qF4+F1kyAg+UmvHpWnbBAt0hp6AZZGSo8i2qFpt28kxM9YkC
 kQ2QHm0QQcg9w1HQC2X2fMZjIU1l5O8ESwtM6FmvkCdNhvJQft7VM2YXndzHcktFmcHZ+Ak
 lKMu2W+h23f46DroFBkmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vkza8/Sz8Ko=:4vGQGwsVboac3KhxbucqFO
 XRFqlD0bG7ydOBNYTdMwo37paXj5VxiwCJ+7w6UNA4J0RryGd24x1Oel4Q4AquYP/lpRkdwa0
 cFaKdHBVeHn4kNooc0ojbky7MRWTPmZeFqGW9+1jZ/WZjsOtKNFlXheJ7f0riqoAF6sC6RDuI
 /DL06Qwz19KhynOvqmSfTmMHahs1wIDQUfIIF+hCmt4/kvuIJo5jYLlVW+7YYU2JskH48Uz3Z
 sQstb3ynhXs5CH/IwKO9BrYEDDLtAaNqw1NB5QwFn3IYb9EQjhjY72MZloesP1ciZxiLjW+BY
 cqA1WzUa2XpsOdR7n/MBZfBkiPH1Ain7yua1+J99ANzhK+QXutvYYXlySn7m7Zp38MUmj8C7z
 R5VD3w0CXrftocsd8uITJYG6IqVFosg+r5GHraxEqpWP+6kOJn7RIw0xadbPXDUjvIQQgk9o2
 +BijTdqzpQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

The macro work_amd_i2c_common is not used anywhere in the driver.
Removed it.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/i2c/busses/i2c-amd-mp2.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 6b91e285745d..ddecd0c88656 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -185,9 +185,6 @@ struct amd_mp2_dev {
 	unsigned int probed;
 };
 
-#define work_amd_i2c_common(__work) \
-	container_of(__work, struct amd_i2c_common, work.work)
-
 /* PCIe communication driver */
 
 int amd_mp2_rw(struct amd_i2c_common *i2c_common, enum i2c_cmd reqcmd);
-- 
2.30.0

