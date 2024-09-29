Return-Path: <linux-i2c+bounces-7080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A2989739
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 22:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EB701F21421
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Sep 2024 20:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EBF7BAEC;
	Sun, 29 Sep 2024 20:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ADUaruCW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100674AEE0
	for <linux-i2c@vger.kernel.org>; Sun, 29 Sep 2024 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727640590; cv=none; b=F0iiRNOyLpEpY3CX2mrKfg5taRxkqTwbqzGmetVIzytDP8yxdfbJqYtHO2GvYJTLcGRM4Ki0iAsA9b1hfxuwUD98tDn3i22gYYkkre46FQP3pHfrcOG90rT6+DnruOFbo140ujRu280jnYDSUHH3yB4E8z9FwtNsVFtjh6SNCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727640590; c=relaxed/simple;
	bh=wOI++m+JL+DVE+hBvbTZ/vjmCwwuqeGl0d/3wlXsGIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jN0N8WBSlvdX++9r0TgjlOTF5mDRaalN16GzLA2dGipR+KmlHWeNaurxF1HDyI3odHhA9ZtCvbn0CSiW6Z2rtUfa7n01OX5fiPQX1bEMCjB/SyCHt8Z1ZzVYL9ueyDlt2ePNhLRoeafAXQqwDNvxpIDxgeHSr708unlYFx4tE8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ADUaruCW; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7CD372C04A9;
	Mon, 30 Sep 2024 09:09:38 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727640578;
	bh=JBwCQozm+0fMwGlfzH27gAbhtnJ574B9V1tQPJcrDEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADUaruCWWMRrSUjBUJdlP57U/ZcVCBSeFTIyxLFpWonoOuuVbmekeG9PGDtaF4zJa
	 B8CvRsesE3Jssvl+wTP/uTq5G8+ojwq1vELlZZndGRo5Ji9Bo2F+7nv9fvmeZ6vNro
	 /cMPLp5z4GzxGtiaJECQnBLC45rn/p2rN3BUBNuMslWbhvPPReb1np+B9INFl43mk5
	 p6KBCUjJihSQ2jIE9YwMguZhtG7sChh2YJdq0yxnWDj+DNgLkPbIOoFLjEamp4puJ6
	 bVk73TOpgRAcGBVps6v3ZnuKuq7k7B+urMlws0ev5TqAHfYGOw5i/EBMx+KNC8ibft
	 JWtF3WoLDXiMw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f9b4020000>; Mon, 30 Sep 2024 09:09:38 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 150B413EE36;
	Mon, 30 Sep 2024 09:09:38 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 146B02804EB; Mon, 30 Sep 2024 09:09:38 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] fixup! i2c: Add driver for the RTL9300 I2C controller
Date: Mon, 30 Sep 2024 09:09:34 +1300
Message-ID: <20240929200934.965955-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f9b402 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=nM7u7_jTEaTSNnH6a8gA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Andi,

This is a fixup for the spare complaint from the kernel test robot
https://lore.kernel.org/lkml/202409291025.P4M4O1F2-lkp@intel.com/#t

Not sure if you want to fold this into what is already in
andi-shyti/i2c/i2c-host or if you want me to send it as a new patch.
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rt=
l9300.c
index ed9a45a9d803..f0bb0ede79ce 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -318,7 +318,7 @@ static const struct i2c_algorithm rtl9300_i2c_algo =3D=
 {
 	.functionality	=3D rtl9300_i2c_func,
 };
=20
-struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
+static struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
 	.flags		=3D I2C_AQ_NO_CLK_STRETCH,
 	.max_read_len	=3D 16,
 	.max_write_len	=3D 16,
--=20
2.46.2


