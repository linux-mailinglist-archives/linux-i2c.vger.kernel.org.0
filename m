Return-Path: <linux-i2c+bounces-4647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D53A927EF9
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 00:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077D328469B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 22:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DD6143726;
	Thu,  4 Jul 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aL42qxm2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BB5405F8
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 22:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720131441; cv=none; b=L3CAwYSmhIvXMkoBsGaIrj90uTgL/IWtmfd3w5Sv+yzDA3+yXNCrWxVpZV74x/V7nkNrt6p43Sbr4QpOFjsHr6TWq8VSNkOXVnYgo2cniCnbosQhxtyiikYom3K1oa51bJXbJ/u0xeV1EVTMt94ozSIFub1BjG44yiKOEm2j4yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720131441; c=relaxed/simple;
	bh=0QQgidXtWp8QZnZvqZ4MSjBn79gM4mDK0CmxsML3CGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuYxfXEqBgRF5NLlTwCN7vAIfFXf6xQHlX3XSmW4jMmu2MbUHP+5e9YU5zeCah74ZOUXXPvC75s4XXo9Tjsn6hDVpp7JnaO7J6Un9kxPYviZxcb/n1LPT0ohzU650I7LRSDDQJvec2Yzv9/NotnhneNWIKl38bRkC1hNmaJh0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aL42qxm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258D3C3277B;
	Thu,  4 Jul 2024 22:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720131440;
	bh=0QQgidXtWp8QZnZvqZ4MSjBn79gM4mDK0CmxsML3CGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aL42qxm2sAAPwRaYZRrNqdU6k6gJSFgnGbM808I+DLcIw3Va42vqXh/P3GxCEIyr6
	 9WB4H/u2r5xvKR6+bGsFIm3XLoFobSbe4HjYnjjOOqcBbui3+c+fC20WEe9/5qRu4+
	 Aq7IJjsZMf/6LVD3bAanL0trmopnH62Gmpws4h1n35dgcoLQtliwCOZwyD/Pa6Kx9j
	 oHbSQbG1laNWSNlcnlyZ+xHbhuK465pBgDfNHA64ndG83UeIanyv+OEHJeYNKv6cVl
	 mf8mPS1xylQ+6JuWEF5ziM5Q0vvCGW8u66XZzbtsjjYKZ/6BnJ3u8ASHwb4cuyaBHL
	 gSQC00AyctpiA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	upstream@airoha.com,
	benjamin.larsson@genexis.eu
Subject: [PATCH 1/2] i2c: mt7621: Add Airoha EN7581 i2c support
Date: Fri,  5 Jul 2024 00:16:14 +0200
Message-ID: <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720130844.git.lorenzo@kernel.org>
References: <cover.1720130844.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
driver.

Tested-by: Ray Liu <ray.liu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..4d93c00264fc 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -857,7 +857,7 @@ config I2C_MT65XX
 
 config I2C_MT7621
 	tristate "MT7621/MT7628 I2C Controller"
-	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
+	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  MediaTek MT7621/MT7628 SoCs.
-- 
2.45.2


