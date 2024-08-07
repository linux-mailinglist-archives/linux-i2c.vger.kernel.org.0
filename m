Return-Path: <linux-i2c+bounces-5196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB594A6FA
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 13:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7660D1C21603
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 11:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28761E2122;
	Wed,  7 Aug 2024 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VRCBunwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D21C2311
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723030125; cv=none; b=dZQVIFWZxA64ITs3/NW2fCfpTptXDW/0H0hWue8fv3xMg+kddHyGaV3en/xZV3LCYWNMsdSO7JJZopXzgtdaRzPgPjurscN74SPn5gSo4PtboirNHJK61wQKiVbRGT+V/Mq+Fubx9KsvPOriraOBKOTitwLJK6NcOuwZSvUdh9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723030125; c=relaxed/simple;
	bh=025qB3F29riRHsCPGjtMEexM8bYmt7U6BFAVrnCl8+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G4psAmcaxCp37Kp7Fbdauvdr9fJNqaCKN8hN/9frFuyEP59pfUPhLt1XPa6sbU7Sgyvex10jsQRe39nf9n9pCKQP9JpJYhznOmdkfapSz4PNTAy0J2Hkf6AOjtkf8XrrKFXjuZ//fwwZTlIbYrW3s0KdtsKe9r1sTqzIkz6wT5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VRCBunwT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=uqfbPSg29r9Tau
	yUPZ06JogI6+iUEi+dzFUiSUjVyIY=; b=VRCBunwTYEevifXwtBH6A84YeI03iM
	ioma5pUvaC8mNyOyVt3BWBZ40bYnYZK1JJJ+boZVQEWpWuMLXtXzsLc2W6o1pe8i
	u4e7bZ3yIzMiHIpmBIHuMK4SqYrD7irPyfTb5LeP+JcLUFoPTA3rtOfl28B91bTJ
	7tnotO9uH/IK3En7+GwIPLg/1uLUiekvbtXM3NJv/gkhscM6ROvPM5ZZobwYV2RM
	nwE3e47fqhPY/9J0Bh5c8x/2it28+nYkprdYjGGuyrNvqsgFjNTiH1sWP818eWD1
	P8lyxmOkj3qyU5fbmBfNk9ug9ySfECICF5zo6yNYZ4Ew6S0XlVtTNywA==
Received: (qmail 536413 invoked from network); 7 Aug 2024 13:28:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 13:28:40 +0200
X-UD-Smtp-Session: l3s3148p1@qLhDNhYfTM0gAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org,
	Jean Delvare <jdelvare@suse.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools v2] README: ask for DCO in contributions
Date: Wed,  7 Aug 2024 13:24:33 +0200
Message-ID: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some documentation we can point contributors to wrt. DCO.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v1:
*	s/i2x/i2c/

@Jean: do you agree to asking for DCOs in i2c-tools? Also, together with
the 'i2ctransfer' improvements I just sent out, I think we could aim for
a 4.4 release soon, or? It's been 3 years and the updates are small but
still neat, I think.


 README | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/README b/README
index fb7bd03..2d342e5 100644
--- a/README
+++ b/README
@@ -106,3 +106,11 @@ with Cc to the current maintainer:
   Jean Delvare <jdelvare@suse.de>
 For additional information about this list, see:
   http://vger.kernel.org/vger-lists.html#linux-i2c
+
+CONTRIBUTIONS
+-------------
+
+Contributions are very welcome. Please send them to the linux-i2c mailing list
+mentioned above. Make sure they include a 'Developer's certificate of origin'
+as used for the Linux Kernel and described here:
+  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
-- 
2.43.0


