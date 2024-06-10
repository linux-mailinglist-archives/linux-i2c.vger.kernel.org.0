Return-Path: <linux-i2c+bounces-3931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6436390197B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 05:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2456281604
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 03:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D4C63A9;
	Mon, 10 Jun 2024 03:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2WSZzKYn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66152567F
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717988416; cv=none; b=kdouCQtccJrmvZ3pes+mCEAgegEXachO+XUm0VxmW+V9IOLu6fh0zNusuhfK7jbPj00RzzEQ+mcgf2Z2s094T51uCagq0xs7NT7CqBpOHfw+EypiQdeoqg+rxrKXUFfxfe0Vs+/q1GIwvlaVt3Q2fLfDRVIKRsHxghA9n1nAB7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717988416; c=relaxed/simple;
	bh=JBE8Qvx2tLc2VESDiLHFiRm2/e6IstkwnJOuvSA3CgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IWsgjtEwAmUP04rnArvYBC8Cik21nmXf9arNk9iH+5XdCca6orULcwkFRAWABK8sPnDpu1mZSYbBC09Cy3wr2FAkGUzKxs49DUSynNcZQeeBNi4I2qFv38ulpU07vE8dydbIamlWvJj939CN4u6HJKqAP1BjlVOsqsLL7D3RJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2WSZzKYn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B99312C04C9;
	Mon, 10 Jun 2024 15:00:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717988412;
	bh=JM7nSchUZd8IhXjFoFFdNjTVu9PbDOsZKx/1TlY2wkQ=;
	h=From:To:Cc:Subject:Date:From;
	b=2WSZzKYn4hADUPmXujSoDw6RBBTD02ZxbnBy/SsAs73hPjScDvG8P0xlZpOuifI7a
	 7SruHZJWKQJFlYrsp7jOH6BWNywTyyD3Ibc4Rw53q50aPExYNxcY7ve1EfuAS3uwNe
	 A2NQ993/Q5DBs4OSViJCvnn8n0Monmy6Hzx1xKkJSX1p62FbKvp4dRTKwtInBuXDcf
	 9hLnzBo600w4wlzPnF47ceGeqIZrwvLC70eQ1wQplUCZbbNJm2bGjGyDaYCiT6cku/
	 QHq7ig7N3jTlaK+k2dIxFk2ZratYKyzA5ouK2yg5Uw8ynB+IH3f2gXVH/2IfSwBTa7
	 CMfYEuCT8bQjg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66666c3c0000>; Mon, 10 Jun 2024 15:00:12 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 979C913EE2B;
	Mon, 10 Jun 2024 15:00:12 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 938682A2270; Mon, 10 Jun 2024 15:00:12 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: andi.shyti@kernel.org
Cc: aryan.srivastava@alliedtelesis.co.nz,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] i2c: octeon: Add block-mode r/w
Date: Mon, 10 Jun 2024 14:59:53 +1200
Message-ID: <20240610025955.2308688-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66666c3c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=O12zeXYUUaeBghiSclwA:9 a=3ZKOabzyN94A:10 a=zgiPjhLxNE0A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for block mode read/write operations on
Thunderx chips.

-Refactor common code for i2c transactions.
-Add block mode transaction functionality.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
Changes in v2:
- comment style and formatting.

Changes in v3:
- comment style and formatting.

Changes in v4:
- Refactoring common code.
- Additional comments.

Changes in v5:
- Further refactoring.
- Split refactoring into separate patch in series.
- Add more comments + details to comments.

Aryan Srivastava (2):
  i2c: octeon: refactor hlc r/w operations
  i2c: octeon: Add block-mode r/w operations

 drivers/i2c/busses/i2c-octeon-core.c     | 232 ++++++++++++++++++-----
 drivers/i2c/busses/i2c-octeon-core.h     |  14 ++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   4 +
 3 files changed, 207 insertions(+), 43 deletions(-)

--=20
2.43.2


