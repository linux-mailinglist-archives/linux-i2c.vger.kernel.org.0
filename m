Return-Path: <linux-i2c+bounces-14689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA07CD8F78
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81512302D5CD
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96D3314B6;
	Tue, 23 Dec 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG3y2eBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsQ1KqSi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74032C31C
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484172; cv=none; b=W5Xh1oaU3zDGmILguJvSU4V0TNnyjgqmlvgWu7t8OIhJteJzWiFwKetFq86AXGdWlQkphbqmTAc8DmXUK5sNsaDl85Ieb5hYEYMsJb/vV3nM6PLyLTy4GHcZyWQkR4iht+Qsb0UNZKLymev3bq1USYBd4f2wcG+U6LtntJ5OcWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484172; c=relaxed/simple;
	bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YipNlWoi1Y/sirQImX6Is2E0LkbpHjGAe2FJ1Od1zRNnJhfOU6ApvrxO8EofIjo1kvUpt8DCbGXPyOslj9km0srmHn5GNMxneA9rWZcicUVlvvdbvkZ5lpnKYz2bRIz+MH9UAmYpr2pQsM1W28wyfJLLQEF6+RBmFOO7/dlaKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG3y2eBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsQ1KqSi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6VMVa1630779
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=; b=hG3y2eBhBYv6LK+z
	1gL0yrBRHY36kK6tWsTAZs50z93bty8jefw0oJk2zhNokRswgV3Vu0zE0e0pU+01
	K8xNvRQoWxZkFlv0ohVF+xl4CxuTiz0CeskCHnmGDfa7zJAYJ5wsECLupZN1+WCa
	EIGTJV1DUwjeBWdszzlplx8YYqbH6yshlF0CXRi2xJMIfTj4hwljaK/uQ2OzCrs0
	qlNfZ2iaCLz/lQb+dJpEQzzmirkg49C0m1UONoGOSEYhoMHmj9o1Pi73+4JkTf5u
	rfK5s3fH+6/mrrs24LERc2HyagXov0pf/WPkZTqqF9m94mL/z4QJ3kTZqRc1RT3+
	YLgXZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j9m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee21a0d326so21060631cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484168; x=1767088968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=WsQ1KqSiqrupA3qkgCsXPPFz8LhtZlYBKLfDcaH7k3iGhclix0I9meZXpGC09wIkOH
         59KCFpPQfy8+7dWlgQiBMh15ggGfO1mIJKr6hlVwpN8e8SbKIx4bmOIQ91q9jRJxW7GE
         mhJ+G9S8jLekTMiAStMTl86E9y6XbhtFMGrzoDUWs/q8Pt8k0SgG213mvnYChtQPaLJk
         +ily5FaRNu38HZzSwczZN7C8+23FLQcHWQ10VWOaGMjaxGv/f0eyHe7WG008PKo+xc2g
         0KMQQXC4fbw9qx1B1qF70NyjSgBuIovDyXVdswHZfQrij43EXmMWdVH+8zlKgpzhkZsP
         pmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484168; x=1767088968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=kcO7qrLENYeR8Aq/anVw6D3wtReh44Yv+weUw8zMAF9Pt2jJRuWEInWh0Ie449DsoR
         jNHj66uHFp119b6xFsG/KOggNFTirvUHwzpu/eY6ZVlSctekUw4C7M7QhXFNUYC80+Ra
         dZ3t1SBBsK2hdS8efj+518VnA9FUiFnwho/qfpt1EGCBtUcAs5HacBq3jNeWvl8ItpTc
         +jY5ODUIVkRR9EC7JAfBVKHRVDyFKUbU04Xt/bKfyOaHQJw6FvurUx+reRrktCIYbu12
         PErecsoGKqZxfHRCrnaRGeo0xX6HoWU3tL59NWyHfSXS4vD3rvhOQpBLt0aQ7/Q55NFq
         EjOQ==
X-Gm-Message-State: AOJu0YzfzYiftsPGX0KUx7YldqpdqdJB8f9nD6/tkIPb1J3f4zvXDVc8
	s1Z+haxklxbpQdzilmU4v6WivqOmv4wN10kc+3LB/NuhSwkHTFrJIn0G37Z8KohqwKkQbMAO2hl
	ToHDRsxNhQL3MJR6AzCaXm4rYhR84pHsPnEaLfr1SJk7Z8IF2Wx2+YPxgJCgS7eM=
