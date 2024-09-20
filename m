Return-Path: <linux-i2c+bounces-6885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D53E97CF7D
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 02:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5793285CD1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 00:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2313214;
	Fri, 20 Sep 2024 00:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nO4MlDpB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593862566
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 00:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726790978; cv=none; b=lhNn0wzgpiT8ERTK9Quw/AuPhLXPFjQR/3WNe+2T1CtiHtSpWD97IG3SS7H9OWQwRxxodWxpSiQlwQZqG8ec8q0ctjfvtTOI3gM6QMRkAHkPAmUaDjfz746lii4S9vWbxrG4yRO6rXM/2zdbNjAgM3J2Y0LSxOaDJhzSygu8CTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726790978; c=relaxed/simple;
	bh=afm3QmADiGWyp1T69V/EAWt8PC/69gUo2yZIKgxS6yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSVdGnuAshiSlV1IiPgYYzyLnB/ruhP1t4+hQcJFKya5De+WxgqxWG8oySdcVs83zbltmGWIxsVv/rBEKogGsasJvHdee+ffMAorDyC1cIjKhjwAtEPTU3IHUj8oAUfIuk1ebh4QUnTCLYASZuYtZ8mH3jSXagXZnWZ1TaaK5qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nO4MlDpB; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D9C82C0540;
	Fri, 20 Sep 2024 12:09:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726790973;
	bh=Q0+B/UCijeX3F90J5Dywxwjt4Bpzqt74pZlYeBAMk0E=;
	h=From:To:Cc:Subject:Date:From;
	b=nO4MlDpBh1wOltYRZlRVQOG6RLS7/5ve6kJ2Xf39tiqioEHM5uz1vlpeQCkbBNGlV
	 yJ4Jmby3FxvJrDVQse7N8nYpxeCcC/oYq/sHGOevfpODU+56t1vqaPhVhOuT+D8OHJ
	 9qjk2Mox2henHDPcGg6RFFdfN6mXB9nweGScRbkDsGe78rIAi6gk5SORQUESjmA9p3
	 7ZV6okJDD5I9bhY1lbhI4yxACbCretA3+wGIo8rxrDA4ZrFfSGk4wn5W0wdSPvaSCY
	 fRTR/KXMNnVB5Amqr0qGb1Ga0W3uR41GufTzS/+5iaEC7MHcJHohg3Ui5x0muWJ0vu
	 7xNpaQCPuJ+OQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ecbd3c0000>; Fri, 20 Sep 2024 12:09:32 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id CA05C13ED56;
	Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id C3AC9280793; Fri, 20 Sep 2024 12:09:32 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/3] i2c: RTL9300 support
Date: Fri, 20 Sep 2024 12:09:27 +1200
Message-ID: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ecbd3c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=VwQbUJbxAAAA:8 a=NLm23PoBcGNys7Jou4AA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This builds on top of my in-flight series that adds the syscon node for t=
he
switch block[1]. The I2C controllers are part of that block of registers.=
 The
controller driver is adapted from openwrt. From v2 of this series I've ta=
ken
the approach suggested by Rob and represented the SDA lines as child node=
s. I
expect there will be a bit of discussion around the naming of the control=
ler
nodes (in the Realtek documentation they are referred to as I2C_MST1 and
I2C_MST2).

[1] - https://lore.kernel.org/lkml/20240920000138.1826123-1-chris.packham=
@alliedtelesis.co.nz/raw

--
2.46.1

Chris Packham (3):
  dt-bindings: i2c: Add RTL9300 I2C controller
  i2c: Add driver for the RTL9300 I2C controller
  mips: dts: realtek: Add I2C controllers

 .../bindings/i2c/realtek,rtl9300-i2c.yaml     |  82 ++++
 MAINTAINERS                                   |   7 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  18 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rtl9300.c              | 421 ++++++++++++++++++
 6 files changed, 539 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.46.1


