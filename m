Return-Path: <linux-i2c+bounces-9577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3010A43F03
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 13:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7863A5200
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2025 12:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C4B1DD874;
	Tue, 25 Feb 2025 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Rgn+28v4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D92571D0
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485739; cv=none; b=nm7kWoKAkCC7Y/R/GcREiW92GWhec+8xZfmpNOYfRlrp0066m0z3u1QwC6mqncLJBhXUR8otvSfIfSTNh4LaW66LgabIHMey9SaCZVF/tC0UKrCNQ7CQ3sF0clrVjF4LGgVR+lYsXaaCz7M5HWkM1VdNlgLmHDKFT5mwE6YzJJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485739; c=relaxed/simple;
	bh=n0qtHPUUpsqeZMp8vdvkoyvxCkxVZB87dbJPrhvR5C0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:References; b=kXuLu4TwgJqpeoTaJEqfrOBnAaXgXgT9uIEgF+9jMlUet9EUFUJnn+jQbq/86m2KZZxhsI2XaqSxtTNoZv1DFSD9tLH3qxKSS3CetWytV5nsfk3aqNshIGqAIes2xKw1IZfLm7uAadndxWjDoZiHEbLu20WaoywDt4u89+CsVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Rgn+28v4; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250225121535epoutp0287ca5d31d8debe4f9b5a1890cc722258~nco4gwC9n0390103901epoutp02R
	for <linux-i2c@vger.kernel.org>; Tue, 25 Feb 2025 12:15:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250225121535epoutp0287ca5d31d8debe4f9b5a1890cc722258~nco4gwC9n0390103901epoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740485735;
	bh=gXCuKyfIyNL+Jw6N7X9ie6bhyy40mSO9kKIdHahq8NA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Rgn+28v4ATHc2wq1xIM3K0pDK58LGF/5HXzwoeW9yD2mbXxPWYPOMYvRpFJ0KigDN
	 Go5NhMD1rBtS9+WB2Ms/WKQBcM3f270K91/TarYGjIgLfK0zIxf/ziSb4EDNE8B/JO
	 x3vKzyT9OS0PWshv2hYy8GWkl3mQg6PWIS4u1xu0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20250225121535epcas5p40740b4f93583e80a6b958bb8c82d1067~nco30fUnU1608716087epcas5p4v;
	Tue, 25 Feb 2025 12:15:35 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Z2GlT2Gklz4x9Pw; Tue, 25 Feb
	2025 12:15:33 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	36.FE.19933.564BDB76; Tue, 25 Feb 2025 21:15:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250225121532epcas5p2343d6b813b78d92203cb06b54dfd1970~nco1BfpNw2438324383epcas5p2T;
	Tue, 25 Feb 2025 12:15:32 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250225121532epsmtrp1f63b3cb7834312bbf4119908db82664b~nco1A8W611727217272epsmtrp1k;
	Tue, 25 Feb 2025 12:15:32 +0000 (GMT)
X-AuditID: b6c32a4a-c1fda70000004ddd-7a-67bdb465d9b9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.3F.23488.364BDB76; Tue, 25 Feb 2025 21:15:31 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250225121528epsmtip28ad80b8c5f6611b0883d6dc06598800b~ncox7FvSB1051010510epsmtip2T;
	Tue, 25 Feb 2025 12:15:27 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com, pankaj.dubey@samsung.com
