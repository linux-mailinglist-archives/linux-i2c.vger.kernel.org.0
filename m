Return-Path: <linux-i2c+bounces-5290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD0A94E359
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 23:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6310D1F21184
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D039D15FA92;
	Sun, 11 Aug 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IkJoBM0n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F7611CAB
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723411410; cv=none; b=Ba2v6lDtpN3tMmhao1Cs7+GZQ9m14stdsRCbyrcMfFjzTTBo4gu0tsUj4Hr6kU8uDY0wOfTPJdMgbsgtdZTg0MW9anufBJjKGOV6FtSjuz226OvT5O0J75oGMhrLa+SLH9tfgx4E9Y9RQH5gtY+Z0en7oO8mkWwHbOfonN8fP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723411410; c=relaxed/simple;
	bh=/JKenog5cXUZhlnwe9lyA2IoSnDbc1a+O19y4wmL83I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipZ6ot802xysuHnQuQOZIuqVUUx7Vd+SPTmhNoX5NBe8z8owmyWBrL+xAZwIWhnZS7Ujorthz1MKAqVJ9JlXtUgUePyOiWAddLKcwuRmMJn43kPXJk7mFOh5hW13ipdk32BySWJA2WHd0CDY8XC5Aw3pw00KFmli8qZgixIddy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IkJoBM0n; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=FnxzPukw+LsvL2
	vz3lMOxWbIiduXn6N33AJ0R81zcVI=; b=IkJoBM0nmYp9Y/bewThn5ewFsEenwU
	eYqcm6Sclf7Es2H353PuhXWRAK7yfUKhwUDKN8xUWs23PyIdarrMIyttJncm2wRq
	5nU7dcH6fKXJSG2/RdVEoBhbGm6/TOH9lmsVH+lgr5Sd+Y13tLd1hHt6nO8uk5rj
	IoAf1kB1j9RzM5/e31neotxTZpZMC1+Ui7zM+BZFtvYXGQjgcr+mXSlpO/2imkVp
	pl2CgzC/4MMpXh19LbYHPHkW5/d/aZgDpmtEc/66idmntNzkZcRTyzZ/sqiIIzPE
	C5yDplaRKEaMnqoacKko5bF1UrAdkHcAP/ETbQ8ZprMeO9FhobQuormw==
Received: (qmail 1179527 invoked from network); 11 Aug 2024 23:23:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2024 23:23:22 +0200
X-UD-Smtp-Session: l3s3148p1@ewJv/G4fEJUujnvj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/4] i2c: testunit: add rep_start test and rework versioning
Date: Sun, 11 Aug 2024 23:23:12 +0200
Message-ID: <20240811212317.16119-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On my way to let the testunit trigger SMBusAlert interrupts, I needed to
rework the way the testunit responds to read messages. This series is
the result of that with some very nice side effects. First, we now have
a new test to check for proper repeated starts between messages in a
transfer which will also improve versioning (patch 3). Also, the state
of the testunit can now be checked (patch 4). Patch 1 makes the state
machine a little easiert to follow. And patch 2 improves documentation.

The patches are based on Linus' tree close to rc3 and has been tested on
a Renesas Lager board (R-Car H2) and a Renesas Falcon board (R-Car V3U).

Looking forward to comments. Once we got this in, I will send out the
SMBusAlert additions. They do work already, they just need some
documentation.

Changes since v1:
* patch 2 added to improve documentation
* added newline to the version string to make its printout
  "self-contained"
* for reading the new version string, the shell one liner to print
  ASCII directly has been removed. Now we use a new feature of
  i2ctransfer. Note, the docs mention version 4.4 already which is not
  out yet, but it will be by the time 6.11 is released (tm).
* rebased, dependencies are now in Linus' tree

Happy hacking!


Wolfram Sang (4):
  i2c: testunit: sort case blocks
  i2c: testunit: use decimal values in docs when appropriate
  i2c: testunit: add command to support versioning and test rep_start
  i2c: testunit: return current command on read messages

 Documentation/i2c/slave-testunit-backend.rst | 60 ++++++++++++++++----
 drivers/i2c/i2c-slave-testunit.c             | 43 ++++++++++----
 2 files changed, 82 insertions(+), 21 deletions(-)

-- 
2.43.0


