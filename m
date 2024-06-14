Return-Path: <linux-i2c+bounces-4025-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7329085D4
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 10:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D135028B2D3
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405347318A;
	Fri, 14 Jun 2024 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="d2scBl8s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB11836F7
	for <linux-i2c@vger.kernel.org>; Fri, 14 Jun 2024 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718352775; cv=none; b=hdimWzu4N71QQPboQzU5EY1yCgfC5c0jUU+QoKLCzMtnN9zT6qoJ9YCWoq7QsI1Lk3aVFChNCz3UUjtadinSMyn0yHBIWttt4OkBG4YLrNzSsvz6Mjbg/ucbkURPHHqA8ATA6osKKrWG9PL9QMIH2ZKb92tBaM50KnfxWhnF1cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718352775; c=relaxed/simple;
	bh=tp/NGE8RxyPHEtfvReImUJ2XG70OLA+d30WQHKc29AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSrVuP2ZdwFF3vrkHLdm+iywMGgPhBl9EwjyKTQO9lHmhVItkWYayQD3619Bx4/xMGni4SAzu4th0BgKF72iZzMtKYKoon7a/EgZ9m1hw9RFen6RuptPGoxfZJuhIBp1/1MGVmqDCJs6C0xqvdQMfGGBdySZbZCAt5kAW2ZZU+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=d2scBl8s; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=CFQTXPUSMeT7AYVoruD7Npcs4kM
	+ge+9KCd3MJfEn/4=; b=d2scBl8sEJsEnqQxWfrcz+oW3TWGdEn8shOY0DzbDhD
	oz+FOUv1e+XofBDao5B9w4aFrq3rwDlY2O9fuMfxQcPDWt/6HZgMTLyqsxXUPaqi
	g7slaN7Qdxgq9bVrjOWD6ex2tgvqjaaaFl4yLeY7NH6K1uj1YSFWZXEgF0b02/2d
	RD9FQdZ4Cq7jpAOHiKp60LP6so904CitYXAUeIVMqOMjdIuB4BEGgC8EMFdKXYdg
	8eC4kqk3+vlH3pHB5OdjkVkBhy/HgoXa5demZPoXtAo4TxBoth6Bvs4SmBemB8JR
	nTE4JuoX1qgEjyvQIbKOtxV02LwaMPMpopvJTtzk11w==
Received: (qmail 1438163 invoked from network); 14 Jun 2024 10:12:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jun 2024 10:12:49 +0200
X-UD-Smtp-Session: l3s3148p1@nehsLtUaFoIgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 3/6] docs: i2c: summary: update speed mode description
Date: Fri, 14 Jun 2024 10:12:41 +0200
Message-ID: <20240614081239.7128-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fastest I2C mode is 5 MHz. Update the docs and reword the paragraph
slightly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 Documentation/i2c/summary.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index e3ab1d414014..a1e5c0715f8b 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -3,8 +3,8 @@ Introduction to I2C and SMBus
 =============================
 
 I²C (pronounce: I squared C and written I2C in the kernel documentation) is
-a protocol developed by Philips. It is a slow two-wire protocol (variable
-speed, up to 400 kHz), with a high speed extension (3.4 MHz). It provides
+a protocol developed by Philips. It is a two-wire protocol with variable
+speed (typically up to 400 kHz, high speed modes up to 5 MHz). It provides
 an inexpensive bus for connecting many types of devices with infrequent or
 low bandwidth communications needs. I2C is widely used with embedded
 systems. Some systems use variants that don't meet branding requirements,
-- 
2.43.0


