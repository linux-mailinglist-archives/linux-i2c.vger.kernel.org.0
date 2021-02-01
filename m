Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153DD30AE84
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Feb 2021 18:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhBARyc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Feb 2021 12:54:32 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:48919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbhBARyb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Feb 2021 12:54:31 -0500
Received: from envy.fritz.box ([87.123.101.73]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLRgp-1lP7iW1Nf1-00IS8A; Mon, 01 Feb 2021 18:51:43 +0100
From:   Richard Neumann <mail@richard-neumann.de>
To:     syniurge@gmail.com, nehal-bakulchandra.shah@amd.com,
        shyam-sundar.s-k@amd.com, mail@richard-neumann.de,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] i2c: i2c-amd-mp2: Remove unused macro
Date:   Mon,  1 Feb 2021 18:51:38 +0100
Message-Id: <20210201175138.8986-3-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201175138.8986-1-mail@richard-neumann.de>
References: <20210201175138.8986-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Fnr0crl6wYI0faTjK8jlVOYXxh8Cl+DG9eWwvU2ID1q4Of/IUTn
 a7bnNfMxMrnfL4yD0NPKLsGVJNzmgtOMTO0JLa0fNWg96j4shbRDDHESk//8TuYhjM0n0fP
 mOKba/vNvMvToNaM44gWl+t0mmjydFnytZSu+tDcOhMcbioRwWdm2Y3r0rGSxxTXl5DjDFO
 3nYJu+pAitFpNaxzGPvKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P8PFOFaC49c=:bV9NDSFzRBJkvaH0D+beYx
 Tqac34GsJkxPaHyzqQY0as6lTRlCmYpgvkpZCXYtNcPa9Mr3CEWyEtnUcgvH3rU/LcM44K8UP
 h0URsy0E5BCrPrzs3/M8ol7DR9aYJ5AU4A7dODfZucw//o21llCKjBiqhRrAQ+wiaRQm+vmcs
 /tVBbHvmd4WuZzR8S27vOPSaEBVShrU2x9GrpaOX53pnZTS8G8E2QNM8pSF7btOIMY3KwlWNO
 2OXRNh4qhHwHDHnBcDf0Gwl7uF1S5hC+ewOI86STGoedcshGYYT1gw3he0JhEid3oUHvgFA83
 KJRvmcP0Z7FpeVPE0JgLRXKXzcYvLEK56aizIWrsy1/6Y83cxjZHNsLkiLTLJ551s01zsTrWM
 39ms4CgI37EUcbqXN3PQmajKTO470AvMbY7QJ2fGSqC/Ga/FxflaA6yX/6akt/zc+GnRl/vtk
 m4kl24MT7A==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove unused work_amd_i2c_common() macro.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

