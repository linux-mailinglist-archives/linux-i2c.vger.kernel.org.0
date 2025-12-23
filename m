Return-Path: <linux-i2c+bounces-14722-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C294CD8C25
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3EA6303A1A2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4879635CBC4;
	Tue, 23 Dec 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqGm7dqU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsVdUaAq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF435CB80
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484513; cv=none; b=LtulCljhGdBdDxH0CbJjIXlh5a9vVlejqe/4jx8o80izQ69j6ZTdhQPZ//2cLKbgu5Xt9l+dlPiZnLXdnaHO5CDOnPyMNjxyZI9ziyaVuUkJWt3QQ96Ag8yNLfQ+kL4rS2cEdmo8Voi7GTpmGJLDpmJRrcKAEYTqTqRKb4YRNas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484513; c=relaxed/simple;
	bh=88tiaV9HDvlr3GN1PksEheeTAyjNgOl38ys1aboqBxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+l1u3n6QGpd/7sJH3mBSDGeTWFYFJIdbK0KWAvBM3DwM9caYXEzfjpFG3dyIIitUeSGHLJRWGav5ZGAn/RG1yq3R8dbWn7k4w399Rz8ncuOuw18hUIiUYOghRkGopvXE7undKibXqelBQb30Oq9fkpS+TsRNJLjmxN/SlfcJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqGm7dqU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsVdUaAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9v0u82198949
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C1LYEIUrAQOrp9ghi20i/HX5sg1rutbkLtla6X4TRo4=; b=DqGm7dqUbSPgdGzS
	Lal65ErB5wH1M9lZLd1C3ckVOTuOArLICTpItioTf5bcH6dyEj6WsP2+At+d27CA
	KCozZv1d1i1neMCcdHqQjt1SuF3I64B+5eFM1YElm1meHP9vPaA9djWxJCx344hl
	LMEIUIEcLotm5QgvNmMnvMteQcMktv+bwxsujcOT5U1eZRFPX9XqQ0D/r2tzg4OA
	5aOCjwc4EmvZLI+Y4Tz1peaP2uFhaIK2PcmR9LRBy2btFT0PVkvtTy/paC1Tt0U8
	tRQcSfKfdSpjCeiBuAmYqB3SgMm84VEuhP4wzZOIsMCfH0MSbvy0Mr0QuNKqx8NM
	aeOyCQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwus35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee416413a8so52873811cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484510; x=1767089310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1LYEIUrAQOrp9ghi20i/HX5sg1rutbkLtla6X4TRo4=;
        b=OsVdUaAqd/t9eFvpNfEc2S0FvAhaZJUMJocvkG28WOhqgzWk7MTG2HeV+MWweD+TtQ
         rDR0EL6gic9owv8nGuWvvSThjSWK9ggSuiR+mNAWdYWldPu484kYrOr5tkCoGvMGMhMb
         TrrOiGMs1l3GyWAzAS1V2KqjeEP0XdxSIZ/aRiaNCNWPcutUKNrWr+byDK4bCJHYApQi
         N2ie+LEpS0QYlA5n0dYNgUXHYa+7lg3lHZ/TEsMaIzV0AUyQe5cLMwrquJk4XbY2oDul
         u91kMIcnRyM4cycmhLQEgTl9oKZzIXG3G0jwKn3OQbrEiy1uX3HCTP5OVrPSkLXrl7Gd
         axYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484510; x=1767089310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1LYEIUrAQOrp9ghi20i/HX5sg1rutbkLtla6X4TRo4=;
        b=UcaXdZZbUaxw7XagghhSx3qjhS5HeIHLUi+lWSxFN0Skzf16/budQ9P4GdwN4//V4p
         icb/NE1ryQRDjRhXuffja2uIjo5oCLNyqQrIL301ljLYhPqEru8kTMAu8Lf+3Bz86Hqj
         t+Xxq5S79d9MlEXcgb9lrF02/D7VTDqxlvMksDjiBrMjHbCnBlE6hQMG32GdH5ywj9qp
         jooy1YS8KzYCjwacPKvEleUEyu4iUTN/Y1Vqs0FhsJwR5mAtL12Rj4LZpUR2uYWl0t0G
         ucI3QY94BLEXBQJYdBlZUSC0lpapI4IsF2QJk2j30LtQn2F7SHLHlRD3FHzXYEkv03Jd
         OTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGk2bqs47tQEDLvFIPWzNn4dh9WoPTkgeq3X61Xib9tU7/9y1Eq7Z4e7rM67alAWdexDIpaEEu/54=@vger.kernel.org
X-Gm-Message-State: AOJu0YySuj8yHWFGNTb669xoEoaHJvUEBZW0G219CtJEsvlZeGfVPbIR
	7HNbdp4kcCp+vuR2vDz3QmcNdJRhXMtK3FlvK2v6fzKFIXwzXlNdF/WMIvmWvw796TkQJStl1dk
	mgcMij4/5HWWZ8Qg65I/xNXtmZxMy8lTAXpi0M6LtKc0ZPf2a8GG7rLXg2Z0C0fk=
