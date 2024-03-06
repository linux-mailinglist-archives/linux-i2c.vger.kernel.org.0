Return-Path: <linux-i2c+bounces-2243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1DB8744C8
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 00:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0EFDB20D29
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 23:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D6A1C684;
	Wed,  6 Mar 2024 23:53:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo584.mail-out.ovh.net (7.mo584.mail-out.ovh.net [178.33.253.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBF63C8
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.253.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709769223; cv=none; b=CAfBUZ3pO3bnZj/2EMuJG1sWMHaVpvHqmryUBK+Y3YUJrln1lyVhxqLaznP0uih/unH629b3SsFoeQFgoSMCUwdFW7Zkb08IhYhyhFVa++FvzXyMr+aAxuTgfmR8z+YoLhBxSGnLT7wF0Vp74XSoRP6/2+M3pFeFfdQFEsffo8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709769223; c=relaxed/simple;
	bh=/OOGLVj0rta8U70jX8WUAv7de9IT8d7h+YisIF6Dy8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cslV1Y3Sdg8CGX3cQicLj29uhkvo+20iwiZ/GtjmPSCtZyD6GrmRKn7b5g5RbmB5fWWlywzIZDlbJ1U++DjkhuQiIe+4Ka1xLwqR82jehmwMQetWQtipWP5FJVCp4U7fZXQ0bC9r6GA+V95XDNzz+UhdXcRi46D8jq73TUbO7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.253.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.176.118])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TqlpK2xW6z1CyX
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 21:25:29 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-t4hpc (unknown [10.110.96.237])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E2EC01FDD1;
	Wed,  6 Mar 2024 21:25:27 +0000 (UTC)
Received: from etezian.org ([37.59.142.99])
	by ghost-submission-6684bf9d7b-t4hpc with ESMTPSA
	id S0i7H0ff6GUdUBIA8rjriQ
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 21:25:27 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003d40e8caf-d1d5-467a-a753-94bbc2f911f9,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>,
	linux-i2c@vger.kernel.org
Cc: wsa@kernel.org,
	cobechen@zhaoxin.com,
	hanshu@zhaoxin.com,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v9 0/6] i2c: add zhaoxin i2c controller driver
Date: Wed,  6 Mar 2024 22:24:07 +0100
Message-ID: <20240306212413.1850236-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16089391144787839559
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugddugeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeejleekkedugfeuuddvhffhgeekgeeivddtieefveejvedtgfdvhfeukedtgfeufeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

Hi Hans,

no functional change here, just fixed a rebase conflict. Patch
78c1dbed3652 ("i2c: wmt: Fix an error handling path in
wmt_i2c_probe()") from Christophe Jaillet is a fix that has
created some conflict with your series.

My work here is just to adapt your series to this change.

Check the changelog for more details. The little adaptation are
limited to patch 1, 2 and 3. The other patches don't have any
change.

The series has been applied in i2c/i2c-host-next[*].

Thanks,
Andi

PS I was almost tempted to fix the checkpatch notes, but we have
a deal on that ;-)

PPS I'm keeping your e-mail structure and sending the series as
reply to your PATCH 0 of v8.

[*] git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

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
 drivers/i2c/busses/i2c-viai2c-common.c  | 250 ++++++++++++++
 drivers/i2c/busses/i2c-viai2c-common.h  |  85 +++++
 drivers/i2c/busses/i2c-viai2c-wmt.c     | 148 +++++++++
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 299 +++++++++++++++++
 drivers/i2c/busses/i2c-wmt.c            | 421 ------------------------
 8 files changed, 804 insertions(+), 422 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-common.h
 create mode 100644 drivers/i2c/busses/i2c-viai2c-wmt.c
 create mode 100644 drivers/i2c/busses/i2c-viai2c-zhaoxin.c
 delete mode 100644 drivers/i2c/busses/i2c-wmt.c

-- 
2.43.0


