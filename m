Return-Path: <linux-i2c+bounces-3941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C74901C97
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 10:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D82B22BC3
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 08:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9858757F5;
	Mon, 10 Jun 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QHAoB3qI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F22A6BFCA
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007042; cv=none; b=Urob6yfgOuPbcHFuRnE8bptNlKylPLInBVW2fwsO5Y76tMCGnq71pRwGQEpIaN/U3aodvY9s/9sPbOr+rMRb75mJ6GWqBK86LxvERd+OJCsfPXmF305U+nV3SK4waH/G52PvkysHlpu+wuRwYG06LVZ3an/WtmAYuNEmjuGg7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007042; c=relaxed/simple;
	bh=YGdvbCsehvYJDIEB2j/KPv6aBB90Bcqxnbrz1sUyXJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swT4ZYDLl/g9qSQc6awgRJXe//E6aHQxo/AgDV6uzzEK5Pff+T8px6yF9K0mTZ93G3rycKWbRCLyDPT8RBlraG2GK5GqmSF9mEFUctiY6p9jiZeeCBpOggECvgNp1ZqempZbN6VnmINO5fT1B1CPvlsD24vOR3dL73U7hnJC+ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QHAoB3qI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3JXnpw5ZxCWydN83TijKpBvVC1rCL3jaX5ZlTBQ9Tn0=; b=QHAoB3
	qIDn0AoFTW+ZRt+50jEUI+E070NwfUPUOcPZD7g2tU/+/Im9Gepibx0xjk8zbyz0
	FwFPjWeAgbpsGC0NfhdqjrUKXVB4N06lPj0ozb3G5LhWOZqKTtv6NO3ZZkl5jcZX
	nMdfLLm9k5BCaQGfnVKWAekN0x35PiRuKGGLoLByNF/MnNfz+0EuD2XlIvyBrWm6
	s/ACEkmj2HE5F2U42LYrBBCsJE0huz1IRITgeCkpf6pHya+UHmZo+wDTtq/pHk4R
	P3o6xWpaej1IkAqhKZFpQ/AgD+C9CPesJDUeTz0Q59GvR2ooipWYGjFKR/QFbh9n
	uXI4G63UIPfxDN+g==
Received: (qmail 4192533 invoked from network); 10 Jun 2024 10:10:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 10:10:30 +0200
X-UD-Smtp-Session: l3s3148p1@69q/roQa8OYgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] docs: i2c: summary: rephrase paragraph explaining the figure
Date: Mon, 10 Jun 2024 10:10:21 +0200
Message-ID: <20240610081023.8118-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'controller/target' and 'adapter/client' pairs consistently.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 203f6c9b2472..da76c787a6c5 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -60,9 +60,9 @@ Client drivers are kept in a directory specific to the feature they
 provide, for example ``drivers/media/gpio/`` for GPIO expanders and
 ``drivers/media/i2c/`` for video-related chips.
 
-For the example configuration in figure, you will need a driver for your
-I2C adapter, and drivers for your I2C devices (usually one driver for each
-device).
+For the example configuration in the figure above, you will need one adapter
+driver for the I2C controller, and client drivers for your I2C targets. Usually
+one driver for each client.
 
 Outdated terminology
 --------------------
-- 
2.43.0