X-Gm-Gg: AY/fxX7qhXZeEG5QtXo6aI+iVlBSejgTuY14CjiD14HvbmCeI6sQpWYgTYYyv4D7aYs
	ZLxYVS3qGi386oQ+tjy2/45atrrgdnq3mGpvgS+vEX9UyI/tN4p/kXAyK4PMdhiVPxy+mt8qvIj
	DqMVf1lF/yfzsqBsRbRo/9fj0ZSHR/fDOLRBzchYlA2EZfswkfpg4sF9w0wawJRkN6NBVfTBLzD
	Nz2Sithhk2n1O7cmtvqHxNh65R/fu7dKKPgEDuCaUsQoDghNDEW5fc3IUJGBuG9mxCiDHLeQ9uu
	U+TGvagAEkQxUDjG3kqr748jdsssgLf6xbsrE1qmG5eHw7+rU1wGt31/Um31O9Y44VbOE6qEoHC
	V7D04kb8VuyMysg22ayc3nnmbIS1h4gh9mZk82Q==
X-Received: by 2002:a05:622a:1c11:b0:4f1:ac12:b01c with SMTP id d75a77b69052e-4f4abca8917mr217344361cf.3.1766484509796;
        Tue, 23 Dec 2025 02:08:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGggn1nlQn909OxifadLVIHuwQ9ltP/J9IvhW1bDhTLBQpcC4YucBCUI/n1P24jN0Eyrcc74w==
X-Received: by 2002:a05:622a:1c11:b0:4f1:ac12:b01c with SMTP id d75a77b69052e-4f4abca8917mr217343951cf.3.1766484509333;
        Tue, 23 Dec 2025 02:08:29 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:18 +0100
Subject: [PATCH 1/6] i2c: provide i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-1-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=88tiaV9HDvlr3GN1PksEheeTAyjNgOl38ys1aboqBxc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoTMopPxJ6GO7jTgjM3KEDBfsvJtWFWAICPu
 igD025MAceJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqEwAKCRAFnS7L/zaE
 w93PD/kBN9hgydLIL6zjxH4ys73jsujiYnt4mcCTmshlf7mAI7JPNWaXD8GZt0R7n1I5tZRlCI+
 qPBbM9aZLTRJMXJy4FOysOL1ar7OXf9EzgSOUvDxMUJahCWCqglE3PuWvVNy3Zm5ljEbyKTiqCe
 axhlmMyaVAdq7zjxBvuSgPbzreWFvuX/IwiamNVYmmzLS7RG9WYc0+LY2kKrAAy2g9eKNqW7vQv
 rUfx0/h7clEA65jxYTzm5iqD6ltlJNO1s4Z5VZTqOE5PaOkgGvY9kbYGugdU7d/c+zxXu89uKH6
 KysF0S9fRIN+RTv2S5K9JvSyjA3FGz0amd7PlffYyHMiacdRqMku6w6PqAhpyumJmJYeL0qm6Na
 Ot9aS/eIv68qsnndCqmcmQ/moR0LAvasU0DVyNHNN5eREd/1zDYlEL8R9GVI9E6nYIlHk3sGP96
 CcQEnAqGdMaWG1OH+1LCuVmPnhdQKurtGFg5GgYQljXtElqi2fBueZJP9O1iwdEmD1nXxFsUQ2k
 5XG5AeVFPKNjINN5SHebADZabOi5bM58Snbt+QXnGKlazC752fYak68abSHs3tDrts9vR4fOjJO
 subkfv9RiYW28zUhRXDqSm0818NDw2/xP2ixVrkMe4OlW/yVr8pxjshFjGs9lhjIc3dwiZX/jcY
 UOrQ1JuZ4rK7qtA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a6a1e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GLuwdYkDV1VJkgsO8fEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXym6kV4m12Ik3
 o2dGHJ4ejqKovVXfwhGtksC9ZRl/+7+aoCGgfMmzlnrsDiKpOBeQox+gxvsGX7gh4meV2cJ1lQf
 nJFSC31lOPBmUedNqBG3Ns8EyQBVZwVclhiAQggmAuYHEZbi6AIs8L+t2LJpw67MKmBT8JtarZx
 +/T7LZUUiQxlOqDR5HrsNhhY2rwNTM3F+EJh3W6cQzDdsDLWvet01L5igOFDPhnlLSsGRarSylJ
 idia/f7odE/fuz0xobpFfcQQXjfTJG42DzqTRaWmFcX5iXPguGUzpChb1guV+w+r/+hTfsKFdUa
 9AegChuv1wQO+3LVnyDZDbZB6kvC4FzpWcnCJMPG+zvta7HtWFtMcqbjdOz9BqzC56iLl4rWsok
 bBvIxz6pKWnK9R65MnWLK5jRDwkQF6QnOvlrx6PmyZZ8/rLHjBgFgMo8F4FnubyP0yyXCf3pjPB
 Ac2g/3ATmwarzIQeJ0g==
X-Proofpoint-GUID: Rus1Fr2BGvXUTOFglGEJoqG46gOIQIkd
X-Proofpoint-ORIG-GUID: Rus1Fr2BGvXUTOFglGEJoqG46gOIQIkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Provide a wrapper around the dereferencing of i2c_adapter::dev. Once we
convert i2c drivers to using it, it will be possible to finally move the
embedded struct device into a separate, revocable structure protected by
SRCU.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..b5f4db9417aca2e058c8be19d57d693339b6f9b9 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,11 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+static inline struct device *i2c_adapter_dev(struct i2c_adapter *adap)
+{
+	return &adap->dev;
+}
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


