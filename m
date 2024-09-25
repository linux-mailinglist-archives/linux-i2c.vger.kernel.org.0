Return-Path: <linux-i2c+bounces-7002-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4549868FC
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 00:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66885284845
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A15017C9AD;
	Wed, 25 Sep 2024 22:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="KkbhBtss"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175B158D66
	for <linux-i2c@vger.kernel.org>; Wed, 25 Sep 2024 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727301614; cv=none; b=QQjM/DBc83cDIYKmB5QjfB9MEK6U1A6iiN3GLUOZcVU47Iv2GN6ojEgmoqIzCw3FdOv/wa7nqVWfHaYF9CoGkyzQqIbE/Qw7r1V/qX2V32H+j78D/bAqdZSeN163QJprZ7y7rv/yp52asbAaJdFN2IsMI3s0UOfGMPjjk8aN8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727301614; c=relaxed/simple;
	bh=KCRZkJVUVCRux8zh/Yuzd2PQ/uHmMLXlhfYhvvFa7ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iciDrNWu8xw0UkYhG/cZzrLwxNHlJQPzTywJ5ygGyGiZ/qP7gqZIZ/CzzS1Cj8mHWfOYLkxstr5bnzxQCVsLylfEV4GVN/6wwZMltodXUf7iktuQhK17sCQQXpuOL5bMj8QhhJk0z4axx96ObDxvvFmlwQGi3egBgcelpc9MCnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=KkbhBtss; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 55C212C0125;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727301602;
	bh=W3ZRm9QfitUJ3rBWGirI0fRXOd+dseX1PtPwNOyjLqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkbhBtssVNbePHgGwD5q9ztrzfoWtP5WM/KkkF7qULCHSHc4UlNJscvmEKgaaio6q
	 rn4MsM7gCFxNXpXCff3l6IGZfT0Y6whmbdPfz1fTON77ROZT2w5DdWDAv5JlSWisZm
	 LJI2bda/BZcjcwyeTfmcNsKMsH3YV5g1GDBjYj7RG5ZdvXHOdFwFprXZ4nocpMxGqZ
	 Uw5UQtwIJ/VVah3NbwoZNNtoOTfHhY7EljJPAQ2h+FSSx6SjkRk9VY/HaXXkCOor16
	 jV3iB045ypgAxSqujQLq1HW5ZXLJFwRiCqQYTpmZrmXXha3ssTCMs3Gd23wZf56b7L
	 /TvcqMrqBeRNg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f487e20002>; Thu, 26 Sep 2024 10:00:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0DAD013EE83;
	Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 0B801280571; Thu, 26 Sep 2024 10:00:02 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 2/6] power: reset: syscon-reboot: Accept reg property
Date: Thu, 26 Sep 2024 09:58:43 +1200
Message-ID: <20240925215847.3594898-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f487e2 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=GF1LeCK7rlvhbTvQy6cA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

For historical reasons syscon-reboot has used an 'offset' property. As a
child on a MMIO bus having a 'reg' property is more appropriate. Accept
'reg' as an alternative to 'offset'.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v5:
    - New, making the driver accept the updated binding

 drivers/power/reset/syscon-reboot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/sy=
scon-reboot.c
index 4d622c19bc48..d623d77e657e 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -61,7 +61,8 @@ static int syscon_reboot_probe(struct platform_device *=
pdev)
 		priority =3D 192;
=20
 	if (of_property_read_u32(pdev->dev.of_node, "offset", &ctx->offset))
-		return -EINVAL;
+		if (of_property_read_u32(pdev->dev.of_node, "reg", &ctx->offset))
+			return -EINVAL;
=20
 	value_err =3D of_property_read_u32(pdev->dev.of_node, "value", &ctx->va=
lue);
 	mask_err =3D of_property_read_u32(pdev->dev.of_node, "mask", &ctx->mask=
);
--=20
2.46.2


