Return-Path: <linux-i2c+bounces-9578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F27A43F50
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5273B2441
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1042C268C48;
	Tue, 25 Feb 2025 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="IVCv8PTj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB322571AD
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485989; cv=none; b=Kq7f62uw+qlBFh4KJgndgFPntl5d6W3tKaoZrei3ZQWxHa8bUDCXTajBpwRqmQm5dHv48yLQHmy/TdAnDgZ5eJUQmNpO8TDVP8JVKSs+nc+EYzi7adaOgWuT1Zt1S6GSfZ29rCv1k/ubQtbJ7F7EcZgZj50aNwlSwVfqGIzSne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485989; c=relaxed/simple;
	bh=lRMt6jA061lprurvx0VShzAqXayV8eltmOsW49Zjb3A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=CZI92dQsbIqk2vVaV4uFXlm7QaKJ4NB9u19BMjsheC0CEVQTnUpJkM3aFUCW2Rgl1Iu1rvHPJSNCQJ8OxtQifXhkqg7KOsq/ue3DoyeE9jBEi8Syc7rF3L6B7PW8TyX5ukempqyikakNgBZWym9APol723IrN3OzSOLdCcYPUmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=IVCv8PTj; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250225121945epoutp022334096d9ddb0bb611f6139928b6fd22~ncshRcBkf0845208452epoutp02z
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:19:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250225121945epoutp022334096d9ddb0bb611f6139928b6fd22~ncshRcBkf0845208452epoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740485985;
	bh=q0NY9q1nH4ABhU1WMsGxQmu1gQKIvkrPnNiTaH8G9/k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=IVCv8PTjCQMxhb78NVUuSVmb0pGligpqCZ8R3yFKxKm318oiV2q6Ctxi1fnqI1EN8
	 QFbV05PMszOqy8v+0HbNgVrprEmEkBy9NfLGGyRrRHcimxPQw3meAJHsxVsKMs284V
	 S405u8BbxRG6bhLl95vjliyo57fdV7dHeH5AwiJY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20250225121945epcas5p317219048972b9afbf040470ae890559d~ncsg6xqUN0319603196epcas5p3f;
	Tue, 25 Feb 2025 12:19:45 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z2GrH6dR2z4x9Pv; Tue, 25 Feb
	2025 12:19:43 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EE.F3.19956.F55BDB76; Tue, 25 Feb 2025 21:19:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250225121943epcas5p129c54f2e9ad44af2ce342c26267fe38a~ncsfTJMmY1323613236epcas5p1-;
	Tue, 25 Feb 2025 12:19:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250225121943epsmtrp27a9dbdc10ee791740565f0d6c55cec2f~ncsfSjkFB0616406164epsmtrp23;
	Tue, 25 Feb 2025 12:19:43 +0000 (GMT)
X-AuditID: b6c32a4b-fd1f170000004df4-c4-67bdb55f6b91
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3A.5F.18729.F55BDB76; Tue, 25 Feb 2025 21:19:43 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225121936epsmtip2fed77c88d0b19afab8241a8d8987f4a9~ncsZEwLhq1286612866epsmtip2J;
	Tue, 25 Feb 2025 12:19:35 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Subject: [PATCH] i2c-algo-bit: cpu_relax/ yield replaced with cond_resched
