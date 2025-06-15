Return-Path: <linux-i2c+bounces-11472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B04ADA300
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 20:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1BD3B12A3
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6778D269CF1;
	Sun, 15 Jun 2025 18:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BJFxof5e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4F261388;
	Sun, 15 Jun 2025 18:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750012623; cv=none; b=hs5DCdyWbEjZDGv2VswIsNRfWy7kPkW/MpHl7hUvzDP+BwmmVBeJ2nOgTJcSJfdSqbP3s8LErRsKnQgxNQB3tA0A6ecODHPej2nEThL+lN6glpfI4CDnmoTZ97C/3dlp4FvG+H8yt5wH7pgjnYTYlbP0FpcD1ByiPYmoyESUMvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750012623; c=relaxed/simple;
	bh=XQMKv+8Ij0F6buYkfRuRLQkC1Su8tTx1szV1QCNicYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=riuoFKREqfMS3lvTyOcZY0Xkt/YmAgumRrxODPEI/dbxJdTzL/9x5HvoJycDNbwzX/JESVLis7pMnyRUdADDN86zNdo18sYhbGD9Zr2uDuS6PsCryTU6/Hxc9Y0Kqyo1y+KPYKBj3xuuKbgboMwF03NR3Yc2GH/lqNenFU3FB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BJFxof5e; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RVAZvd/zLDzaceTSC6FoHp8KiZ3t/hEM3+Zjok0zqoY=; b=BJFxof5eXTLmFGzFh0cuzXi5Sv
	4OBY5pUBDwl52+UqPOuW6nkC1AcmQQ3uGIdUXbzY7Chp0O2frvaIQ12lPgW84RlRDTgxprWGADhXY
	0hErHzxqLuytqcNlrh7sY+lEfvw6Om2g93hoTCAxIROVYYnrMf7yzZfo1JK+WYw1gt9aB6N/6SpgD
	8HVjZGzmatcFwGxEApwXDLREmO+dJm6Q/KTsqs1+Xs6g/3h8MMtvPMFg8x+nKaUUK3ZjBHbV7ApD4
	jWFiPZ8s+KkYHUVBZubs8CCa5l94uHllXeEno/vPuTLkBIEHFR7dOwG+7Qnp0c8/jkwS5zReFGCri
	jxO9cFFw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsE0-00000002jpL-2lkw;
	Sun, 15 Jun 2025 18:37:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: scx200_acb: add depends on HAS_IOPORT
Date: Sun, 15 Jun 2025 11:36:58 -0700
Message-ID: <20250615183659.902110-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The scx200_acb driver uses inb()/outb() without depending on HAS_IOPORT,
which leads to build errors since kernel v6.13-rc1:
commit 6f043e757445 ("asm-generic/io.h: Remove I/O port accessors
for HAS_IOPORT=n")

Add the HAS_IOPORT dependency to prevent the build errors.

(Found in ARCH=um allmodconfig builds)

drivers/i2c/busses/scx200_acb.c: In function ‘scx200_acb_reset’:
include/asm-generic/io.h:596:15: error: call to ‘_outb’ declared with attribute error: outb() requires CONFIG_HAS_IOPORT

drivers/i2c/busses/scx200_acb.c:224:26: note: in expansion of macro ‘inb’
include/asm-generic/io.h:542:14: error: call to ‘_inb’ declared with attribute error: inb()) requires CONFIG_HAS_IOPORT
  224 |                 status = inb(ACBST);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-616-rc1.orig/drivers/i2c/busses/Kconfig
+++ lnx-616-rc1/drivers/i2c/busses/Kconfig
@@ -1530,7 +1530,7 @@ config I2C_XGENE_SLIMPRO
 
 config SCx200_ACB
 	tristate "Geode ACCESS.bus support"
-	depends on X86_32 && PCI
+	depends on X86_32 && PCI && HAS_IOPORT
 	help
 	  Enable the use of the ACCESS.bus controllers on the Geode SCx200 and
 	  SC1100 processors and the CS5535 and CS5536 Geode companion devices.
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 # v6.16-rc1

