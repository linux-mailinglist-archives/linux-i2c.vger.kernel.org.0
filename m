Return-Path: <linux-i2c+bounces-9772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A537A5B6C5
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 03:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F309316FF50
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 02:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B73B1E5B87;
	Tue, 11 Mar 2025 02:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ZAKOTq37"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DB1E0E13
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 02:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741660488; cv=none; b=jQxI9k0CkhGGS/ZrygcyoFczTnO9wRzhnBGOtahlpazdJeUDMq4nYBSxCZLQhf01ij5GxPFbkJmCNMAk8KDCn9M7YHHUVQwvQYVPelrAEnbydmPHZsTGRW4HqDT+rD5LR9i1tfaYIHUZ2zlyS9RtcziJw1Sce3/4l15OKh0MVfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741660488; c=relaxed/simple;
	bh=7rs+5EEs/SL2AFtJ7ww0n3l9Z0zhWicNpBJPL/0UaOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSQ+517a0Hok3x7Dwsse5T8D9t+SlnufV8kDo1sWGwv0MyQ6DVdEOTivmhjAsS65TXFckVQHnRUtr93K6gGtsbahfN9ORsZtW72th359Z6fQGbI/Ssls8LBl08uXATqIdVs2y7NP0Hq7xtVrZy1MZDT+WEDKYwiOBdS4lZ4Accs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ZAKOTq37; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 835282C05E6;
	Tue, 11 Mar 2025 15:34:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1741660477;
	bh=Sex9JYtWbgweR7e8QTVW2+Bl3vtEB4RACxAnEaw+Cvs=;
	h=From:To:Cc:Subject:Date:From;
	b=ZAKOTq37ugevxwDP9n83hlPhEb9RajbLIzrFd0jPmX+X7adkqkBMVNJRsvc+9cZld
	 Iqy/OY9zG6YhajEBAY24HYlzCXgbhAp1CPMDlF+V4wnmzqGeUGyvrZklCQsWqAwC1l
	 azig6bpDybiX3jS8KXLv3rzV8wpSOu9Vb4GxBAdBHk3540FtHf+W0toAmqymMzmcwI
	 lb5bFnRAJECGHsViLYXhy1Za4bdOyYWuIJ/VKcdVIvDDCTFZBbXkmr+9M/kM5fWksQ
	 PyNAMfg/jDLPD8XLB5jmRK1MGfOcTJ3VnYPmYUmCHvpH1iiB3ccbfWxyVM9hqx3/c6
	 g72TIdPNixGjg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67cfa13d0000>; Tue, 11 Mar 2025 15:34:37 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 3BCF813ED8D;
	Tue, 11 Mar 2025 15:34:37 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 373A22A1692; Tue, 11 Mar 2025 15:34:37 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v12 0/3] i2c: octeon: add block-mode r/w
Date: Tue, 11 Mar 2025 15:34:31 +1300
Message-ID: <20250311023435.3962466-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67cfa13d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=qLRRFVotBWa09gTHfIAA:9 a=3ZKOabzyN94A:10
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


