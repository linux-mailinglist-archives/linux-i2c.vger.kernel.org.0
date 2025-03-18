Return-Path: <linux-i2c+bounces-9871-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884CA6661E
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 03:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BAAF189A984
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 02:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA7D19341F;
	Tue, 18 Mar 2025 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="lNEfjBFe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6337191F6C
	for <linux-i2c@vger.kernel.org>; Tue, 18 Mar 2025 02:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742264208; cv=none; b=nhVH8XCGMyIixTNK6ZgXNFJVtFGTnrHrQG47FotXHaD+EVgtILSRtpfOS9zLTY7lTm9qy1Vg5wSvetwxH5/U5JiQ2YtAA0bVzEoS+W/4J0cMBKQghcXcbfEp91dfgpLVw92IzkaSxuqhuEgbUBC4FsIKfQ0u0k1Mu5Pe1MblOfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742264208; c=relaxed/simple;
	bh=7xYag14Z5WfiLJYwle34DVZIFs3mt+VA80GXgmqXMlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sCZGvRtrnpcH60yZRiDE9S7H6EjI3kK8ARHC7TTWUDdl7WbC+c+FX+BxBRnTWCIFtEaZKMbf4nv98u1wj8Nl6XTr/EF0VaRx++QK7b6BFS+WMB733ffUI65gTOQj/YfWTGwfZ7u5DfUdfz8WG/SkV0VFwM/IKjpt9EPCMBg0Idg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=lNEfjBFe; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 932642C00BE;
	Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742264198;
	bh=WrXQpuSmssU45MfZ15C3x+byalLo+2yseO52kcTWPnc=;
	h=From:To:Cc:Subject:Date:From;
	b=lNEfjBFeZV0TFLrokrqDPCNCNLEUHoWuEozb6cKPWnPSjSf7XzgF6lUzgaeVSXvrj
	 m7v4TB1zyYYzhGUjh5eygHAc8GmOqWKDYloBOxMMPXUcLCzFXX5wAPlI9WG/zBvcRE
	 Ol+KcSPtkPToqM5ekE6JranM4qF/wh+KLLbVW/bhtfDDTJh0XoXxwmtffA4u6ni2Mo
	 V1XKh+xgH3jXHRDtnXFIgiIoT9tMCT8j7yZzuuSWqTnHELX9dhVKqVY3vuK7NIJKiV
	 MM2MB/r+SBa2HVlfEpakpm+o9o/yguqbIa6Dwx+KzlzHdiRqytrOerMqMXNbjRvRwx
	 ynk0n0cIhHRMQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67d8d7850000>; Tue, 18 Mar 2025 15:16:37 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 064D613ED56;
	Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 059622A1692; Tue, 18 Mar 2025 15:16:38 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v13 0/3] i2c: octeon: add block-mode r/w
Date: Tue, 18 Mar 2025 15:16:28 +1300
Message-ID: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67d8d785 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=qLRRFVotBWa09gTHfIAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for block mode read/write operations on
Thunderx chips.

-Refactor common code for i2c transactions (merged in v11).
-Correct function docs.
-Remove 10-bit addressing considerations.
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

Aryan Srivastava (3):
  i2c: octeon: fix return commenting
  i2c: octeon: remove 10-bit addressing support
  i2c: octeon: add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 195 +++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 179 insertions(+), 32 deletions(-)

--=20
2.47.1


