Return-Path: <linux-i2c+bounces-9314-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168FA297C2
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 18:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49C2A1885A06
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 17:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC656212D86;
	Wed,  5 Feb 2025 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ka3aDkIy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9582116F9;
	Wed,  5 Feb 2025 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777179; cv=none; b=CnzA8SJubCYmrEz8T98Cv5h6E/wVJF00dF8guVDtFqo6APKt38ZaHF2F2GaxvGF1WxaGBAYs8JII4bG+uo+Y1NCoQqJcbaLjfQU1hYUEwipbCsgJWQXazS5AtL3CvDoXEL6JFCajRfbg6PEIeO68g31XOSU1W7RVL29lbqr+VCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777179; c=relaxed/simple;
	bh=f+xBpNnxELe7+SSBuSSEu1KTcHFIkcpONAaBt+7Dc5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+ppbS+Sf9EmxzRgAz2UdLVMrUP1f+NrYNDmogbkJ2AAow8P3cOFFUujO3lwg7ycTsaGp7NPpQfBDZ7KK19dB6jbMYE8PRUnBD8EG5l1wXZARUQsP4BqtwPASIpMJZDxMrm7rA55wdu5ULnOhjk0wPKri0F+Vj16eqApZlr5EwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ka3aDkIy; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 04A59441E0;
	Wed,  5 Feb 2025 17:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738777170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7T4oH0F+uOVl2FeHd3gTGC+QiKM3fGP2FR0FJ8gs5E=;
	b=Ka3aDkIyywWDGCLelVFaELIkev6ncAUyRtASlgMv7zN8Esf//tPv9aG5+OGT90sNfiB7zF
	+Axf9xrjLivXqMh0wYR52lV1s9/A1aj0SR6x3wMQsFheF4v0U2eJeWinIzov6Eae07gEWA
	9bSe/OfW4bIkEpMZD1Tvq/hiV966PcjoQoflkzz6ZjkQ3t6LkMU0aG1Vw33rqmKYjW1nCa
	kYME7gwDAoaRT6x5arb3lFfeIXWsZFuoL2u6oKGNgijtlu1aRyzAFRHmVDLqVXrDS38DNd
	6bPIg1v8XCix0+SzhiTXSdDZdrp7hcyqJL9edM+Nvqq33smOs/kasMLlf3CSaQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [RFC PATCH 2/3] i2c: i2c-core-of: Move children registration in a dedicated function
Date: Wed,  5 Feb 2025 18:39:15 +0100
Message-ID: <20250205173918.600037-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205173918.600037-1-herve.codina@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegto
 hhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

of_i2c_register_devices() perform the loop for registering child devices.

In order to prepare the support for i2c bus extensions, extract this
registration loop and move it in a dedicated function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-of.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
index a6c407d36800..b4c9db137f5a 100644
--- a/drivers/i2c/i2c-core-of.c
+++ b/drivers/i2c/i2c-core-of.c
@@ -82,21 +82,15 @@ static struct i2c_client *of_i2c_register_device(struct i2c_adapter *adap,
 	return client;
 }
 
-void of_i2c_register_devices(struct i2c_adapter *adap)
+static void of_i2c_register_children(struct i2c_adapter *adap,
+				     struct device_node *bus)
 {
-	struct device_node *bus, *node;
 	struct i2c_client *client;
+	struct device_node *node;
 
-	/* Only register child devices if the adapter has a node pointer set */
-	if (!adap->dev.of_node)
-		return;
-
-	dev_dbg(&adap->dev, "of_i2c: walking child nodes\n");
-
-	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
-	if (!bus)
-		bus = of_node_get(adap->dev.of_node);
+	dev_dbg(&adap->dev, "of_i2c: walking child nodes from %pOF\n", bus);
 
+	/* Register device directly attached to this bus */
 	for_each_available_child_of_node(bus, node) {
 		if (of_node_test_and_set_flag(node, OF_POPULATED))
 			continue;
@@ -109,7 +103,21 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 			of_node_clear_flag(node, OF_POPULATED);
 		}
 	}
+}
+
+void of_i2c_register_devices(struct i2c_adapter *adap)
+{
+	struct device_node *bus;
+
+	/* Only register child devices if the adapter has a node pointer set */
+	if (!adap->dev.of_node)
+		return;
+
+	bus = of_get_child_by_name(adap->dev.of_node, "i2c-bus");
+	if (!bus)
+		bus = of_node_get(adap->dev.of_node);
 
+	of_i2c_register_children(adap, bus);
 	of_node_put(bus);
 }
 
-- 
2.47.1


