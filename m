Return-Path: <linux-i2c+bounces-11358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF1AD536A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 13:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4491D1C24647
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Jun 2025 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E04525BEFB;
	Wed, 11 Jun 2025 11:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DVRxKKgj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B58E184;
	Wed, 11 Jun 2025 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640087; cv=none; b=cloHWJDwbj8LBnjPbRC1uxGSslPJuNhL9Fqe4A/eEvBemqxmwxjx/P7lpqLsUCDcwRJ3/z6LWaheJvO2tpPEGQjTtrX3uXYj+DoIHckhmZ5owlWJDQuFT0lLueh0ACvSIleWLBe9KSmvY8Oqam8VbRlvujwihGTjeEIgrviCS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640087; c=relaxed/simple;
	bh=/xBjPL/xGn4SpJ0kMI0oUuAtTggcop7AzvAQx8nzDEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUf6bWZRc/18QgWe8oNOackBv4PocWmeOHkqxxay4shzAkO9MO91/ehvslD1p9doY/mQmLHB7RJygCV41IXmeQ9zFsI2WlQdQgveki1Pk5QKufzb3rZduwmVoQUQiaJ+QehXzfAoVPLV/02VowxahBLm7L95FVi9DnhPA6AExtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DVRxKKgj; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640083;
	bh=/xBjPL/xGn4SpJ0kMI0oUuAtTggcop7AzvAQx8nzDEE=;
	h=From:To:Cc:Subject:Date:From;
	b=DVRxKKgjCYzZW5IGdrBD3dFdWi2lJr1Do5BFXYmFzY8FENT6+SiswcLtaSfgrWUpm
	 ij66oinROpTyHf+x0xkFwwFPEjFCvNB6Y9M9nCgNjWUupd062WkkrrSp/LTfHE211f
	 DtTtUNHh4lz1QGkpioI/b4R0icccl5Ocir0JmJhic6vbbadtF5fvvPClkn196aMa8t
	 G3ESDfJWDnJdf5SB4NRc74oohyLDm0Tvln+wwmXIdhKAcTmd12kVhkpvUPWpEl0rI5
	 JKegGO/uQCwEX7o+SpALAjZeEA6Ccd72ob+LC3pWiNkBXblHtZ32WNeseNE6I1Er3F
	 ebKGRyNJJhAYQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF64717E0536;
	Wed, 11 Jun 2025 13:08:02 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: devicetree@vger.kernel.org
Cc: qii.wang@mediatek.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-serial@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/3] Add MT8196 compatibles to bindings
Date: Wed, 11 Jun 2025 13:07:57 +0200
Message-ID: <20250611110800.458164-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds compatibles for MT8196 (Chromebooks) and MT6991
(Smartphones) for HW that is fully compatible with older SoCs.

AngeloGioacchino Del Regno (3):
  dt-bindings: timer: mediatek,timer: Add MediaTek MT8196 compatible
  dt-bindings: serial: mediatek,uart: Add compatible for MT8196
  dt-bindings: i2c: i2c-mt65xx: Add MediaTek MT8196/6991 compatibles

 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml       | 5 +++++
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 3 files changed, 7 insertions(+)

-- 
2.49.0


