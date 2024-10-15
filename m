Return-Path: <linux-i2c+bounces-7409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26F99FBDE
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 01:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A12AB2340F
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 23:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE041D63F5;
	Tue, 15 Oct 2024 22:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="FLPpWC5o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6781D63EB
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729033197; cv=none; b=RDxRPiam0bKRLEfqQwKlgiMhXJqZTZDS3BvP7X0ZQ4feIESEyIo9ppA9yAdfVEVA+lnOLcUObCGCWccRUsYflbz5EFN4ictmyxoTUNWTbL68o6fkhsH4GJddhVEk+tADFrCDxrECv+0yFNnp2Zck3FL978G+UAkq/iP3t6flJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729033197; c=relaxed/simple;
	bh=AUq+DRuI2P8P4NGN1Z3bUH0LrDdXYBWBFbLpZVuzyOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KPlL3cJXlJBmT4fqd+VnVKeCFgFXmnAg2tQX7hyK+pvtEnDYvNpCrnHzegyXr6f30dSOphlB4l+tZ86Pc950rETR60EXRxxl2l7uu4tCaVvYK+48MB0o1NMehGc5CDmuzjFLTzppV/M4FgcwMgi9bEKdnl/G6GcxKurlRAxw3Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=FLPpWC5o; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 969592C038E;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729033192;
	bh=l07QL1OSHu0TgCuTqR1/PJIa1Ihp52ojcHC70VFVMJU=;
	h=From:To:Cc:Subject:Date:From;
	b=FLPpWC5o1gn7Fm4HjNPQg5Swb4J5bdX9yDCwysNKqfxRE+QX/S7otfUbqVpr5IKvj
	 BTZG2kHYIm6EpqEoZ5XGMnFeqLrAY+dX4yiqPONIJ7RsPvh1+TXa7YmMkmJ+5LfGZe
	 xcv5PjJEvVi0vVwcnAB7mgIn7c0enORF8QiSrOyjViW1WBywSkTgwmpEq8t/CghUjU
	 jCtkLWuGS3T9/W3tNbJ4qY/2wGlLU1plFyjQ6HwCidmi64zu9Ux+QZijLwaRaMYxGr
	 bGsv23U2cJKDuqTeL8uPjvVzYdQppUAP+8QTOl8p/E/cy0pIJWUv9AHRJ0GYFThDX9
	 jheUczXP9qUVg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670ef3e80000>; Wed, 16 Oct 2024 11:59:52 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3B07013ED7B;
	Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 351802820D4; Wed, 16 Oct 2024 11:59:52 +1300 (NZDT)
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
Subject: [PATCH v6 0/6] RTL9300 support for reboot and i2c
Date: Wed, 16 Oct 2024 11:59:42 +1300
Message-ID: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670ef3e8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=bFzpBXSQfSLquZs-7NAA:9 a=3ZKOabzyN94A:10
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

 .../bindings/i2c/realtek,rtl9301-i2c.yaml     |  99 ++++
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
 11 files changed, 713 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9301=
-i2c.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9301=
-switch.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dtsi
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.47.0


