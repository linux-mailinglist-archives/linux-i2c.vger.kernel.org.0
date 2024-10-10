Return-Path: <linux-i2c+bounces-7317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916E997AC8
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 04:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 206B41C21F3F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Oct 2024 02:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA15018893C;
	Thu, 10 Oct 2024 02:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="UjbJs4VR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299F18859F
	for <linux-i2c@vger.kernel.org>; Thu, 10 Oct 2024 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528838; cv=none; b=AuFMpNYR3cdkJJ4dEjNNz+BOTbibq72SvmyaGMJ1lRLI2VJuyvamm+892wznEeuE0aepdCyvAShuxFFaJ7rrXsRk8kN19v9nnpKiIGNCXSiGCRomJLH/05WSFYU7WU+/8TKu38LZMQqW1s8bHosgGwaBgjOa0roukMj7ntdXPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528838; c=relaxed/simple;
	bh=vqRA5I9YDoS9gZ7+XutRaP3CXLY9CA0c80kD2T03V3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A6v83q5cYy+pP5a9Yuxsse1UQxb+JMRIvAMvLM9o7UB9wFGkXznJdotoDjXRgVIWvIWQfed6msNMNO8mN/5rEK0HTjZoETE575dmvxgv3B+uv10gKNkfPzI7ph0nqHCVj02Q3wS1UDvksmaf9VPdgn1WMgDb0FGV4bGY6omU1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=UjbJs4VR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A66B2C0B81;
	Thu, 10 Oct 2024 15:53:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1728528833;
	bh=DwCXNLp58seGyvywJ2aPi/OUg35spBzhGTQuHmyblcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=UjbJs4VR4GRvox10c8f3UW3g4jTQPwyAlmODUEcj6TkIy/1YXSspqk3rE+iTQ0v52
	 dZg8YhlwMcniRgC6mTmiq3y6S7+qjAPtTzQzByBywHYSz/FU6ImYhN6gYjhNV9W/gQ
	 1h+U9tHZAM2DXPbX3dYCP2Qgrdp3wC/svN+F6BTEohxtfB85XAYQM+ZnF4nrO5IqrA
	 KgjAFvsrW3Apm55aZSVMbc+JPSihXNumIPMnrZRxFIr1wAYAnRR5az8RpYB9FaqHtj
	 5gc0Z2XrauBateVhnB+Yfm7hUpj6WvuaUIXaFc71fDkpii7HiUmy3Qvz1baktdvjlY
	 26WQ9gLruR91Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670741c10000>; Thu, 10 Oct 2024 15:53:53 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 1157013ED7B;
	Thu, 10 Oct 2024 15:53:53 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 0F7342A0BF8; Thu, 10 Oct 2024 15:53:53 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v10 0/2] i2c: octeon: Add block-mode r/w
Date: Thu, 10 Oct 2024 15:53:14 +1300
Message-ID: <20241010025317.2040470-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670741c1 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=toHKM1xulaPNuss4LNwA:9 a=3ZKOabzyN94A:10
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

Aryan Srivastava (2):
  i2c: octeon: refactor common i2c operations
  i2c: octeon: Add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 241 +++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 213 insertions(+), 44 deletions(-)

--=20
2.46.0


