Return-Path: <linux-i2c+bounces-10352-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9CA8A2EF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25653A67A7
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF6229C33A;
	Tue, 15 Apr 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9zJymXN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F22951DA;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731437; cv=none; b=PtLTmdcSDHKeJDs6SqKS08Pex6OevjiDJf+PuUeUMR9tJwC5LiWyOWIoHgVfpOtUYXy4aqRhKo1CuHDkeNbZYjsXdkXcZxTSRQYGeTGc+7dVdOmFsB/TMq6e6RPramf2yKcKLNNJpiXeHu2PspbF58DS1EfJgyPynNKOEJkwesM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731437; c=relaxed/simple;
	bh=J3Oie2pptyHEtwvKtZF+eWmaLMCyaUrJVSGBPvvdSlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkHWGtUn0N7TFQjsz1aqIz7aypzVMsCx887FCRXLvchuGgyKjBGt2X3O+KaNZKdyN6bw/R6UbOFJWD9QV7P2QEnL3DDAcWy3aSBG0dCAA32Oos7bBPy67ksrZVarkOgEfDmNxKTTurgX/GmS1sJ9p35y2f7Lwe4SB+3svPRXFU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9zJymXN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D168C4CEED;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=J3Oie2pptyHEtwvKtZF+eWmaLMCyaUrJVSGBPvvdSlQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s9zJymXNPTZOXH7mjUl0DjJiQnxJOqCGFa5iNXmtPndbrqBuDGv267Xb0yWif0CsV
	 uNeQpT+5Fd+8w2sEbBrBewBoMqFZdi09FLbrt3/iwQ5ssPPu4QY7l0DVurdWZqD791
	 mfb8cecYFexXhWQClD9icW4ujlNKK1uR3RUjMNFqaI/wdAI+69g61bLH1OR/gd+23y
	 47RkxtJqu+AidqXZIvQS4MFYAcp5jAdmhmadXI+D0d2QwZz8q2YLXxq7ZVhp4MIxU7
	 fIsNl/sNMWeVPC7mSomGKYPfIGZreYnC6K9aQsq1TZK6L0/WKcyK8Kn2mUxaF8ZzVq
	 PWBg3HcQNdXMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9E8C369BD;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:55 +0000
Subject: [PATCH v2 1/6] i2c: pasemi: Use correct bits.h include
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-1-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=T4ctk5KZpkF4MCpfLgWPh46S+YQwBJlk0+PfdZqRe6g=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WpVo9+5foQ6z5vcxp3SHJe/Yv2n3g66G6UzbKwXuL
 tgouymoo5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRbQ4M/70DXfKzoxxXTxOc
 uo9dNH/jlYrXT2ck/Xx1InsiY6tQ80ZGho+/F3tc3uDmaXHgnMfKKX0nLK4sFYvyXBK8OMPl/06
 9o5wA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

When changing the #defines to use BIT and GENMASK the bitfield.h include
was added instead of the correct bits.h include.

Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Closes: https://lore.kernel.org/asahi/Z965tVhC5jxy1kqZ@surfacebook.localdomain/
Fixes: 8b4da3ef9206 ("i2c: pasemi: Add registers bits and switch to BIT()")
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2ebb64929f2f6a3525835a880c3114d..71cc8cfc7c5cbf3924269f6217712d42008c03ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -5,7 +5,7 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
-#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/kernel.h>

-- 
2.34.1