X-Gm-Gg: AY/fxX7b/ZymcEslbPdbLTTckKlKZpD+et0roRuUOeH2EOXYsflKlaOJ7svk0PkoSiN
	oocYdYZoduXoShJMnfg91SJ7NWoI1xNSif8sPoXyuUBtSslm9xwaO5AnSf7HLtJmyXGWoiGvyt1
	/B9G9sxIcd0xqvhdm3U3TvP0hhS35BkePUznnqtLdYLMZADy+/xvHS7okv8ZD/Jv4MBBxFtK2p7
	yaCcSbdI40FEj+hQAOOsLxbJ/lgc1Y5z8ab2q5bcyhSTM/DtNwZsindp4++VYrMmgEw494dpYTb
	VoQiKMewARPqfS/Gof4nB4ewNdORPMFea5kXLeYrBGNBYPchb7xycDjDrnGF29IZeE58NbNfeOC
	guB2WQUbJVG94mHK4gKC250de/JPr/4ZyzKgPtw==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204127421cf.39.1766484168137;
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCbCcOwt7PwsENXNFXjD41YHGkGJlBJ34XwvIgIwyJ9Q2n14TG1CsoAxoooPIxMGGgm4WVfg==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204126911cf.39.1766484167633;
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:24 +0100
Subject: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi4lDcQCifG3TxNlV3pNhaduY0Sn/XzxO1IX
 6KkowPlTIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouAAKCRAFnS7L/zaE
 w3gBD/0Vl8pDykw6ETOkKFQljl3UM1M3CJbnY+yo0kZT+SiECA8eRrap87iHfm19c6mC1Qcm42T
 fPEtfuni5DTWZzzF26TvLyz4l7ZEcMg4Q6UAEZVAc8Jybc7WaVUeRzf8P5rwSki+HdZ0W59W/XQ
 tkJ2GtOGSQ52XE7I5wmASiDxxX7bp58IR/I31WfS005D6EqhpvQAwKdTw8gYYkkxrY6ZwBe07BD
 kae+CXffjmnWs8IFesCbYHseao9A95f2UvZEajaOvCjrES9W44cGVaOCP5nGRkHwN/bnw7qzwSh
 N6n750a0l8S4etcjcnFPB7Zc9n5xNi1P2y4T/bU2WrBBFjdph7PiXgS3ihaM0CEWiriP2QIYzjo
 jk0daF/965GEziSPEoFBLEF6McW4lhbsKxmAczTkG7A4UHMU3OTc5iu6IN2YgVs/uD8bMeN71QL
 C/np0FOY3cMZ8FkJpMSHXO9JA79KmO4grADmcJ4tsK/H/9c8Og6oDho35TdruxQaOq4TSjxqOrp
 ihqJqL0ogTI0cNTl05hoyvBy+uCPa4qWxn032QvCPq65yamv8Ry8abNAW85T8Ai4ipoyuFAztmY
 drDCsNvroTIdVEEfDq6tyj1ZxfrH35z+7tA0DKl41RuWwf8WOfeeOVrdH63KV5Dtvpq09ygIY2k
 pKhjZl4zQIk8Vyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pdy8KUkmBXTdx93b9gjrrWOdPryt9XYd
X-Proofpoint-GUID: pdy8KUkmBXTdx93b9gjrrWOdPryt9XYd
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a68c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwUmgMpXSqORY
 y6SHfnR4Ai/X6JBM1Q0O7wtSnGqsuIuDob3gDAC6Oo5vZaGkg7TQHy3m5RCGaqqccR3IQJARVQq
 j4LqTemmFmIvgG14qXqybfDZHF5iRj4I74UNZPvpMMPXJuckEaYkpJgAPBQrMuDjFmrolAYrbE5
 LwQBdWl30oKuicuTmdxp0aLHI+2LjuRS0jrhUkdpEJH7HPGQkavNloMAK8Au3CY1nMe7IeNM6mJ
 87jPiPIPObRBYKKmwKsol59SNINNMBox9nwjl7Fea/dOTeuHcH95QhdKzYC9p4zrYhcOT6YUFvg
 hU2Ed1cmEkuayb5iwsklzhS8coX4LpJ29HK8tdX6r7JlljtlG2AY+JN8dwTtxnHaXdAFC7Qo8fF
 Ijec90At2JnJTdddyfTcDhmxq83xlxjyMHqVWh25qS87PZ2iOIuoJ56GgfjlAAF/l0EAYhLudFJ
 LS4uKL6dieQfIUuyCQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3


