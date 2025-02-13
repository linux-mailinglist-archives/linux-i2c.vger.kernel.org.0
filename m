Return-Path: <linux-i2c+bounces-9443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C93ADA34AF1
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4F83B468D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8160D24BC16;
	Thu, 13 Feb 2025 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l+ihDgTR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4824BBED
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464203; cv=none; b=rQsb2arF4/DHMoNS5sDQb1yuJ6hhPTjX7JJFAzKiIJejEBq4clMpG8lCvDLRQAnn2h6Lu3PoPB7DH/LVvWL0fnW+npYFOM09DudENg+2NUOl98TOIxnXBxyJlQNV88Qwy08i3XWO1BHs3l11QDqa7m66bjjtV4oMErPx45Z4EP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464203; c=relaxed/simple;
	bh=/WXCidTVdTxwKwKCY9XoYLm5tETD5VI6+Cjgi61RIhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oppvqg2Az83b/Dsh7FJv6tct7ORTVU+C+JGMXScw4SRCds5OpJEYvKliki1HsEkPCMbSefP9hotspzZKgX2k6L4bc+xgR4tfF3qPXBrj8TIVOlfJ7w+lctdzQHdf10HMFl1MjAOoOo5hV8LYnuRuKGuGn7yb3vKbrSntgPhiwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l+ihDgTR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Dy7pzNdjK1tp9I
	TNYZaghj5wxJIyE0F/LQJR6WcvzQM=; b=l+ihDgTR9060+7POmFTICO6vu6Y9kA
	Fj9ff/fVz3zOXe/6HZhwGx1u7NEabJMpnCblwM8ZVW061mOYsJ8H+wxn6nvkxlOJ
	BdsxqL9r8sVJTZppUGbEr6qaKqbUn36v2fFR2jPZlPjI+aUd6RJPxkRmaUKZcpOI
	C4Awrr5hjkoXJ6l1RNgk1PHWLKuzaI0K9SPrNoyCd9r8B3a5ayUYGi8e6AphSMhZ
	gKwVBU4DNrms3p40BVtEPmncvkg0Nj9JrbvChV35G6/xYQJYKEJE4yjkUoi/Lr24
	sOlvVh6r7kY5IeitMv2xFGpqrKjcOoYvLCzV43lPszEpGuuCqxD9Nnrg==
Received: (qmail 1944291 invoked from network); 13 Feb 2025 17:29:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 17:29:55 +0100
X-UD-Smtp-Session: l3s3148p1@6/15kQguqtpehh99
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: delete entry for AXXIA I2C
Date: Thu, 13 Feb 2025 17:29:51 +0100
Message-ID: <20250213162950.45596-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The maintainer's email address bounced and he wasn't active for 4 years.
Delete this entry and fall back to the generic I2C host drivers entry.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..fc332fbf3958 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3859,13 +3859,6 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
 F:	drivers/pwm/pwm-axi-pwmgen.c
 
-AXXIA I2C CONTROLLER
-M:	Krzysztof Adamski <krzysztof.adamski@nokia.com>
-L:	linux-i2c@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-axxia.txt
-F:	drivers/i2c/busses/i2c-axxia.c
-
 AZ6007 DVB DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-- 
2.45.2


