Return-Path: <linux-i2c+bounces-4174-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2A911CD7
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB1B7B23690
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50F316D9B3;
	Fri, 21 Jun 2024 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mMdbDpmk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E790116B3A5
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955029; cv=none; b=o0b4PlPHjnP3UrAs7RNUD2s+VaG8rOUnRoxpxDwmIePmx8JY3Mt8lRHtlZGxij4PDQomnE/p+7vWGhcG3jorBIxMi1FULfDptf4wRzwF1Rc1KXJ0kptt8n5WERnhNbqiLUx4+dpLleCz8RlN4ZiiNawRi7/WT3yiZvKTS4rcc/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955029; c=relaxed/simple;
	bh=tp/NGE8RxyPHEtfvReImUJ2XG70OLA+d30WQHKc29AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lX6lsCfFEFRvkGx/zVecNSeH+Bd9VIT0femCQe7IJXcqY3oyQDYiXxboP3mrVcwXr/XNWtqsTXzw0jaxtxy76wz8yDUs+TwaJAiXUPb/4oX1uo6YhOXAOhtowY8Ar9fqi0uKyp1Py7GIt2BSpuZXEajwIJHzSbWq1QdoP6qSI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mMdbDpmk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=CFQTXPUSMeT7AYVoruD7Npcs4kM
	+ge+9KCd3MJfEn/4=; b=mMdbDpmkdlmtdIGn7alJWBs9X8lSnmyMDx4wnFpSOv4
	INM3gEzf5eKpf+2Q1nveHfi1wm/sgPMcMxlVMHHctox9jqRJYvrR4AWtxhfj0OpW
	EwJYgl8BTKHBiugU4Si/WV5f13g0jOFI+wKVYv2KLWlY8zM0y6sJEVQ/olHRBdHn
	V8ivlsHhAbGtuvWO0hwt7OxhX3yUEfMIiBTuSfIkodN3ZOQh+w4G89jAwLWkMAmk
	VdynEDw05kZLyG85ggoAXwQ9OYH8dRwam38LIXq0UCC40mDnwsd8en4fxp2tYj98
	njKfMJqk8ap5Y3pg5NzV/2xZ0EFx9bblN8aatvGAAzQ==
Received: (qmail 1279093 invoked from network); 21 Jun 2024 09:30:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:30:25 +0200
X-UD-Smtp-Session: l3s3148p1@3l2jZ2Eb/I8gAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 3/6] docs: i2c: summary: update speed mode description
Date: Fri, 21 Jun 2024 09:30:10 +0200
Message-ID: <20240621073015.5443-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
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


