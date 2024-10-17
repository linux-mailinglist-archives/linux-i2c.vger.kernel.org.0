Return-Path: <linux-i2c+bounces-7437-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E73839A16B6
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 02:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D3941F23A69
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 00:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCEB3FC7;
	Thu, 17 Oct 2024 00:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="o+GtQB78"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7354AD5B
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 00:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124227; cv=none; b=Hh0x2t2d1IS4Dj4WfNV77UN039QQAdqaqrDvA/ijiJ8oCz6zOMLbxXD4xjn+ntNbzmyNx7K9fp+acndkpawkvv8956KcxQmn7csVUvq9KcmEAq4ZQ75QKMKcoINvCWF+8EawkQBXni9+gQ1r/hsVYK1V4XS6iEL2p3jVqUd6tUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124227; c=relaxed/simple;
	bh=E+7u6KTQexlJ6wdE3PWO5eMFpGPF18HoZLoHSCNHy+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4A9YCWA5xi/PE1eZR9EDevLyls9GT4acSFlV8eeD+DPcMc+ebFEMxIIkcD3W801DU4PsdCiQMQ77aRRrP5DdAG9kk4+rHrGMLIb9lmoDD4SI5qhvgAZGio4U4+oU+1grf3tYPRbo4jIZQewcikYUoaak5ufJC6bmkMSWAHqDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=o+GtQB78; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9979A2C0517;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729124217;
	bh=5yDFp/uQn/srePUknm1E5IBHytrSxM87aWnogIJlLxo=;
	h=From:To:Cc:Subject:Date:From;
	b=o+GtQB78608usSf9v0Q/rYqIFcdipEpfmxCb1+pveLoF6U06tFZsuGYPz403nonXT
	 bwiiatkZheF0R5eX0vnZs16DP57bqyqx+OoDnsev1XTl3Xr31gTQlon6QgkxjZMQUk
	 PGV1PW8QP7+id/IWJYkczcGaYCOJiuV0YHEAUmpG1fAEOBbwCjMAkP8wNSaALcph0O
	 gIo9XbdYxDK3vtuAJ4PKr5COHSiyVeVM3165b799331rWHXuZqERJMUd7OoO071yO5
	 oFSCAfi+l/2O1w8zAIrs+UEuLJ/ngIbMhjt+u3vHozJn2udxO5lJ0wBwVp1b8NZ/YV
	 1nlyQCfIF9laA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671057790000>; Thu, 17 Oct 2024 13:16:57 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2E93813EE32;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 274E02807F7; Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de,
	markus.stockhausen@gmx.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 0/6] RTL9300 support for reboot and i2c
Date: Thu, 17 Oct 2024 13:16:47 +1300
Message-ID: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67105779 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=bFzpBXSQfSLquZs-7NAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

As requested I've combined my two series into a single one to provide som=
e
better context for reviewers. I'm not sure which trees the patches should=
 go in
via. The first two have already been applied by Sebastian (thanks). The b=
inding
and dts changes (patches 3-5) would make sense to go in via linux-mips wi=
th
acks from the dt maintainers and the driver itself (patch 6) can go via
linux-i2c.

--
2.46.1

Chris Packham (6):
  dt-bindings: reset: syscon-reboot: Add reg property
  power: reset: syscon-reboot: Accept reg property
  dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
  mips: dts: realtek: Add syscon-reboot node
  mips: dts: realtek: Add I2C controllers
  i2c: Add driver for the RTL9300 I2C controller

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  69 +++
 .../bindings/mfd/realtek,rtl9301-switch.yaml  | 114 +++++
 .../bindings/power/reset/syscon-reboot.yaml   |  11 +-
 MAINTAINERS                                   |   7 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |   2 +-
 arch/mips/boot/dts/realtek/rtl9302c.dtsi      |  15 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  29 ++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rtl9300.c              | 425 ++++++++++++++++++
 drivers/power/reset/syscon-reboot.c           |   3 +-
 11 files changed, 683 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301=
-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9301=
-switch.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.47.0


