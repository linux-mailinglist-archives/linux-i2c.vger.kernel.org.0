Return-Path: <linux-i2c+bounces-4023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D39085D3
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38D75B23DA1
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 08:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136B51850B1;
	Fri, 14 Jun 2024 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ByD4G24s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84F183094
	for <linux-i2c@vger.kernel.org>; Fri, 14 Jun 2024 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352774; cv=none; b=N8spb3JA2Zjxyck+/R4kGCiqLWFrIG+UIbulTsEqWsqrrXMbX4FHOZS52l+odlt0V5TPlAnWZ7S+GZRxsreOwrSHbex6QmebUf1LhRNyLK2RzPwHn4z5Gi5kfczP4xZuZrrm1zi1XTCgTzU2OwAbH/0KAL2ipIsBwUiX3AVAK1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352774; c=relaxed/simple;
	bh=XhzeoMaRN/6jo3S8xUdtyMUKaNt8zhwUmh3qU0Jhlcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bYrES8vzawE290bkX3IcBVT5R1ImsXF3rvBdeF93h8YToDzvz4IWWzIRtmobv8WB1QmjNhb/Ghji1mB3zA5nE0qR3RGwOAszF0qVumNeFCBjV7M3+IMFFGfVcd+E7iz6YdUm3Eft9DoVCO33fLv0gEgdrgUcFF0Bl969+tepqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ByD4G24s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=k1; bh=g
	pxaUrsENm6FiIcetDaXvTR6fi8XFR89MzCUZTB7YZs=; b=ByD4G24sgqSreVT9J
	wglnj+uAiZmxu+QI7VuSFsTRMsJ14Vk4P6IO7R8HbFgIbfqUIKZ3mxgL2LHb1KYx
	TR4+hm8ab/xRYLQr4KGmiq1Rn64SnHLqNEedtEjDN9nnJ5tu1fJ2ie5FtyikYseZ
	kZNozCJkBFHSwBOKNSuU/ieXC78XCkhpb/ANByXN3hxP+U7eXxqszSVawlV04xyE
	AHiFA4W6VM/J8PBgNC5bgDpnng4i4mM8ybT0gFmXEIdcjHnWlo+1DvIwtTvc1Yo1
	WOgZeLxej3Lu4fYl+PHt4h1t5j6nmYoZswQo3s6O9pCsGER8jr0uc3+RuZH6Th6h
	V4jOw==
Received: (qmail 1438057 invoked from network); 14 Jun 2024 10:12:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 10:12:48 +0200
X-UD-Smtp-Session: l3s3148p1@9NZSLtUa8oEgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 0/6] docs: i2c: summary: update and use inclusive wording
Date: Fri, 14 Jun 2024 10:12:38 +0200
Message-ID: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The main motivation for this series is patch 4: switching to
"controller/master" when defining the I2C terminology. This sets the
base for further improvements to inclusive language within the Linux
Kernel. The other patches are improvements found on the way.

Changes since v2:
* improve patch 6 to be more clear wrt to the synonyms 'adapter/client'
* fix the faulty 'drivers/media/gpio' path
* slight rewording in patches 4 and 5

Wolfram Sang (6):
  docs: i2c: summary: start sentences consistently.
  docs: i2c: summary: update I2C specification link
  docs: i2c: summary: update speed mode description
  docs: i2c: summary: document use of inclusive language
  docs: i2c: summary: document 'local' and 'remote' targets
  docs: i2c: summary: be clearer with 'controller/target' and
    'adapter/client' pairs

 Documentation/i2c/i2c_bus.svg | 15 +++----
 Documentation/i2c/summary.rst | 79 ++++++++++++++++++++++-------------
 2 files changed, 58 insertions(+), 36 deletions(-)

-- 
2.43.0


