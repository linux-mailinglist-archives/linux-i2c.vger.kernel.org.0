Return-Path: <linux-i2c+bounces-4367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54058917C1B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 11:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E797286F25
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 09:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6CC9184122;
	Wed, 26 Jun 2024 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Kbl8F7L2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA318410D
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 09:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719392968; cv=none; b=J5OoEWoqjvyHCSmlRXIJTpMTm/y8hO7bURxlLaHSeCUYD+ppDVFAgu5pbGwVwTtxgjwCOKbtkXgZp9R55nL+/YeMV293wSM+MrpzAEnDA1VgAl8qd6hWpbkbTxSn2qk5ep7CGaNDNyCxaPvxxOYd9RQbwA5fmtuPzoao5s/GW/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719392968; c=relaxed/simple;
	bh=LQGBhB8CzLDrfbu2RQ+7+lH19tE16e4kgrN3rqhqVQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gy/CbikwXR1OOkPsGYX62zDcQXq935NOYPU5Np+BUL54/PFdU9ynw1vEqnUW8PsaIxoklo2T0w+YdWEp12ygCSgiRhzB8DU9bvq7h0CkeJNrcoVgBy7YfAPlp6DYx0jc9xZbaXZ+PSTLDp4864GaNTc7E15Rm8jq4hpFKU1XUyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Kbl8F7L2; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8571460003;
	Wed, 26 Jun 2024 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719392958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pco9TU8U5Bl23OKH0jbTgomLqieC7XmRZYQ84sMqkmE=;
	b=Kbl8F7L2Dwyii1Ilh5A/TVfVaXytMjQNw2H4ZfTQGjcMzAbYZsfapd88ebcm1FcKj8uxWj
	4C8DOPHbGAz1WzdRkfCEmE287oTNqShYXJGerL8oTLX8//QhKQJymyIeyd1kSsAFom7GOa
	1sgl0EQxRxNNPkQbCgx5nC0Sz7KbDTKCPsMIHHboLXeV6BG7qxQBKv/efTYB2scgXBwRbR
	TBcphuOBBUckcFkUgVVd07vs3Yu/YkcYd3HFUUqf9UrcYH3ybmF5kz56cbBq0figYy2/IY
	m7JyV0F43p64H4yE1kPnQmjFdexL/l88qgQByujXlP4AP01pda9iQcqkJGeK3g==
From: Thomas Richard <thomas.richard@bootlin.com>
To: linux-i2c@vger.kernel.org
Cc: jdelvare@suse.de,
	thomas.petazzoni@bootlin.com,
	Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH i2c-tools] eeprog: use force option when eeprog gets data from a pipe
Date: Wed, 26 Jun 2024 11:08:33 +0200
Message-Id: <20240626090833.356666-1-thomas.richard@bootlin.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

When a pipe is used to send data to eeprog, the force option shall be used.
If not, the first character is catched by confirm_action().

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 eeprog/eeprog.8 | 2 +-
 eeprog/eeprog.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/eeprog/eeprog.8 b/eeprog/eeprog.8
index 6a61102..70f78ae 100644
--- a/eeprog/eeprog.8
+++ b/eeprog/eeprog.8
@@ -95,6 +95,6 @@ Write the current timestamp at address 0x200 of the EEPROM on bus 0 at address 0
 .P
  	date |
 .B eeprog
-/dev/i2c-0 0x33 -w 0x200
+-f /dev/i2c-0 0x33 -w 0x200
 .SH AUTHOR
 Stefano Barbato
diff --git a/eeprog/eeprog.c b/eeprog/eeprog.c
index 9978241..ef18ae1 100644
--- a/eeprog/eeprog.c
+++ b/eeprog/eeprog.c
@@ -65,7 +65,7 @@ void do_usage_if(int b, int line)
 "		eeprog /dev/i2c-1 0x51 -x -r 0x22:0x20\n"
 "	3- write the current timestamp at address 0x200 of the EEPROM on\n"
 "	   bus 0 at address 0x33\n"
-"		date | eeprog /dev/i2c-0 0x33 -w 0x200\n";
+"		date | eeprog -f /dev/i2c-0 0x33 -w 0x200\n";
 
 	if(!b)
 		return;
-- 
2.39.2


