Return-Path: <linux-i2c+bounces-2854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A7889F09A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA37284600
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6417A15AAB6;
	Wed, 10 Apr 2024 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QphoD0Ic"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37A71598E1
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748311; cv=none; b=EEADPKvWhXWntwoyiddfDDM32RlhpabfMiNDVX2zrW4XWnWpCNqk3leywgl6sNauykZshumBl+8yAXCcLm54yx46KTzpYgfuc7GNf//ZziEtB5tVCtYUoZQkwpuQhyuE5sveipRarMmaMx4KybGR7H8rIJDMOSlh+8Sq3XnaXOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748311; c=relaxed/simple;
	bh=dVv3yCapRGHqaKbd/raKqVqecjajjR0ihwDqpWezJvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MS0hO1DVUFbiypeWjhuF3+UqlA5UIYxOVkwmE/eVq/DaJeQ1RdB7aogJoS+uvkBiR5ddRQ5TBxHQXtVrQmA6CuZH2ltTeD7s63dEV0gY76D/KGpljdyUYRVOMRluu8S6MOvs0XlSKIG2Y0Ts01/Tz2jU7yRt56uBjyGXjZcQrc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QphoD0Ic; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4EUSyGzomATeNIcG8P0cZgKgvqo4WHF+lzVzVLKSadU=; b=QphoD0
	IcmvSEdfsDJaszWGUfYISArnr7pFEh3iVuEliuWPXsaTgp99s+8UAb1PeiQ2J4Gu
	YVzkQFx3QKuRWskt4wncxwHVmjHKjJzyR7pgQVM3JZumJ3aMUasyuyrdbjPI09MX
	orqntkK7cBII9SSeznWLuksgjiYzPM25iII9cciqsLVPmcQPgblgN2v6WFy+xDAR
	GYaOcP6HHNAsj3qUD8mkxKXUqEpyl8BtH28WnzKa1Tn7BnuTR3JmA+ZZr0FdXKwq
	nFtZzB+Yb9qVvDlZJkJ2v7nmQEJW9ryYrinepeH7aZSYWbDr2HyBE0CLJiGG1swO
	lMVX3FG5Sbd7o0jw==
Received: (qmail 521447 invoked from network); 10 Apr 2024 13:25:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:01 +0200
X-UD-Smtp-Session: l3s3148p1@AQUNSrwVyC5tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/18] i2c: bcm2835: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:17 +0200
Message-ID: <20240410112418.6400-23-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-bcm2835.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index b92de1944221..3045ba82380d 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -370,7 +370,6 @@ static int bcm2835_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	if (!time_left) {
 		bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_C,
 				   BCM2835_I2C_C_CLEAR);
-		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 		return -ETIMEDOUT;
 	}
 
-- 
2.43.0


