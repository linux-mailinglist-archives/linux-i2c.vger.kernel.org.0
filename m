Return-Path: <linux-i2c+bounces-1126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E33824F5B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 08:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F841F2256D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 07:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A739B20DC7;
	Fri,  5 Jan 2024 07:52:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D66F20B16
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jan 2024 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1704441110-086e230f2911770001-PT6Irj
Received: from ZXSHMBX2.zhaoxin.com (ZXSHMBX2.zhaoxin.com [10.28.252.164]) by mx1.zhaoxin.com with ESMTP id BsGNqcDFg8rNxUtp (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Fri, 05 Jan 2024 15:51:50 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX2.zhaoxin.com
 (10.28.252.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 15:51:50 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 5 Jan 2024 15:51:49 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.164
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <wsa@kernel.org>, <cobechen@zhaoxin.com>
Subject: [PATCH v7 0/6] i2c: add zhaoxin i2c controller driver
Date: Fri, 5 Jan 2024 15:51:43 +0800
X-ASG-Orig-Subj: [PATCH v7 0/6] i2c: add zhaoxin i2c controller driver
Message-ID: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
References: <cover.1703830854.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Connect: ZXSHMBX2.zhaoxin.com[10.28.252.164]
X-Barracuda-Start-Time: 1704441110
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 2601
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.119008
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

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
	Compared with the first round, the main difference of this
	round of patch is the use of i2c-wmt driver.
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
 drivers/i2c/busses/i2c-viai2c-common.c  | 267 +++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h  |  81 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c     | 143 ++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 282 ++++++++++++++++
 drivers/i2c/busses/i2c-wmt.c            | 417 ------------------------
 8 files changed, 795 insertions(+), 418 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

-- 
2.34.1


