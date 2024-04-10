Return-Path: <linux-i2c+bounces-2859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877989F0A9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0261F22A1F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B4B15D5B3;
	Wed, 10 Apr 2024 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="epXvFUdE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11915B143
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748316; cv=none; b=ZcdzSRud10OMtwti3yzCvsRBMDj9N7pkAjncesjPmxnO3CCqUWZsffwt0CoMmbqcK1eUMD8hRDJIJWCt0tqSq8Eaudng6iIFfdfi3+CxYkK6bu5N7krQQ8pLFEgc1HrTVhqSiyepq90pgYEi7uPj3vxyQSlsHEjHqNJ5ptWKZus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748316; c=relaxed/simple;
	bh=pKNy6/uLelc9atfAUxjk+L5JFkzaKEwH/YQAY44xMp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRe3wyA2JeMPS+9qV3UL1qo+P5GVm96vEoehIaAQKS/vXqj4CHwkW1gPrpHjlIrYPPacpVV6QwkW0t4x5ebWhDnNX5tgqI7Ojwlga+HtKEQOMMV+J27dPFmiAH6dE/MitmNMHbXMbmNfvdrfnsbx2zBETJExuqLtCY5FFZHKnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=epXvFUdE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jy0TzjFxRzkI83BTDaZvBAgFgJJl0WCFPH//vHbPFOw=; b=epXvFU
	dECEpEQU7wwUDKH0L4A5dnk/KnufSLIU8+tcYgj9N+Y7K2XSjveQ4i76654T98Mj
	ozYnMJyETZh0WX/FvP24CG2SBD9inGEqSg2XiRL/+UdMCSSIQyaiih4tTmbr6wlC
	qGGm6jbmS3e8gXzHk10dPK8ISWC/o4AsTOhQqpIckZ7ZZFQfJ7KW+jXfH+PmQFsI
	1+W1kiKU76tI7mxSTP4YOpyTtst33VNudWbaN5z/aDIZR3gqcSJGQH/IohbeXxuD
	yW5Ce3mCbUR9Aq6QEz4ejpgiCsi0AZ0dUhO6dGZMkxpsFloH8Ttm4bi/vjgF0poA
	Vzine1zU4fJsjt4Q==
Received: (qmail 521574 invoked from network); 10 Apr 2024 13:25:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:07 +0200
X-UD-Smtp-Session: l3s3148p1@ukRvSrwVgwZtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Seth Heasley <seth.heasley@intel.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] i2c: ismt: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:22 +0200
Message-ID: <20240410112418.6400-28-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-ismt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index c74985d77b0e..655b5d851c48 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -623,7 +623,6 @@ static int ismt_access(struct i2c_adapter *adap, u16 addr,
 		dma_unmap_single(dev, dma_addr, dma_size, dma_direction);
 
 	if (unlikely(!time_left)) {
-		dev_err(dev, "completion wait timed out\n");
 		ret = -ETIMEDOUT;
 		goto out;
 	}
-- 
2.43.0


