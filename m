Return-Path: <linux-i2c+bounces-8132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A93109D5A69
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569DC1F2288B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A00189B95;
	Fri, 22 Nov 2024 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IETxJzIg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5789188592;
	Fri, 22 Nov 2024 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261935; cv=none; b=F/viwGcJwjTHgGsnqHbCiZaoYAlce3vaeMS9YyfY0dShhycKMk5oCT/GStTheMrzT8R0rcu3A/uTZhVGBd4A7PeTD6aTtHvo1n5XqJ7ss1ti2i/CSgG0C0iFMYFfEFBRNb1jqIWns24FUmqhV2bhYPAeJqsXRF7W3CSZia67va8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261935; c=relaxed/simple;
	bh=mZj7FnKAVErRfFltYoWX7/xSElAseIuMvSbGoMTLv8Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SM2Lsj3OwMw/LdvtbkT4Tb7kAMDXsc8r1+WcTrJM0sOZ6AUG2vy1pQRwqSmxiUHr61yklpitcSNwqSQN27VQo5eSizTNPvH+/DxmlIVRKbMr+i4OnPimkJ5sGeiIDXHiomIe5uHHWfVFI3RNwAPOr7raeLdNMtHCpYn7lHzigDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IETxJzIg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E4164C7;
	Fri, 22 Nov 2024 08:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732261911;
	bh=mZj7FnKAVErRfFltYoWX7/xSElAseIuMvSbGoMTLv8Y=;
	h=From:Subject:Date:To:Cc:From;
	b=IETxJzIgTY1rLCUNoqQw3jBITcVOnXlynicaWje4fvbDAxozNOi8+pfX2pXNQwlfG
	 Jna1wiO7ZvtGHT4YQ0TZL0xrKJ2KrLSyUM1CuUdZJYzOstipUk9KTcIpQR/s+vQdlu
	 Nbqe0gv371zkcFs+AuPVAKvFNeb+hHaBDLee0Uuk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/3] i2c: atr: A few i2c-atr fixes
Date: Fri, 22 Nov 2024 09:51:37 +0200
Message-Id: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAk4QGcC/x3LMQqAMAxA0atIZgNNsIJeRRy0TTVLlVZEKN7d4
 vj4/AJZkkqGsSmQ5NasR6ygtgG3L3ETVF8NbLgjYkJlh8uVMOgjGXtveR2CDcYR1OdM8oe6TPP
 7fmL/rltfAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=697;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=mZj7FnKAVErRfFltYoWX7/xSElAseIuMvSbGoMTLv8Y=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQDgk26NSbVJAgKNj9VyJXXqUcYmsXrS9IvwJi
 erCi53biiKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0A4JAAKCRD6PaqMvJYe
 9RAOD/9uj+Gb7qnlHZdN/lXHC4fYLGEJFjsZyM5LAV9bbSddpR7ArivNWUxMhOhus6iUo8AGsY6
 4ZAGPporn7H6a9m5yjXm4g3ckmH0FdJYH6ulsEbozjgdGtRdNFKXZstymcNzURZF5dftlhsbjfM
 ko035LMvLEERRoBYx3o6fvb+OJYff1vNjtR0wNXXJ2xaQwEPU3aIDbm61x2S9EFFA9PVX0DN5sR
 BHUFL+DyMPkLc1YHsum9KhJ0f9NMxC+PU0Q64xvI9CqNbsx36Bxr/CJvXtcmdPWk32OEtfKnXe8
 PmFBmBiHrfB784T9R/A9wyZKlkaw2Dt9PNq+Cd+OAsbtS1SlDo62aMLo2TzmF55MK6gZ4ZxuFiJ
 JrolUKvJ7TcasN5e8MURe6zuq1xH6ahOQVTorM1b0c5BmWCjc5DOQRm3lOEuV2kx1rEQbDZr/lN
 UHAtFHUJsZuoVq/dG1kKN7J1WFlOvLLRXrmXhH0PH8991vi0ryTY6eP5bCO8mN5qBKywK8CvLKG
 snuT8L0ie4hyKGYxBE3Ku46Fq1VdciDjZH9LnMpnYUMkwjL4SVv4qGvRJCTw57OfudjetqqaI/7
 dVhr1qxPf0xxtQQ4TGcBpo7cLdHPqFPnQXK9hEwjjf7kCr4s+AVx2updrU3xnudPjk4Pv1x+wi0
 7vjOyHQCX8g1xHA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The first two are perhaps not strictly fixes, as they essentially add
support for nested ATRs. The third one is a fix, thus stable is in cc.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Cosmin Tanislav (1):
      i2c: atr: Allow unmapped addresses from nested ATRs

Tomi Valkeinen (2):
      i2c: atr: Fix lockdep for nested ATRs
      i2c: atr: Fix client detach

 drivers/i2c/i2c-atr.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241121-i2c-atr-fixes-6d52b9f5f0c1

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


