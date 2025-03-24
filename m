Return-Path: <linux-i2c+bounces-9997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB5FA6E385
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E643A675E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 19:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9D5199E88;
	Mon, 24 Mar 2025 19:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="zL9kf6O+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF0194C61
	for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742844593; cv=none; b=Ht2eygMlneoVB3qvdUsMHbGFpjE7oAdLG7KZ9B+wCbAZ/t6PNBWpTmihokJTxohSZJ2g9Eq05in/5vdZUzcmAywcM53+9IiKSL8R12J98IxLpAxDrGaV+M8gjuUzIx3XIes4vNuS7nP9cAnOepE+x6dpchSND7i3zuVgq2QdyAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742844593; c=relaxed/simple;
	bh=8TJe0kVhGoR6sCm5pzURu/URzFkew2belXE+Ac3fzKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVQpFTtYkbpxSWxiGzCVliqDLESetPJx77TCyYMujgj1VqoXA/kxpKG7saaiBHeAmfnQMs2KEY5fEEr+gcHKfrJWl6xyOYpvFqQTR5qRh+pRxWv4WSxQabAeWnQhzhRQHCXpLGQ3J4Ll7FGW/LodQ/kL1KxDeSedfuXxQz6tyXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=zL9kf6O+; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BFE362C00B6;
	Tue, 25 Mar 2025 08:29:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742844588;
	bh=uyQXzTickG6v0i7iU89rdKkTMj8eQV7bcp2q8Y8F0wY=;
	h=From:To:Cc:Subject:Date:From;
	b=zL9kf6O+JCN1SBsWmrHz16SEmY2KCT8YUfxCYTdCe9OjuBhh+/M5lsGkn8ujvnuBr
	 0DMwUDfL4Y3l8nabOJijOfRGWm2a3KVh0RLD0+kOFeJbWHO8rG/i5oIWXp+tXIjW+z
	 6J7Oop0O+qTfTCc9G6qLSA+mg2U9KmvRhKAjlPwnIGGzUzgJ89NqczlbactNt3aWQD
	 ZPXQfnCtFWoIPmnz2O96t1hg5IErounJ/JPEGT/RZGEIYpTuyi5QwSRM7zEX/plu73
	 z6lpHphmMsAmuCpjjktgneMZd/Dm3RtzsIso+oFpnJ3jA2DOhXT7kCZpvi7wD4NIaG
	 bjIxpxKY4x+5A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67e1b2ac0000>; Tue, 25 Mar 2025 08:29:48 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 4164113ED56;
	Tue, 25 Mar 2025 08:29:48 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 3A94F2A362E; Tue, 25 Mar 2025 08:29:48 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v14 0/1] i2c: octeon: add block-mode r/w
Date: Tue, 25 Mar 2025 08:29:45 +1300
Message-ID: <20250324192946.3078712-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67e1b2ac a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=6rJGSieKV_OOAbgiSREA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for block mode read/write operations on
Thunderx chips.

-Refactor common code for i2c transactions (merged in v11).
-Correct function docs (merged in v13).
-Remove 10-bit addressing considerations (merged in v13).
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

Changes in v11:
- Rebased patch against i2c-host

Changes in v12:
- Added fixes for function docs
- Removed considerations for 10-bit addressing
- Transition to using appropriate byte-swap operations, instead of custom=
 code
- Refactor commit removed from this set, merged in:
  https://lore.kernel.org/linux-i2c/seom4yspcjnmdxxwn6wuyiqdy2ywpna6nw4rn=
36tsqinlncbca@jdehzfnznlsg/

Changes in v13:
- Removed unnessary assignments
- Removed explicit casting
- Correct typing for be64 ops
- Use min() instead of MIN_T

Changes in v14:
- Minor fixes to return handling and declarations
- Kernel doc and 10-bit patch removed from this set, merged in:
  https://lore.kernel.org/r/20250318021632.2710792-3-aryan.srivastava@all=
iedtelesis.co.nz

Aryan Srivastava (1):
  i2c: octeon: add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 166 ++++++++++++++++++++++-
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 175 insertions(+), 7 deletions(-)

--=20
2.47.1


