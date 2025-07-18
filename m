Return-Path: <linux-i2c+bounces-11962-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D57B0A565
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 15:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53CAA1C82110
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Jul 2025 13:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F51A298CC9;
	Fri, 18 Jul 2025 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="u+5twy+G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724012AD2F;
	Fri, 18 Jul 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846183; cv=none; b=adBmXGeve9u9yL2ath5a7u27HyqiPw1RCxLn0ceKNKUJLFeP1qmn3yD5QgRcoX37o0DPtuu7DPYC9I7sa8JI1XJK+su9H6Nlm2Ovy/3vydpjUZ2Q9gVEJX0H2eGDbCkC+OB3WBz8gnbEV0Y3AdfxumpEa3f+CR+4pU71wqet4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846183; c=relaxed/simple;
	bh=otTGygr7TVGTYqcr0fX9VequzUeg+oyf0nTBNcNXdAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Iu72qNL/fEWptR29Ivo7gbwrXyFRJyvyoRCKj1WBNPj21LMiYtPi55kq19+Sim2nblOJrAsILcvZpktNofsHN0yOl6iqsw4VtxY4rJyZZDjLD1oBWVUHKwiuZuQ9eyCsrQ058Ye6uuZqxkN+wwLP4oe5+sWhXj/3pebYnH4LxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=u+5twy+G; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id DB6B01FBBB;
	Fri, 18 Jul 2025 15:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1752845682;
	bh=MzOMyIV68qHQ0Kt7SHQ+0I+blgrtc5hfOPRGbkCaOXw=; h=From:To:Subject;
	b=u+5twy+GcjC/2I6RtkO5b91F9NkV42c6eu1+N4v8XBtVuWd2u44uSNSfeEpTlzqol
	 P2krDTV4T4ozRlh0UxoHkIS8o0E9SaGlGtB7U18vh8nTDdBCbhSSFWC5Hu6/sG0R6+
	 x/PVztIBIzhWcj4tPx4AOSpNngR3RlY1bhdQRQWI4ocr0x/RN/KJeZoW3Di4E7ZI0R
	 bn8ph+yymT5vJr2p+vtks3c3qWPqRePFLcuJHvMCFYvulIarz4Kay7P2jF4nFOOSN2
	 /cWCtnQ4pCwYIk0RFzrpq0lARzB8V4acIaUmyzV2+9DddvdhTXv3Xd37hfCDcu8e3S
	 imOGSNF4fAIlQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] i2c: lpi2c: implement master_xfer_atomic callback
Date: Fri, 18 Jul 2025 15:34:27 +0200
Message-Id: <20250718133429.67219-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds atomic operations support to the imx-lpi2c driver and split
the previous v3 patch into two separate patches.

The first patch replaces the open-coded polling loops with readl_poll_timeout.
This improves readability and consistency, and prepares the code for
integration of the second patch, while maintaining the same functionality.

The second patch implements the .master_xfer_atomic() callback, enabling
support for atomic I2C transfers.

Emanuele Ghidoli (2):
  i2c: lpi2c: use readl_poll_timeout() for register polling
  i2c: lpi2c: implement xfer_atomic callback

 drivers/i2c/busses/i2c-imx-lpi2c.c | 254 +++++++++++++++++++----------
 1 file changed, 172 insertions(+), 82 deletions(-)

-- 
2.39.5


