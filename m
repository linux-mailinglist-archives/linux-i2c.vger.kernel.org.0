Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44303308D6B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 20:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbhA2T2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 14:28:45 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46183 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbhA2T2i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 14:28:38 -0500
Received: from envy.fritz.box ([87.123.100.109]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis) id
 1MRCBm-1lHcby2Mjc-00NCEK; Fri, 29 Jan 2021 20:25:58 +0100
From:   mail@richard-neumann.de
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: i2c-amd-mp2: Remove unused macro
Date:   Fri, 29 Jan 2021 20:25:53 +0100
Message-Id: <20210129192553.55906-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129192553.55906-1-mail@richard-neumann.de>
References: <20210129192553.55906-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uCXYvYF3DaIli/odY1xLYPUqpRLmF0sSjnzEQK+zwufVj+7SjJU
 zrM37TNZXEswn3LCUIsdAa6X7qVQEr0TuSksHDewRsQSC40o0dlsMsa+kSnEAEEh1eY0hL1
 DSlmzbFLpgC2Z+tfKRy4iVU0rpfR3Q/j6n9mIl8OvLi4XTtoKvtyNMiV92iQlbLhwIgHlwg
 mBdsKushWS8n6ZpN9dIqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZL8u66K5q48=:Z3FsRiotT2lrYGTL1lA9TT
 wKfDrdYeO97kLnf5G5WpXxV05Ro0g3W4whUI/VvKL6XYbJhxlIHbbcmdeouAxL9HHeONsVgbB
 /W2phiotK0ZUFpPGfxDa+tZ6efo/ShtzldLW0OXrJeYkMYcNud5//R9l9l8iJUVYsBeiroqFP
 eKLogVrdkRFB0oQB1zf5d5KOj56B8f1ahTdvdgbA12concWb/Y7Tzl7eljvXIr+84rktsxACY
 dcTHw4tKUoybof0M4adbuGba2pYTIKv+NraPPLPUHwrFAnGu3MvFv3xPwZsTFSpfwotErX788
 i9ITgPNtR0l3XLRecCoDGRYA6U6kmEyTDkm3f7jx2c9EB9mpZ5JG9q5eGnsSLUKbD8aLDWY8r
 U7eWD615LY2t4GRMpiwe/LMjqV3WGBTdNehhgM4iljHBJ+2MhUivzlCUYciG792i5OsIFCm27
 wilZbLY9GQ==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Remove unused work_amd_i2c_common macro.

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

