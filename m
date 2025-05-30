Return-Path: <linux-i2c+bounces-11171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46FAAC919E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289F916D775
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D732367A6;
	Fri, 30 May 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDt8HM7U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB1235BF1;
	Fri, 30 May 2025 14:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615516; cv=none; b=qU0X++hNIJergl3y5agPLS0dx93z7itdgBEbgmsv7qaJjJW6imty+PAL3qykGB5fRY5Aw+iyQtz4p2WBtKY3WU5PPyVoNo/0JuyOLXhWEVPK+K6nVlwWdNlJORLtEHeEBbHhB5FQ3dTyPSnzRQHgzMdb/yje2ZI08wEtEAWE/V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615516; c=relaxed/simple;
	bh=vwGtKhIn2Qmyd6yR7cAx46dfvq6gPnyu1w1Ccchw4sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyAM7yEF/+eam/TyEG5GjJQxvUgN9M99ooz/51ioW0J6kj4fV3H1e7NEY1t8jaOGMU3Wqh3g6l6pFwLsbETIMDQuczv/FbvPxi8qXrUTwM0qeVTkAka06m5LTmKS6UE7evYBV7NpGxOmrh13tVR0BBsQK4L5Tp8+eAGIkd8Rmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDt8HM7U; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so22752305e9.3;
        Fri, 30 May 2025 07:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615513; x=1749220313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlhLt6sBCSjNDZMkxnwJdey/EChrUfmaVct67Y5v1pg=;
        b=DDt8HM7URte6wfGUtbh7P4/Hy9ka4lQQNQ1dQ8J4HLCmoNFHeKF+jfGPngqJYuIPo6
         6V4r6mQwZQuH5ktzB1tvRTA1A+0oXxTJITZpfQcVw0a65K3Hgq9JakxUB26ryr6lK8Oa
         akDNKdsm/u//ECDPtQLgUiCOpASjRkWlW7Aq9/GFfHFH0RMND8UHnaW3T1nyHLvHg6w/
         Mw+YbULvpBwQ2Q7Ws+5ugIQNOT3e3yH5a3boxWd5xoqLsbtrsxSsti2sp1uYGqr33x8P
         cVlCyQirp604nXvcyumn9JkHC2TjPcJxEemB0FFswq8E53AOac52VTM+RdHudB2zxdxg
         M5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615513; x=1749220313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlhLt6sBCSjNDZMkxnwJdey/EChrUfmaVct67Y5v1pg=;
        b=nEFnDo5/zUHZZjRQKICbKWRbq0aQmMIZVAZwidNjgnqdctIrjH8dzF6PME7iA4yIYA
         q/ObbpWpO9goTh1TOKyn03KytiL/yC7N5azCUdlOjqg6S4uuMb1l2M0Pht0v8Xw8pU/k
         ofOEsRgK9TugB7O6nzUOEXgwc7SBBQ+gSx2tpOifUOKCnTbBosLDEmdV8WRJamw1j/Cd
         501gJDuwZ/GDJ7GdgFD+Q0P/n4Xo8XEFC44QGbNt3sx5CiPqSxQWtCCtt9NtZL4UUki3
         PzKYi4sDeGlqIZRrij+CBeiCK3xZrAfDJDSgRF2rOYYO6WvSHIxjSY/Qf1uU3Lq8yZsq
         Hc2w==
X-Forwarded-Encrypted: i=1; AJvYcCUf1oWYqHwJffWf27C1yQ4YTdeYb8knvT3zcgMzmvV6qpjmiTKEYBbl0cQZJWLBnPk4CttSe4WXAday@vger.kernel.org, AJvYcCV3yf4FtDuIc72d/QCCfZhM9OEypa6jv4syQ8oTdx7uPneDFSLmLcRbFDAARL8jJk5qvqnaEI/xFriY8GBh@vger.kernel.org, AJvYcCX9a+/+RSHlH37iJSefcwMoXhQaZs6khpaSYHjee76FXi62OpxKlyjbBeesmSkwevYJ9bsLro1cJnWQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1RsXX3D+NfC14poxrMF0DuszOnThldpdNtvNL2FjSH1PXA4qH
	YiyoRDU0lPabI2gnYXlajxiz/bQgR3jPCAd9ajhbOUKPr8NuuIRXGAIO
X-Gm-Gg: ASbGncuDPFdy3TNIjteS/IQMe7D/2+c039PGAd4Am5fn/13KlQB2adjeukjzNCOGR74
	3HKzBT5mzibBEEe6CpOx0b51hZVXDgqwnAsBzcDK/1PE5EjJMHTmHZdCkKNoeBTGfqZX5E/W6mh
	+TubCDKRrDgK/KhxxKaNA+d+2W43A37CXQ12g0hnyobzfQyXJ/5H6DMkL/yCBOb/VaiSX+GnJuj
	DU26+GH8vst00h4dsAKSXdQRgeBHyfBGp75i/TSW7F3E8GZw/hnX/9nU5URJUE25R92RmMSj5Sk
	uGBYvSCBI7nFv1u3TWe/IjboC2vGtdjQDeV0OVUx5/9uIQrXL4BOYrlF2DRq6KWFgK1ezsELCcb
	pg41vvGB8OA==
X-Google-Smtp-Source: AGHT+IF6lE41q9KONltvR2r614DrzHheJtNyryXqM/tZL6KNEcDXh3rpX4GgYL9oYTkzbU4ayeagHA==
X-Received: by 2002:a05:600c:a088:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-450d6547524mr36429195e9.18.1748615512861;
        Fri, 30 May 2025 07:31:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/6] i2c: riic: Move generic compatible string to end of array
Date: Fri, 30 May 2025 15:31:34 +0100
Message-ID: <20250530143135.366417-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the entry in `riic_i2c_dt_ids` to place the generic compatible
string `renesas,riic-rz` at the end of the array, following the
convention used in other Renesas drivers.

Also, drop the unnecessary comma after the sentinel entry, as it is
not needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 4950b790cfe7..a4df00cb470c 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -693,10 +693,10 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 };
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
-	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ .compatible = "renesas,riic-r7s72100", .data =  &riic_rz_a1h_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
-	{ /* Sentinel */ },
+	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ /* Sentinel */ }
 };
 
 static struct platform_driver riic_i2c_driver = {
-- 
2.49.0


