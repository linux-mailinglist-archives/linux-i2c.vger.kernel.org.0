Return-Path: <linux-i2c+bounces-7233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 276639922C7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 04:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47D9281812
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 02:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67548522A;
	Mon,  7 Oct 2024 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="w3mw9qP3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DAFEEC9
	for <linux-i2c@vger.kernel.org>; Mon,  7 Oct 2024 02:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728268750; cv=none; b=i3LprSTBcB9HPDimmKNiIcf94UHMvW3d/vyP/7UjDdPftrkRxJDVt36Zn9dEPYKcfQBwZs+DHX3/ssXxiXDFXb4WsZhh5xJjCLqCsGXtM0TOEiXQb8AthQL5TnVDwCeo5YX6P3HbtT7JFBEmgLQiu1FNI34Kwenfi0BzNHj1HjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728268750; c=relaxed/simple;
	bh=62oZVVEZ6NOPDK9tPBcHARZVaHxkynPnfYWtvj94UgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ly+8L1tPRU/5fbT8E0hj4bsQ3yOu1EV77bs8+zjYMm4wd3VmqJ4mpiIJq54dgsxvf6AoaU5L91P09hJ4iHSBG5vgoxsFM3aJjTQrkX9EEYJ6X7am8lXyJdukCeYfEUtC67ccO9gI/7f+9ZIu3UjESKE87YpXh28R/pTqUOJSgd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=w3mw9qP3; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2DD4E2C06BE;
	Mon,  7 Oct 2024 15:39:05 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1728268745;
	bh=3JxFGEhq3PiJQk+KKA3SDUOhEPkCovHxH8V1ZqR3Jms=;
	h=From:To:Cc:Subject:Date:From;
	b=w3mw9qP3NqjT0QIasOdHAj5i7Euv9fIL7ZPTSukZxDcUtSBgnUE8yRaPsDz0snKgb
	 wv7BiJBYOaH8Q31C0dgtTRr2cR+Obpn46IKGuzuIo1ipIhRveyPYBlzPgmmzXahhJR
	 IqGliIHJl8jD7H1kd7rjCykWC1K7Aps8KcgLeUH9Dddvozo1ksmefkOZ6dfNT6RF2n
	 NaHduHBaEeSl43n0EUx+UZOyb20YVUaXKwYkPqkbM+i2gyYUojEFhQJi8pjHrPsFbh
	 72pnknxLt7TNkGoQOwQetIBOsEXPioJUCQgbN3mCx3KSjAA0KI1UxVe2/pXq1SiRnF
	 /bgQBnG0vuVAA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670349c90000>; Mon, 07 Oct 2024 15:39:05 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 0C8D113ED6F;
	Mon,  7 Oct 2024 15:39:05 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 09A172A0C47; Mon,  7 Oct 2024 15:39:05 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aryan.srivastava@alliedtelesis.co.nz
Subject: [PATCH v9 0/2] i2c: octeon: Add block-mode r/w
Date: Mon,  7 Oct 2024 15:38:57 +1300
Message-ID: <20241007023900.3924763-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=670349c9 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=toHKM1xulaPNuss4LNwA:9 a=3ZKOabzyN94A:10
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

Changes in v8
- Updated refactor commit msg with more information.
- Rebased patch

Changes in v9
- Rebased patch against i2c-host

Aryan Srivastava (2):
  i2c: octeon: refactor common i2c operations
  i2c: octeon: Add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 241 +++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 213 insertions(+), 44 deletions(-)

--=20
2.46.0


