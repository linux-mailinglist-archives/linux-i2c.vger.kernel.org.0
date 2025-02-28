Return-Path: <linux-i2c+bounces-9646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E9A49BC0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4B9168E4B
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 14:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6A626E15C;
	Fri, 28 Feb 2025 14:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pfyYheMX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287681AA1FA
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740752426; cv=none; b=JeyASbFfdKA4WzkS7u/ZE5LpaZn1b14/7WPqjE8Ug28x6E3szwgtVU0zfZgbM7dvi1oeQHrJaYCtGFoeOeVWLcMOV6S2nKq++3PFc82PaF6nvg3lmCFwn749nRyouDX0BEzdEKriUjh9i6rrX2Ctt8oH+yYDN5FLj7FcmFpuOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740752426; c=relaxed/simple;
	bh=anGoJKP4e3oq3xRrI9guDLd77101unUczH+xlNTk/Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=BSiiwkLThSWKQNkz+2H1Ui+AAgiTyzIDSMbxdnyk92hbDnuPD+yvkxQwUqZr2M4gtvMqZknxYrf/D44N+GSqBGwLcFs28lWHWDz+MkO3PrUBs1VutYVZIp+eqPkJbNQ9pxdAFK7PC0zKS/pTuwIYwlVmXj1t+qEaccQgafNw5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pfyYheMX; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250228142020epoutp0263f00ab1097c95b9535f20a3b847deb7~oZRqWMlZ92780427804epoutp02H
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 14:20:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250228142020epoutp0263f00ab1097c95b9535f20a3b847deb7~oZRqWMlZ92780427804epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740752420;
	bh=YjHS5lQzbKkPowwCR1zNX2dluJmZJNm1nz6Pvscy/Wk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pfyYheMX2MGv4nPsfQ5l4KhHlcZns+spCEHimD5LxxxIcowymaOoSsNuihj7LFJko
	 PQtgJxbvXOQGciB1Cov4BMAYFWtYzdbloeRLb7KdFC1MJzmESjTjKoHIYXYN4hLy3z
	 12aSBcsOnuBsaRIFYvR7WX2VLZxA9QjI7eQ494Fc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250228142020epcas5p43cfa7d7a465fcbd946ce16f223d778a6~oZRpzpxdD1432114321epcas5p4Q;
	Fri, 28 Feb 2025 14:20:20 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Z49N24H3Lz4x9Pr; Fri, 28 Feb
	2025 14:20:18 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1F.68.19710.226C1C76; Fri, 28 Feb 2025 23:20:18 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250228142018epcas5p463b70b48a1dd36016c26dcf66f8b489d~oZRn67SxP1917919179epcas5p42;
	Fri, 28 Feb 2025 14:20:18 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250228142018epsmtrp14b0f4592a064862cfc20cb5a6cd98583~oZRn6QXjY2679026790epsmtrp13;
	Fri, 28 Feb 2025 14:20:18 +0000 (GMT)
X-AuditID: b6c32a44-36bdd70000004cfe-7d-67c1c622c82d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	67.0D.18949.226C1C76; Fri, 28 Feb 2025 23:20:18 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250228142017epsmtip224f154fc4fc4fc8f93c4e6c9ef83a290~oZRnMwY9K0770007700epsmtip2C;
	Fri, 28 Feb 2025 14:20:17 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com
