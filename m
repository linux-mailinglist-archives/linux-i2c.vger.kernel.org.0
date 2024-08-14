Return-Path: <linux-i2c+bounces-5406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C37B95222C
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F87B224A4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA651BBBD7;
	Wed, 14 Aug 2024 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="a3SmYcbG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768B224FA;
	Wed, 14 Aug 2024 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661272; cv=none; b=fjou2bBFqf40AFDNnFGyl/kq1YTZZNFxqpsLCPuDe/O56p5ZCEfXsLrd85cCXw26NWc2vRHky3pSJd8k78Z6vzCgadJ8zzgiwNMmugZoInO0aSzY6m+1Louq1FtPcOR5Y3z2x+IaKvUXRugcTbesToeIcovVyH//jZt7hmD5a00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661272; c=relaxed/simple;
	bh=FixFz6aYCSZJ12RhiPdmM+LsZ5Fd39C07sGtiL0fEfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCOSI8KDbGOfG7s1qSRxuFN4/uSftSdZ3xvLSEoRI7pkSemCjKdBcjofKbfvcAjYi9aZRxZd+br0zXM8aiFFUNVhhuhRB9DaeMu+x1gxnoIO9Dpi48wNUsHVYQ2u1juucEPo/g3UWIqBqwDUt2XjB8ppEwGHf4DqJloMkqeGvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=a3SmYcbG; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 0C76C413F741;
	Wed, 14 Aug 2024 14:47:43 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mail; t=
	1723661262; x=1725475663; bh=FixFz6aYCSZJ12RhiPdmM+LsZ5Fd39C07sG
	tiL0fEfo=; b=a3SmYcbGl4Gn0/aOjtd7RGw7EBYAHjdHcWBusUSO04RYGBndFcf
	g7nrAOQhl67PwJD6q84XHaDIWkJxg80+PbVpv4KIQUl2wTWifSo8isejRAwMz6fi
	LMjw9vg/y39eGDC3O2y/6Z9rH6bkKHU53aRMroX8LX6G++QfFmG+Q7kE=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3nIemSHc2WPf; Wed, 14 Aug 2024 14:47:42 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 4824A457383A;
	Wed, 14 Aug 2024 14:47:42 -0400 (EDT)
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
Subject: [PATCH v4 0/2] Add support for Congatec CGEB BIOS interface
Date: Wed, 14 Aug 2024 14:47:29 -0400
Message-ID: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
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
v4:
  * Sort includes
  * Remove GPL blurb from top of file
  * Use memremap instead of ioremap_cache, avoids sparse warning
  * Minor styling stuff
  * Relocated some static declarations into function bodies

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
 drivers/mfd/congatec-cgeb.c            | 1125 ++++++++++++++++++++++++
 include/linux/mfd/congatec-cgeb.h      |  112 +++
 include/uapi/linux/connector.h         |    4 +-
 8 files changed, 1452 insertions(+), 1 deletion(-)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c
 create mode 100644 drivers/mfd/congatec-cgeb.c
 create mode 100644 include/linux/mfd/congatec-cgeb.h

--=20
2.45.2


