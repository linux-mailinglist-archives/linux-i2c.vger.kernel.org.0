Return-Path: <linux-i2c+bounces-11955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15277B08BC5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 13:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34DD917BEDE
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jul 2025 11:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FE2299A9C;
	Thu, 17 Jul 2025 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShNKWOyi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D9275855
	for <linux-i2c@vger.kernel.org>; Thu, 17 Jul 2025 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751826; cv=none; b=XTrhDpMPh+AKHergUxH+iOj7QlSqi/cpdbZoOQiIv6w+rXocUdIYRwVftScIVY96mTdDnvCLBx43IWr86EOjif1YbZwIFm2IHndt3ReyPYx/S+6cD9vgGD4R5dg3bvMOQf79Ha2Dn1IwFR+McCCvOT12L7ZfSCqojsHDmhtbVg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751826; c=relaxed/simple;
	bh=dmEgoqhZn+YcF6b5gM1EloXtrRIoPqW3Rc2/1Ieuwrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrIR/Fo83KzDFnc0A5U03ZuTjbD6qe3gspbV4Rj5wOGFAXG2Mcgz5Tewswbw7TtzIoVqQkCd93OZlgqU+JNEHrowNDtofKfPQSOwAP6jsEDU/KWY8x2UZn4ZX04nY7g/YmpT5cZqNpD2CxWaAVbB2eqrioi2XLaMAU3J2SvHQJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShNKWOyi; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-55502821bd2so1053761e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 17 Jul 2025 04:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752751822; x=1753356622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6tfnIpnrDFLqgXhLPTYnDrGo7b7raLlVtze3OnlPStk=;
        b=ShNKWOyiso6r8HN1DNVBbajNSVXDPS3yqyNiCPvkLAcbkof9aQp50cjKQbJ3zAlBMh
         uBEE4eKw4eum7jxuzLuh0fJplVoqr7YJoJt1Tnkss4SxieDFYY/4cT7m2M8JWkHfOCqX
         WUUBSspBpt6BGC+Mi65pU8Hu7rO6eMpIJ7soGT1oE3sX3ZDiubb3npllRPRUE/+7kPgx
         MMd/PFUpxhrHdVQRzEYofcUE3OOZCpUWrL4JBSQa/HTH3zfMksM2ILzYAf87XMJe3HNR
         ny859ntAzw+JDLjptNVpZ7TjI5DI3WdJfpMahS9OTaZiy4oJ9lx0Ps2lk8yb5CSkDBFM
         zM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752751822; x=1753356622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tfnIpnrDFLqgXhLPTYnDrGo7b7raLlVtze3OnlPStk=;
        b=QKCx7x1c0LfmaYl/oo5xzgwWRRbDu1EYF5nx8uhQOfYkdcr6abA7tzbqFy1Uarmo3Z
         ttDDVgNEyWX0yzEPX3nrS4bj+MVHDl4YllI6ZIP/Sbsq47peu35AKknUXqNTeWNp65Gs
         nefpNZaeZKapNuBWy33FND8P2TZGOF5fIcqFn9UpeWhahjvUl2tT/cFd9MEFoR6JVyop
         VVvyNcCHq/4ZItpeRyWipCQ+oDf05KQAxJDjxV7gLIiMqJQjKrH8VF9Pt+8kaAGIMxg8
         Ng/g4IDK16bznQUes084GmftOsSkVzZKe5lw74xK20JuKVrj69xi7Ef2ZqqKsUrC8mAO
         Jozw==
X-Gm-Message-State: AOJu0YxjMpbHcl6mle6f5RQ/xCrOl6QxcwgWMdk2QnCtgWOkpkNEvDu1
	vAzC0m9pTzTkKqlQbWnX8AfEx05FuqIV/1egE7XDAFf5XWCasIqYIe5FbfklmvYm
X-Gm-Gg: ASbGncvAe2GZ5+eBAhAp6HAqpySPqSH9VOI/WZ8EKyu02WT8DUDO6xbwKwUubBeJr3C
	X1whjpOsZ1zQTOHSlvwnrclM3dptv7I/GIUqNj/tnx2orFeU/ViIBkEsHF2a3/6naUPKMtdkMkF
	mlLB36nVcAyONTge8TpIUIEKxindmfDGwgya+0IhbHvhUG0UP0P+hQ3V64O/tEr0wWCdwvJiXvK
	TOTrbxBIZfVuvPpCsZvOjC5i1VullkVrQdRaB8qBWrPTN1p2hUo4sjBi7AOBdnbWtrC2fza6v7S
	ztbbet5C0JxmgeHNZWhVNEOXffGi+rLKREwB6dUhn5w2oQ62mMMXWvP9s2u7VdM0KwVWwwsIvYR
	7Fh8gR1usE4QyrLyN
X-Google-Smtp-Source: AGHT+IFt/G7LufmDCFugy9jju4YA2beUngntjcFZoLyCWAzwxqrF76HeW9rTJqu60KFxCc5/Zvy9dA==
X-Received: by 2002:a05:6512:230a:b0:553:2f78:d7f9 with SMTP id 2adb3069b0e04-55a23edd1d7mr1811233e87.9.1752751821710;
        Thu, 17 Jul 2025 04:30:21 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d315dsm3011989e87.110.2025.07.17.04.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 04:30:21 -0700 (PDT)
From: Torben Nielsen <t8927095@gmail.com>
X-Google-Original-From: Torben Nielsen <torben.nielsen@prevas.dk>
To: linux-i2c@vger.kernel.org,
	manikanta.guntupalli@amd.com
Cc: Torben Nielsen <torben.nielsen@prevas.dk>
Subject: [PATCH] i2c:cadence: Handle atomic transfer quirk at probe
Date: Thu, 17 Jul 2025 13:30:07 +0200
Message-ID: <20250717113006.4129012-2-torben.nielsen@prevas.dk>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we know already at driver probing if atomic transfer is not
working on the specific hardware version we are using, it is better to
not populate the handler instead of offering a function that is known to
fail.

The current behaviour caused a failure to power off when using a PMIC
connected via I2C to a ZynQ 7000 processor using a Cadence controller
with broken hold bit.

This patch fixes the issue.

Signed-off-by: Torben Nielsen <torben.nielsen@prevas.dk>
---
 drivers/i2c/busses/i2c-cadence.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 697d095afbe4..68ae60a09aa6 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1230,7 +1230,7 @@ static int cdns_unreg_slave(struct i2c_client *slave)
 }
 #endif
 
-static const struct i2c_algorithm cdns_i2c_algo = {
+static struct i2c_algorithm cdns_i2c_algo = {
 	.xfer = cdns_i2c_master_xfer,
 	.xfer_atomic = cdns_i2c_master_xfer_atomic,
 	.functionality = cdns_i2c_func,
@@ -1511,6 +1511,9 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		id->quirks = data->quirks;
 	}
 
+	if (id->quirks & CDNS_I2C_BROKEN_HOLD_BIT)
+		cdns_i2c_algo.master_xfer_atomic = NULL;
+
 	id->rinfo.pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(id->rinfo.pinctrl)) {
 		int err = PTR_ERR(id->rinfo.pinctrl);

base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e
-- 
2.43.0


