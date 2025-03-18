Return-Path: <linux-i2c+bounces-9873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6A0A66620
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 03:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 935377A92E0
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 02:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F64C14B07A;
	Tue, 18 Mar 2025 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="hBhfwJcd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637F191F72
	for <linux-i2c@vger.kernel.org>; Tue, 18 Mar 2025 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742264209; cv=none; b=cjk9GovOgKCzg4oydBQDDZP/RyFVYytdz8b93uKC5wO4hkmNxa+556HCCk+lzvNlELq2H3RVSehDV2OzkYfM4y09RCcKxix4yMeBj66Q2Hvl1QI1SaV78+GFCxa+B3w9l1iQItJCyGjNjXioyvmJ+Jx1fmRN+9hwF5DreSgVg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742264209; c=relaxed/simple;
	bh=8tSpg3imDga5tWwzzlp4L8Ce/B9GkfltKPs1gFJ1iSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZzTwLHudyJjXLk/Wd32r5EIdV7Ws4QLM0EqeTmxGXoTGrgOKBFRwbFPLdA8FK6sriRE7iAv7oR25bcKhQrJBi+Qg6do0/dvvWU7IczrY1KM3VQt0sC6rwmq8B0B9iFlHR/eZDUR4d4bSS9FAKpp+iSvD1FKK4DmmiXROG8hIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=hBhfwJcd; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F0A8B2C0375;
	Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742264198;
	bh=rk12yIwRFfsZFO22IbTM3cGgVoF4j8t2R27zQgv6PRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hBhfwJcdNnfYS2LtXD226T4XqQr5l9vX5p1cmoU0Hisx4QBSXBYvCRFFtcK9KtWCG
	 TiOgu1FhOIgNvBHTl+gb1llkLXkqNIW7pUBClpM5b2ZgI+M07boeq9wcBw1TGDAFo1
	 7XWF0w7xWPctpk+BUuMn2M/fKQvRba5/DHunE1pBu6CrDnWZ7r9L/w/ToDWoxr612A
	 13tImwUNxjEITdmcpk5wUGnfSP6PxHs4qwRsq/G+6ozoA48QP9YVz8SIYhzt1g6qit
	 jrlyH+2dC4yv2ec+97p8CA/rbpjfflI994Ayjj2m/B7th5gPp64HwLdK6sbuaTB1+O
	 nHDAGsLm+Ga+A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67d8d7860000>; Tue, 18 Mar 2025 15:16:38 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id BEC9F13ED56;
	Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id BFF352A1692; Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v13 1/3] i2c: octeon: fix return commenting
Date: Tue, 18 Mar 2025 15:16:29 +1300
Message-ID: <20250318021632.2710792-2-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67d8d786 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=Vs1iUdzkB0EA:10 a=HCePzOn4azgfXwQElH0A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Kernel-docs require a ':' to signify the return behaviour of a function
with within the comment. Many functions in this file were missing ':'
after the "Returns" line, resulting in kernel-doc warnings.

Add the ':' to satisfy kernel-doc requirements.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 3fbc828508ab..0094fe5f7460 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -45,7 +45,7 @@ static bool octeon_i2c_test_iflg(struct octeon_i2c *i2c=
)
  * octeon_i2c_wait - wait for the IFLG to be set
  * @i2c: The struct octeon_i2c
  *
- * Returns 0 on success, otherwise a negative errno.
+ * Returns: 0 on success, otherwise a negative errno.
  */
 static int octeon_i2c_wait(struct octeon_i2c *i2c)
 {
@@ -139,7 +139,7 @@ static void octeon_i2c_hlc_disable(struct octeon_i2c =
*i2c)
  * octeon_i2c_hlc_wait - wait for an HLC operation to complete
  * @i2c: The struct octeon_i2c
  *
- * Returns 0 on success, otherwise -ETIMEDOUT.
+ * Returns: 0 on success, otherwise -ETIMEDOUT.
  */
 static int octeon_i2c_hlc_wait(struct octeon_i2c *i2c)
 {
@@ -273,7 +273,7 @@ static int octeon_i2c_recovery(struct octeon_i2c *i2c=
)
  * octeon_i2c_start - send START to the bus
  * @i2c: The struct octeon_i2c
  *
- * Returns 0 on success, otherwise a negative errno.
+ * Returns: 0 on success, otherwise a negative errno.
  */
 static int octeon_i2c_start(struct octeon_i2c *i2c)
 {
@@ -314,7 +314,7 @@ static void octeon_i2c_stop(struct octeon_i2c *i2c)
  *
  * The address is sent over the bus, then the data is read.
  *
- * Returns 0 on success, otherwise a negative errno.
+ * Returns: 0 on success, otherwise a negative errno.
  */
 static int octeon_i2c_read(struct octeon_i2c *i2c, int target,
 			   u8 *data, u16 *rlength, bool recv_len)
@@ -382,7 +382,7 @@ static int octeon_i2c_read(struct octeon_i2c *i2c, in=
t target,
  *
  * The address is sent over the bus, then the data.
  *
- * Returns 0 on success, otherwise a negative errno.
+ * Returns: 0 on success, otherwise a negative errno.
  */
 static int octeon_i2c_write(struct octeon_i2c *i2c, int target,
 			    const u8 *data, int length)
@@ -625,7 +625,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2=
c *i2c, struct i2c_msg *msg
  * @msgs: Pointer to the messages to be processed
  * @num: Length of the MSGS array
  *
- * Returns the number of messages processed, or a negative errno on fail=
ure.
+ * Returns: the number of messages processed, or a negative errno on fai=
lure.
  */
 int octeon_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int =
num)
 {
--=20
2.47.1


