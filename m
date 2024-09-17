Return-Path: <linux-i2c+bounces-6838-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7169997B61C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 01:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28DF91F21DEC
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 23:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB5A1925B8;
	Tue, 17 Sep 2024 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="afUDE771"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A518BC12
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615787; cv=none; b=S54DF6fGtws2IWb9kDvUmmhSnWK79sJ5cxsIPf3uaEYEkhkEDPngmvTp8F+WACfu4mh0j8f+cai7j8LggTprNQ17cSkSZheswZvOhFH29mfBnGOHHh49//ghP0F7ck7P5D4bzcXSWTg9EyUFyhfE694qOORae0xJkZj/gZWs2TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615787; c=relaxed/simple;
	bh=lh8NXlWYHkzkQBkbBSmavOc/t+XvaQZppmvfRiEh7vo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRbSb0f2uzRE9165e1B6mlsEQIaJWftIkrYtmwOxYkaliyA0VqiGQXq/yw7GUJM4NjZW9fHyzeEh1OzsT5nfV/yhOmZXOH9nXtQMfdYSuPI1heEfT8xHQirSz+Y9lEYkLlQBOr6Ax+o1znRd0LEZTJPex9CN7ye7tVAsBQXl6xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=afUDE771; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C886B2C03CA;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615776;
	bh=G5WX0lUDSv4/vDoftqM2mFslRvVzWTPMc8qIUnjkrcM=;
	h=From:To:Cc:Subject:Date:From;
	b=afUDE771AEAUfM3xEpWtjDLPulE1RCrlPwRtdVuQv0kFC03U8ITJMk9iBk/bSVjQI
	 5nyhDyhGc5oLdWYJoEzLhtG3HG3vPpfUHdelOeb6Tf767tKTkASRCc0fSGO4I6WtC0
	 SbfCnyyviyEb45J9HLcKxyQVIyW83g4Y7gHvsBawWcAUWAhMsU45P2I6qVUsVDB1SL
	 WG5Tm0qfEzvS/17qkwRuSB/poGTqNiNNhULfSWSfsk1yr62JA+9+CqFBhaHOgv3jVc
	 p9bI3tzZnUuCjo+UosMMAoUtmZ8KDUNdIgWDe/BE66sTrrGWcIE1vZlrXMkSSgws7T
	 HqITfia135Mtg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00000>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 79C9A13ED56;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 73BDF280B62; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
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
Subject: [PATCH 0/5] i2c: RTL9300 support
Date: Wed, 18 Sep 2024 11:29:27 +1200
Message-ID: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=VwQbUJbxAAAA:8 a=NLm23PoBcGNys7Jou4AA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

This builds on top of my in-flight series that adds the syscon node for t=
he
switch block[1]. The I2C controllers are part of that block of registers.=
 The
controller driver is adapted from openwrt, the multiplexing support is ad=
ded by
me and differs from the openwrt implementation.

[1] - https://lore.kernel.org/lkml/20240913024948.1317786-1-chris.packham=
@alliedtelesis.co.nz/

Chris Packham (5):
  dt-bindings: i2c: Add RTL9300 I2C controller
  i2c: Add driver for the RTL9300 I2C controller
  mips: dts: realtek: Add I2C controllers
  dt-bindings: i2c: Add RTL9300 I2C multiplexer
  i2c: rtl9300: Add multiplexing support

 .../bindings/i2c/realtek,rtl9300-i2c-mux.yaml |  82 +++
 .../bindings/i2c/realtek,rtl9300-i2c.yaml     |  73 +++
 MAINTAINERS                                   |   8 +
 arch/mips/boot/dts/realtek/rtl930x.dtsi       |  18 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-rtl9300.c              | 543 ++++++++++++++++++
 7 files changed, 735 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/realtek,rtl9300=
-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

--=20
2.46.1


