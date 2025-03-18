Return-Path: <linux-i2c+bounces-9879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61376A67171
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 11:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ECEF19A23C4
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 10:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B023C207E0F;
	Tue, 18 Mar 2025 10:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BnSnSiYg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623920764C;
	Tue, 18 Mar 2025 10:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294216; cv=none; b=I8vsslW+Ky5/rtFeFgijOxsE/FWFKJ+GATY4Nf+Dy9DlpcesMW4imNUgBQkMR0Shq2BNyfNQ5CFVu7b546tw0rCCGp8pGxCuoufYfqfyF/P6E6eTbKr8jucldz4V4+LAh5bZF1TYPI1Cm+vekjwYpOW/MI6pRqQ4crTSkzlgNmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294216; c=relaxed/simple;
	bh=AqHje4qRGs/w5vfLuPRZK7NGvT/F6W9r++HnxYkpuEc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b1FfAvvEIQ+HRLlVxK6K+ac9duArQyZaO+6wjGU3T6apyDVxfRQjxPQOBnts3LpUVTiJNEjU8WJt1xf3NxXZWPzIXKPvhphe31/Ev+vgTcAd24jVBE2Brf2ELEGNBuuM8fjcqwdYzqjSL2M+Dm/8KerXfDCPOYbzyDUia0tEvv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BnSnSiYg; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaOR22567230
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 05:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742294184;
	bh=Vp66K2kpByLgHwpxXhwISpg9i9+Q2Xci3v1ydQTFy8c=;
	h=From:To:CC:Subject:Date;
	b=BnSnSiYgGeCiKqen8f69slw6sp9OCVIkuCghPXVnJ0pMktDnlTQ/bVKJy4aaGUPN9
	 SSiwBi7R4Z0QcjypykDVvGlsvcuxdmedGgq05Vmc78EPThQMSfWw7rxdy12hcmFA4x
	 XlquzkiZtzNfFi/sh4S4hwQyCwZ0M2/NCTtH0TfI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IAaO30125968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 05:36:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 05:36:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 05:36:23 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.98])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IAaM8v042159;
	Tue, 18 Mar 2025 05:36:23 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <vigneshr@ti.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <jmkrzyszt@gmail.com>,
        <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <j-choudhary@ti.com>
Subject: [PATCH 0/2] Add support for setting MUX for I2C lines
Date: Tue, 18 Mar 2025 16:06:20 +0530
Message-ID: <20250318103622.29979-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

These 2 patches add support for mux-controller for I2C lines as required
in TI SoC J721S2 for main_i2c3 instance where the I2C lines after coming
out of SoC are routed through a MUX which is controlled by WKUP_GPIO54:

______                     MUX FOR I2C
      | SOM_I2C3_SCL    __ FOR DATA AND CLK LANES
 S    |----------------|  |--------------+-------------+-----I2C3_SCL
 O    |----------------|__|------------+-|-----------+-|-----I2C3_SDA
 M    | SOM_I2C3_SDA    |              | |           | |
______|                 |              | |           | |
                        |              | |           | |
                   WKUP_GPIO0_54     __|_|__       __|_|__
                                    |       |     |       |
                                    |       |     |       |
                                    |_______|     |_______|
                                     TCA6408       PCM3168

Setting GPIO hog for WKUP_GPIO54 is not enough as I2C and TCA6408 drivers
probe before the GPIO is hogged and since the I2C lines are not actually
high, I2C transactions for PCA953X driver fail which in turns result in
deferred probe for other peripherals like audio. I2C recovers after this
failed transaction but PCA953X is not probed again.

We get the following errors:

[...]

[    1.293131] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.299971] pca953x 2-0020: using no AI
[    1.318993] pca953x 2-0020: failed writing register: -121
[    1.324599] pca953x 2-0020: probe with driver pca953x failed with error -121

[...]

[   21.191584] i2c 2-0044: deferred probe pending: i2c: supplier 2-0020 not ready
[   21.198855] platform sound: deferred probe pending: j721e-audio: devm_snd_soc_register_card() failed: -517

So add mux-control in I2C driver to defer the I2C probe till WKUP_GPIO54 is
hogged to desired state and then continue with I2C probe.

Jayesh Choudhary (2):
  dt-bindings: i2c: omap: Add mux-states property
  i2c: omap: Add support for setting mux

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  6 +++++
 drivers/i2c/busses/Kconfig                    |  1 +
 drivers/i2c/busses/i2c-omap.c                 | 22 +++++++++++++++++++
 3 files changed, 29 insertions(+)

-- 
2.34.1


