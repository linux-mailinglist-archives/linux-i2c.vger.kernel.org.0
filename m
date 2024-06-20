Return-Path: <linux-i2c+bounces-4120-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEF90FBE7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 06:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C440E284264
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 04:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B79DD22EED;
	Thu, 20 Jun 2024 04:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rxuUbS8S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FFA1CA9C
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 04:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718857076; cv=none; b=VugHMKaCPOhZjVEA/fzqkH+ZZ+HVMetEMRCK1JLTUdnHQBh6FmUWblp8Y8rA3qEfTLhBjO9FFCaRbKOmcRTiMdsmQBG86AHTU24gljJVGdXwoIr3sVG/o/FHYewl46Mj63e7qKcu6lqVTIuKZ8kcQkQC5ffaTcITJ/YruXAgsjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718857076; c=relaxed/simple;
	bh=uQHaf8yChIIhCYaHuI7LY4cDSqy2+PZXoDrEo28Kt7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1yC4sFgcXrCCk565bFOrkOfLtUdyCi+zmssQADxPCrA+2duHf/Y92+23r3LH00ZzC1zEWKsf24O1RyH9wEV/6ii1cN23Lm+uhbvsbGBhyMVNcENWDdSn0ck+dj9uPzb1IhiaQZZ81U1VZJPHlAXa/qHu4GXFekGbvn9BZFtvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rxuUbS8S; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 259562C0659;
	Thu, 20 Jun 2024 16:17:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718857071;
	bh=LGfmMYNwk03wF06503X9eyd3XeMGLgHv2wz6GaL77UU=;
	h=From:To:Cc:Subject:Date:From;
	b=rxuUbS8Shxi/olSi0wRaq7CiJiEis8LkL+2fzElaj5iLbFYpmQD+aZxY3A5wZz2Da
	 WMC27GiLr1uJe5taictISFviHUn17oZGGauxYwgRxR7xC9y9RCqEmisTSEZJ5DJ7ww
	 4+sEzYfBMi7cpjsptU2aYffjIzJmMksTBwcq+dQVYGHihvfCuJwg70V3t1VJ+VYKjL
	 pWp3k0xwih+wFqLKq5tHPinli5J0l6b0b3VcIUDyjqzBydAFGPNSPgOqcgy7x0nVoN
	 0hWkJQ6Bge6DG7bQlu7CWY+wEXH1mSIcVXyCErJ1tL8OC+HT/Bz7/3arjZS0HREyEg
	 Ia1ujHoqLga/w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6673ad6e0000>; Thu, 20 Jun 2024 16:17:50 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id E6DAE13ED63;
	Thu, 20 Jun 2024 16:17:50 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id E0B0C2A0FF5; Thu, 20 Jun 2024 16:17:50 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Markus Elfring <Markus.Elfring@web.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aryan.srivastava@alliedtelesis.co.nz
Subject: [PATCH v7 0/2] i2c: octeon: Add block-mode r/w
Date: Thu, 20 Jun 2024 16:17:43 +1200
Message-ID: <20240620041746.3315255-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6673ad6e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=toHKM1xulaPNuss4LNwA:9 a=3ZKOabzyN94A:10
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

Aryan Srivastava (2):
  i2c: octeon: refactor common i2c operations
  i2c: octeon: Add block-mode i2c operations

 drivers/i2c/busses/i2c-octeon-core.c     | 232 ++++++++++++++++++-----
 drivers/i2c/busses/i2c-octeon-core.h     |  14 ++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   4 +
 3 files changed, 207 insertions(+), 43 deletions(-)

--=20
2.43.2


