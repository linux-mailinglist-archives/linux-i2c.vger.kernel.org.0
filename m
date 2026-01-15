Return-Path: <linux-i2c+bounces-15192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B69E6D2523B
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 16:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B559630CDDBF
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 14:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009FD3A4F4A;
	Thu, 15 Jan 2026 14:54:45 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D95F3A0B27;
	Thu, 15 Jan 2026 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488884; cv=none; b=fVAf+eH9ZMCtldZZE7eXfKT/hsPOOu4+bG2mrR35Px52smwVLkoYW0pkFP7hetXQpMOjDq422s8e3JsNNy2fCsYKraWEssvsD3CIB77oIdX6YsryNzSWAu2fc6kKnkQk25UqbXt6n6CE9YobkFG8hVMAV+Qyri6K5FgkOCUqDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488884; c=relaxed/simple;
	bh=8lIQyKgEiLIsBqCgyScROCV7LDAF2mqaH328nAshXzQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I28rqLcxZi6GQZ+2EmBVqpe/TVsxSNFCUbLx/kHvxx5QnnEXck1QL6rtzgIv9G1TegKA5RCc5cMn46VIKOrxooO8AORm7xmL5R4S6sG+nqBUg1jr13O3ZTKir5DNQnhahfOGtlN5yK7RRT8UeGtGpvajH5/VqxMWQw2AQSCtEho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 60FEqk0v039366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:52:46 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jan 2026
 22:52:46 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 0/4] Add I2C support for QiLai SoC
Date: Thu, 15 Jan 2026 22:52:40 +0800
Message-ID: <20260115145244.435890-1-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 60FEqk0v039366

This patch set adds I2C support for QiLai SoC.

Ben Zong-You Xie (4):
  dt-bindings: i2c: add support for Andes I2C controller
  drivers: i2c: add the driver for Andes I2C controller
  MAINTAINERS: add an entry for Andes I2C driver
  riscv: dts: andes: qilai: add I2C controller

 .../bindings/i2c/andestech,atciic100.yaml     |  44 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/andes/qilai.dtsi          |   6 +
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-atciic100.c            | 353 ++++++++++++++++++
 6 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/andestech,atciic100.yaml
 create mode 100644 drivers/i2c/busses/i2c-atciic100.c

--
2.34.1

