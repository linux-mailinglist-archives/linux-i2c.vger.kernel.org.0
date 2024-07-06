Return-Path: <linux-i2c+bounces-4731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBC929404
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 16:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79E271C219BE
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 14:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3205013A3E4;
	Sat,  6 Jul 2024 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O22PyAbH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F224B5B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 14:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720275835; cv=none; b=BOaK/eBKpgdELWHGECBGSJdwemdZm7AbfXcc5XaulWoCl3zJG40MXmwraCjfqp4NPQDVnZlusWTNHWs8WU6iYR8xS1AhN/pBZETTBgqCNjQN1UYZqSU2kTOeqTt02TzWzTXIYY4EZyVz5oNwpe4MZ/qpLcpSDYLJnpgq/BI8omg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720275835; c=relaxed/simple;
	bh=EypVFF0r2iU9aRCGsYaF0MfX7pr6tRfyKoJp0FFn1hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SfWh+ZK6qWVkyFYYiiJ9EvFoyY7rhJzFwICzn8/oRl8N4bUZ00dI3hoglMHjnrbljSq0SDUXDeU2QJG1V7Klz9a39OOxpAT9sh/Bkatrhc6dJjwjQ7otA/W5L5FfOp65pXWReEc902n9SSMJ1q1kxvVcVRQGRn3/355rLHN4BMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O22PyAbH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=T
	fWrrqrSEKmI8uFlSyBXJYPTJk8sTd6u4UeqTRUwrME=; b=O22PyAbHpcnpqGODI
	+6Eom312oFHrTOTywcHaS383FXxj3MfUSWwcGtuMrysd26GvUb2aVDZrSuR/nWsa
	J1Eg2MHnb0av5BTeolimthqSZk6fgaZKYnT5/7GDH7c+wBJvWntMU3ymTPGx6JW6
	dzI0a2rHAziU/iMxyLUKCpdVK5JIg4FMlPr1in+IkjVj3UKSu1L77Dg8eV85ENmf
	P6TGxyj/CxGkDxRDz10qOdchtBXZbkmd7GUQHFiz1oIweula/YPG+geGpg82UgwS
	+zko/53pWs0qPISt1N2DmTvfA+l5CcvDRqJOZtA9lJ4Du7ynF2rlczC3DRKSyniU
	lS2QQ==
Received: (qmail 3846280 invoked from network); 6 Jul 2024 16:23:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 16:23:49 +0200
X-UD-Smtp-Session: l3s3148p1@UUGx7ZQcIINQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	linux-i2c@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: delete entries for Thor Thayer
Date: Sat,  6 Jul 2024 16:23:11 +0200
Message-ID: <20240706142313.2028-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The email address bounced. I couldn't find a newer one in recent git
history. Delete the entries and let them fallback to subsystem defaults.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3c4fdf74a3f9..68e3ef05facf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -846,12 +846,6 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
-ALTERA I2C CONTROLLER DRIVER
-M:	Thor Thayer <thor.thayer@linux.intel.com>
-S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-altera.txt
-F:	drivers/i2c/busses/i2c-altera.c
-
 ALTERA MAILBOX DRIVER
 M:	Mun Yew Tham <mun.yew.tham@intel.com>
 S:	Maintained
@@ -871,21 +865,6 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
-ALTERA SYSTEM MANAGER DRIVER
-M:	Thor Thayer <thor.thayer@linux.intel.com>
-S:	Maintained
-F:	drivers/mfd/altera-sysmgr.c
-F:	include/linux/mfd/altera-sysmgr.h
-
-ALTERA SYSTEM RESOURCE DRIVER FOR ARRIA10 DEVKIT
-M:	Thor Thayer <thor.thayer@linux.intel.com>
-S:	Maintained
-F:	drivers/gpio/gpio-altera-a10sr.c
-F:	drivers/mfd/altera-a10sr.c
-F:	drivers/reset/reset-a10sr.c
-F:	include/dt-bindings/reset/altr,rst-mgr-a10sr.h
-F:	include/linux/mfd/altera-a10sr.h
-
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Joyce Ooi <joyce.ooi@intel.com>
 L:	netdev@vger.kernel.org
-- 
2.43.0


