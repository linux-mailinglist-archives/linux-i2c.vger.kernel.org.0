Return-Path: <linux-i2c+bounces-7913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34349C3603
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 02:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D050E1C21935
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 01:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB76614F9EE;
	Mon, 11 Nov 2024 01:30:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E8814B95A;
	Mon, 11 Nov 2024 01:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731288658; cv=none; b=YmRUz/lSwi5bLnGIvAztejd2b5kpKBxKQMELy0Crr1TkyYSJLhS9lQNSL/E+E3eV6ngWZu4t1XDg/B1L1OtjVkdvIxWCSXvc8nGfGfZxqy+t8KDDnKZTUsPtrN3jyp0v4XN4Bo1lBu0IiDl5tYJ4Vod/li1LMDTmY5NHpAfWmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731288658; c=relaxed/simple;
	bh=0JSYVCMppQ4gPpDglsiUJWmmCHlt0HifKB1+DPJgXS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uOJuO7WiEf2XEB1SctaMJeJaiiArjInRnsKpC8gyJCaZGwZR0O2QA5cnIuJKQGt4ER42ScNtOvpL6SvQESodxnBbNtwkjDNjWsR1bmWIhzszvBK2dMDqoINfgG1rCxR5GHG7FElbjAWPpJtV3Qecbm+qPR772nKMkvk5Bg/INsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D341CE0;
	Sun, 10 Nov 2024 17:31:25 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4187F3F66E;
	Sun, 10 Nov 2024 17:30:54 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 05/14] dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string
Date: Mon, 11 Nov 2024 01:30:24 +0000
Message-ID: <20241111013033.22793-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241111013033.22793-1-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controller IP used in the Allwinner A523/T527 SoCs is
compatible with the ones used in the other recent Allwinner SoCs.

Add the A523 specific compatible string to the list of existing names
falling back to the allwinner,sun8i-v536-i2c string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 984fc1ed3ec6a..c4efcef591337 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -33,6 +33,7 @@ properties:
               - allwinner,sun50i-a100-i2c
               - allwinner,sun50i-h616-i2c
               - allwinner,sun50i-r329-i2c
+              - allwinner,sun55i-a523-i2c
           - const: allwinner,sun8i-v536-i2c
           - const: allwinner,sun6i-a31-i2c
       - const: marvell,mv64xxx-i2c
-- 
2.46.2


