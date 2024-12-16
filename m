Return-Path: <linux-i2c+bounces-8517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F59F2FEE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 13:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F34141654B9
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 12:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5154204576;
	Mon, 16 Dec 2024 12:00:52 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10179145A11;
	Mon, 16 Dec 2024 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734350452; cv=none; b=X/K7EPeySaC8F+T+u7CJnfutuyWDg4FuUYbuNPQzzgWShQAKfnT8LIGF3ZIQZ8Lo20tMG+nW4VQny6EAjtT9UEDo3y8hY6quPERuWOnxsMH5FahNuEDhalJVVXzu+Ffs5xcUm1kuJowQLVHXTK1KuHWk0kMmbnhsxXDe4CC7+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734350452; c=relaxed/simple;
	bh=e2ux6iDG2bxleQugJ9VXT+2yKT0Jf8M1XDcLpdJn4qM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f8GkI8KzFt9hNA1yB5kjhc9SIWKmvc29hb+62ZpTv1mz544u5KKgbWtz2mRqs59XRRGWGl83C/XmnoxjbbYos0Cv0wT9zi9UIyYP1RR7/VrhxGJcKkhLJUWtb5F3pw0Wy7u/graUNnEg6sl+OcAukf0fYyZph4JyR11SPdcdOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: FSvM8t14SUKI6/uxtO1WqA==
X-CSE-MsgGUID: SZZJnxgUQZehofuBubjMFA==
X-IronPort-AV: E=Sophos;i="6.12,238,1728918000"; 
   d="scan'208";a="227994658"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2024 21:00:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1D7F0427160F;
	Mon, 16 Dec 2024 21:00:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3E RIIC support
Date: Mon, 16 Dec 2024 12:00:22 +0000
Message-ID: <20241216120029.143944-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the I2C Bus Interface (RIIC) found in the Renesas
RZ/G3E (R9A09G047) SoC. This IP is compatible with Renesas RZ/V2H
(R9A09G057) RIIC IP.

Note:
This patch series depend on [1] for clk and [2] for soc dtsi

[1] https://lore.kernel.org/all/20241213123550.289193-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20241213173901.599226-7-biju.das.jz@bp.renesas.com/#t

Biju Das (3):
  dt-bindings: i2c: renesas,riic: Document the R9A09G047 support
  clk: renesas: r9a09g047: Add I2C clocks/resets
  arm64: dts: renesas: r9a09g047: Add I2C nodes

 .../devicetree/bindings/i2c/renesas,riic.yaml |   4 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 189 ++++++++++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  32 +++
 3 files changed, 224 insertions(+), 1 deletion(-)

-- 
2.43.0


