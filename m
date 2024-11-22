Return-Path: <linux-i2c+bounces-8144-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F749D5EBF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626341F23663
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766821DE88B;
	Fri, 22 Nov 2024 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aFwrKQPG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE41DE2DA;
	Fri, 22 Nov 2024 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278407; cv=none; b=GCpWpcjC7JQ9ywRjRPzcxzzizL7UsbBLt71ViD3W7aMP9MDzmZWkXNP5AGFjfwcWk81wX3X3ioeeMZVYahPmSFWBSHyZeRWrOAiA1L5sikB1cktKWGGw+xTTonTWNedG2tfn2t2dl5wtuAKg0hqLN1V+caB1YmvrS+6ab/zP7q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278407; c=relaxed/simple;
	bh=IQNWzrAH1iBv5O3e7R2BGgKJIK7yXJflYT7NUyp5gWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWgSZV4HRV8RkVOWje/c3+58xNd5ymhvEcjlXblBjsQOnVRbpcFTTLbP1J+HzThtrahErcOmLS/TvQA3F5c0z641l66cQi2ifSmmL727gpodJInrgIgdyFcJtqW560c2jfOsym/qRq8Ue6iHPDn+RyLZQOc/4G+RoSonbjCGisA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aFwrKQPG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 724D7F86;
	Fri, 22 Nov 2024 13:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732278379;
	bh=IQNWzrAH1iBv5O3e7R2BGgKJIK7yXJflYT7NUyp5gWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aFwrKQPGcFrKx1Qm7EXg2iBsQ3XewcTzrzvtteiSc0Mb/4qstKNgXe4GfHc7bjS3y
	 r0w2g519HKDI3n2WO0W3RmIP7yH63Q/fwwVzo9Z687jjKAOISweGxGxZMKKZ4c24bC
	 R8un0ys9JrfUw6pDNVpJedoHDQ8GTCoMAKXN4Dd8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 14:26:18 +0200
Subject: [PATCH v2 1/3] i2c: atr: Fix client detach
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v2-1-0acd325b6916@ideasonboard.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
In-Reply-To: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
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
 bh=Jmofkmp04A8WontjwcBtEvvZ4qvWTZniF5VxGkU4/yM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQHh7xqCe0gcDoAE6qj7Ocv+4zTEfYyAfARISQ
 DBF2DWTbFeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0B4ewAKCRD6PaqMvJYe
 9flkD/43MaZQnc3ShdbKozlEhQ1X6fPbuzKvkSM/Zj2vr6Iff3tE1e5J5/8ogrVGZJO3rp5JDo6
 NgIM+7aFCsAD8wi7WnDxP5sb5aTab/89cXoL0dxnAX+XnWcU7XpzHbjlaeNkAfdalNAh9j1xQhU
 S09EroGWVU9xWbcyUdOYuhQhm6ByNhxToZ40inu0tOExIZr7A9qjhIDLQQzgCdKGXdZq1NNK6O6
 teqG9MYulj3Zh0z5nvnn0cdaC+bZoBTyHGvBY7DvtT1uStvCPP7yHgpY/CPzHIdrIj5c/4n8wcq
 +IHZ9be/gpMsDd+5wH5v5jw4xKt0lKnTXDewjM33HpWEVlJy/b+Cdiw/2mvXILcH2Nmk5ZQykuF
 G+qFUvqrb0diWht0rK/r5EEcxrsQbKRTi8+Ly+CLJzCVNNnMQm9r2ktTDcm+amwe+wM3fZ7zf/Z
 9cyNsIpF293zVB5laUt8j9kQdFtOKMEqnaMdu9fRSr1OfBptOK0m5uRk6zsMFLM0W1QFg7nFYfq
 8/26FC9Yy4IR1mRYPs5mE5vT+KembsAWn8VacJTB5EtUI2rgQKwEt6QZCTvTQZij5iAwPsX+oOc
 rrB/mERtANq9EaDH0WxzDA7o1Omc4oqWGfWQ5Y04eAWMxN4a+LRvAIifPZ3HKn53ZmDZERlMFdt
 f5xElXnTOxj+SYA==
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
index f21475ae5921..0d54d0b5e327 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -412,7 +412,7 @@ static int i2c_atr_bus_notifier_call(struct notifier_block *nb,
 				dev_name(dev), ret);
 		break;
 
-	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_REMOVED_DEVICE:
 		i2c_atr_detach_client(client->adapter, client);
 		break;
 

-- 
2.43.0


