Return-Path: <linux-i2c+bounces-4390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F291A4CE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 13:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F54B2832D8
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCD7149C77;
	Thu, 27 Jun 2024 11:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VNBrvY9Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A00B149001
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486914; cv=none; b=mqmewzoszO2/vdASr9SYohaCPQtpmS5U0u+tHOYeb4kV4jmDPt7gTGR8GrGgCUQ+EBkLN2kR8VUDAt/8RGetlq2xAXW8ia1EaFfV1vItLy0jMPilKEyfUn86wIqDCtMFcsJXJ3aXmg7GIBUVf/6BWBq+Y0yc8jYpNdKYF5GWGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486914; c=relaxed/simple;
	bh=vSrC6MKsoswbDMlDS34W4lt+ugl8b9L0/0ZvnjpDzQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU7bh0Pnwz8YykVSGI288ik6zVLnp7kkLzAdG/xWoUEQEfbWN/s21/iyNk/DY1pJPuF3hhnJ8p1bEa3Tx85s6/6Ue55NQPaoEE7IWYfCZvLa2vrALFEKCfcB0rtDBPhLsS5ZuyipOk9oEz8JbXsnMFkW347Bj2Xbo2gMgoboHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VNBrvY9Z; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=GQMRZOemAURpD4kjKet+n2xAoTAMM9frMGdb4hRkkqY=; b=VNBrvY
	9Zm6R+NbRtPt7wY/oD5NAScwPkXUL/j+9vxwEdrDDB5S3LDma6pSPSMn4JOLIPb6
	mNF2LhZ6NtfO0LnxzFmoeSlJFWXM7zsIYqPOmijf8ruGzWNzCgLOIx4YgB1U0qql
	GNWT73QGPoUmdflIHv2DfKtQ17ZjrqJg07GRJJ2iRiOBYmhsiztx/5QqyuUZ+0NW
	W9RySOeQ4xhq3hDg3dwvK+ZfScMHnhn3/1tqolVrD7oXNayLiYeyEzuWJxp18j3j
	CC0wlFkcMDTmzlBsoHc+5fFMAj4VnZ/kSWnm2oaBvGPCRSZfiOqx0cvINoumGi8T
	y2HtFvvtUWRppsiA==
Received: (qmail 884592 invoked from network); 27 Jun 2024 13:15:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2024 13:15:02 +0200
X-UD-Smtp-Session: l3s3148p1@lnMGPt0bkNogAwDPXys0AFWnEn9dr4bp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: testunit: discard write requests while old command is running
Date: Thu, 27 Jun 2024 13:14:48 +0200
Message-ID: <20240627111445.29751-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When clearing registers on new write requests was added, the protection
for currently running commands was missed leading to concurrent access
to the testunit registers. Check the flag beforehand.

Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index a5dcbc3c2c14..ca43e98cae1b 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -121,6 +121,9 @@ static int i2c_slave_testunit_slave_cb(struct i2c_client *client,
 		break;
 
 	case I2C_SLAVE_WRITE_REQUESTED:
+		if (test_bit(TU_FLAG_IN_PROCESS, &tu->flags))
+			return -EBUSY;
+
 		memset(tu->regs, 0, TU_NUM_REGS);
 		tu->reg_idx = 0;
 		break;
-- 
2.43.0


