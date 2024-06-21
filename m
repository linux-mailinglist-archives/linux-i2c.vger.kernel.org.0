Return-Path: <linux-i2c+bounces-4175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFFE911CD8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADEC4B23B58
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1CB16D9D1;
	Fri, 21 Jun 2024 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N1K8je8b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB60816C69C
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955030; cv=none; b=MoMaWBR7gKry7mkTZC9Q2vUZkYHqHOln7mN4uE6hgJm8EjQzAQiKe3RKgRTeQFDKQWIF7arhJ1O5whT4jrJTmYnwFSDBn2NbQDLd8YEspT1FEsYPCqG5xXfc54Wf2OgMfFsN6CoVxme6uN32YyzoCVcXszcADPbt7zKvxrTtNVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955030; c=relaxed/simple;
	bh=tH0NOSAY7BDUS/VNB/ZGWgSpJi45DZYDHlrsL1Okdl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiI1WXZOl/bjdKF3sQDv4nDxhmml9mG6mYTK0v4aHB2xD1AfrNJJ9QowwWmkpjEscaKNsCodVJWyIQd7qtQXVXLKxSuFnJob5FK1fHHaDosY4Pdw0iaGZSjNliGc8Pt9b3uC+z75Xoaj7a9FCiApelpG5XwYY0QRFoHB35lGK4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N1K8je8b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ixLUA05ywsqk+tUJDK/loDg53P2byoU2nyRRhw8H0ik=; b=N1K8je
	8bd5zxibUE9olBIun0NZzWz3hEhNAZb5Qya0F7FFstQhIPuMQQ4KI2hz3bc1aDLS
	dLugnRrgw2mm7TfqWWeun+e7dDMUTNe6e3y2KPBlDCJCOEI3tETodV2ZU+RzxrIA
	v1bT06waVERZpRg9tFVMtsoGQHzUqmnC/1mOumfH4p+QJUtA4hxjR8nLef/ypLEI
	6fnKdPDWHHcOAdB3vFKOexuLjcW/fsG95OBPIfLA4Za48Ra3BWy08GW4UiVaOlkO
	ne7r34poFXojXa6SJ1EyjIseZAYF2qZWdqCSgfl/M7NyyU48HMj71zN9uRYzcXas
	APhQIDXgfHSLBQVA==
Received: (qmail 1279121 invoked from network); 21 Jun 2024 09:30:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:30:25 +0200
X-UD-Smtp-Session: l3s3148p1@sQawZ2EbBJAgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 4/6] docs: i2c: summary: document use of inclusive language
Date: Fri, 21 Jun 2024 09:30:11 +0200
Message-ID: <20240621073015.5443-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We now have the updated I2C specs and our own Code of Conduct, so we
have all we need to switch over to the inclusive terminology. Define
them here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/i2c_bus.svg | 15 ++++++++-------
 Documentation/i2c/summary.rst | 23 +++++++++++++++++------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/Documentation/i2c/i2c_bus.svg b/Documentation/i2c/i2c_bus.svg
