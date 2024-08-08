Return-Path: <linux-i2c+bounces-5225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D474E94C47D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 20:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839AC2898A1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750E9156257;
	Thu,  8 Aug 2024 18:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="O1TwBqcV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27E9153801;
	Thu,  8 Aug 2024 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142170; cv=none; b=tIuV6Swv7NEOkbE8ww+xlt4Hy2GKZgaITnslHhZYdJzZi9eb+WKry3hRJhMq1ogLeMNwiiAym+Dt1e7GtA/VNxQ/DlLVGSt7OrhV1PKDEwkGcZFLeKnA2aJDG9tTaWH5fBoejyybT1zXN41X8bKN2WXr5bJs1U/IwYC4JQaIdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142170; c=relaxed/simple;
	bh=kCgWHc+83KGG6UfWWtFMPlYslsuSMeiP0G9EIf0zPM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSDgMmM/lTbL8OVV9Tg2RPysu4Xg/6URG3CO/OAIYkeuBMgSVJfiZiCh831XKk5sIclFFT7bwpYZq7xuq+BSw2tFxt58ehSdii5dzYLWpZmx6NjAVc7K4uj0UkyTgY5oafmOeGxrf5RDwfhg8p5JlwVGt0nksaLcx2XzTNlWPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=O1TwBqcV; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2DD2F456D905;
	Thu,  8 Aug 2024 14:36:01 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1723142160; x=1724956561; bh=kCgWHc+83KGG6UfWWtFMPlYslsuSMeiP0G9
	EIf0zPM4=; b=O1TwBqcVMW+3LfCcrxJTYKGrnXBAQ/6aJQpOWqlVApBJy7SQWGo
	TbQfutrWgCJ/w+mlTobkpofSpx4oG+D+m8+cNLUQKhdDPlQZB2es0XzPwDKP1C8Q
	TYL+tuayRgIrOr6sBk1JqFtAdJ6sfpHBVcvCq3qUgCKuhn2VS69naFMY=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LRR5fCN_yTkM; Thu,  8 Aug 2024 14:36:00 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 63894457383A;
	Thu,  8 Aug 2024 14:36:00 -0400 (EDT)
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
Subject: [PATCH v3 0/2] Add support for Congatec CGEB BIOS interface
Date: Thu,  8 Aug 2024 14:35:24 -0400
Message-ID: <20240808183527.3950120-1-mstrodl@csh.rit.edu>
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

At the request of some folks the first time I sent this series out,
CGEB has a userspace component which runs the x86 blob (rather than
running it directly in the kernel), which sends requests back and
forth using the cn_netlink API.

You can find a reference implementation of the userspace helper here:
https://github.com/Mstrodl/cgeb-helper

I didn't get an answer when I asked where the userspace component
should live, so I didn't put a ton of work into getting the helper
up to snuff since similar userspace helpers (like v86d) are not
in-tree. If folks would like the helper in-tree, that's fine too.

Changelog:
v2:
  * Moved CGEB code snippet execution into userspace
v3:
* `checkpatch` pass
  * Should I add the driver files to MAINTAINERS? I'm not sure what
    the norm is there...
* `sparse` pass
  * I'm not sure there's a good way to keep the __iomem marker
    around while not making the struct fields really inconvenient
    to access, so I just cast them away which causes a sparse
    warning. I figure it's probably okay since this driver
    is x86-specific anyways? Let me know if this is an issue and
    what the preferred approach is.=20

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

 drivers/i2c/busses/Kconfig             |   10 +
 drivers/i2c/busses/Makefile            |    1 +
 drivers/i2c/busses/i2c-congatec-cgeb.c |  190 ++++
 drivers/mfd/Kconfig                    |   10 +
 drivers/mfd/Makefile                   |    1 +
 drivers/mfd/congatec-cgeb.c            | 1138 ++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h      |  112 +++
 include/uapi/linux/connector.h         |    4 +-
 8 files changed, 1465 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c
 create mode 100644 drivers/mfd/congatec-cgeb.c
 create mode 100644 include/linux/mfd/congatec-cgeb.h

--=20
2.45.2


