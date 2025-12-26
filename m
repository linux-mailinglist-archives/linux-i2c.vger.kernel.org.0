Return-Path: <linux-i2c+bounces-14784-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7EECDE7F2
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 09:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D88253007C91
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 08:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AB3313276;
	Fri, 26 Dec 2025 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JaysVk8M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F494188CC9;
	Fri, 26 Dec 2025 08:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766738009; cv=none; b=T4ehfOYgsgvgUJh/u2txg3n+cKklWbZYYr/1WWnXY1D6W+ROZzcwt77IbLCPQYjbfJf6vzl/q3C9/cdUSrvkJLeSAt1fq7BpXzu55mu3qx6/0aykacseTIoUEbCxYrdxRDa4fIOTPEgIvop7Q/4su997MFB7+aC8WesNkD2BTfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766738009; c=relaxed/simple;
	bh=QdK+ioxJYZOUfej9gZ6o7Vdbqq5r1P+ouqs79rCNmWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FMwKLE/D5LYTYPcdRHD98eRnxwGq0UiucnlHZ+ol5hbpvnzIkPdW8SyBxlGJeBtev/vLJdRweuVhKY+bcZqLOVDzj8mGfw3Cd61OlQ50I4CwlX15X0ZgW4ZotZZuKssg3+1hKVUa+LsFZVBnmlhymufALg7v9MEXfweMFGn9j5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JaysVk8M; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766737934;
	bh=WjnZoQgubG/w/UFsn+p1ZQ0l/F3FJ/kjz4hHUkUfm/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=JaysVk8Mm82dWkf7n1f83dOVCz4zdftaHq7wsMZ6uJxRbi0RnQPpLXA5bpl/gM3qy
	 3FxMtu031luaFMl9JDEvO4ZeTqOpuFyG8wmU2PyiGS/mT6AZUMBdT4TnTZhjuvxig2
	 aotDqBVq1/ST9Pjv+GYS1neJNqU8aliIF4/AgRN8=
X-QQ-mid: zesmtpsz4t1766737926t9cb7b6e4
X-QQ-Originating-IP: dIxHJoTdAeMTTH62ybgH7z40gRrrQjFbaucAFSflfcc=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 16:32:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15364710950003848342
EX-QQ-RecipientCnt: 8
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v5 0/3] i2c: spacemit: improve clock handling and cleanups
Date: Fri, 26 Dec 2025 16:31:58 +0800
Message-Id: <20251226-k1-i2c-ilcr-v5-0-b5807b7dd0e6@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5HTmkC/23MQQ6CMBCF4auQWTukrSWIK+9hWOB0kIlASYsEQ
 7i7lbXL/yXv2yByEI5wzTYIvEgUP6YoThlQ14xPRnGpwShTaKVLfGkUQyg9BaTKXFyh2KqyhfS
 YAreyHtq9Tt1JnH34HPhif+t/Z7GokdnZSp2Z3KO69TK+1zxODfEgc05+gHrf9y+6t77+rwAAA
 A==
X-Change-ID: 20251017-k1-i2c-ilcr-c928d50e407f
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766737924; l=1266;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=QdK+ioxJYZOUfej9gZ6o7Vdbqq5r1P+ouqs79rCNmWw=;
 b=Z2YbsHsGXTjvGiUgFaKcZIEAaaoI3oEua0YOdPQ81oSVXRyS0IsMh1JF0Kpo3kHHxOHZLLL6E
 uEkvnDWJW1fB8MZd58RPoZ87d+JG7ZTuoTkV6SWBIX09Wz6Ye78bi2/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBVtUtvshiqcoOH0IeVbbJEivhw42zcHa+Pu5w/4dQj4s5Fo3yW57xxt
	ltRSItltj36/aaGl34ye5FHAPs1HbDu97V3C7l+E6H/VD+U+ob4nSleFSdhH0F7yaQcmy78
	OVvhh3vTmqUDDutmnGkHwaIekSfkI1eL6uKHeceBRI1KueZn4YFfXS3TQkJTmGQH6yGilpG
	q6okbdSw/URr3BQGcKb45/3wgAEX56nSCEv6LHZsM4CWnOUorLK+ZFp+enY7CWjFKu3PkaO
	hbFnFYfRrclWhdMoVpJiI1tsexELEGt63R7kIo5Cqo3QgX7DTx421ugb7R4qSpdcIZurRfv
	G6x6Va0O0+J3itjJPuWV/iUl2/lrl/ilioETEbVVBpsWJAMmC8mztItqCIEyNNKU/NggyeK
	XlziZGntFydEkt9byTFNbISGw4vc/Q21pvlWMhH5WxBCR91ipTwAYdSFLmx274ps+0CEGo5
	6LkBuEqfOQcCk6w9oRL02EnaZS+8T6ol2HCyt/IljCDdh113BCzXOwBLUBRyVnAV3yIubfB
	DYUnS4XpPVkpWcSO/xusDdMHBNWKjHRZQcXu0lsge1WFu+XmpM9bLhue6Rb5gf41JPFYaWM
	1s6vuWGSEJTdVDuJ7G2ejwfXdrZyVE3ehXraopdsM1ChnAvyNmcv6JUlO9tfKybhgqOX6SM
	CSothzQ/pQbFdc2KHHPFuBT5AU0xcGBfiRpaHSL5S/fApUs4bgNcU2w9VGwfyRp9YeuM/rF
	xo/zje6b06pBCx/6YrkRSXWXNTpOyckAbHlDG3lx0brqLOD54DsJswpwlYTrMnX9q6XOXun
	ACQo5dFM5CU8sJ7Po6McOWBObMPe33OQ3TO/LW6tAw77meK+ChvyoUGqH2uSmq/XfcQEJ6F
	AMAdZLDBk5krdsuaRcLqzHrSRsr0cxAOQug9MITRFuw+2pZlagrBVdWN9e/4exai8x641M3
	3/GF0xiZDUyfoxeQnwEcrb+HbCFX4/taqTrY8B0Bm1uM1qW9pkcR8FsnrL8xQqT6Lmlpvz+
	Hv30jmClAzlgtlBLk13SM7NwkejgvARGNg9sCS4R7W1f2wKGvb8R01VWrzEjkIH8MskWWWz
	pRnaB4Z1gYbGm1AjS0tDxcTcxSOrC44uWO6e+aIVzaij1bLpn+133KPsKy1Nz+SaD+dTs2h
	Bx7Uh06H2Q9yibItmGma3T3u/g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

This patch series contains a set of small improvements and cleanups for
the SpacemiT I2C controller driver.

The main change in this series is to improve SCL frequency accuracy by
configuring the ILCR register based on the requested clock rate, rather
than relying on the hardware reset defaults.

The ILCR is exposed as a managed clock via the Common Clock Framework,
allowing the driver to program appropriate divider values for standard
and fast modes.

In addition, the series removes a spurious warning when the optional
clock-frequency DT property is absent, and performs minor whitespace
cleanup in the driver source.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      i2c: spacemit: drop useless spaces
      i2c: spacemit: configure ILCR for accurate SCL frequency
      i2c: spacemit: drop warning when clock-frequency property is absent

 drivers/i2c/busses/Kconfig  |   2 +-
 drivers/i2c/busses/i2c-k1.c | 162 +++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 146 insertions(+), 18 deletions(-)
---
base-commit: 138e17a35265a036c4cbf7d4a6afcaf69e5d8b2e
change-id: 20251017-k1-i2c-ilcr-c928d50e407f

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


