Return-Path: <linux-i2c+bounces-4027-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BE9085E4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B167028B39C
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 08:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D4E1836EF;
	Fri, 14 Jun 2024 08:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PX3Vsfla"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7B187333
	for <linux-i2c@vger.kernel.org>; Fri, 14 Jun 2024 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352779; cv=none; b=FA8pwZZUCKzUYRG6ES2FX1dmrAURo9gJmZRJhqpfOt2ClpntrL+JsxX7dSYeH9Y9lpBcstaTVBGQNFto6o+R4GNF2Hjk7QwXj8ze63cOtCq7CKqsuVJbeToRU5RXz0fEitGEQUlhzWZEAAmZ49uFhejAL+N9jBizfTKlEUzwXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352779; c=relaxed/simple;
	bh=BVEwSEZWW70n3zK43WnEFFNovrnrFP6C9VNMi4Zg6mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acCjwo0BDrFcxCBym1gWDGhxYF3ACJa9oU5K31z3nRiBiXEfBXIoUCu3i+0dZrJxM4SXnRomuPYegLFNZGbGiSAegaozSAPQLOJTStZQIDNFMSLohZTnwiCisOGmrdutarl02OFrs2AGgYeKnY5xFdz2jJ27OwAd0XRA7ObZn3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PX3Vsfla; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=x+OirvJmm2z8OY7TiPcj0ELlgpYDPQ+Seo1lKvUO+VI=; b=PX3Vsf
	laINXXGy3e3zub0bL77RqjsZYszfE483pUzNdyKQdEEvpy6I9/Mtr6t/pVGqWb/R
	dvaPM3v2WhJ9KefQ/ritD72/2c4eubbeE+PKAF93EoYbgnOzOLrD51nFjMIvhw5r
	b5CVo2SsGSagW+NEgkJa9tOliyu3sPBf7EY55Oe5Qxdr/N8I0YNRp5yBHXV3VuCe
	bE6aKjND8v0eLk7qyS0fI5IVAvkkpTjnmQ9kBfKjCltaGe5yLnbPL+aPNXrsOQW4
	vajav7vusIciE4k2MuWTSjaOBGOezzRqEAz9Rp7Kqg/LIUF9vqHGmznNAZds7uiG
	TfrbPUzL/Fi2yGNQ==
Received: (qmail 1438219 invoked from network); 14 Jun 2024 10:12:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 10:12:51 +0200
X-UD-Smtp-Session: l3s3148p1@wNCFLtUaNIIgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 6/6] docs: i2c: summary: be clearer with 'controller/target' and 'adapter/client' pairs
Date: Fri, 14 Jun 2024 10:12:44 +0200
Message-ID: <20240614081239.7128-14-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This not only includes rewording, but also where to put which emphasis
on terms in this document.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index ff8bda32b9c3..90f46f1504fe 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -31,9 +31,7 @@ implement all the common SMBus protocol semantics or messages.
 Terminology
 ===========
 
-The I2C bus connects one or more *controller* chips and one or more *target*
-chips.
-
+The I2C bus connects one or more controller chips and one or more target chips.
 
 .. kernel-figure::  i2c_bus.svg
    :alt:    Simple I2C bus with one controller and 3 targets
@@ -41,16 +39,16 @@ chips.
    Simple I2C bus
 
 A **controller** chip is a node that starts communications with targets. In the
-Linux kernel implementation it is called an **adapter** or bus. Adapter
-drivers are in the ``drivers/i2c/busses/`` subdirectory.
+Linux kernel implementation it is called an "adapter" or "bus". Controller
+drivers are usually in the ``drivers/i2c/busses/`` subdirectory.
 
-An **algorithm** contains general code that can be used to implement a
-whole class of I2C adapters. Each specific adapter driver either depends on
-an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
-its own implementation.
+An **algorithm** contains general code that can be used to implement a whole
+class of I2C controllers. Each specific controller driver either depends on an
+algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes its
+own implementation.
 
 A **target** chip is a node that responds to communications when addressed by a
-controller. In the Linux kernel implementation it is called a **client**. While
+controller. In the Linux kernel implementation it is called a "client". While
 targets are usually separate external chips, Linux can also act as a target
 (needs hardware support) and respond to another controller on the bus. This is
 then called a **local target**. In contrast, an external chip is called a
@@ -60,9 +58,18 @@ Target drivers are kept in a directory specific to the feature they provide,
 for example ``drivers/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
 video-related chips.
 
-For the example configuration in figure, you will need a driver for your
-I2C adapter, and drivers for your I2C devices (usually one driver for each
-device).
+For the example configuration in the figure above, you will need one driver for
+the I2C controller, and drivers for your I2C targets. Usually one driver for
+each target.
+
+Synonyms
+--------
+
+As mentioned above, the Linux I2C implementation historically uses the terms
+"adapter" for controller and "client" for target. A number of data structures
+have these synonyms in their name. So, to discuss implementation details, it
+might be easier to use these terms. If speaking about I2C in general, the
+official terminology is preferred.
 
 Outdated terminology
 --------------------
-- 
2.43.0


