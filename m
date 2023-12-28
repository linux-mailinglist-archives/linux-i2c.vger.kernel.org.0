Return-Path: <linux-i2c+bounces-1029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDC81F44D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 04:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64A2283A29
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 03:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052D53D62;
	Thu, 28 Dec 2023 03:17:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx2.zhaoxin.com (mx2.zhaoxin.com [203.110.167.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313953C0B
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 03:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1703733467-1eb14e0c7f06b70001-PT6Irj
Received: from ZXSHMBX1.zhaoxin.com (ZXSHMBX1.zhaoxin.com [10.28.252.163]) by mx2.zhaoxin.com with ESMTP id yf9CLtJF5Iyyc3Uq (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Thu, 28 Dec 2023 11:17:47 +0800 (CST)
X-Barracuda-Envelope-From: HansHu-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
Received: from ZXBJMBX03.zhaoxin.com (10.29.252.7) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Dec
 2023 11:17:47 +0800
Received: from ml-HP-ProDesk-680-G4-MT.zhaoxin.com (10.28.66.68) by
 ZXBJMBX03.zhaoxin.com (10.29.252.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 28 Dec 2023 11:17:46 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.28.252.163
From: Hans Hu <hanshu-oc@zhaoxin.com>
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.7
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <andi.shyti@kernel.org>, <cobechen@zhaoxin.com>, <hanshu-oc@zhaoxin.com>
Subject: [PATCH v5 0/8] i2c: add zhaoxin i2c controller driver
Date: Thu, 28 Dec 2023 11:17:38 +0800
X-ASG-Orig-Subj: [PATCH v5 0/8] i2c: add zhaoxin i2c controller driver
Message-ID: <cover.1703733126.git.hanshu-oc@zhaoxin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
References: <cover.1703647471.git.hanshu-oc@zhaoxin.com>
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
X-Barracuda-Start-Time: 1703733467
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.36:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 1396
X-Barracuda-BRTS-Status: 0
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.118654
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

In version v4, the patch consists of 8 files.
This version is based on the latest for-next branch,
with some adjustments as suggested by Wolfram.

Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Hans Hu (8):
  i2c: wmt: create wmt_i2c_init for general init
  i2c: wmt: rename marcos with prefix WMTI2C_
  i2c: wmt: adjust line length to meet style
  i2c: wmt: split out common files
  i2c: wmt: rename with prefix VIAI2C_ and viai2c_
  i2c: wmt: fix a bug when thread blocked
  i2c: wmt: add platform type VIAI2C_PLAT_WMT
  i2c: add zhaoxin i2c controller driver

 MAINTAINERS                            |  10 +-
 drivers/i2c/busses/Kconfig             |  10 +
 drivers/i2c/busses/Makefile            |   4 +
 drivers/i2c/busses/i2c-viai2c-common.c | 278 +++++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h |  79 +++++
 drivers/i2c/busses/i2c-wmt-plt.c       | 139 +++++++++
 drivers/i2c/busses/i2c-wmt.c           | 417 -------------------------
 drivers/i2c/busses/i2c-zhaoxin-plt.c   | 298 ++++++++++++++++++
 8 files changed, 817 insertions(+), 418 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-wmt-plt.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-zhaoxin-plt.c

-- 
2.34.1


