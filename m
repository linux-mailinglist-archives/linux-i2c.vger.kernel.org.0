Return-Path: <linux-i2c+bounces-3939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF498901C8F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 10:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D7A71F227D0
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 08:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C5F6F31B;
	Mon, 10 Jun 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OfuLmN+Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243557C8E
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007040; cv=none; b=huyJrS9ZyssHm5YAxL59GLgR1j/KVpJvZHymCGcHKt9V8qKBmQQi7KgdpysBJ6bL788S4TadCcY1Zig/FTEH7BRpp6NSr4JrdpiMhwIKldAuyU06A/p4E+H9dQX5PDIdKx0sIn38c0a2gDFX83ISxlvUI9qYOL5k/ggz481MAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007040; c=relaxed/simple;
	bh=tp/NGE8RxyPHEtfvReImUJ2XG70OLA+d30WQHKc29AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bI4EE+wWfXvhpFCA5Cq/1CzVg5cZEIoXN/ra6XguRB90GBs3WEJ8nTqk5PPPs2fUgA7eZEzKbXQPjbSoCJrAoScz2YAALNeMEUbNh3dXR/kCZ0xBnYRBmT21D9IwzQPNIWdm2Fp0+v1Zp73xy/BRQxDU0tdidzpyt9prMUunkL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OfuLmN+Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=CFQTXPUSMeT7AYVoruD7Npcs4kM
	+ge+9KCd3MJfEn/4=; b=OfuLmN+Q+W0aDkLcJCZ4mUk7jiEUuZ4JC+Z6tSZcVUX
	2HmLO2jmontJoUW/aqt4hGsD3tajJViqRXKq3nrEcjhKz6GcGgahCc/UM5NZmPL4
	xmqcAiB2NJbjSCJO8M/WUROWNmWh3rpt0IALcOTngo1zd5rwbLwIN5h8TwARIL+m
	IcMeH+qheGVLRiFVS5Z8C+lSSt2lVu1fGRlEzhWpt9B6Sfg9EAJXLLQLxJ1TtscE
	i2M/izCuQsEJKg1ZkkT6j0ynNEuCw2y4F5cJlvyD1dcUQYBhqD79cTXApX84SfQr
	mFdiJpONj6PFkxwwT2KHh1Y+q2aSob6+vRnOz021slQ==
Received: (qmail 4192466 invoked from network); 10 Jun 2024 10:10:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 10:10:27 +0200
X-UD-Smtp-Session: l3s3148p1@Yk6broQa0OYgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] docs: i2c: summary: update speed mode description
Date: Mon, 10 Jun 2024 10:10:18 +0200
Message-ID: <20240610081023.8118-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
References: <20240610081023.8118-1-wsa+renesas@sang-engineering.com>
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


