Return-Path: <linux-i2c+bounces-5100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B0945057
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 18:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78F9FB2A0E0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881151B4C34;
	Thu,  1 Aug 2024 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="PoVx96se"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7E13D251;
	Thu,  1 Aug 2024 16:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528919; cv=none; b=mWd9RkCYljEw2ggFIWrcro+aGdb1suSTtBATup31bSQGHccGa49ZO8LKB5z1kEl7XO3JRBE0CRQWY8k8UIsKwrJB8jdl8PbVXdq/RqY/KSy+TsgHstVnfRpuqdLHLHzKRJX0gLEA04sgXLRabl8it9yKyx/i+wMzTdz0oVaRHps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528919; c=relaxed/simple;
	bh=/8nriejmXzDzWVmm/IlmiLk0ggY6nmt4tGPeWk9wNsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CcRdqswZhgVdqJktZc1qxMEBbXR1QdqLA/HKuXWkHVB6iWtLC7rcvqCxIVwWoiV4WTzkppIMRX4dU9hiGkriFB6iYp1lv6Rx2cAzftnoVLJEd5S2Qak8j5NFIU2Lv9IrPFQWyhd7xPvK10wW/2YfZ9ytFY6yRwNTt98kq6uoHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=PoVx96se; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 62D5C456D91E;
	Thu,  1 Aug 2024 12:06:23 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1722528382; x=1724342783; bh=/8nriejmXzDzWVmm/IlmiLk0ggY6nmt4tGP
	eWk9wNsE=; b=PoVx96se74RXOXibEBplzKOSXOOmf51PNbVy6gTdW38BwRj4xSE
	+xN9S9FtKdp3kD73nLjy3lW/frcR+fZiFe0qzLn1xlDSPnIWjIK2IeRjOhK+V2t0
	4Gx/vAhZf59DB4xpY2pS3rAZjUTJ1n8mPV5QSdMr4DbibUf9LV64hE/Q=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZLVFkvNF_GIA; Thu,  1 Aug 2024 12:06:22 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id AD7EB457328D;
	Thu,  1 Aug 2024 12:06:22 -0400 (EDT)
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
Subject: [PATCH v2 0/2] Add support for Congatec CGEB BIOS interface
Date: Thu,  1 Aug 2024 12:06:08 -0400
Message-ID: <20240801160610.101859-1-mstrodl@csh.rit.edu>
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

At the request of some folks last time this series went out, CGEB
now has a userspace component which runs the x86 blob (rather than
running it directly in the kernel), which sends requests back and
forth using the cn_netlink API.

You can find a reference implementation of the userspace helper here:
https://github.com/Mstrodl/cgeb-helper

I didn't get an answer when I asked where the userspace component
should live, so I didn't put a ton of work into getting the helper
up to snuff since similar userspace helpers (like v86d) are not
in-tree. If folks would like the helper in-tree, that's fine too.

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
  x86: Add basic support for the Congatec CGEB BIOS interface

Sascha Hauer (1):
  i2c: Add Congatec CGEB I2C driver

 drivers/i2c/busses/Kconfig             |    7 +
 drivers/i2c/busses/Makefile            |    1 +
 drivers/i2c/busses/i2c-congatec-cgeb.c |  189 ++++
 drivers/mfd/Kconfig                    |   10 +
 drivers/mfd/Makefile                   |    1 +
 drivers/mfd/congatec-cgeb.c            | 1139 ++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h      |  111 +++
 include/uapi/linux/connector.h         |    4 +-
 8 files changed, 1461 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c
 create mode 100644 drivers/mfd/congatec-cgeb.c
 create mode 100644 include/linux/mfd/congatec-cgeb.h

--=20
2.45.2


