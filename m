Return-Path: <linux-i2c+bounces-8145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 062599D5EC2
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35D41F235E3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969B41DE8B6;
	Fri, 22 Nov 2024 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aE6N5Aaw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D751ABEB0;
	Fri, 22 Nov 2024 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278407; cv=none; b=oMdldeAjVj+s6DmPHvq9I1ixqfmYInLClpbTl69VFfeBRscSFl2GOu9VGxSPR3UT0gKfQ9pZ2aYic06sjoCrk5euRJbhCCG4K+HCapI0tJu4yrYxnIazBb7FQDzkRlPNpHBfLpdhqfna9pchXS7E2r+t+KWujTxZ+TzzWt2GJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278407; c=relaxed/simple;
	bh=5OIR8lomOsDhd2IzlIS7HBTEiwHrDrY4r4nYsF6PaSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NfHmdR+ZsGEpIdlfKcwYld5pFuJ5UkJ2NczUkOpRIU+wU/ef3baZN08dYcTqvZN7QQWLwQk9A2Lk45WibRb2zYFw5FuVvrq20ZZqqcQHk1eEe13oBDMR8fZ79Bo9glw8JZKcndu45uCc3jCnH9E0Htt2tlysC5IgWSsggUkOMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aE6N5Aaw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9513514;
	Fri, 22 Nov 2024 13:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732278378;
	bh=5OIR8lomOsDhd2IzlIS7HBTEiwHrDrY4r4nYsF6PaSc=;
	h=From:Subject:Date:To:Cc:From;
	b=aE6N5Aawsnyz3JKdP8xzQ289zEtyWaZ6Wlf6TSfJE0+yKHD4tO11e9b4S3VE3Z8tM
	 Fl0tTpN8lLghVaw2/PLC/q643bQtze3xYWvaMFVPD3xtA6q31xDxpcEJ+5Zd+Knv6O
	 oVf0gPgi/9XWYGYRJ0oQQ8xeKgQzNR7UO4uiRcAk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 0/3] i2c: atr: A few i2c-atr fixes
Date: Fri, 22 Nov 2024 14:26:17 +0200
Message-Id: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGl4QGcC/12MQQrCMBBFr1Jm7UhmMJW68h7SRZpM7SxMJClFK
 b27seDG5fuf91YoklUKXJoVsixaNMUKfGjATy7eBTVUBjZ8ImJCZY9uzjjqSwq2wfLQjXY0nqA
 6zyz7UZVbX3nSMqf83vMLfddfif9KC6HBlr0lL+fODHLVIK6kOCSXw9GnB/Tbtn0Ae9gFl7EAA
 AA=
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Wolfram Sang <wsa@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Cosmin Tanislav <demonsingur@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5OIR8lomOsDhd2IzlIS7HBTEiwHrDrY4r4nYsF6PaSc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQHh4vEGwa+xBzSPxkJL53B78OchhZzT1K3pXv
 59xVew34oqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0B4eAAKCRD6PaqMvJYe
 9Qu2D/9Dhl0902HxJ0No1PXIZQjP/wYb3WLxJ5wsSgU59ErU5QygpovZ3tGfyG4kqRDbcszs0jM
 fcFbcHShAxVR/WXhZnurWmuU1qyYL3lDO4lmodD2DumxdgchVId42cu01QXmqH8fz5DAz/b3s1Z
 g7BmYquuB+Rkj2HWHlVB+3Tl3KbCp9aqPcURh4ZY2oelemBswSoEF+HIJT7P2AwCwGDbxPSX/AO
 PJ2+lZFLEOsnIgTqCQ7wn/g69bTaambplVmRcWIrJ1pNfV3wi7puXp3G0V8ZNeXOxYLYZ4SkSxd
 ZG9ASG8J4vZvKQoiNO5iBbbRFD5dGLNqZlODmdNw1TrMOADFKaAEvNsfoCRG9g6YXxJJSSfWt1U
 jztqSai9Wu8nnVpnIG3LgbaPxDu1sdaly77PwNMXuQAGWQqLg55DnNtXX66kpzTc+1nhg3juCeW
 oyP0N2nOoBo36tzqLipnxtVY0iqwTu8miYe8B8xIx/Ar7YbdJ63ASkQdSKCXCmZXiXqAupWy0Hl
 3pLe5H9oc4hxhd0f+alKMP51IZw+988OEGp1OUJbaBQW7qLH+BMj0rZVOlicRfu8One23ZJ5vZ5
 egYj++M90bollEtZ+LeDxsduL1BlG6TDYwkxt8M6sNXfsIl7igOlHnHekk8xbn3WVFuHgGR7Y6I
 Gcuw/7As69pgmhQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The last two are perhaps not strictly fixes, as they essentially add
support for nested ATRs. The first one is a fix, thus stable is in cc.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Use mutext_init_with_key()
- Rearrange the series so that the fix is the first patch
- Link to v1: https://lore.kernel.org/r/20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com

---
Cosmin Tanislav (1):
      i2c: atr: Allow unmapped addresses from nested ATRs

Tomi Valkeinen (2):
      i2c: atr: Fix client detach
      i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241121-i2c-atr-fixes-6d52b9f5f0c1

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


