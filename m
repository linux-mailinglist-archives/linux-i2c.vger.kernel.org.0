Return-Path: <linux-i2c+bounces-4171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF9911CCA
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 09:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3BCC2844AB
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BF816C6AC;
	Fri, 21 Jun 2024 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Wg0mtBT9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773282D68
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955027; cv=none; b=fSJjzU/YDhRh9dA1ARJBNTh2TEh/6yGA3uZPzAjwOVXAA36N2kT7nA8r4b/h0XWgr5ORzypHm75B3sAUkwSjtbMVON6oaCpyAKcMOgTu3RojZye2xXMer8yEJOg+mv8UV/cXclc/IH+XRuTdc9TuLxc3BouwHk6WZVb/SfSqPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955027; c=relaxed/simple;
	bh=AaeKWFy6+MhJUSVDuiArePmxqwjpDms46lje4lfg78Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSoclfBRY5lXUho/d0r8PMOEN64yxtscthTPX/nRrzxtFf8ZX0SEQV/vs5qYYtfoD1p1J7iS7g3qmzxzqcYAcc3IWvqHyGMa9TUZ7Tq6Wvh89evGEvr5bLANybG4Hh/zOUY1CFpkdwa9+FoZYEcEXwJz5prmRRVu0X5a9ss6jys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Wg0mtBT9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=QxN9/peWzKBlFqRmDXEKD0iHTiZ
	lunJFWOblMthWaXk=; b=Wg0mtBT9TyelcTDA6riZbZ61STrKMj128jtojXWdlDy
	cZGsCS4/HE6r3C5To2WPq1n3j9GVdKufVNIGHfPoxwwpkYmt++KVWSqrIClwPjIB
	hklChVsz1gt/PhbDBpPZKA1Plk8hU90bCHWCdcKg4xQpBu+rbnrZ8K2rKVpfMz4Q
	BIXiBXw/P0MU72PPsXGVLhACU7DcoUurSYGi3KvV9L25DjOXjdd6Iad0nQulC65M
	SMD6wXxoTyEU1H7C+rTSdKtExeBpVMWBybKZstz9ZWXv9iYglaJvDnT6t0yyZxCF
	3KAZPL6lefdo2qGu9np8lkfUE4xwLZ+Tav8WrGdBOIg==
Received: (qmail 1279036 invoked from network); 21 Jun 2024 09:30:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:30:23 +0200
X-UD-Smtp-Session: l3s3148p1@G1uLZ2Eb0MMgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 1/6] docs: i2c: summary: start sentences consistently.
Date: Fri, 21 Jun 2024 09:30:08 +0200
Message-ID: <20240621073015.5443-2-wsa+renesas@sang-engineering.com>
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

Change the first paragraphs to contain only one space after the end of
the previous sentence like in the rest of the document.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 Documentation/i2c/summary.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 786c618ba3be..28ff80a2302b 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -4,10 +4,10 @@ Introduction to I2C and SMBus
 
 I²C (pronounce: I squared C and written I2C in the kernel documentation) is
 a protocol developed by Philips. It is a slow two-wire protocol (variable
-speed, up to 400 kHz), with a high speed extension (3.4 MHz).  It provides
+speed, up to 400 kHz), with a high speed extension (3.4 MHz). It provides
 an inexpensive bus for connecting many types of devices with infrequent or
-low bandwidth communications needs.  I2C is widely used with embedded
-systems.  Some systems use variants that don't meet branding requirements,
+low bandwidth communications needs. I2C is widely used with embedded
+systems. Some systems use variants that don't meet branding requirements,
 and so are not advertised as being I2C but come under different names,
 e.g. TWI (Two Wire Interface), IIC.
 
@@ -18,14 +18,14 @@ access the PDF. An older version of the specification (revision 6) is archived
 `here <https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
-a subset of I2C protocols and signaling.  Many I2C devices will work on an
+a subset of I2C protocols and signaling. Many I2C devices will work on an
 SMBus, but some SMBus protocols add semantics beyond what is required to
-achieve I2C branding.  Modern PC mainboards rely on SMBus.  The most common
+achieve I2C branding. Modern PC mainboards rely on SMBus. The most common
 devices connected through SMBus are RAM modules configured using I2C EEPROMs,
 and hardware monitoring chips.
 
 Because the SMBus is mostly a subset of the generalized I2C bus, we can
-use its protocols on many I2C systems.  However, there are systems that don't
+use its protocols on many I2C systems. However, there are systems that don't
 meet both SMBus and I2C electrical constraints; and others which can't
 implement all the common SMBus protocol semantics or messages.
 
-- 
2.43.0


