Return-Path: <linux-i2c+bounces-12183-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764EB1F6FB
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB3F189CAAF
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CFE27FB31;
	Sat,  9 Aug 2025 22:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da2BYuBp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93161265CDD;
	Sat,  9 Aug 2025 22:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777247; cv=none; b=Ii6SoqMNVBvS+ufEvApTAF7N8UbzhzEuntCPra5vt/TnilE0d6H7Q4I/OJmF8XWMTZ+u/W783q+4SlvddK1+vO04G9xw0r5skY6m3TO0Rqww3KfSXNgqVD+t6rVo3HhTyvNETvM+uAsgdA0huFrAQM3fJ5/K0ymVnipkRK/wIPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777247; c=relaxed/simple;
	bh=4DzfJUaj9CMNcniWQN1jZhMrIdrao3Lw4vpRQFHqIck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7ef/6TW7lsijwQx0/QWKjcY1GR9zl4WezJvwQvAiCpPRHNRLQ7KZTgXwk8wcdvnpE9urdvArlNoU/v9BqsC8BauF7kIu8SQKN/exGTz8IJsMfM8sGprlGXltf7M1foSbkVPC0v1Er8W/VmLFzSsFtPzpNCn4+y6dbeCsWV9D2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da2BYuBp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so1804046f8f.1;
        Sat, 09 Aug 2025 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777244; x=1755382044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cq0E/m7mImjpJamMpj0TWXiouXIESM/JDlH94bzicD4=;
        b=da2BYuBphj4FdS/+n6cPHaSpSK1bOSZdU4qx0LoIantlwJxht1xeyh+OFeRBynMlpx
         weIhLaq3SDCmS4Qr0hVuzHo0eG1Qu42DmxVIi1Cx49l57Uu8gS4TlEGJ4PvAU/Ie4g0+
         Id07Ly1GETQAEzUgcgsrSZmfgiO7nlbyv4x9qYM//aWHNS4ogLBeIRWEXhu0VT/jbzYY
         KE6t2cpT4cFzSz95RQAdU2pK+8Su/8Z34N5mFq4MX05du9wrDpaZ20ma/ucyZ3FeCQAc
         kRMGgi14xSLyZSGtPLz+BdOZ5oPsW/4Q5GbinZojAdhZJLcQFrmyLEOmxm1JOyivHQI6
         X26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777244; x=1755382044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq0E/m7mImjpJamMpj0TWXiouXIESM/JDlH94bzicD4=;
        b=rDFW1r/ssTPlp1kNOg0jT2rvEdwL3gk6FblSbXRBEejPlQ3HKGorEqEwwnq0+0HaGp
         cH12xh9w1nw8lArbbZQOiiFjk7mqceeHIgDbJVORyRulq8lMupHzeVMXjReaWSxs+Mfv
         CSrGL1/vrrbuHdyXmm8IsgFpmqCazmCMTqa5E3M8ujVmky+V5fZLqBoa+yTkN/ncN+pn
         oGcJxVB/IXsU2j9S7Sx9BwwDcENtdrwNu/+pJ9uDdX9rNzzAZj7h20knAH/IWTKo/k+e
         R+npYV3WU3xJW46EA/Ta3nC2uS+cgdO6GbJ7IujSBU2It+WGf19UpV60e4ppfzxnPIl4
         w8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoaejkAA91Rf/f8KgiF4YzAVqNjri1Yu/ln8Y0GbkQqxVMi7YL3FvnVO2eMP/wjoHcQpNJhNblnKT4rmfZ@vger.kernel.org, AJvYcCXH1d6sFhMx22qiWA8BdBZBZLJfUARb9ugOcG+RTroQT7F0Uiy6EFo3flvHBaAtpF8GiYTaB9iaAZiV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7oMsb/uWUH0smlPIgy8QnAEOwPq+B7YSd4TjqMYTQ8xhe8DJq
	Y6YyxA1smWSBqlkD0+F+wLTvoOTjF+CFXwUawaFu6WvTZ3GXphMvcO9N
X-Gm-Gg: ASbGncuVESUeu/9wWRljBkb6yYtGvsGiIsstVoyknaDon91gtgYrMZ+ZayiCBspoeUK
	TRgWbw+KI4ZINBSzsTnGMWRq0/Zaf2jd+MIUeoUiy0yZ4bE53x/rzq+ZIYtPpi+JDugwvq8DQW1
	vSM9Fazgy9EQc+mRjOwX+hDL2gOJBqg2NidNFoWe+Py6NQHQcwMR4F5F+mNGLN/WJaFCMclQkip
	POZGXGEihZesldSydo+1w0tnF5wUOIkVDstgrBs0BjbJxQsJNA0B9FgX0utjh1gz3C9hjrQfawp
	wpL4wGZ2si3ozQuEPtcNpvKTK5rSnIoW/VxNIJ9fV8ItFlhsiKMvHXmFLXm5TdN8iIFvnbgOeQ4
	thGi5vSYvh7AyB1T7A55pal8Y35E1Ie1noNhIVw0Mceuczg7mBA6T
X-Google-Smtp-Source: AGHT+IFfEF5W1hbTqfMVzogXGkEZs+k1bew2UPzZx+k+bp+lw0P6M1qwwv/Oc/pH9M0UOn3DRdc2Jw==
X-Received: by 2002:a5d:5d11:0:b0:3b7:8832:fde6 with SMTP id ffacd0b85a97d-3b900b2dfbemr6340196f8f.13.1754777243866;
        Sat, 09 Aug 2025 15:07:23 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:23 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 02/11] i2c: rtl9300: fix channel number bound check
Date: Sat,  9 Aug 2025 22:07:03 +0000
Message-ID: <20250809220713.1038947-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the current check for number of channels (child nodes in the device
tree). Before, this was:

if (device_get_child_node_count(dev) >= drv_data->max_nchan)

drv_data->max_nchan gives the maximum number of channels so checking
with '>=' isn't correct because it doesn't allow the last channel
number. Thus, fix it to:

if (device_get_child_node_count(dev) > drv_data->max_nchan)

Issue occured on a TP-Link TL-ST1008F v2.0 device (8 SFP+ ports) and fix
is tested there.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e6eb6a32fde2..68acbb6cc5a4 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -402,7 +402,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
-	if (device_get_child_node_count(dev) >= drv_data->max_nchan)
+	if (device_get_child_node_count(dev) > drv_data->max_nchan)
 		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
 
 	i2c->data_reg = i2c->reg_base + drv_data->data_reg;
-- 
2.48.1


