Return-Path: <linux-i2c+bounces-5167-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31D9492D7
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 16:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFF21C2351A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DD316B741;
	Tue,  6 Aug 2024 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iyr/c8Vl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155D18D623
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722954044; cv=none; b=g2CYLhmI42UhEqHPpFxh+aIiwrOJpbsUagpRRHQdIvB9ZHI62elFQelHzl+XHqne6F1qJ/8ZIlmdMcbqKYMB7qyqGCA7BS0wFfJ0foSR7tGZdljFgqIEv2lPjBmP6xHSYIuxirePFVEk92JKWSdEtOGQzi1igdvkOPBfPFuPkyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722954044; c=relaxed/simple;
	bh=VJcYVzWxs+vXvSSDlJo4H6o0JJ8oED4u3PXvLG5sW04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RgahzgIXK/Edet5KHjE20S+QjGei4awPmaKJWmRXvC+Yo7pOupm4aHx3gy3TMGbBQ0Ia00m+SmN3bpFh99iZudvwzDwAR0K/OAhKTbyYW2UwsvBwg4aUxiMPH5l20EjYEsZhB4ObekXRj6TThUBPS69EhIzo7YS09woDOJlQ2a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iyr/c8Vl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=eHozqRtR+0XFHu
	NKYIsT3ljFRBGekEofoPaAeRrHhLQ=; b=iyr/c8VlGvrICgPo/Rn9GYAggsYBSu
	JpeiJNQsC2KehRId9/vi15sVBdue2w4OFZVT80ozZv/XJYniSX87pRic5v/kjH7o
	Cfl8ukf7sB1T5E+vD/JgkX4pgsGIL3pt57QGpHjgbILYr8cG5ekToX+JTe9NFAQI
	nlKGMlvDmn3kJBBWkDur4mID2ElmQOcFibKzPy1nxcxLchFdWAlaa7wKSttqwWSF
	/lcY5xYVUcJbdsSoHxw/BiUBOTAD0JRrKfCI096OLQOF/8EruHgtXaJoxn8kthJX
	SPpoxf1rD6Zyy+bpyoufu/j6Jbv8wCjaOGgwzJ6wM3PVhuV3r17aDA+Q==
Received: (qmail 249145 invoked from network); 6 Aug 2024 16:20:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 16:20:36 +0200
X-UD-Smtp-Session: l3s3148p1@NoZHfwQfDoYgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/3] i2c: testunit: add rep_start test and rework versioning
Date: Tue,  6 Aug 2024 16:20:29 +0200
Message-ID: <20240806142033.2697-1-wsa+renesas@sang-engineering.com>
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
transfer, patch 2. Also, the versioning has been improved, patch 3.
Patch 1 makes the state machine a little easiert to follow.

The patches are based on i2c/for-current + a naming fix[1] and has been
tested on a Renesas Lager board (R-Car H2) and a Renesas Falcon board
(R-Car V3U).

Looking forward to comments. Once we got this in, I will send out the
SMBusAlert additions. They do work already, they just need some
documentation.

Happy hacking!

[1] https://lore.kernel.org/r/20240806113532.32679-2-wsa+renesas@sang-engineering.com


Wolfram Sang (3):
  i2c: testunit: sort case blocks
  i2c: testunit: add command to support versioning and test rep_start
  i2c: testunit: return current command on read messages

 Documentation/i2c/slave-testunit-backend.rst | 50 ++++++++++++++++++--
 drivers/i2c/i2c-slave-testunit.c             | 43 ++++++++++++-----
 2 files changed, 77 insertions(+), 16 deletions(-)

-- 
2.43.0


