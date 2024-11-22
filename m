Return-Path: <linux-i2c+bounces-8134-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677F9D5A6F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6AD2B228CA
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A7118A6C3;
	Fri, 22 Nov 2024 07:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YJptDc2L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C76F18A6DC;
	Fri, 22 Nov 2024 07:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261939; cv=none; b=bv9uH4D36EbS95GpWmjUIilitpx/i7BRgUi5DnUCRtN8OsojGjYZ6xIb5bDfuL5GtHdzmB2CVesKeojW9G+9eSvtwtpTpMaEQMebBVTj+1au6kwr8+DBKEQgehWB+/Qqc8pFcqgG9SYq8nX1NmFTLcoMXKFIBy7uDZu23Xg5jDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261939; c=relaxed/simple;
	bh=qMne2asV7Q0TXeki4gIxvhn9LMPemEYp0iLpLeUbjY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCGpnG1o4MO+ESlH3V13/YvkSs//et8bQwMQC5ZqlJRKFFvWqchDjuJvwm5N2xmDa7J93WIdmHeXSzVSXrcCLOPLHPVyb1A2W6y4KFzK7JxUiy29XZ9BaFG29wcjQT48Fm/571xKNt/vwQJCaDJNpo6D3E8mWl+HX2aq4gT/5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YJptDc2L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23992F86;
	Fri, 22 Nov 2024 08:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732261912;
	bh=qMne2asV7Q0TXeki4gIxvhn9LMPemEYp0iLpLeUbjY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YJptDc2LCl/pg6IA5bY6BcYFrB5ryna5gagl+4qrWfQA+iK3dciahTt6jdBy7alLS
	 PKRDdyFZ9NyKui3qjsZA3nFaL3/kUulBmzJSvPvZmtDSru5e/sxt/YwgP7prL4Xm4F
	 6PBt7+mdnWgVM4ut59IngW0KMJzYZU+uXtwh1pR0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 22 Nov 2024 09:51:39 +0200
Subject: [PATCH 2/3] i2c: atr: Fix lockdep for nested ATRs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-i2c-atr-fixes-v1-2-62c51ce790be@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=X+j1k6E0LQY9S62/kgsLP2Vw7AUmIiJT8pkvs76+S60=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnQDgoZlON6xzLbQm9JcuXZn1w3F8A8TpDzSlJ/
 FHRDzkhmAqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ0A4KAAKCRD6PaqMvJYe
 9UAMD/9eTniacDdMLDLKjk6fIwo6qrtzPNlaU02TNyfMCRjWWeKQaVwUuVlYnW9JAwk89R6rdvD
 IvZM8ziqILKVjL1GS8oMzeMUrsqvGjlOLTgwFPXdAWu/58eZCXlV7AtI6MtDJN6S3U9jfjt3pbB
 cHKsTqTjpnc2/AXsVEwWDkQKImoLaXjc2EvQ3+zaG3KVQMwAl8jbjLc/oDgpFqosHOuRdqTMwK+
 bTRG6SCAV5l+uHrYFAQDAkep1asgziGop9ZfVsMULsn/zBUz3kO33AXFgwMjoODHkoC21brY5rU
 2ZQn1g0D7FK6m3AEeDf6UuL/OmUtdEoxZwFY5GiK4+FAPIaBZzKrNyVO+Yz4c56r6zTA2Mb3y4X
 nqNbfOAp3Pie5JIwLy1OIdr7H2Y9CMuESnJozMm5+je1YxuR/RfunhsS9YU18OBzkdDtL2UARiB
 I5AXi2GXIxoePLDVi5FjDHsd+QRQp4J7pe0s9hJ97yr5cN1sgP/pbHHVhkvuAypgKxtbWxIL/UG
 obWuWcGesuZfA6cKXrTLOK8zVsbhlzPiuIfrUsBTnow4/QI01o7BtTseNjUJAwy/oV8uzl+62f7
 PfigZ8AQiPLyWAUQU4lVlsEKPJrjj4N1VEu0g9NbsJZBaOyfJRf+PoeyDf7+o4OVszP37Hqw9f6
 SdKFdcYvaM4sxdg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

When we have an ATR, and another ATR as a subdevice of the first ATR,
we get lockdep warnings for the i2c_atr.lock and
i2c_atr_chan.orig_addrs_lock. This is because lockdep uses a static key
for the locks, and doesn't see the locks of the separate ATR instances
as separate.

Fix this by generating a dynamic lock key per lock instance.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/i2c/i2c-atr.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index ef5adafa9bf4..9bdbd94b5054 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -54,6 +54,7 @@ struct i2c_atr_chan {
 
 	/* Lock orig_addrs during xfer */
 	struct mutex orig_addrs_lock;
+	struct lock_class_key orig_addrs_lock_key;
 	u16 *orig_addrs;
 	unsigned int orig_addrs_size;
 };
@@ -84,6 +85,7 @@ struct i2c_atr {
 	struct i2c_algorithm algo;
 	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
 	struct mutex lock;
+	struct lock_class_key lock_key;
 	int max_adapters;
 
 	size_t num_aliases;
@@ -505,7 +507,10 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	if (!atr)
 		return ERR_PTR(-ENOMEM);
 
+	lockdep_register_key(&atr->lock_key);
 	mutex_init(&atr->lock);
+	lockdep_set_class(&atr->lock, &atr->lock_key);
+
 	spin_lock_init(&atr->alias_mask_lock);
 
 	atr->parent = parent;
@@ -535,6 +540,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 	kfree(atr->aliases);
 err_destroy_mutex:
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 
 	return ERR_PTR(ret);
@@ -552,6 +558,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 	bitmap_free(atr->alias_use_mask);
 	kfree(atr->aliases);
 	mutex_destroy(&atr->lock);
+	lockdep_unregister_key(&atr->lock_key);
 	kfree(atr);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
@@ -586,7 +593,9 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	chan->atr = atr;
 	chan->chan_id = chan_id;
 	INIT_LIST_HEAD(&chan->alias_list);
+	lockdep_register_key(&chan->orig_addrs_lock_key);
 	mutex_init(&chan->orig_addrs_lock);
+	lockdep_set_class(&chan->orig_addrs_lock, &chan->orig_addrs_lock_key);
 
 	snprintf(chan->adap.name, sizeof(chan->adap.name), "i2c-%d-atr-%d",
 		 i2c_adapter_id(parent), chan_id);
@@ -646,6 +655,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 err_fwnode_put:
 	fwnode_handle_put(dev_fwnode(&chan->adap.dev));
 	mutex_destroy(&chan->orig_addrs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
 	kfree(chan);
 	return ret;
 }
@@ -679,6 +689,7 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 
 	fwnode_handle_put(fwnode);
 	mutex_destroy(&chan->orig_addrs_lock);
+	lockdep_unregister_key(&chan->orig_addrs_lock_key);
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }

-- 
2.43.0


