Return-Path: <linux-i2c+bounces-11473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFAADA4A6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 01:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9FA16C4C6
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 23:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE0127BF79;
	Sun, 15 Jun 2025 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjbcZWdi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8C14F98;
	Sun, 15 Jun 2025 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750030142; cv=none; b=fxSIQr9uNGFXnEFLlU/LB8kRtHSt+a1RlKbOjs0ffmPMhRu5NzmFrgVYlzhSL516n5P8ED0N1qzhDhozM9EMIo5kLh6Xe5846fOviYEyNbAfx39qK8/VCwWygySKYxI/DPIMlyCx3U3McZmYlJ4TVdH60uXUdilwsL2G37CfwQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750030142; c=relaxed/simple;
	bh=DWimgH8rMKjuf4vMr5NxaUQb9aQLnmXc2cKfvKmOYjs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qy4w12PC47BJwoZtO2wkQDAnZvLgpof2XgtONBapm35za/Xlp/wzgaOPOBhYgHTvb/zsYavZMuTUZelNGAEh5BB84JAJeErr26w3LI67WbkxPitr5Gbn5xgGGnsWFlfem0qGmuNxKUHwtnKoSoDUGizXI4h/NdTVem+s2Z2YnMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjbcZWdi; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70e64b430daso38456887b3.3;
        Sun, 15 Jun 2025 16:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750030140; x=1750634940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4L1oIP7Q7C4H/Wk40XbdL60soYz2tCkmxujds9z+l8=;
        b=TjbcZWdi5DWOdlX8fbljloepGMuJnFNKRgCFBDsS2tID9r1o1HV1+VbT43N3L78u6y
         cez/pT092W5A8yi6PTtGQyPK4BS37n6ZjUICYN1mKRqVRythwjySyDgm+s3xsxbfEixS
         Z1XpjHxp+Ro3t06Ht7gSubZKDvTX+QUxzjHW+tIQM9p6kXguN1JVfd8CCAAslWChF+TR
         G+IQhbM3NtVUb9wiMDDQ9Ub/zowor9ZRWm22UO1mCIPAf6y3/kFDrCnl+sXP1HHNfwPj
         ww3Hsy4ezm2qpLUCspi69u1ayKyICYmuaUElu90Y0rY3dXRN9EDhtqtABhYYPrZu7hEX
         tZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750030140; x=1750634940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4L1oIP7Q7C4H/Wk40XbdL60soYz2tCkmxujds9z+l8=;
        b=nRubw+cHRKB6sKattnUHMDjlK6R0Z/464DzAEEPsr3y3fWG5/MpE8JbL25xvrpBAm/
         X/mlRB/ki9Li9u1MyeSWp82MixiPByeRzcwHULNYpDhmDzC9bw30G9i9HD6VehndxJeg
         M6k4hUqujEu1HAuR4fWIfmEeDoxWmqxWoATqCV4xiGJR3V05Av8IOEvRB6mDOHgatXBS
         xNKJRmF143mSzjs/7jrkksHjZeblCZz6Thf79K3chJgg70H0GCUEKTZEzRGu2hpgJTcd
         7fmW+EfPK1i+RmbgzGoZ0+XeVC8SzaICjZW/xvptp5JEcrao2yc/XLnzUliP/GVYp391
         ecCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp2y2oa8ySk0v3ds/ZziJZflG8vqtFRm06k3Ismg/9t4CEFfJcqL4Mt71jNQIGKBGTaLQ1D7uI0ew=@vger.kernel.org, AJvYcCXM154j+U3rEMZfARzR/N/bz8Iy2Pzr8d03konFLDCHF+YVJRsbwwZOIJx2rJXqJa92nEqDwGHct8Yxzjqa@vger.kernel.org
X-Gm-Message-State: AOJu0YwTNUJ3Uw8I7nOz+JH7nM3i0P9BK/YI8RkWZ3sFFJBrkF2JOHci
	lTFS946MzJH9lVH27DKpjP4ReBUulQ+/L++PurhbE95K+1UjZN2Dvn4G
X-Gm-Gg: ASbGnctF7J1tDaqb/qBDxauYCKpD7YbkKGMDw82WqWHRjPZa8vm+Nje6SbUMunCNlge
	VpupaLRR9OY/hXj/gs9EfPgbKjXbBtbpUgkXgh0vJHz2XrCO4mR4bNgIntrYWvZ7P0MvtdqiSyD
	tHVCrRzdoNZhL06XpqNBFLat/hnRi0NsNH+ElZRVXE4t4ULGAzqfz99APw3CGNVF91O/DnHlQrD
	Xr5Pte4J/nyDoIC0lTsp0rlKs+oGcRPx6fHLc3BwejTXZBpNmzwX1Xa5aADvhs+wGjzCJlglwKt
	xm3UvCtB8/bh3F2qgZxYt3bQ8YklyyyGe/Sf21f/yBo6oQt52azNRSee5IFbC4m9BNqKX+559Iw
	g
X-Google-Smtp-Source: AGHT+IEI55Gr516Y+UUPmCbRzJEcva3gfImFqYXM9qu30jqtB/Ym8lYr/p6NbruMNk+/HrEyoc/eOw==
X-Received: by 2002:a05:690c:4983:b0:70e:16a3:ce75 with SMTP id 00721157ae682-71175235ba6mr104360107b3.0.1750030140039;
        Sun, 15 Jun 2025 16:29:00 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71152059c2dsm14946487b3.2.2025.06.15.16.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:28:59 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: jdelvare@suse.com
Cc: alexguo1023@gmail.com,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: i801: Fix out-of-bounds bug
Date: Sun, 15 Jun 2025 19:28:57 -0400
Message-Id: <20250615232857.491602-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data->block[0] variable comes from user. Without proper check,
the variable may be very large to cause an out-of-bounds bug.

Fix this bug by checking the value of data->block[0] first.

Similar commit:
1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
ismt_access()")
2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
bug in xgene_slimpro_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..7503418be39a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -527,6 +527,8 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	if (read_write == I2C_SMBUS_WRITE) {
 		len = data->block[0];
+		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		iowrite8(len, SMBHSTDAT0(priv));
 		ioread8(SMBHSTCNT(priv));	/* reset the data buffer index */
 		iowrite8_rep(SMBBLKDAT(priv), data->block + 1, len);
-- 
2.34.1


