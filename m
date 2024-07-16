Return-Path: <linux-i2c+bounces-4989-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 032359321F0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE8A1F22C11
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A5217B4E9;
	Tue, 16 Jul 2024 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e58g319u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B671742
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 08:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119006; cv=none; b=X0LxyB5r1gWxzesNrcoyayZo8xmqtxwBmIXnsM6da56yuhk98AFKg6MuO+LAvvmF5NOfaxMylhERKEVWHcHZZHXl7v1NCwilHTY0GiW2T2zgeRgoTA1nZr8m+OnxXpkEBb1LNH7D4H6EvWFmKyYj84WwmxkXbNyGBcd3dd28L6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119006; c=relaxed/simple;
	bh=f/iaYGBPw3u7SHty7kiGMaLXWBNa80JFr6I505swO+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ev/kUy3XuVQ/SSor9YogKfeM3CtR2fPxtrKcZlJ9JHAVzEPU8lx/TnDUou9isNMpArRuM4ZZXIHHxaAAfy136CrXNsha1W98KCptdSFsb7/YJrzobZ5QEQYeM0hIrFyGMgcPsk0HFwL4hnwjHHQRYfVcbKaNI6+T+H1ycBdkJu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e58g319u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hOwg0SGCHaYI5z
	zGEcCR6Wdz09cZeMJeZEzPr3j/Jpw=; b=e58g319u89A/Ldf2VbDvoUCE2vXuFg
	MB59pRSRmxQGC9Nb3hDaOsjHlrC0W32d4761ZGUinTc38vXRdL2CIZzfneLFLVJJ
	Oe7QZZ5I79BVp1G5Y5X52BHy+GsEO74PJBGf4Rb8RXb/+859CzI/vrD4njL07Q1x
	s5fzBYeetmxhrsNWdFvio06jvVr1z8itvfjUOOEX2Z24VAP/mzisF3VaL1iEXlK+
	77VtPzfNQNwJiiyl6Kh9iNtqhOwwpT83/AITH8/hJ4nbD29evNAnq+wmDVKedqgn
	c0AgjJrWFqcUFSOd6dL/TPt54RvoDMuZZVixkNKbgqs44LkeuYG+Td+g==
Received: (qmail 153587 invoked from network); 16 Jul 2024 10:36:33 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2024 10:36:33 +0200
X-UD-Smtp-Session: l3s3148p1@yW4wPlkdZ3ptKPND
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: header: improve description of i2c_algorithm
Date: Tue, 16 Jul 2024 10:36:23 +0200
Message-ID: <20240716083623.7737-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are two patches to remove bitrot from explanation of struct
i2c_algorithm and to ease understanding.

Based on my i2c/for-mergewindow branch.


Wolfram Sang (2):
  i2c: header: remove unneeded stuff regarding i2c_algorithm
  i2c: header: improve kdoc for i2c_algorithm

 include/linux/i2c.h | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.43.0


