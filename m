Return-Path: <linux-i2c+bounces-7000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AA99868E0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 00:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B912B22BFA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BD316DEDF;
	Wed, 25 Sep 2024 22:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="hrLLV57n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4265158DC3
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301612; cv=none; b=B2TSYHZm4fKWZ0DCnEPuzPdzrK1JxvuFlG7TRvGBi2kmo9EV0U+w/rdS++UvpssOK8SfIycmsd8AG0gUuiKsg/ToatCIx7/StGWPAItnZbmdAq0sxnb1vvvLKX0l6KplLK8B98WsUhlueAMgUG/OFbJ5vNXhbeHWgNzKoRs00hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301612; c=relaxed/simple;
	bh=19Zs19igwwTsRGrW+qSDylhuecdiuTJmIxRPpqgQ34g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lKAIG2miElLN0rYzgV/88UtZ+B/RS+lCHogITKe3J11ziAHEAXf5ux8fAOjHQSIcQrbzQpU0YAG4Xu65pE0h4pP8973KjNkqVHm07Fhn97rzyamFpqyh8x+lbGDSLjzaJ+faK8zx2bxiw3zq4s69duJ+55VK9vndAtvs/+SJZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=hrLLV57n; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7EEEC2C035A;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727301602;
	bh=xp0rMPwXL9MRqFT9Vuzo1/tmgEzpG+feYWJ8UxT0M/o=;
	h=From:To:Cc:Subject:Date:From;
	b=hrLLV57nthwbrWRmx8OZtAP+n2fMdx8JO+L9HXov/ZCqDOex8wdPYRLxAT7e3dVu8
	 Xuto5EE1RB81KGGeaZm6sWphMzs1USFid1HNK1Ze/C1ry8xa9hs++eerfgReyIvanU
	 AB89E9Wd+U9wink7fRI2yU0iBDRLglcP5cEfS9CEaDn76QiDkv1Mk3VOPAjr+v/xKp
	 yLIlOekqGEUENI1btiG660+65bNz0ub+69dvarm4ZwME+6BwGWjG/X4qu/1mqiNiWB
	 IkHfg06BVASL0mdESOecjP4gUGTpIb1n7j3vJ9W3KX4EypNAWakk5OTVM7jzMWBSf+
	 JhOnIrV4Wry+Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f487e20000>; Thu, 26 Sep 2024 10:00:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0AC0313EE36;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 05413280532; Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 0/6] RTL9300 support for reboot and i2c
Date: Thu, 26 Sep 2024 09:58:41 +1200
Message-ID: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f487e2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=bFzpBXSQfSLquZs-7NAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

As requested I've combined my two series into a single one to provide som=
e
better context for reviewers. I'm not sure which trees the patches should=
 go in
via. The first two are reasonably independent and could go in via linux-p=
m. I
guess technically the last one could go via linux-i2c but it needs the an=
d the
bindings/dts updates which would probably make sense to come via linux-mi=
ps.

--
2.46.1

Chris Packham (6):
  dt-bindings: reset: syscon-reboot: Add reg property
  power: reset: syscon-reboot: Accept reg property
  dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
  mips: dts: realtek: Add syscon-reboot node
  mips: dts: realtek: Add I2C controllers
  i2c: Add driver for the RTL9300 I2C controller

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     |  98 ++++
 .../bindings/mfd/realtek,rtl9300-switch.yaml  | 115 +++++
 .../bindings/power/reset/syscon-reboot.yaml   |  11 +-
 MAINTAINERS                                   |   7 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |   2 +-
 arch/mips/boot/dts/realtek/rtl9302c.dtsi      |  15 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  29 ++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rtl9300.c              | 422 ++++++++++++++++++
 drivers/power/reset/syscon-reboot.c           |   3 +-
 11 files changed, 710 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9300=
-switch.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.46.2


