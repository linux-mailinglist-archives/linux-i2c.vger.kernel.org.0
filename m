Return-Path: <linux-i2c+bounces-4964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B592F9D2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 14:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280E21F2322F
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 12:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0982215E5B5;
	Fri, 12 Jul 2024 12:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZOO43gpC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378216CD13
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785673; cv=none; b=nUQP9TbJ67uSNccQ2pm5RqKj92JpM1BPAFEi9qywdP8v1hyp5Q/5TvFBZHd4ADYcmkgrErKuBaNcOgsd0SB39k2MzBCrjBSyxgjS79NonAr0q8b8+rsA50y3I/IdJHW0Of/FprF52nvJyFaFG4zotVFoZN4trU3vLXdxy0e+CWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785673; c=relaxed/simple;
	bh=uLiNU7ShxMJ2CqMbzJMTtjMmcgBj4Phnv/Wc5+odGsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nhdP+ZT2K36m7SsEpuix48j7jj0wPbZBZVgsEwg+Hf1Y3QSdCyMoRgHUp3I/0VatJkj9UJ/wsbHZqR1COLzzoc0577Di6VpylNlkWcsjOH1IPlg2k7LaCLaou9qABWRYv1fPPWcvu+V/71Uv7Ebey3Xf3Ra/Z3xkZIDg83J5L3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZOO43gpC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=U2vP5LERhTNzUq
	Klh2w5cnLhN8oUQLgK6MVisBkC0gw=; b=ZOO43gpCLH65QQT50YxmdvLOj3ojn5
	jcAAwKO+mVdOsKTn5ZlfpYyXlCWvWkuqeFiwk+/KRBvFRLQiV0ybSleowDfZcrYN
	WHVI5me8ZyG7D/yrQiUkP67DwfZEc9QZEuRAH3hW1fmxn+V8YdYlFzquxt5svfLA
	/YERAQ68UKr3pk/W8uiDezT5QcHSltlx73GXfLHYrVIqowYLI3XQG+DO5kdWgvU4
	LkAmgFlqQK8ifXENDYrPtCYe8BWPiKKiz1iO05yq7eYtmgD+Mf59e4xeYj8d/OJw
	BKeNEOTzyUE5NjZdAgZ7R+QdOpz7IxSinFzA8f9QXjjbV8suhHRgepEg==
Received: (qmail 1147608 invoked from network); 12 Jul 2024 14:01:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 14:01:03 +0200
X-UD-Smtp-Session: l3s3148p1@hwArogsdme5ehhtW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools] README: ask for DCO in contributions
Date: Fri, 12 Jul 2024 14:00:53 +0200
Message-ID: <20240712120053.4076-1-wsa+renesas@sang-engineering.com>
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
 README | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/README b/README
index fb7bd03..98b4ae4 100644
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
+Contributions are very welcome. Please send them to the linux-i2x mailing list
+mentioned above. Make sure they include a 'Developer's certificate of origin'
+as used for the Linux Kernel and described here:
+  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
-- 
2.43.0


