Return-Path: <linux-i2c+bounces-3072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE568AE5BF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EB401C21C58
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10036127E0A;
	Tue, 23 Apr 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CHGkAUtZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205EA84E02
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874416; cv=none; b=DclUtRiU0WDOz3CvjgELTRxUM7VevOTT4ImciCunziOk9J2J34klENa5/XcHRMRzfq7CIw+KdQ1OHMLa+2S3BE4CS6SBQi9s+g2VH7l27yPdfszjwav+t41SU/daYPcKBnUtmz8uOxtgoHhUJWWMXILVKq/5aExDlWpdIjbDt9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874416; c=relaxed/simple;
	bh=4GV9MbW2RUuneAx+t3k0TvU8fbKIZejKkKEkfAigKsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NOlqnyvH6R20lnAVM7LlCczyuUPkxQl2VeIOqwB5HqMi4n3TCmW6SLiGPrbK4Zzs/fvpNUcQ8lDS2shSqZ+4Wb3I49IR1O5zPeD3WFOnthI2Y33ZTbor+HsYlvtoS3fIX30KBNfAeQOfNwSE79uR+wpyT1oVLBIGAczkn9tSoPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CHGkAUtZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=WOkkrOzp70gQH6ESIdM1GW0bOtr5jQu2Mkl7P4COiR8=; b=CHGkAU
	tZKSh5LQE1xvhXrYl1zayyLSkqmqv+F9dGKxSTY26TAkT24LnloWOpaoHWHlEcjF
	Unw5N8/t8kq7xu3LyRoatQZnPhe8FChGtLLrwHBtoy3ytI3n2zDPkLKOZ5ZRE+Iu
	DcxAlBWfoaCu4a9DZo3pc7YeCKhnnY5Mq9SJPQ70zYW/S5Ojk9LA0qAfNpxP5jgQ
	NdvtFmTiBdN1YtXmiwrRGSV0RRt+lpmH0PpLERABtTvxXpaqquCLvUtSnc06Lfbs
	3x0KDClsYlHmUVCXXV3uxSZkZE+zw2+H0Y+7e+WSo17nJlD03tgpnDsAPa3aB2V7
	B3XAAChg4Td2HccA==
Received: (qmail 215962 invoked from network); 23 Apr 2024 14:13:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2024 14:13:30 +0200
X-UD-Smtp-Session: l3s3148p1@OGhke8IWVsIgAwDPXxiyACzheF6dGXh7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rudolf Marek <r.marek@assembler.cz>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] i2c: ali1563: remove printout on handled timeouts
Date: Tue, 23 Apr 2024 14:13:20 +0200
Message-ID: <20240423121322.28460-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-ali1563.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali1563.c b/drivers/i2c/busses/i2c-ali1563.c
index 307fb0666ecb..63897a89bb35 100644
--- a/drivers/i2c/busses/i2c-ali1563.c
+++ b/drivers/i2c/busses/i2c-ali1563.c
@@ -99,7 +99,6 @@ static int ali1563_transaction(struct i2c_adapter *a, int size)
 		return 0;
 
 	if (!timeout) {
-		dev_err(&a->dev, "Timeout - Trying to KILL transaction!\n");
 		/* Issue 'kill' to host controller */
 		outb_p(HST_CNTL2_KILL, SMB_HST_CNTL2);
 		data = inb_p(SMB_HST_STS);
-- 
2.43.0


