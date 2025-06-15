Return-Path: <linux-i2c+bounces-11476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E735ADA4D3
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 01:52:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0868F168DC2
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 23:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB3F1FDE31;
	Sun, 15 Jun 2025 23:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSLIepdh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135517548;
	Sun, 15 Jun 2025 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750031572; cv=none; b=dZ4YUyOG/pUcCzbtnjrpS8C9pUb/2GoWoApT07Yec5O0sVnHcC0sxMBMakO7GUgbNtAzTwG0/I/F6AUhemqbJq+1Vi3xDd4lgNTbtildPPKcN3DtN/arztlJXKi6ES1kGf5jD++TtqHFPVk6sg5sW2hgQnZ6JXSz5WqYhr84gLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750031572; c=relaxed/simple;
	bh=hkt79L8daEY1ma0Plt8be/QeUMMPMG7I0YUpBQO3eI8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BOd5iQUrR406F7fjNC47ayTrCDujqIEfTvq1Jh3/X7qOKM1aKmLSFPsjiq3vw9y2RH1KKzS2UxxP61Sh9XkirGAq8RJpw6i9VG2JTFg7Jni6+kZeayY2r6Y8wJ+Zhzot8kFFk1+uiaVvIFfYsYPUyyAI883CWCFad8MUrpUdeS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSLIepdh; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-710e344bbf9so33992917b3.2;
        Sun, 15 Jun 2025 16:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750031570; x=1750636370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WlU8TcLGy7uqhBDl+TjbseUDj2uCehS6ZFN2Ft+L070=;
        b=QSLIepdhW6AUxALVHK3D2g1oQFTBX0hVBt92hVy4/B+vAFZFiWPf47g23T97yfBwq0
         HV8ri0iF/zx17JwgACV5Q2RpVqIUtRmA4T8xQDVQz1rhdAM0J6l3HVVM6uJrhKdbH2uB
         1v6C/3aJi9UnXZ/ca4esjzG/6xIFf1BzG7RIh4YrIjDnfqvLKjInnRsooLr2iT5Bb1e/
         KGC04kVwtRNmFpFM6zFhJo8LwSNwc/akPe87gCQXn2QXFZd5T0foppgKDVIGBDH1/erb
         WFKsVrEWGtwAW7niavBgGJRRLZ28AjzcutczmKvLO+vG5ei3Pc/AwzJvzxmaAEH1e1sv
         01Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750031570; x=1750636370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlU8TcLGy7uqhBDl+TjbseUDj2uCehS6ZFN2Ft+L070=;
        b=QHWV5kJVBXLXFR2T8AeWpk1WZ/2ljeSmeSy0Sa6pkuvsVMSO51jHmykqT2XXFOZJp5
         DH3Pj15to10FGG3rMJhCA26KEnQUKaJyXRGNWIwDPYga9Uovq4AYaAeNFMjvIoqLtmW7
         20Oyf9OxCTPN2o2aZpm64a6VOwyVUc5iPdvB3wyWIkOwysfmYrjdYrZLsXsYleIWm1w3
         K0rV1liXBxUacLQ6RQUSh7ml2xTZ/N8/AwBfL1YuBVWIR38yyL/6kUMi9RhKLdtAfMYD
         xrvIeAXkUGc9MTvygJQo/qrcE9WpLVHq26m0rD7qw12p+VTlJPMXKR7rm3wssaUmY51B
         nKUA==
X-Forwarded-Encrypted: i=1; AJvYcCUycirUw9WyDRT/Q4FIMDVqCWQwoR3sGH8hVps8DfGMLySRe6gfNcGsXKWBtMTi0CQMVC1cIlP8LkmHY61M@vger.kernel.org, AJvYcCVuyR+7mZKZE591Qfoa09YYqEG+rQOpOCspHKkw0TKOjcvNA+4jI6SCjiYWMx7D3APinPkSCIl76BM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbJWOzT3BGAPekfhbn91DvLB+/+HX9qJWNoip9L+AqEHH7QITy
	FCLPDkMoRvy1anL0WhToQG8yxKYvKA+kKcnYJJZqbrhSgXTR7UmE8MbpxRjZFpc6
X-Gm-Gg: ASbGncsye6Ko/LZUT/yuY9oOfeyx+LBGo5hK2ePVrHHoAg/ScwXIVObCcZ6W/CCRMLY
	AyV87fabh8BsOs8xgKFtoDVzXbUAqK5j1BJGPIk3k+sJrdpeC43GZ17oTM7dUoc1jAVUmBKNkM2
	nQKXOdUe84/y/OUniASCQsRhOdXyTCX9WkTha002Sv9aP02kbktA2j2higUrLSuAkVkKFQdfF2S
	WhPUer1/FWDpbViD8aRKUwhvVJb7l2Ov3zsw1odTVXQyh3ZuDtHXtVhrKQpjaF4J5hUD1oMux2X
	dopLVl3EnqPS2CJtZ4AfT88xzj8DW4YTpmptxncBQWMsUdTIRJWtWpNZh471Yif3cXxa/T+8a5O
	o
X-Google-Smtp-Source: AGHT+IGAU2ahxG4ILZ9v/Y7EFpVXj7Sn+YnemqaMbjEIhiYVPTXO2lRrFCsRaFNw9Hx4gFRTTNc5AA==
X-Received: by 2002:a05:690c:4c05:b0:70f:84c8:312e with SMTP id 00721157ae682-7117537b465mr108162817b3.1.1750031570255;
        Sun, 15 Jun 2025 16:52:50 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71152792fbfsm15315177b3.65.2025.06.15.16.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:52:50 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: chris.packham@alliedtelesis.co.nz
Cc: alexguo1023@gmail.com,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
Date: Sun, 15 Jun 2025 19:52:48 -0400
Message-Id: <20250615235248.529019-1-alexguo1023@gmail.com>
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
 drivers/i2c/busses/i2c-rtl9300.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e064e8a4a1f0..568495720810 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -281,6 +281,10 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
 		if (ret)
 			goto out_unlock;
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
 		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
 		if (ret)
 			goto out_unlock;
-- 
2.34.1


