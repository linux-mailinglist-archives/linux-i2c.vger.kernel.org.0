Return-Path: <linux-i2c+bounces-3074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5B8AE5C5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EF231C21A0B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CFB12E1EF;
	Tue, 23 Apr 2024 12:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TzWzw4zX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EB583CD3
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874417; cv=none; b=VUavGDgIvDY+zoFyhzeqoSF1dUqzIarh4pVMMAzD/ohTtlBd5Mv2LYqH3sbeC9ijtJWnRUilN9RMj0yvLS6ULKXQUn9mf6mnxyXV7ZaOAafvlCoq6pFLtDOalE10qlgWl2RdrtFN1G+TfyUTuL5Y/YdhKdUDDqNKkvBBAyrcBwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874417; c=relaxed/simple;
	bh=0jPmD9w6MO6TfNirky2Ez+VJd/uyuUY40pI0AtAvSpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAarWLoBhsEqSgoxjhzO2ngFY0omosPMG0T9oPEyTP3n5PffNw06u3BrjYEbXpeDTDE5ZYNzsVNhdPnnumdK0K9oj4ofVrC+PXjnzaJasZ0pgWBZTBYq80oSMz6Zp7gpTizeBTX6dwcfzUyu87MeKNQ0DDNSj47mq3NOQllCyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TzWzw4zX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xe5iCNJGYAImX92c4VMr943pPMAZr/upLvt8TB4E1Rk=; b=TzWzw4
	zXLdQiwmqYFVdOdf/vhMQHs1khqXsRzXhUUnaGLWq4B4MLBzWbnSQ+SjHGA5w/hs
	RDlPn5o35fHgrOvLsVcML94E8ZV2VAOVgnevPn/vUjDX9VQLh56eu53g3nsyPJwp
	ZV/qhYTSA//TE8GReYgaBuG/y9i22nTDx4ifjpAEfN/G9ka5Xh1DvP2cIsIHnQ97
	zZ1ea5Yc6BqrI8CnojBEIojVOhIBnhTBJJDrF59MzUrPwACfaTj5Vlu57/dxJ6fC
	DQyBoohCBHIA4LsTxoGvETCzkRsaZhibgl5cEQxr2Jx0VIWjYrtF+9qTrazSooR4
	liVpdILFHALtej5w==
Received: (qmail 215997 invoked from network); 23 Apr 2024 14:13:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2024 14:13:30 +0200
X-UD-Smtp-Session: l3s3148p1@iRJwe8IWYMIgAwDPXxiyACzheF6dGXh7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] i2c: ali15x3: remove printout on handled timeouts
Date: Tue, 23 Apr 2024 14:13:21 +0200
Message-ID: <20240423121322.28460-5-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-ali15x3.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index d2fa30deb054..956e5020d71e 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -294,10 +294,8 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 		 && (timeout++ < MAX_TIMEOUT));
 
 	/* If the SMBus is still busy, we give up */
-	if (timeout > MAX_TIMEOUT) {
+	if (timeout > MAX_TIMEOUT)
 		result = -ETIMEDOUT;
-		dev_err(&adap->dev, "SMBus Timeout!\n");
-	}
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-- 
2.43.0


