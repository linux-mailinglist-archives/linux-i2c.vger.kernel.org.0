Return-Path: <linux-i2c+bounces-8135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D829D5A70
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A3F52822F0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E467818C029;
	Fri, 22 Nov 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Btt7fQQQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93218A6CC;
	Fri, 22 Nov 2024 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261939; cv=none; b=mw5tCxtPSsHv/cy61zWOr1eGHkQXWPEV3itRtToJ6krMJIEKiS4LzA0K3elBIAwvMb54qE2OR2T/MpHx+TvY5Jaiv/o/de0EAO4cMw1ZU288s6aizK2sTYeF3elXWjsfOT8lWqjAybEYAItVC98v5wIUqithr4kQ4sCXDWWdmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261939; c=relaxed/simple;
	bh=edVSjzhoWUDOtk1q0JzE9bRTYE8O3Hs6haOSqgo0/KM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rjgas4ArBXhvk68yY/h9Ni5cZHL6MFAxb2T+JQ2eCdlRZwpya8PqimAEQ2GLz0upk7ipEYFcRBfOqmf71zcXw5pODXI3hAUv1N+4YX2fntfZMCDlf/tThjSqXAyEHV1sB1O22g4RRqMVyR0yla9DmXckRdG1W1ldWGaSJkayvV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Btt7fQQQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D35AE10B9;
	Fri, 22 Nov 2024 08:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732261913;
	bh=edVSjzhoWUDOtk1q0JzE9bRTYE8O3Hs6haOSqgo0/KM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Btt7fQQQ5ewajSSXr6hl/RT7nrckpdEUn6LFr82a6yzX3PshkBeKwVaVCwTJeM2Jq
	 37hJx0yKjUxEEadnGPPGEdtudUrZYzDvoTbGClQyIeQhSn0eLKz7bHm4ks2vochQRc
	 78dYNQ/m+La5G6DE3pW2BAMtHL2INZ507+LDaNxI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 09:51:40 +0200
Subject: [PATCH 3/3] i2c: atr: Fix client detach
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v1-3-62c51ce790be@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
In-Reply-To: <20241122-i2c-atr-fixes-v1-0-62c51ce790be@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1208;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=y4zkY/aSb+oAW8wi1OZRGAkS9LvBKaab9mHJC6eDWH8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQDgpCjjz9QsI4cov2rGk+C52uzZuwgD5A6P6v
 EZQAg+wr/KJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0A4KQAKCRD6PaqMvJYe
 9af6EACHSWuHCtqDfVi0cQmEVDbXaLAHMAueafBaeYWAN9hNc03RnXuG71yuFrBQi0Hsr8pzyog
 DFe2m9PfxXj/Dda5ONKOnaQT1ueiptUpDBlZfeNZ6o3l7uYuBPg+JGu62GcxK2XoP5ZgiuGB1Id
 NtA38q+QL/D9Z9bCkNwOZ7RRoP41Gj3iagNZ1LHNE1heHn3ktMZixR8D5dsN9tN/xqxUuNxl5x8
 y31E/b5Gfy6lgaxCg9c59gI87byD2LD1E575FW8CReWNFTZj0Zj4NmsmnlN5fqnIdEB3+7pcaMt
 LGwkHxbhoJki0C6IqE/Xgevz5xyFnp8dDdhBJGJGmMMMJjEhmJ9v2LjTNIgY7hbCsWFNvhjL2zJ
 4lXssQTPdnpB0K5mApoIRqFbsyje6lG39tRhYVuJlz5JQLWveviTDuItXl3sGZ4z4gs9tB9zrwW
 oTaG1wr0HV7ew8+iq3Wku175xoT83l+dkgELC2a1p68W+/XOS/ResVjvvAf1LVSEikLzuBAF7jc
 J4oJpOkb3ajy55yYbYWfZUUCFsW1XdINm7/9MT7HMGHfbYoOtdbeU/PjsyR7HHO1AVTQ2aJyyir
 V42yHWnAjuaijltC/q/TXfUer3Jxje8KgdPgnoqvazLIMNT8na16D6MA4W+DYjCb3Z9RiwosNa8
 XiTMR7GBY/mIY3w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

i2c-atr catches the BUS_NOTIFY_DEL_DEVICE event on the bus and removes
the translation by calling i2c_atr_detach_client().

However, BUS_NOTIFY_DEL_DEVICE happens when the device is about to be
removed from this bus, i.e. before removal, and thus before calling
.remove() on the driver. If the driver happens to do any i2c
transactions in its remove(), they will fail.

Fix this by catching BUS_NOTIFY_REMOVED_DEVICE instead, thus removing
the translation only after the device is actually removed.

Fixes: a076a860acae ("media: i2c: add I2C Address Translator (ATR) support")
Cc: stable@vger.kernel.org
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/i2c/i2c-atr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 9bdbd94b5054..2ce12d42c24f 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -406,7 +406,7 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
 				dev_name(dev), ret);
 		break;
 
-	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_REMOVED_DEVICE:
 		i2c_atr_detach_client(client->adapter, client);
 		break;
 

-- 
2.43.0


