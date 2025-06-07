Return-Path: <linux-i2c+bounces-11275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFFAD1025
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 23:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B8EA16CDA9
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 21:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6859720E70E;
	Sat,  7 Jun 2025 21:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qemd9i48"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F521C84B6;
	Sat,  7 Jun 2025 21:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749332581; cv=none; b=rpca5RI5a5xxjOH23NnUY8Dx7nKWnETlnRk18Fv3/kwEccuo5HMdyUVgXx5Kce+dTcypBvNb1cC9vrrKRzezzbB1+zA8pSU1yOe58Rgu7Isy9ewINWeYNvbE9z6dIX/Qn0OHYtl6O8CKOvuSMc7pe1PeKKGlCuMd0DwnZDeEZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749332581; c=relaxed/simple;
	bh=gm4fasS9vdQQbKuCZtoPAMG4B6dKjldt1nwRY4/n4nw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PSsAy4YW9EEbVJzcgXT7EIilg5QCBbnp6u+HDa+x5itHPldrVjdd6OTRlpx7YUBp94x/HukOvmE47PbIWKahNnli4TDeul+pvh3thFC7/q+CHMEnLF2xLw9VuF6xa9hPd0NQWvYHRTE2f8v6wCuwFhL+iEVhg/iVOhknKf3Uw84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qemd9i48; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-710e344bbf9so29562147b3.2;
        Sat, 07 Jun 2025 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749332578; x=1749937378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YjscHMC+1NsZwBWXAeWQleUywfW88cG3lx1fz7LMCSU=;
        b=Qemd9i48lPyVPkU7oJZ6SbaFVjMsnNNLzxvjxeqrb477FA8FPIM0P4z/B84bC766O7
         8xQxRw2ac8JH0pkHHIlgctZSbyMRp6RKmhZlQw7nCNrDNmEVPqNoUFoaymcSLbMfHMZE
         7+umecH4Pb7T6QgtaUd/oNS9v0udlTCmaGaAK+B2Y25AoqoAwy26RC2QvNcSM3RdGlsw
         UOOFb0tnIAga6WD/IGTK1kTvj2ACNu/A71SFk/kmYWCs6HV8QFmK5k8VII8chrBlssoC
         UwTza8qZwVaNaalWgcwhbzUxXOAIE9J6j4BNEovKjohgmkjo5sKw4jTMtUoM8c04inQt
         8axA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749332578; x=1749937378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjscHMC+1NsZwBWXAeWQleUywfW88cG3lx1fz7LMCSU=;
        b=oCUAPW5YYm2/3T0FPq+E8LrMsuj6Nfl5nDgpHtc68vDbO1XfN4xrdHhGx6R5sI9B0o
         hskB6aIBcasUSytVjOqxc1LA8oqGY0f+CuNwq5z/o4g3Grk/WSGr1+TqYkki5UfT4g5P
         hCJnx8I2/hLrtvy3kYNC8/ljrvl/U5HnAxbmDf70/JOM/nPQlYSOSQusdL0DZCdv3rBu
         +cVqiEoR7QMQRCP/ed+AD2XZj+RCjmXdgmKN8i9BWo0SvyoTzmpJrMFoTdORNsqz41X7
         KhG0f/yiJhK80rOfbe0EdzXyhkpLVcKILXwxkTGF7Ld+TH00QqmgkKhu7sgm52zvu5iN
         kq3A==
X-Forwarded-Encrypted: i=1; AJvYcCXVU7stdrgMCmho4MAYaM2sJxAptPYLD3FjxbvwgRtV5OPgfOiKU9xOAxk3LwZxayaA9JcdedBaUVg=@vger.kernel.org, AJvYcCXw74g8BpfAvjlrNYe9DTKQ3kLtASM3iObf51mOBJ5Mcg0B8l9Bi5dlPMc7zfHNzrP6VnIxRSQyGIJpYP6P@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjccz9Qe/D0MWTCvHUl/y8ohVh9CykXD/rnN6Ms1waOF7Avm1C
	FpEahlWfalNpWoLCO7l5Hi7dV4MfF21NC3vXIRPAkswq1zJ3B+/AZ1f+
X-Gm-Gg: ASbGncuA0FnOt5MjlNimZ28g7GVlPZSrg4rheLlIxIvd5JBdSdjvRH4lQFrDzNBjAb5
	kVyLpdmzKtUWrk5WGndWA0kC2t2Mks01fQ0Z7XHZS0M5F+R4XMM0Rw5/di2z8HzpOvKO/VdUsdB
	Sfy+wChnNRY2eCDoU0zXp00ea3IpK8bFgT1DgwjVULCcLEIP1jSu2Cdxnx4Bg0WLdKVLUCrfb0H
	zwrycmYf5yMjUxNll0NVmURgcBDg7sHD1LjT8S/SoigtCkqqhqPFn+PeDsACy4OJTkTiJPMsrzU
	n6ZkP7mWQVlYRzzRuKTcdIQ+mTWQhwXdQ8nFhivrgKKD8bohyXxBR/Ssp/rMITvYrw==
X-Google-Smtp-Source: AGHT+IFi7sCc6zUWOl2n8ocwxXau8vfpIhvgXEPkIJZ0ahc2fKnvKNbUQDVVfPk5ZO4jM0FFXS0NtA==
X-Received: by 2002:a05:690c:7088:b0:70f:8883:eb1a with SMTP id 00721157ae682-710f763609amr114840637b3.6.1749332578501;
        Sat, 07 Jun 2025 14:42:58 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f9a1255bsm7116987b3.103.2025.06.07.14.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 14:42:58 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: kblaiech@nvidia.com,
	asmaa@nvidia.com
Cc: andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Guo <alexguo1023@gmail.com>
Subject: [PATCH] i2c: mlxbf: Fix out-of-bounds bug in mlxbf_i2c_smbus_xfer()
Date: Sat,  7 Jun 2025 17:42:55 -0400
Message-Id: <20250607214255.2579865-1-alexguo1023@gmail.com>
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
 drivers/i2c/busses/i2c-mlxbf.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8345f7e6385d..73fe8914f3f1 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2071,6 +2071,8 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
@@ -2079,6 +2081,8 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	case I2C_SMBUS_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
@@ -2094,6 +2098,8 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	case I2C_FUNC_SMBUS_BLOCK_PROC_CALL:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
-- 
2.34.1


