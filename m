Return-Path: <linux-i2c+bounces-13820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD83C0BDA7
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 06:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8023A3B4AAA
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 05:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2B82D46CE;
	Mon, 27 Oct 2025 05:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="tOeFrQfk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E3200BAE;
	Mon, 27 Oct 2025 05:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544105; cv=none; b=YkeNPaMgDSNHaLXuSKtwVRIqZy82sdqZO1N9qjg/UA45sroAwVV+fJNpzKKnrqL0/jBWXM8hf/4OKT1b9k/sOCt8LCHFBP4WD/CHw8vnjI4Rvu8T2rI0fWZarYGmnhkXSj2BQ0+W+1cXNLZdzO4gTyDWpxVQg/uluKmJRebW82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544105; c=relaxed/simple;
	bh=96aC389yABIKi820ambhl0cjJ7tBBL4EZCK0/odqlGk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dVXHHXCNGsiJjRZipVT+ZwEs3b9SU634lZmyaqngU5EbWISC3nsY/0uGbUw4/CdYO1IfBHtCKh1dFHCotbYPUUd2qgUVsW1ounVi2dClmEkpRb2PToiL49ahyIczXkTuZRaXsUVdp8PIdSCzYilRuJ2a0oaWExKxhe16xXfb6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=tOeFrQfk; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761544096;
	bh=WfFn7N0mc1wHwAiznNZBnReSRfRT2Yj3MVPqoP4mDEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=tOeFrQfkDzo+mH1IhEPC8RHikgfnxJZSt1YUlDmm20f/rwcwj6Y1lR0DyyxVJ3s0X
	 am4T2T8vs1kZgAAyw7y8aXHWVt4vJD/52gJt/kcnnaTSj+rP8/zrUvq1h5DHEzPy02
	 rFlgCQUxlBsXFHGgwkwnWMixIJykkrIJsfknWfU4=
X-QQ-mid: esmtpsz19t1761544091tcb13cbc9
X-QQ-Originating-IP: E90Q48vY5pZc+ZER2E/GzZ66qCzJUQPL0AnAd+/lUTM=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 13:48:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13782442783455841640
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Date: Mon, 27 Oct 2025 13:48:04 +0800
Message-Id: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJQH/2gC/13MQQ6CMBCF4auQWTukU8WgK+9hWEA7wERpSYsEQ
 7i7lcSNy/8l71shchCOcM1WCDxLFO9S6EMGpq9dxyg2NWilC1KacCR8GO9a6bCVBc9WN8XFqmN
 TtpBOY+A07+C9St1LnHx47/5M3/VH6X9qJiQ0dNK2IKZGlbenuNeSx7E2PMiUGz9AtW3bB4We5
 YO1AAAA
X-Change-ID: 20251021-p1-kconfig-fix-6d2b59d03b8f
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761544088; l=1382;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=96aC389yABIKi820ambhl0cjJ7tBBL4EZCK0/odqlGk=;
 b=97JBHNALbGENyElZmpwiUy7eXNO28dNsBJA/+Ag4XaDhraAr701WQkmJKN7Vllq7Csxl/CdT9
 NjjCaUwfPUtDen7qvUf1el9pqUmYK0i3xVkY9dndhMapSAoKv97Y1Zq
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NH+njjzUOij/ZIe26MRjOqDHhwRGRs5beEL7fs8Mpqwe88D5etDoDb4Q
	GGTeyzIZPV02d7wrEGRPDafKYL95xhER6EE1lu5XMdR/ympZPol9vBBu+nS56a+fbRssU/r
	oRR3hYuhH1nQBBpg+1CEMXzriAgVL3Cm0N6qhQbBPe8KFdseyqJCK8E2LZJLic5CtZhGZid
	r1H/bXcCQLOTYrEN+vp3aMkftLGhrvMJHKms6t3jF+vhXxdYEkdaKrTJPyc7223bU/JJv0R
	XMVUk5bcCtVVOpmt1gSJAvcaDbgc/haR6jk22yoJzPOoFXVYCLOm8Gc2/Nula0ev1xqkdb1
	aMIEqdII+nOju1sNLxY87OgdDlHGMB2WjU/3h2nY/SvWyIn8jc8VL+WEWnoNsP8to7yezOb
	TdkQzcWo01flJybgIiHTsKSVEuCaT8KmfdvjqnJdg4Mu5PabyPozXqZj165k+BZDHGNdPkN
	9OUV3SzRz079f/vXrD5NKdjL35ku1xqBg2Pa1yqgHDppvZE0aEaJU2kCxIH9ehipoMUshjX
	wf5R4lEM6gOHAOGv0dwAeR2VvRvBgt8Hn1SHnRwht8cBLoQ2VBgnkNYlqN5jfZFhu3tNN45
	XuzT/4a8VarpvWGvrZCAgBIXB84GaXhDIntKe12tvQDdYp3dXKEweTZz2ZyLyesyrSSsPdV
	1oSvmbKfNABXuG99YhD19MIbsb0uOyB7OpSTlcNOF8tM99N55pGoNKdzVS3N+DGWUMfByue
	48fHfdXgK5bWV89FnLLPW4lLWskZ+vF2VEJjkV3k/BGuNHmIulw4G6XsfMVtZJnI+QypLGe
	RvhPioX9itTrYG1T7ZnzlbLV7vlPqV08tpCL1xtl1iSL/x8wBlqeHbYAGy+gnIJRv8YphgX
	R+MOX3ijvKDORaOFNuzcOxrnTjH7bRLaSBE47Yv71Dt+/4nZMsUXbNI5D7PHd8Kz0LrARrE
	I4C34QMLUh40R+Xz3lX6qhSj037UdoP4mzMQ3VEQe3fzSViLNBrrQ4/4zcdY2mXtSDGU+MG
	718jxQf62AKvOgnEt2zP0cRpu0h2yrM6apUJkTnNXQR2nim7uFhzM8kNKVW2WL8qrnm7MgR
	uLJ9B3bkc21mc9vOI4QsJfDzAAx3X8qz8pCR22rMr/YtETBpjmzAJbEtZizZeF/6NKkMZ75
	u4/jP4JiUhSphZT3qwI439r56g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
merged, the driver would fail [1] when COMMON_CLK was not selected.

This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
patch has reverted by maintainer [2]). In addition, the Kconfig for
P1's two subdevices, regulator and RTC, has been updated to use
'depends on MFD_SPACEMIT_P1' instead of 'select'.

Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (4):
      mfd: simple-mfd-i2c: remove select I2C_K1
      i2c: spacemit: configure ILCR for accurate SCL frequency
      rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      regulator: spacemit: MFD_SPACEMIT_P1 as dependencies

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
 drivers/mfd/Kconfig         |   1 -
 drivers/regulator/Kconfig   |   3 +-
 drivers/rtc/Kconfig         |   2 +-
 5 files changed, 148 insertions(+), 19 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251021-p1-kconfig-fix-6d2b59d03b8f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


