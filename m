Return-Path: <linux-i2c+bounces-7808-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B99549BDA26
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 01:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F8E2B224B8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 00:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918871CD2C;
	Wed,  6 Nov 2024 00:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="oxrNumk8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929991DFFD
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730852325; cv=none; b=ecJAxvC6Td3L0eW+bfsM47vG9V4qgAr8aF0EK+cQV+iOH8AnC9ok5nImrQKCdP6UPJmERVzY6kqN63PMu8leZIY/z1j8J2HsfC9QEvboC64bd0rwqpndhzn8r1tgOJaG0PZ/865LKx2AESpJFlItJa4JkK/KysksHG7PDHOz7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730852325; c=relaxed/simple;
	bh=OV7rC9SGp45flkU3JH8bfIgN93uqENCybkl5c0Uws+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7AxMtZiiuVuNeeRGargbSG12C/ImUhcs7957W04U6PNbV6jQ+mZuww9/A1LZRmYz4rGe77PGrudzOIRzL+5JEZ2FsOIdbKi+yzjuznz/c0FNrsEjxOftgO3J43bFNkd2QhcMljyiPQtR3hGdFCu5WUQNwGYrnqMKMgAo3IRuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=oxrNumk8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 731FB2C0272;
	Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730852320;
	bh=8bwt52cw6rtX0LinX0KBsYgpelr6iV8WF0gRtiDgH38=;
	h=From:To:Cc:Subject:Date:From;
	b=oxrNumk8PQQ7nknNGNk2+mzCDAgFAKLs3FR2eCmbVBBtX67ENYGJ6WiqFPuwyICq4
	 XaOvMY51vmGGh3Zv4pZypfldahLTGqeUgWTrRwGt99NlfDx5qOVLbI5TDFkQ4GDdMf
	 f4AIkzLHbAeITTO35M422AJ46CGHAmBWa25CMvOcRweT0CZBgd1iz1zDzlJInXCD+H
	 oyhx0VqPMbzVWwbJSMW0cNLW9lpBvIVrLyzjB84cYWXX/DCmEPYrAfw6/6qd9yfa1T
	 mECP7ExQ7VG+ZnN+NFoTDDApza50R7LwVTQ5DPfIzXyPD7z0nKxkztU3n+gxuS4fdg
	 a07DURTp9MyUw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B672ab5e00000>; Wed, 06 Nov 2024 13:18:40 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3241B13ECC4;
	Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2D521280594; Wed,  6 Nov 2024 13:18:40 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	andi.shyti@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 0/4] RTL9300 support for reboot and i2c
Date: Wed,  6 Nov 2024 13:18:31 +1300
Message-ID: <20241106001835.2725522-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=672ab5e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=bF7ai87FHNFcyyT0DhMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The following patches from earlier rounds of this series have already bee=
n applied

- https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.=
git/commit/?h=3Dfor-next&id=3De7af7d13316dc5e2293c4f777f71bd8331f5d7a5
- https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.=
git/commit/?h=3Dfor-next&id=3Dce38cdc908557953604ffb0a91ef5ae3fbdf1c6b
- https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/co=
mmit/?h=3Di2c/i2c-host&id=3D9114f5a4e63edd5ab1ba453799da335237cfc6f1

There may be complaints from some of the automated checkers about the mfd
dt-binding patch until it shows up in the same tree as the i2c binding th=
at is
referred to.

Chris Packham (4):
  dt-bindings: mfd: Add Realtek RTL9300 switch peripherals
  mips: dts: realtek: Add syscon-reboot node
  mips: dts: realtek: Add I2C controllers
  i2c: Add driver for the RTL9300 I2C controller

 .../bindings/mfd/realtek,rtl9301-switch.yaml  | 114 +++++
 MAINTAINERS                                   |   7 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        |   2 +-
 arch/mips/boot/dts/realtek/rtl9302c.dtsi      |  15 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  29 ++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rtl9300.c              | 423 ++++++++++++++++++
 8 files changed, 600 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9301=
-switch.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.47.0


