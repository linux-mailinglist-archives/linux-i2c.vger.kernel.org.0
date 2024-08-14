Return-Path: <linux-i2c+bounces-5400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D357C9521F1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAAAE1C2135F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC191BD4EF;
	Wed, 14 Aug 2024 18:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ezrR7SeF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936F1B32A6
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723659736; cv=none; b=mAFll5iUtu96gUV/R3yYwieZXkOekNpJYVT1YscIx5vWA9OSGkv8Mwyo/jDKzC97F8z+qXLYVKv15BKfswYiLNjdvZAiwDt4UBOWNS08gloiJKdbCyuCfnFZRBXf4ylv4IQqLZUeJ3wj+5/1G9a8uhEq6+qWbW/n7izVgvfSNMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723659736; c=relaxed/simple;
	bh=c6OQZefza+adnkSkZ5sGm1MjzvG3yjQNLK1qIleCkjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bee2T7c1X4+YFzOnfZ+b41MDrZbKXo+SaB+aR5ob1NMvjR5uX6hKZkvJh3jkill8YYtDG0C13oln9I/aJB7ZR6KEaKXD6LHhJOJaHkQhuKohED8ErjtVhfj4M00zYadXUxT7D5lsDNWWuZId5NK/OPQq76IMV4h3t/qopAfA9cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ezrR7SeF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=SK8IexRvAKlKnh
	4m7J442KZI4xYCyLd87gulEF1hTLs=; b=ezrR7SeFU35ZwRDBF5nknfNlMxOsBq
	1UqV0Bn0VVUSelXOME61VO7lkFcyaXpqX+Rrp7l3fNMneC1KdW9YCPuzTRZjkyBM
	NaH1/s5TbzEoPAm4eoV4HzG24Mqe4vtM6FdwiApUCFssDvwkvHc9ZhKMU2+tlq9w
	Oj3do4L/7q3YxboM0K5PkZu7ernYSufBegR5pFuY/NeHSAI09RyN+vqlBzf2TOgN
	2tz1apsKX3gu3JsZlsfyA136vMoh0n/xEq0dvycdUktfcVIqXP7qN0JTePA5cUQE
	AeaT5AxnwaQQqSvcBEy9tVz3PItMVo3rlqvYDsZH5S1i9369Tcd/Egmw==
Received: (qmail 2065449 invoked from network); 14 Aug 2024 20:22:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:22:11 +0200
X-UD-Smtp-Session: l3s3148p1@c2oDzqgfcrYgAQnoAHipAGJRnFk/ZdC8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 0/3] i2c: testunit: let it trigger SMBusAlerts
Date: Wed, 14 Aug 2024 20:22:06 +0200
Message-ID: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finally, after all the prerequisites, here is now the series to let the
testunit trigger SMBusAlerts. First two patches are preparations, third
one is the real thing.

The patches are based on i2c/for-next and have been tested on a Renesas
Lager board (R-Car H2) and a Renesas Falcon board (R-Car V3U).

Next and final step is to update/clarify DT bindings so GPIOs are
recognized as custom SMBALERT# pins. Code is all there already.

Looking forward to comments!


Wolfram Sang (3):
  i2c: testunit: describe fwnode based instantiation
  i2c: testunit: move code to avoid a forward declaration
  i2c: testunit: add SMBusAlert trigger

 Documentation/i2c/slave-testunit-backend.rst |  60 +++++++++
 drivers/i2c/i2c-slave-testunit.c             | 123 ++++++++++++++-----
 2 files changed, 151 insertions(+), 32 deletions(-)

-- 
2.43.0