index 3170de976373..45801de4af7d 100644
--- a/Documentation/i2c/i2c_bus.svg
+++ b/Documentation/i2c/i2c_bus.svg
@@ -1,5 +1,6 @@
 <?xml version="1.0" encoding="UTF-8" standalone="no"?>
 <!-- Created with Inkscape (http://www.inkscape.org/) -->
+<!-- Updated to inclusive terminology by Wolfram Sang -->
 
 <svg
    xmlns:dc="http://purl.org/dc/elements/1.1/"
@@ -1120,7 +1121,7 @@
     <rect
        style="opacity:1;fill:#ffb9b9;fill-opacity:1;stroke:#f00000;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        id="rect4424-3-2-9-7"
-       width="112.5"
+       width="134.5"
        height="113.75008"
        x="112.5"
        y="471.11221"
@@ -1133,15 +1134,15 @@
        y="521.46259"
        id="text4349"><tspan
          sodipodi:role="line"
-         x="167.5354"
+         x="178.5354"
          y="521.46259"
          style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
          id="tspan1273">I2C</tspan><tspan
          sodipodi:role="line"
-         x="167.5354"
+         x="178.5354"
          y="552.71259"
          style="font-size:25px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle"
-         id="tspan1285">Master</tspan></text>
+         id="tspan1285">Controller</tspan></text>
     <rect
        style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
        id="rect4424-3-2-9-7-3-3-5-3"
@@ -1171,7 +1172,7 @@
          x="318.59131"
          y="552.08752"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287">Slave</tspan></text>
+         id="tspan1287">Target</tspan></text>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968767;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1"
        d="m 112.49995,677.36223 c 712.50005,0 712.50005,0 712.50005,0"
@@ -1233,7 +1234,7 @@
          x="468.59131"
          y="552.08746"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287-6">Slave</tspan></text>
+         id="tspan1287-6">Target</tspan></text>
     <rect
        style="color:#000000;clip-rule:nonzero;display:inline;overflow:visible;visibility:visible;opacity:1;isolation:auto;mix-blend-mode:normal;color-interpolation:sRGB;color-interpolation-filters:linearRGB;solid-color:#000000;solid-opacity:1;vector-effect:none;fill:#b9ffb9;fill-opacity:1;fill-rule:nonzero;stroke:#006400;stroke-width:2.8125;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;color-rendering:auto;image-rendering:auto;shape-rendering:auto;text-rendering:auto;enable-background:accumulate"
        id="rect4424-3-2-9-7-3-3-5-3-1"
@@ -1258,7 +1259,7 @@
          x="618.59131"
          y="552.08746"
          style="font-size:25.00000191px;line-height:1.25;font-family:sans-serif;text-align:center;text-anchor:middle;stroke-width:1px"
-         id="tspan1287-9">Slave</tspan></text>
+         id="tspan1287-9">Target</tspan></text>
     <path
        style="fill:none;fill-rule:evenodd;stroke:#000000;stroke-width:1.99968743;stroke-linecap:butt;stroke-linejoin:miter;stroke-miterlimit:4;stroke-dasharray:none;stroke-opacity:1;marker-end:url(#DotM)"
        d="m 150,583.61221 v 93.75"
diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index a1e5c0715f8b..a6da1032fa06 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -31,15 +31,16 @@ implement all the common SMBus protocol semantics or messages.
 Terminology
 ===========
 
-Using the terminology from the official documentation, the I2C bus connects
-one or more *master* chips and one or more *slave* chips.
+The I2C bus connects one or more *controller* chips and one or more *target*
+chips.
+
 
 .. kernel-figure::  i2c_bus.svg
-   :alt:    Simple I2C bus with one master and 3 slaves
+   :alt:    Simple I2C bus with one controller and 3 targets
 
    Simple I2C bus
 
-A **master** chip is a node that starts communications with slaves. In the
+A **controller** chip is a node that starts communications with targets. In the
 Linux kernel implementation it is called an **adapter** or bus. Adapter
 drivers are in the ``drivers/i2c/busses/`` subdirectory.
 
@@ -48,8 +49,8 @@ whole class of I2C adapters. Each specific adapter driver either depends on
 an algorithm driver in the ``drivers/i2c/algos/`` subdirectory, or includes
 its own implementation.
 
-A **slave** chip is a node that responds to communications when addressed
-by the master. In Linux it is called a **client**. Client drivers are kept
+A **target** chip is a node that responds to communications when addressed
+by the controller. In Linux it is called a **client**. Client drivers are kept
 in a directory specific to the feature they provide, for example
 ``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
 video-related chips.
@@ -57,3 +58,13 @@ video-related chips.
 For the example configuration in figure, you will need a driver for your
 I2C adapter, and drivers for your I2C devices (usually one driver for each
 device).
+
+Outdated terminology
+--------------------
+
+In earlier I2C specifications, controller was named "master" and target was
+named "slave". These terms have been obsoleted with v7 of the specification and
+their use is also discouraged by the Linux Kernel Code of Conduct. You may
+still find them in references to documentation which has not been updated. The
+general attitude, however, is to use the inclusive terms: controller and
+target. Work to replace the old terminology in the Linux Kernel is on-going.
-- 
2.43.0