Date: Tue, 25 Feb 2025 17:07:24 +0530
Message-Id: <20250225113724.14653-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAKsWRmVeSWpSXmKPExsWy7bCmpm781r3pBlseGFrc/9rBaHFo81Z2
	i46/XxgtLu+aw2axaOsXdgdWj02rOtk8+rasYvT4vEkugDkq2yYjNTEltUghNS85PyUzL91W
	yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
	I7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj69zrzAXX2Ss2r3vG1sC4iq2L
	kZNDQsBEYs6OJ8xdjFwcQgK7GSWe/bvKCuF8YpT4e+ALlPONUWLCmXcsMC3XH99jg0jsZZQ4
	dG8WC4TTzCRx++1Nxi5GDg42AWOJtgeVIA0iAiES33r2M4LYzAJmEjPvngYbJCzgJXFux1Z2
	EJtFQFXi2cunYDW8AtYSD35tYoJYJi+xesMBsPskBPrZJQ7//wqVcJFYt283I4QtLPHq+BZ2
	CFtK4vO7vWwgN0gI5EssOZsNEc6ROLD8AVSrvcSBK3NYQEqYBTQl1u/ShziNT6L39xMmiE5e
	iY42IQhTRWJiBwvM7Nk/djBD2B4SF172gO0UEoiVuPdhO/MERplZCDMXMDKuYpRMLSjOTU8t
	Ni0wzksth8dMcn7uJkZw0tHy3sH46MEHvUOMTByMhxglOJiVRHg5M/ekC/GmJFZWpRblxxeV
	5qQWH2I0BQbSRGYp0eR8YNrLK4k3NLE0MDEzMzOxNDYzVBLnbd7Zki4kkJ5YkpqdmlqQWgTT
	x8TBKdXAJPs04a3IbVfb1TXqD1T9r23097yaY7m2s0to36plj/98Ti72O3W3s3H6g+Kge6/u
	yE1va32a4ftyrsBBv4g/L/itGSLt75gELtD7srrDx2qxPcO1hrM10gvbmCaWLrEJOhFitNhH
	/iNvXNqUv//e6b8OnHvtz5OeRKPE9TOOP+9kWnHu3hNtlfPPaxboN1mvYvYJnr07qYW/LspR
	1F6dSX1C6NfVdpuenPt/zD0ieuWudxNy2NccSnGt/vJ57oGlvIpxd7+tzvI8WaYdanfk5pbd
	hpp7xfZdmzRte6ClAHdHYskHFrf6xsUKH7N0b+o3Hr284lzGBy3ty+aT1HLaV22c9S0h+nOg
	9S8+QZ4+FSWW4oxEQy3mouJEAIUAhDzDAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBJMWRmVeSWpSXmKPExsWy7bCSvG781r3pBiv+yVjc/9rBaHFo81Z2
	i46/XxgtLu+aw2axaOsXdgdWj02rOtk8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK2Pr3OvM
	BdfZKzave8bWwLiKrYuRk0NCwETi+uN7YLaQwG5GiTMLtCHiUhK3/3cyQtjCEiv/PWfvYuQC
	qmlkkri+oIO1i5GDg03AWKLtQSWIKSIQJvF5kw5IObOAhcTKLQeZQWxhAS+Jczu2soPYLAKq
	Es9ePgUbyStgLfHg1yYmiPHyEqs3HGCewMizgJFhFaNkakFxbnpusWGBYV5quV5xYm5xaV66
	XnJ+7iZGcGBoae5g3L7qg94hRiYOxkOMEhzMSiK8nJl70oV4UxIrq1KL8uOLSnNSiw8xSnOw
	KInzir/oTRESSE8sSc1OTS1ILYLJMnFwSjUwya7yOFdV5DX9kX6s1Llp5cJCGbNmPIw7Ipjx
	fE3qoQszcu7sF5X78NPq5zpe1kuiOYobKg1/cl5z67+UuNm5f3+SYfT7H3l7VGezeClnP/5X
	G2Le/YC3103g/tr1KnvcBILurNv2y2b/nMXmnQaVOR3To1gPlEsvXfxaJzDgS8uao6qSneaT
	xKK3TeY6eTjUzvvUR6nT31iLGlNrl15qs5rhsY39ldl7/9i41x7fZ8zTy5/RuK1xU+OUnmDO
	qzbtp/+K9Lx4xHSFddLv9yVr10/5lNfokJ7V9OJZkMeKJVF1oUpbg6a6TjG7lZnwreSVefHr
	fXe3aC3Xlv4zR/5swL2T15nkn+2ZdXiLy6RjVUosxRmJhlrMRcWJAFY+Pql7AgAA
X-CMS-MailID: 20250225121943epcas5p129c54f2e9ad44af2ce342c26267fe38a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225121943epcas5p129c54f2e9ad44af2ce342c26267fe38a
References: <CGME20250225121943epcas5p129c54f2e9ad44af2ce342c26267fe38a@epcas5p1.samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

cpu_relax/ yield replaced with better flexible approach in kernel
with cond_resched.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index eddf25b90ca8..4168fd901957 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -97,7 +97,7 @@ static int sclhi(struct i2c_algo_bit_data *adap)
 				break;
 			return -ETIMEDOUT;
 		}
-		cpu_relax();
+		cond_resched();
 	}
 #ifdef DEBUG
 	if (jiffies != start && i2c_debug >= 3)
@@ -329,7 +329,7 @@ static int try_address(struct i2c_adapter *i2c_adap,
 		bit_dbg(3, &i2c_adap->dev, "emitting stop condition\n");
 		i2c_stop(adap);
 		udelay(adap->udelay);
-		yield();
+		cond_resched();
 		bit_dbg(3, &i2c_adap->dev, "emitting start condition\n");
 		i2c_start(adap);
 	}
-- 
2.17.1


