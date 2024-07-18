Return-Path: <linux-i2c+bounces-5014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97F9345BA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83FC1F22734
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 01:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5CE1D556;
	Thu, 18 Jul 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="GeRia4gf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F2620;
	Thu, 18 Jul 2024 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721265924; cv=none; b=lP4eWh6EopfSwac0xAUlK3E19Hvk84gG3enCBfkyhdefvZjEqpxy+JJj1wbLt0nNdcAQzGP5Lz4U1Jty7EGdCsIrFWn0opLypf6VfOzqbyhZpw1fN+3tV35yL2Pwy+fVT2NJ+7BpiEdWvpFna3Yc3twEqxBD3SwjD9sn5A8Mto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721265924; c=relaxed/simple;
	bh=v8HKLxZhttVWIKwfX3YLMwdxEeFHIhN6tGV6+ffqnkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hM2hySIN9SoQNkFBowLdHBPbFtnlaSuICsFdY4VCLxWm/MysEblTmcQ15fa2+g1bBhfOWcEMGsXsCuT0yj6teJBs6QPID2XbT9s5x/+gQ2w/9u5CtoFiWa2wNfKkA37c4pfeY5jAbQsp4aTxey616xt6P3VVfVCL/4g9bFBdbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=GeRia4gf; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 8766D40D7C73;
	Wed, 17 Jul 2024 21:16:15 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1721265375; x=1723079776; bh=v8HKLxZhttVWIKwfX3YLMwdxEeFHIhN6tGV
	6+ffqnkA=; b=GeRia4gf2FpaBGScjBzdklKWjeJ65+Rkp+8usRfxovneRdsy991
	hKyTuXRYT8coMSEzWJQDdsSRw0lh81GfeCFY54GlzEWnN6NuXchrftWfQJpXKEkf
	GrfmgatIWCvPwkfFqg+BTXOOWvnIHLGKdCBPB4m/hKUmvjIKV7S4oYj0=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3CWXBX-cJRGP; Wed, 17 Jul 2024 21:16:15 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 0890145735E9;
	Wed, 17 Jul 2024 21:16:15 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	linux-mm@kvack.org,
	lee@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH 0/3] Add support for Congatec CGEB BIOS interface
Date: Wed, 17 Jul 2024 21:15:01 -0400
Message-ID: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The following series adds support for the Congatec CGEB interface
found on some Congatec x86 boards. The CGEB interface is a BIOS
interface which provides access to onboard peripherals like I2C
busses and watchdogs. It works by mapping BIOS code and searching
for magic values which specify the entry points to the CGEB call.
The CGEB call is an API provided by the BIOS which provides access
to the functions in an ioctl like fashion.

This series is based on the excellent work of Sascha Hauer and
Christian Gmeiner. You can find their original work here:

http://patchwork.ozlabs.org/patch/219756/
http://patchwork.ozlabs.org/patch/219755/
http://patchwork.ozlabs.org/patch/219757/

http://patchwork.ozlabs.org/patch/483262/
http://patchwork.ozlabs.org/patch/483264/
http://patchwork.ozlabs.org/patch/483261/
http://patchwork.ozlabs.org/patch/483263/

Mary Strodl (1):
  mm: vmalloc: export __vmalloc_node_range

Sascha Hauer (2):
  x86: Add basic support for the Congatec CGEB BIOS interface
  i2c: Add Congatec CGEB I2C driver

 drivers/i2c/busses/Kconfig             |   7 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-congatec-cgeb.c | 187 ++++++++
 drivers/mfd/Kconfig                    |  10 +
 drivers/mfd/Makefile                   |   1 +
 drivers/mfd/congatec-cgeb.c            | 620 +++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h      | 105 +++++
 mm/vmalloc.c                           |   1 +
 8 files changed, 932 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c
 create mode 100644 drivers/mfd/congatec-cgeb.c
 create mode 100644 include/linux/mfd/congatec-cgeb.h

--=20
2.45.2


