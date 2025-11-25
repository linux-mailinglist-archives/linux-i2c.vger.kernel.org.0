Return-Path: <linux-i2c+bounces-14250-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD52C8316F
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 03:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AECA4E49E8
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Nov 2025 02:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE00E1C3F0C;
	Tue, 25 Nov 2025 02:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HBwQuNx4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7281A08AF;
	Tue, 25 Nov 2025 02:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764037694; cv=none; b=NNKag3Yn9fQzqKPpouDtlD15WdJiKBwDiogtY1FLuiFnf0ju1IXl7WT5IQOTpRog/dqb+YIVtsn6ZKuZrlH99WqAHxO8Hiaf9mltPQgDuPfN3rh5KVNgiLS22RX+QfIbwQ7osJSg81fEi0Cx3HYqbh1oIwekr1TzBTdkotZfMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764037694; c=relaxed/simple;
	bh=8DvU2rbjtJTJBwJzrPU5e28J4yRXGfOsiOeqFFsLLn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+x/W5SbHXAvans4tM210pyE2CR+6Vnw+ogsliyusdlqaiT1gMfX9q05XLu66xVGoRl8qCOumBpQNwupCy9u8f+ulYG9ncPW/vdQv6yMu9LmpOYzbgJPuVxer5brO0bzrX0ZeDx/ljfurBZpBxSnmIaVD8iJZebntyAU2HoG+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HBwQuNx4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UPCzUXZJn6eUA+7em2rQtunPZoyLcS/avld+pjWjq6s=; b=HBwQuNx4JxjK2iI5mAGQ4Z9ZIS
	Mus12TJeK4I1GDNI8KjsJ+IyErZyC97FyFe0GDDo58tWfEpxlgF0RiFXtd3jrU2UtJ/WQqPSxbAV0
	vmBerJ7jg3qNuC5VvVTWFRck7JNt/EVD0gySl6fpV97FgGwg4tpfQo4pBmj9xC8esU4ywHmDUuFGO
	Cy0YgmgzIxprQRXVzSDhKBtiAUqIaYg2INkS8Tcx7tGAxm6kHu5NmNgLZC801k68Q2Yz71ohh3d47
	iZp9So0LoX7BEFWHPoTxsXcvfUnAvpVM43qAP76uG3TXZ3RWcQflWIxwWzEeUvGK1FwyAXQDvd7bC
	h7VVqrug==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNimn-0000000CcOK-147V;
	Tue, 25 Nov 2025 02:28:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i2c.h: fix a bad kernel-doc line
Date: Mon, 24 Nov 2025 18:28:08 -0800
Message-ID: <20251125022808.3168059-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change an empty line into a blank kernel-doc line to prevent
a kernel-doc warning:

Warning: ../include/uapi/linux/i2c.h:38 bad line: 

Fixes: bfb3939c51d5 ("i2c: refactor documentation of struct i2c_msg")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
---
 include/uapi/linux/i2c.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20251016.orig/include/uapi/linux/i2c.h
+++ linux-next-20251016/include/uapi/linux/i2c.h
@@ -36,7 +36,7 @@
  *
  *   Only if I2C_FUNC_NOSTART is set:
  *   %I2C_M_NOSTART: skip repeated start sequence
-
+ *
  *   Only if I2C_FUNC_PROTOCOL_MANGLING is set:
  *   %I2C_M_NO_RD_ACK: in a read message, master ACK/NACK bit is skipped
  *   %I2C_M_IGNORE_NAK: treat NACK from client as ACK