Subject: [PATCH] i2c-algo-bit: Added the bus lock during a i2c transaction
Date: Tue, 25 Feb 2025 17:03:14 +0530
Message-Id: <20250225113314.12353-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7bCmhm7qlr3pBi828Vvc/9rBaHFo81Z2
	i46/XxgtLu+aw2axaOsXdgdWj02rOtk8+rasYvT4vEkugDkq2yYjNTEltUghNS85PyUzL91W
	yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
	I7+4xFYptSAlp8CkQK84Mbe4NC9dLy+1xMrQwMDIFKgwITtj7+OtjAU3uSs2zVnM1MB4irOL
	kZNDQsBEYtuSA+wgtpDAbkaJDTfjuhi5gOxPjBKtq+4yQTjfGCVWT/nIBNMx68weqMReRonZ
	Wy6wQDjNTBIt716wdjFycLAJGEu0PagEaRARCJH41rOfEcRmFjCTmHn3NAuILSzgJbHp7BE2
	EJtFQFVi+sZ1YGfwClhLLPo8nRlimbzE6g0HmEHmSwj0s0tcWTOZBSLhIrHtwBWoImGJV8e3
	sEPYUhIv+9vYQW6QEMiXWHI2GyKcI3Fg+QOoB+wlDlyZwwJSwiygKbF+lz7EaXwSvb+fMEF0
	8kp0tAlBmCoSEztYYGbP/rEDaqeHxIept1gh4RYrsevdc7YJjDKzEGYuYGRcxSiZWlCcm55a
	bFpglJdaDo+Y5PzcTYzglKPltYPx4YMPeocYmTgYDzFKcDArifByZu5JF+JNSaysSi3Kjy8q
	zUktPsRoCgykicxSosn5wKSXVxJvaGJpYGJmZmZiaWxmqCTO27yzJV1IID2xJDU7NbUgtQim
	j4mDU6qByf/EXV6zrXpJXrU7TXf3fC6S6fiz8Quz1WNGvl1WmxafYXjBW5RQZl/meDNNq7/s
	rP2e+8wZ/Z84Nm19qLlyZvq5Sb5zLFct7bhSO3+yt2bU35WHTqzJjfSMVz3h/nHelpeZjPE/
	DEONJ0276xk8L3p3/+Xif+5Kh9nZ/V+zd5gxS2/8eMUws/Bzl7PexQAxoeS6QtW7T8pt485I
	Wwf8VlqbHhZ4WWrhHC4eU7slTu4a4rfNYiLCf62MW8x/a0vt7IO/vHk6z7e/LS6bJn7/5W7O
	zR9/CYot9WLhlew1vafGoPxKPeLVP+eeimrv/fcWn5y2ZuIcnrOC3QF/jHvtAte8jurIeh2n
	uOQRwzx3JZbijERDLeai4kQAglNWwsIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJJMWRmVeSWpSXmKPExsWy7bCSvG7ylr3pBmsumVrc/9rBaHFo81Z2
	i46/XxgtLu+aw2axaOsXdgdWj02rOtk8+rasYvT4vEkugDmKyyYlNSezLLVI3y6BK2Pv462M
	BTe5KzbNWczUwHiKs4uRk0NCwERi1pk9TF2MXBxCArsZJS4uaWSCSEhJ3P7fyQhhC0us/Pec
	HaKokUli8vHNLF2MHBxsAsYSbQ8qQUwRgTCJz5t0QMqZBSwkVm45yAxiCwt4SWw6e4QNxGYR
	UJWYvnEdO4jNK2AtsejzdGaI8fISqzccYJ7AyLOAkWEVo2RqQXFuem6yYYFhXmq5XnFibnFp
	Xrpecn7uJkZwaGhp7GB8961J/xAjEwfjIUYJDmYlEV7OzD3pQrwpiZVVqUX58UWlOanFhxil
	OViUxHlXGkakCwmkJ5akZqemFqQWwWSZODilGpjCLFiqWba/P9HoHPa4YuX1XRa/p26xmDBR
	4MHChc+3fuz8VMzyrFlQ9UCbaqxEQPqvGSfkpu68NOUGrwTn9NqZFqXnhBaturVUl/Np97Oq
	K438hjx5dzKMYxVbea2uCp9xK2epnLSrZOrKtJzeyyaOrQKaZr76VqwrTd+vnv9wbZlGSars
	ldTHemsvlHqYV8tudz224GqDi8JS1ZNCtdmVhwLbuSstnRZPzw269TsgcW6t4q2K/92bnxlc
	//vyJIfq7Qq9HxI7i+ax3Zsv89XnJt++VO+EjsY/gTpSrWtU3XjzJ9TY25/yvjFFNvZ0l2Rx
	V4bvprjF0/7my6kvkV9ReKyp7aaInozUgrdPKpVYijMSDbWYi4oTAQppW/d8AgAA
X-CMS-MailID: 20250225121532epcas5p2343d6b813b78d92203cb06b54dfd1970
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250225121532epcas5p2343d6b813b78d92203cb06b54dfd1970
References: <CGME20250225121532epcas5p2343d6b813b78d92203cb06b54dfd1970@epcas5p2.samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

Earlier i2c-bus lock was not available to i2c-algo-bit driver
for that reason if there are back to back i2c transaction occurs
it may be possible to occur a race condition.

To avoid the race condition we added a mutex lock mechanism which will
help to protect the i2c_outb()with a proper lock.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index eddf25b90ca8..18021dd9eef3 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -31,7 +31,7 @@
 #endif /* DEBUG */
 
 /* ----- global variables ---------------------------------------------	*/
-
+static DEFINE_MUTEX(i2c_bus_lock);
 static int bit_test;	/* see if the line-setting functions work	*/
 module_param(bit_test, int, S_IRUGO);
 MODULE_PARM_DESC(bit_test, "lines testing - 0 off; 1 report; 2 fail if stuck");
@@ -349,6 +349,8 @@ static int sendbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 	int retval;
 	int wrcount = 0;
 
+	/* Aquire the lock before accessing the I2C bus */
+	mutex_lock(&i2c_bus_lock);
 	while (count > 0) {
 		retval = i2c_outb(i2c_adap, *temp);
 
@@ -379,6 +381,7 @@ static int sendbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msg)
 			return retval;
 		}
 	}
+	mutex_unlock(&i2c_bus_lock);
 	return wrcount;
 }
 
-- 
2.17.1


