Return-Path: <linux-i2c+bounces-11477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF195ADA4DC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 02:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 015737A5B31
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jun 2025 23:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228DA1917F4;
	Mon, 16 Jun 2025 00:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY5jMUWJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646911474CC;
	Mon, 16 Jun 2025 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750032023; cv=none; b=VpOJA1LFGFh2UO/HZYGGVZiih9Jqll3qVTVzHwETI5HTpB4/Qth2cRdD86JzZSl08U/um64TZaP/rN581Gl43Hasr24IxcJ1zxjZXlq8abqNX/S5lELuUznMt/v9amEzyQQEaPrhHtge8IdwpixWfaqxiNTmgvExz0VZQEX5u0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750032023; c=relaxed/simple;
	bh=CFlsrKntB6Zb9gxZeqZjWwo1JbEZh39zK02weOcAlp4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nEC8iQyS0KaXtZLv9X3WHhyOHEQQAuIt79hGeyRqH65FBlkXB3aqeD9oNc5M/hAaR4WmCNXweiX3V59hJDJbU2EjWjTDljCo9eHCkwT/IwtZXmFjB4f3uIKsOGIKLsFo44c+NtPMqmJcWFYCrpm7QN68dAFNo6mlhg9Q4RlFbmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY5jMUWJ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-710bbd7a9e2so30950517b3.0;
        Sun, 15 Jun 2025 17:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750032021; x=1750636821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbpHHR1YWrZ21Q/PNqsadbXIdVEUSMTqTza6iEwDmdQ=;
        b=lY5jMUWJJcucEY3v3vjBo5PQFiW/eo6qMdIaVJows112i4coVujCKTXAyn1PidY/+b
         gY5mBDmLZCY3RiQzROgXvRWeEQKjr4+MjKWnP5O+QcXUVTye6OFT3RJwENFgjYpdrmTA
         0LHW7BuEOagxRysGALUaGULklj8E+lnYmsILfOZDydVWDQH//88wqrcGShnbYFDNYt9A
         hZhiLWODM14q6soWyC7TrQvlP1zAB0Jv07LyciXSyiKgSiE4Qq2YaqSi80MpKfQ0zqtt
         P7wOlcc8OiTCXf5owKAjVwrv1S15Bg4xt6PTI+n5xuUlcJQ+pPrB7UuoSd2/irQOPSCs
         lofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750032021; x=1750636821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbpHHR1YWrZ21Q/PNqsadbXIdVEUSMTqTza6iEwDmdQ=;
        b=FfKkHqVknmST2Nnce8kw44JzyN3KahXkMukMWFyZU7msB9djwwkRWhbrWjU41aS8iu
         mwxvukZu7PpOFAA3mb/YaPU1OyCy1AVVF+RLzoLFAbSQdPyd/Me0ze3Rz817Ay3BFxuD
         UpDHGEXcmiHArgcji4crI1YSjkKh0ealKwk3j7xec88bITJq3tdIE3tC6F+CrvvvCvy+
         eEYV+THO7VfuDqmSWzBBRY2OkpPBsFfiPuBRYtHfFtsBJKKgoauiENyjM94gZ1ENPSko
         2wbMHJmOcmlJnMlxWXsAq7oW0bZYKK8U1WrX8ZMsS8e5Tmy5iNR0oJgpN4/RJEfNv/TL
         K0QA==
X-Forwarded-Encrypted: i=1; AJvYcCUy6qDCOk48rLyAUYMTHX7tMk1xe4xQyaovrgquyIebmqyzkQCPv9wun/kyyA4QR6rVvyvIMKtUajYjxmF2@vger.kernel.org, AJvYcCWek9nONlegks6TsdrgWCQLeyQV2rQ6cRNUtCaVZgjAlBSF9kgPFHWfDKAWKvjV5JmoXjs1WFgUWec=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywim5kbBy65w+0RiFRQzXe6Mwkc86DRF+U9mxx8XccTfJXczs4p
	lw6EDg0l4f61/dSNdi5QiEOrhU5Asw90VtPd8SuFHiqLFxLEfvbc58k6
X-Gm-Gg: ASbGncsqyyG2WwhvK3k/vLbWyD8wFUjwSOHMcv/Umr7J40+QUTN5hFewHOVsoKcJj2E
	CZViSuYHNkJSlQTzVb4+MeAGyNbr4Lody+wgxi4QOzHjmM1g+CV3+YpLsCrZL+Tg2x6hENKeNrS
	wWuHQEcKt2yYXLDhkkrA4ty755+rC1ziC/SIM/RffxteCAtSu1QDLsUcToWbs3/loJ30Es6uXWY
	UUsUSIJcpFYW4HaSna37VrCuR2GD+7JPOPHgvOycssPsgXBvua2IB3F0AFNFffZQs+kb3DWJOt9
	whlXIpd01+x7RUF3ROnfAO0o5CeFgPnc8zt5PPYn/mqEEiKlAhLb6n+w56G76RkdmCF1EeuneaA
	F
X-Google-Smtp-Source: AGHT+IGDXYrPWN+Wr3Z2QDg1C5fs0fvZipdzhoh1Vk3lSCmP/M8jbzJp56ovokdH9P91PUty8NLiOw==
X-Received: by 2002:a05:690c:906:b0:70e:29d2:fb7b with SMTP id 00721157ae682-71175498c04mr101981967b3.33.1750032021178;
        Sun, 15 Jun 2025 17:00:21 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71186a916absm4304957b3.17.2025.06.15.17.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:00:20 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: andi.shyti@kernel.org
Cc: alexguo1023@gmail.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: powermac: Fix out-of-bounds bug in i2c_powermac_smbus_xfer
Date: Sun, 15 Jun 2025 20:00:18 -0400
Message-Id: <20250616000018.545636-1-alexguo1023@gmail.com>
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
 drivers/i2c/busses/i2c-powermac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a8..3a061b67716a 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -78,10 +78,14 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	 * anywhere near a pmac i2c bus anyway ...
 	 */
         case I2C_SMBUS_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		buf = data->block;
 		len = data->block[0] + 1;
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		buf = &data->block[1];
 		len = data->block[0];
 		break;
-- 
2.34.1