Subject: [PATCH] i2c: i2c-exynos5: fixed a spelling error
Date: Fri, 28 Feb 2025 19:07:45 +0530
Message-Id: <20250228133745.35053-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsWy7bCmlq7SsYPpBltmKVkc2ryV3aLj7xdG
	i8u75rBZ9J1zd2Dx6NuyitHj2cL1LB6fN8kFMEdl22SkJqakFimk5iXnp2TmpdsqeQfHO8eb
	mhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYALVNSKEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2Cql
	FqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUmZGdMONHBWrCdreLutA3sDYxzWbsYOTgkBEwk
	bh+T7mLk5BAS2M0osXBdTBcjF5D9iVHi3PVjzBDON0aJd7umsME0bH2jBxHfyyjx+vJMJgin
	mUniw5/rzCBFbALGEm0PKkGmigjES2xuW8ECYjMLyEisuLSVEcQWFrCUuPHvGzuIzSKgKvF/
	eitYnFfAWuLFzSdg9RIC8hKrNxwAO0JCoJtdYsqdbUwQCReJBQdusULYwhKvjm9hh7ClJF72
	t7FDHJovseRsNkQ4R+LA8gdQrfYSB67MYQEpYRbQlFi/Sx/iND6J3t9PmCA6eSU62oQgTBWJ
	iR0sMLNn/9jBDGF7SNy6O5cdEmyxEsev/2eawCgzC2HmAkbGVYySqQXFuempyaYFhnmp5fBo
	Sc7P3cQITjFaLjsYb8z/p3eIkYmD8RCjBAezkgjvrNgD6UK8KYmVValF+fFFpTmpxYcYTYGB
	NJFZSjQ5H5jk8kriDU0sDUzMzMxMLI3NDJXEeZt3tqQLCaQnlqRmp6YWpBbB9DFxcEo1MJ2a
	sS5jamByW3TPKRO2H067T909+06zdX7Dz6JLQWLS0/P0FHpOerMeFjzA1zDt5szZBQVbxJwN
	O7bGHa4Wf/6luTzbq+/Tz1PJfxhNX5z/dWqjyZSrR9tPJK+71fRP9oKWyQdZjfiWZ78fTxKK
	eBB5bPdPj2THpsDQZGeLwoy6j8z8vP9j710UlfG7yMaZKaH97rRA/WJtbbkva7Llys+cTFjX
	0aKi1Rh5QjWV91za67UxO0Iklpjy+VyYfPxZW/BV/ymb5ntJ9V1n2WW4ZC/jy6cM6//KedQu
	Tb30damhw8TmQK2FrXVzX8k+tTbINDzmGe9xbIqv/SJexbPrtzcETt+nUNGctVTjTEEXoxJL
	cUaioRZzUXEiADiRQPi6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEJMWRmVeSWpSXmKPExsWy7bCSvK7SsYPpBkd6OC0Obd7KbtHx9wuj
	xeVdc9gs+s65O7B49G1ZxejxbOF6Fo/Pm+QCmKO4bFJSczLLUov07RK4Miac6GAt2M5WcXfa
	BvYGxrmsXYwcHBICJhJb3+h1MXJxCAnsZpT48/4GcxcjJ1BcSuL2/05GCFtYYuW/5+wgtpBA
	I5NE1z0PkF42AWOJtgeVIGERgUSJTxNfsYHYzAIyEisubQVrFRawlLjx7xtYK4uAqsT/6a1g
	cV4Ba4kXN5+wQIyXl1i94QDzBEaeBYwMqxglUwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcx
	goNBS2sH455VH/QOMTJxMB5ilOBgVhLhnRV7IF2INyWxsiq1KD++qDQntfgQozQHi5I477fX
	vSlCAumJJanZqakFqUUwWSYOTqkGpn7to7N8Fh2zfZv/dr2GTVnVT7XvP6IuqvK82nUrQKj9
	VYjsolUZ57p8t3GqHrh+stTNRuUKm+jp0uVfGzzzo3eHLz1861FG1jyOeYfDft+2sHO8y+N0
	ZtqlZ0XcrmY/anQLuB8dnrPzFN8fsyX2hpNPsa17cjGdyav+f+S7CQ3cv2ZWXWQ61Nt2qbZL
	+ZvUy3MHM5JPfnQTTdXkfT43L93litISG81jRonP133a+W9hy8OVr5h+zFijs8Flz+LNkn+5
	Jvf82n9hlTuv5t5bm59ye/nwzZ59aGrpzIfLnStcPO6ZbHBUN9O+kaB/dHphZsStE/l/9vE9
	f8Dxa9vUtYdLSkR4u/XkVE8qH7yeyy6hxFKckWioxVxUnAgAYiu9SHUCAAA=
X-CMS-MailID: 20250228142018epcas5p463b70b48a1dd36016c26dcf66f8b489d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250228142018epcas5p463b70b48a1dd36016c26dcf66f8b489d
References: <CGME20250228142018epcas5p463b70b48a1dd36016c26dcf66f8b489d@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Corrected a spelling mistake in the i2c-exynos5 driver to improve code
readability. No functional changes were made.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 6cdd957ea7e4..02f24479aa07 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -814,7 +814,7 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 		ret = i2c->state;
 
 	/*
-	 * If this is the last message to be transfered (stop == 1)
+	 * If this is the last message to be transferred (stop == 1)
 	 * Then check if the bus can be brought back to idle.
 	 */
 	if (ret == 0 && stop)
-- 
2.17.1


