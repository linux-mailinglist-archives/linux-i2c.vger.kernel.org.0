Return-Path: <linux-i2c+bounces-2816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D5289B63E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 05:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA1F8281E04
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Apr 2024 03:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 813D45231;
	Mon,  8 Apr 2024 03:06:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD6522F
	for <linux-i2c@vger.kernel.org>; Mon,  8 Apr 2024 03:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.110.167.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712545618; cv=none; b=becDlxQ0Tz1Rc4GyICqc/kUJWS6L2uR2ey4Agh/yn10zsIFG4gT93h5rxNi+XcJFIUWQ7xYQuWOJy8M5KaSf7Zm1nviTdYm7XROMqmeTaIWHWfHG5JIjllL8+TbfPXB55TvR0ncHH4rv0C4lafcx/M4QU0r3Zcc8BPBrwsYtMWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712545618; c=relaxed/simple;
	bh=KwdKldelbRUYPqCjqVTdW3VN25LTdQMm66uSDm1zhe8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuD4EaPpbYRHUc7zsdanIN5TgWi66mI3rKPXlrjTtQLodQOK2DWOxbCY1ZGW5Im8m7VeTrRqXXocoQO0o4DmFVJPuu2POi5qlNXIvzeRG6Qve3pU2VGEoaek8k8Zu8LBtOwWtA6NPKdWeakV0p+jqP0wYEmKWEYSoeBlrtKyHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=203.110.167.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1712544890-1eb14e2b8127a00001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id e0OD8p9e8ETwHGNQ (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Mon, 08 Apr 2024 10:54:50 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 8 Apr
 2024 10:54:50 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 8 Apr 2024 10:54:49 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>, <hanshu@zhaoxin.com>
Subject: [PATCH v10 0/6] i2c: add zhaoxin i2c controller driver
Date: Mon, 8 Apr 2024 10:54:42 +0800
X-ASG-Orig-Subj: [PATCH v10 0/6] i2c: add zhaoxin i2c controller driver
Message-ID: <cover.1712479417.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306212413.1850236-1-andi.shyti@kernel.org>
References: <20240306212413.1850236-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Barracuda-Connect: ZXSHMBX1.zhaoxin.com[10.28.252.163]
X-Barracuda-Start-Time: 1712544890
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 3790
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.123213
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

v9->v10:
	* fixed style issues that were checked out by checkpatch.pl.
	* In Patch 3 in wmt_i2c_write() function, deleted the log
	  when received nack.
	* In Patch 4 in viai2c_irq_xfer() function, return 1 for
	  I2C_SMBUS_QUICK access.
	* In Patch 6 in zxi2c_get_bus_speed() function, adjusted
	  the log when firmware gives inappropriate parameters.
	Link: https://lore.kernel.org/all/20240306212413.1850236-1-andi.shyti@kernel.org/

v8->v9:
	* In Patch 1 in probe() do not return at the
	  i2c_add_adapter(), but call clk_disable_unprepare()
	  in case of failure.
	* In Patch 2 fix the conflict when i2c-wmt.c is removed.
	* In Patch 2 in wmt_i2c_probe() function, call
	  clk_disable_unprepare() in case of failure. While at
	  it, add a comment to explain the reason.
	* When renaming i2c_dev to i2c, change also the reference
	  in clk_disable_unprepare().
	Link: https://lore.kernel.org/all/20240306212413.1850236-1-andi.shyti@kernel.org/

v7->v8:
	* move per-msg handling to interrupt context
	* add private struct viai2c_zhaoxin to handle zhaoxin specific things
	* fixed some other formatting issues
	Link: https://lore.kernel.org/all/cover.1704440251.git.hanshu-oc@zhaoxin.com/

v6->v7:
	* adjust the patch sequence
	* put those renaming related patches in 1 patch file
	* rename i2c-*-plt.c to i2c-viai2c-*.c
	* Some other adjustments suggested by Andi
	For more details, see the comment in each patch please.
	Link: https://lore.kernel.org/all/cover.1703830854.git.hanshu-oc@zhaoxin.com/

v5->v6:
	* fix build warnning reported by kernel test robot.
	  Link: https://lore.kernel.org/all/202312291225.cWVt6YF9-lkp@intel.com/
	Link: https://lore.kernel.org/all/cover.1703733126.git.hanshu-oc@zhaoxin.com/

v4->v5:
	* fix 1 build error.
	  Link: https://lore.kernel.org/all/ZYx0VPVmyQhtG+B9@shikoro/1-a.txt
	Link: https://lore.kernel.org/all/cover.1703647471.git.hanshu-oc@zhaoxin.com/

v3->v4:
	* Some adjustments as suggested by Wolfram.
	* rebase patch on top of for-next branch.
	Link: https://lore.kernel.org/all/cover.1698889581.git.hanshu-oc@zhaoxin.com/

v2->v3:
	* Split the number of patches from 2 to 12. Make it easier to review.
	Link: https://lore.kernel.org/all/cover.1691999569.git.hanshu-oc@zhaoxin.com/

v1->v2:
	* Fixed some bugs I found myself.
	Link: https://lore.kernel.org/all/cover.1691030850.git.hanshu-oc@zhaoxin.com/

Old version:
	This patch has already gone through a round of reviews.
	The difference from the first round is that it reuses
	the i2c-wmt driver.
	Link: https://lore.kernel.org/all/20230614094858.317652-1-hanshu-oc@zhaoxin.com/

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Hans Hu (6):
  i2c: wmt: create wmt_i2c_init for general init
  i2c: wmt: split out common files
  i2c: wmt: rename something
  i2c: wmt: fix a bug when thread blocked
  i2c: wmt: add platform type VIAI2C_PLAT_WMT
  i2c: add zhaoxin i2c controller driver

 MAINTAINERS                             |  10 +-
 drivers/i2c/busses/Kconfig              |  10 +
 drivers/i2c/busses/Makefile             |   3 +
 drivers/i2c/busses/i2c-viai2c-common.c  | 256 ++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h  |  85 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c     | 148 +++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 298 +++++++++++++++++
 drivers/i2c/busses/i2c-wmt.c            | 421 ------------------------
 8 files changed, 809 insertions(+), 422 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

-- 
2.34.1


