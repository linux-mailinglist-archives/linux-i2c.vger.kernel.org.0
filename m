Return-Path: <linux-i2c+bounces-13597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB00BE4808
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 18:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F1653ACBBE
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 16:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D3E329C5E;
	Thu, 16 Oct 2025 16:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4dO/SMG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980732D0FC
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631312; cv=none; b=XS9WkCU/aQhq0H3ur1jJNYtCIoUHYLJC0ymXvobv0jP2r7pmaIoH392C0vcS3nqRzTupEs5l3QQVOxzE0x2aqP14wgipBEQCwx0zlb8DCFDuBa/cQ7qo8UUuItwISrQXVoC/IB4hinjnQJ7k9/GFFaCyX3EYZ8iQwey3WQLP9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631312; c=relaxed/simple;
	bh=1S7qkacQtOJLn4B5dSDEdf4PQhZDBi/JrvSfER614yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRzfz8D5z7Tte38ZvNNnCfarXqQsAz/+yzrattMGvRmBKki7BU1lvCGJimHXLC2mkgyUeKPUms5y3F0JlFzyvZ78I32q92G3XpdYQoynW5sxMTDQnts2K3O0zcvc2fdCCPPR4dJCtKrTKRD0/GZ72QNreZCROSRm1iReYIOsa8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4dO/SMG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso7595805e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760631308; x=1761236108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ5MmPkHxZioIeQfPFm5x4+gWD/pC2wMeHLaiRdBbYA=;
        b=h4dO/SMGUjf06sdezexgkxWFQaWEVWunlIje+Vp/9z2D3/TF6Ad37dk0PvbodLbXhI
         OwqnY/ef5ENb+790W/+folYpzhwAwyDVZPH7DDd3L401oSqPtymwBz5soDil2wLXxuip
         uUVX/7IZH1IRR4ct+/zzwVqyodAYuT5SFt1ct0Ol9E7weVf1yECOXQtiCWNBdycahseJ
         F0omWbtrj8O+YbBm4d77TNGf24kYj2fP2gg4slTFJs2F+9FVDhaG6mLmE6GAdxEXBcDo
         KSyB5c/hKkpDoFklq+gAUnUzWv9kIQ1nXltJ11QKpq+LH5mJnSKEh5P/UgepFw6SAHKk
         IHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631308; x=1761236108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ5MmPkHxZioIeQfPFm5x4+gWD/pC2wMeHLaiRdBbYA=;
        b=k2CwEKOXWbxVkkeirU19uidbmvS31exT5r382oNUkjAMfSZrpyd+WmecT+Fpau4rAm
         Rlyb59MyV1sALNwJr85pOiDFcp7U8h/wB/swUzLN7ef6I2+CHAydfMpTJnP9QAsxA2dH
         tIQFK8FYgMDtpMOWpeTdln1jjpyW9fMJ0H6FBLdD3gIsQ189pbB8VpK7eyQ4FFEbvrn3
         mb+iZDejLVNbdmCg3Ssd7uO32PHPYhwt/YAH5v2lANKm2GFNYsa15oJ250zQM5ScZEon
         YuwTzQMtgikgv54BcjyBzI31pJp+9n3UmAtgCWDGi503Sp1gBaRT/YQTb4ZieC0QO3P7
         KBzQ==
X-Gm-Message-State: AOJu0YzWctW/XfNzthROd1IHWoFeuoJ62/HoVIH5PZYmghSKFt37kJ7l
	4hylHvSOnoeDE5VFQlNBrCvgMx2GDzdakKVPPEfsM7IUUYPHg+OcR14u
X-Gm-Gg: ASbGnctn1QSO1XI65lswui8Cly4AHCMBcbfwbFxrL1fBUXpFBeCPxZva8X7rrGg/u3E
	memdEeFBNtLG+eHyD/3ujUdmVJEi3O2gm+ujzdql9AIiV8+/M6OO+VaHXxD1THnUCoKf300PJwX
	xKS5XUoCBSrJD3RnN/jyEk54yInc1Q9R16xeZJv02FQqRP8ZLKr3AYqAouQxGnekOTMEpl4aX5k
	mGs6iuOMphJS8ydUG8/PyJvfqV/q912EQeaX+YsghZuRK2ZDk5UWrrOBNdNJGOzlKTfe7AcEYKT
	NL19MOGDdHwead1PMx/KSs0dgutv2bswTKdR0NMWlUT/dSe/J1QjGY2z0ysaxNjZHhxAfOQNHCu
	fWZqftIBV09hSM9xyEpwd3txAwB6yX/AyLjsTzBAHWsEriVd5Udm6onW/ULpx3X/PLq9wrwsVmW
	kgBQbjyosm+Ghho/w7
X-Google-Smtp-Source: AGHT+IFze29dl8vMjJDBxLAzhOIyds7dSrfcHIK9v1xZIW8d3NBlF+kSTR7WBTP80GFdC7rAjNgDTA==
X-Received: by 2002:a05:600c:5287:b0:471:1337:7220 with SMTP id 5b1f17b1804b1-47117874810mr4363165e9.3.1760631307981;
        Thu, 16 Oct 2025 09:15:07 -0700 (PDT)
Received: from hangmanPC.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471143663afsm35654025e9.0.2025.10.16.09.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:15:07 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v6 3/3] i2c: pcf8584: Fix space(s) required before or after different operators
Date: Thu, 16 Oct 2025 19:14:17 +0300
Message-ID: <20251016161417.15545-4-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016161417.15545-1-chiru.cezar.89@gmail.com>
References: <20250926154520.40583-1-chiru.cezar.89@gmail.com>
 <20251016161417.15545-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around '=', '>' and '<'. Add space(s) around binary
operators.
Enforce errors fixing based on checkpatch.pl output on file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 41a81d37e880..d675d484fe66 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -183,7 +183,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -272,7 +272,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -284,7 +284,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		ret = pcf_doAddress(adap, pmsg);
-- 
2.43.0


