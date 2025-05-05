Return-Path: <linux-i2c+bounces-10808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BEAAB973
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 08:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1CA4460E45
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 06:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D7D2857F0;
	Tue,  6 May 2025 04:02:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 20.mo582.mail-out.ovh.net (20.mo582.mail-out.ovh.net [178.32.124.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03D22DBB05
	for <linux-i2c@vger.kernel.org>; Tue,  6 May 2025 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.124.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746500026; cv=none; b=bkYYeH7ek2zRdlq/gG8nglMa5k8AFRO2cpuAqxSwJq+CRwGizZt/b3bqo2NYSpT6UNgQd0DCMdbwdMbw8T2eBYWdgMidcRQQ0ZTC1bp7QFlQnngfOEp/+61In+CsXHBmQPEjcIU4/YEVm4Yux1RAsS1R6SCW2WQvdwWdGejfAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746500026; c=relaxed/simple;
	bh=cgSjeKSfHHYoUxmWYtpLOxGtmWkqUZ68W+4E1DITWpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzd27yzxmsCJ06d/SpHOSD6Fqv3ZmXcjiz16M+K2m48aAY+ayU2igHv79rjKFFapRJmoppX3d0QPWr+ebBwH8MA+TWsQNmPV7UOW+JfuoI7/TDVS5KDkYzUVdxOJ7OkTRTvOi46nCCAKGMooXFpJjDOFiKvoL3J0xdzbQS3EXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.124.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.2.206])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4Zry6x6sLmz1RpH
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 23:15:21 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cbrd8 (unknown [10.110.113.153])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8E0FA1FE5C;
	Mon,  5 May 2025 23:15:21 +0000 (UTC)
Received: from etezian.org ([37.59.142.105])
	by ghost-submission-5b5ff79f4f-cbrd8 with ESMTPSA
	id bGMJGolGGWg53AAA8w/7vQ
	(envelope-from <andi@etezian.org>); Mon, 05 May 2025 23:15:21 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-105G006cfc46cdc-f827-4b0f-b2a5-2e291018f2d6,
                    747E7ACD920FD474922C684FCFDFE7BAD88F7365) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: Remove entry for Seth Heasley
Date: Tue,  6 May 2025 01:15:11 +0200
Message-ID: <20250505231511.3175151-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5082593658242599444
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedvfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht

Seth's mails bounce back, remove his maintainership.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

I had a chat with Seth before and he said that he had no
intention in continuing on his role as maintainer of the ismt
driver.

Andi

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..70229ed0c55a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11235,7 +11235,6 @@ S:	Maintained
 F:	drivers/i2c/busses/i2c-cht-wc.c
 
 I2C/SMBUS ISMT DRIVER
-M:	Seth Heasley <seth.heasley@intel.com>
 M:	Neil Horman <nhorman@tuxdriver.com>
 L:	linux-i2c@vger.kernel.org
 F:	Documentation/i2c/busses/i2c-ismt.rst
-- 
2.49.0


