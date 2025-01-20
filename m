Return-Path: <linux-i2c+bounces-9135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFBA16566
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 03:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2535E16676E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 02:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B8E42A9D;
	Mon, 20 Jan 2025 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="jTXmdMBb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E22CA9
	for <linux-i2c@vger.kernel.org>; Mon, 20 Jan 2025 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737340419; cv=none; b=hSXmRVXyyRyfWV4gja0f/8rR8RLtYzgdQ/aHgANnPXjE9PSVrJhbB8Orz97h74c4kOUC267kz8Igw+buK304dIDbq5FI8qFW0MctbkLKjIukBVqaGNYj2W/l01qgAmxucvQkwDxCtKPS/mPC0K8I4/ZWYXg/0yd7DS4cA6KrGlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737340419; c=relaxed/simple;
	bh=u88EdLGOh008M3R4cLTvBfhELUVV1lDzxH41JFVfoEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JU1HtlqzHQfGi5umuklegQVKAm/IW1uaJhlDkxsJZ6CV/S5BlpL/6PTLcO2rT98EbYzOeJfXHh1Ww50ZoukGGND8D/z2zBWdl40lVsW2+VQb5TlcDB3OEw39nZ9b+E6uIT865SgKSg/oy7ZBtFhvTPNDjHYPygQL3t92Excf4yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=jTXmdMBb; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EDEA92C0824;
	Mon, 20 Jan 2025 15:33:33 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737340413;
	bh=Ad6ocpj/eLaZgojqFc05BdsW690x4k6u7weqjJh3tQc=;
	h=From:To:Cc:Subject:Date:From;
	b=jTXmdMBbvRSyaWVYPNUBAO5DKnPJS50Do+8SiHbXFm89ZAL4Z8020BPANKWxgH70J
	 cg1zf8/PkXHO8FeHj2o84u6f9KnA7fe6nGX2zK1GGdbjq7+yzxZgZPKcqMY+aFll0b
	 qw6wbHQttUOuHJUkf6H0PwSMC1MIi/IySiZMidCwA0x/UUqwU4Q1tua8i3EfaUKKWD
	 r9+E6o0mmTfkwJJzWzAKNxs99Yl/n/ob3qkKsFVJgmWq0wowalY9nM9gxNLSzvjhtk
	 iLyl6WkTTfGcrW/0msems2KOW87+sVxf1FEZ8vjoa+ftvegLXKAs+pRkzNl2AUj050
	 pR6ydxw+B/TlA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678db5fc0000>; Mon, 20 Jan 2025 15:33:32 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 7472A13EE2B;
	Mon, 20 Jan 2025 15:33:32 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 705882A1696; Mon, 20 Jan 2025 15:33:32 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v11 0/2] i2c: octeon: Add block-mode r/w
Date: Mon, 20 Jan 2025 15:33:25 +1300
Message-ID: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678db5fc a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=toHKM1xulaPNuss4LNwA:9 a=3ZKOabzyN94A:10
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

Changes in v6:
- Reword/reformat commit messages

Changes in v7:
- Fix typo in commit message.
- Remove usage of r/w and hlc abbreviations from commits.

Changes in v8:
- Updated refactor commit msg with more information.
- Rebased patch

Changes in v9:
- Rebased patch against i2c-host

Changes in v10:
- Fixed unitialised variable

Changes in v10:
- Rebased patch against i2c-host

Aryan Srivastava (2):
  i2c: octeon: refactor common i2c operations
  i2c: octeon: Add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 241 +++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 213 insertions(+), 44 deletions(-)

--=20
2.47.1


