Return-Path: <linux-i2c+bounces-2855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8E89F0A0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96286285044
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F3515B122;
	Wed, 10 Apr 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="a6oVtxBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71C915ADA2
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748313; cv=none; b=N0hDbbVdD7sKBfu4kudq3nfmN97jXykND+uTumpdtFn1XM3UdBS7EuTG0qWsLOjIaPjxG1cPTFw9phPQJ1m+3z02yYsW2fguNg8WI454HAFahd6mmk2BO8P4GPuVKJnRY5Y+EfDHA5wpZQd8sKj9RwTc5gVU1L/jbaadGnhw9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748313; c=relaxed/simple;
	bh=EEUfTeoa9Foy7qAXuzOsrCEqiYrisx6cg3y/4vq3/C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDe30MjtXuKHUY6K/ovh/DMOCcptRU4RBFQfF1GpvdeQtD07lqIV/mYfDSxpSRfb/wxkqqJj1TDMgzyp2bSYxhh3/opoAeSaOvuxUvvp84ng5Wm8MkqLP8OyMsAv8wn0E5CKTCRw3VlhwYCN7khcVssxg4pVKK/yIXJo/ztAVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=a6oVtxBh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=hD8uz8cN1ScOd8WPchdst4mxCACdD20Wmh45ImGI/X8=; b=a6oVtx
	Bh1gvv6bITBD1Cz3DUhfELjmFMxhEhR+AHoeksfm5KrUSRVeoTQikoU/us2SJR36
	rqhzW6yJBUHl7MfBms5eST+3Y5CC5UJ1MuHezo3gp8VXpRwwjOOg/8rhgsMCskuF
	4kgy7RaL4OCO2tK/P8srJT2kFViURleSD/lh+JjCUqSVLQCTDpHLB0ve+pzwFifE
	Pyz8EWOzPRxhwJj0gt3aNTVOi+tPxvtNMLR9t/vS/RZmprV/kWIG/G7cE4I5fTp5
	gzwrWLO2uV0sO78yYo2yAFoG6TXLqyFhb2BMuq7eorRE5aoF/PYcKhXZzZXokYVg
	61UO01t9i8Cf5lpQ==
Received: (qmail 521473 invoked from network); 10 Apr 2024 13:25:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:02 +0200
X-UD-Smtp-Session: l3s3148p1@iO4iSrwVDyBtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] i2c: cadence: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:18 +0200
Message-ID: <20240410112418.6400-24-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-cadence.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 4bb7d6756947..1b0006e3b95c 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -789,8 +789,6 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	time_left = wait_for_completion_timeout(&id->xfer_done, msg_timeout);
 	if (time_left == 0) {
 		cdns_i2c_master_reset(adap);
-		dev_err(id->adap.dev.parent,
-				"timeout waiting on completion\n");
 		return -ETIMEDOUT;
 	}
 
-- 
2.43.0


