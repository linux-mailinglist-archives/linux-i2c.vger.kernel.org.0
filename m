Return-Path: <linux-i2c+bounces-14714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F66CD8C13
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 932433028F6C
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE453587CB;
	Tue, 23 Dec 2025 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsYfx7th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkgnRwwt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354D357A56
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484426; cv=none; b=ZMkeIhjtwk671Nlz39qx4Qo1ZNXT2YCpvM7IdEQiH8MvQ5UqgXHRLVjtHRtLfHexLhjVgQFxHl3TwLcndDldVMO6H0k183RA4ScdV+qaB2615/IloDcEimRnVoVgzV2ALAURCpy5tdPZllgBFJ5EmN8z2pmQ18y0WxtNeNvT8E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484426; c=relaxed/simple;
	bh=LAcxiKQGqL+CB6msjFSqS9xK4NleUINdt5fI7Yxx6G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6D/EcgNicWmlPJsa7sZ4IapqYh+vmEKAAChm/BN1XLzfBdbRpo3SaVTJ4TAH9VzngoJQUrqKH3WkMVrC7koNWx9fV57C3AWKdJ78pAhd3T1sWbPjW8uTMtan0l7NJCyyLhDl5/q5eZFb4RgHjpu7DtOYsj0ObrrFH+9hWE75hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CsYfx7th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkgnRwwt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN70KC14044367
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LhGSwvhhqN/W1BvF0vDxPbc0Z/RZ700SYFQ0gpFFmcU=; b=CsYfx7thZlRT+cmK
	Pbvk6v/10CGk9USUl4NkDx3szcIkWe75CxGXbRRyHVGHuT1qQuBW/sftcVBUBU72
	y6XlhAsFAKCaX1WvclMDdmamUsx5iDUxyg46mRy5noFNY+2Zn/ezzMB8jSqKUwJ8
	Ue+So+LZrBhvgctWT+GfMlXeYUBoGeLZjv+emsjNouypYCrutU8FEjoZaHi6gOVy
	8qIVdP+1jL6jXHQ7GxMc1/afFlIOGoiHlKZexJcq4Wz3eOr9YDTqfR0cid9OQf55
	6w9y/pBSwsbikW4A69CSRQy/D29m8kJuVIYMIekV1jHqG/VnCYTGOVuk7rCd9/jw
	8gW1LQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha725-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso161517891cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484423; x=1767089223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhGSwvhhqN/W1BvF0vDxPbc0Z/RZ700SYFQ0gpFFmcU=;
        b=LkgnRwwtsngJbM1II8cSNKe1mZw6g7P+CoR22wPqULNNhFxKqfbe3UJSHI+lLXA10x
         QsYlfbCiltu/56Zje3erDR/8fXBNKe7USzXbP2aZ03q/B7wgRbussRfqtJsmdylwnwfQ
         LE+gcYRakfYqieMeVFaTqTo+/LBsS+uUe4BfQICNN7aK14t7fG9cONu0IDLGGXAFIWQt
         OfzCHqHcNlcBsGxTMoj8c9utNXGHP5AD1Tsg4LXjpuiLAvTmeolPaQnzbOsD+30qNFNe
         10+d+ScrBSjDHwKnJKCbmoCRmQyxYzzre3OH5m98he29dkUv3bq8P54/tSBqW9oAH/Y6
         QeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484423; x=1767089223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhGSwvhhqN/W1BvF0vDxPbc0Z/RZ700SYFQ0gpFFmcU=;
        b=wB4sPRTyubNQIpABTdmc8dAsi5dSHHzmHX3flaryiM8+9lQ8nEJrzKkpEG7YVuu71q
         JoWeJIg3yh/kTlLJmtAUZRwow7AdgC8YZ2Q7ui5lVb9NoYo49Itfyf25brRMO9WKl+Gc
         M2W/Qp8VQBgOIIpEKu0M99e7xOtZgo2oEZ2bjUHFbfhQRAbqp2SCIfZQsPj5Ro7ubNrP
         3znqyVXgxcRik4K9JBDEHZjpzOK3U0Q9WdmrHcktN4R3cXkCc+eA14aKNlN/8vQtwLcu
         R9eXfno30WrzZceuJf8byv+NF1MhdqkhOWHWqyhxMER5/cgFG06ncoY3JhXvFreYjhGL
         HAbg==
X-Forwarded-Encrypted: i=1; AJvYcCUVJhrRiPpsKcyd/5K2u04MT4HPNKZrzuTP4QaWdSMsw80GN3bSJfC+qrzlTeMlIcuq7+xK+zWQYBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIxzruaXx4KeipBWGki7xF4hAOxmlcXmGtEwjlNRxqSPw1IUB0
	5mGoLye58rs7cKPy0EdRQJGfT1OK9w7xbZaecoXLLh+VK4nvmemWnn46lI7ssxspGyCQYKQepzg
	etg0TZL9Hc/cJx5oij7BgxzQGDnyab2RWeKDVPCgWBPEi3EiPDhiabjcRm7E3Ww8=
X-Gm-Gg: AY/fxX6poaM/N1dzkJ1Xjz9TZ9+RKPPC7NMRCJop6DQvtzloTSzFRZHfhevaYw42kPn
	GWHPKyGiP1DPCFvyNwTM+qxvjnTLSL4jtQO8ma7CL5NyMKl4hakPvDBH59J0ZICAsUIdprEoN2U
	m3chQg5oC3+sKtpb4HG+M4jJbDoqW0eAf4qW7tBanYEPwkTReFi9fajEzF5eWx6Ne4tWo/9CCpz
	IIgt3/Are9zGDiZrziNr2iKWQJJ41/cRLq9QyhbLzjbckaZQXYYZOt8xgFltSRhuEU6DcpNgP/k
	8XGNHgQkr+NQLTs+5HI43KsvmeFpm+az23PrElsVaLLuk57zBW/rSlwTxf2Rhn22JckgWbIDmV1
	WFwF327uRAMbjIDUdvJpJ/oNbcqnd1GK0g8P7JZ0=
X-Received: by 2002:ac8:5d94:0:b0:4ee:2423:d539 with SMTP id d75a77b69052e-4f4abcd8305mr221168261cf.18.1766484423108;
        Tue, 23 Dec 2025 02:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpuFJuPWbRWv8E1MSpXZGukl4q8fEI44ie3NYkFSyTgt+zBQrGFexPvbQNXrH4TTqPL7w5nA==
X-Received: by 2002:ac8:5d94:0:b0:4ee:2423:d539 with SMTP id d75a77b69052e-4f4abcd8305mr221167951cf.18.1766484422729;
        Tue, 23 Dec 2025 02:07:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:48 +0100
Subject: [PATCH 1/7] i2c: provide i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-1-2e36e0e785b4@oss.qualcomm.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LAcxiKQGqL+CB6msjFSqS9xK4NleUINdt5fI7Yxx6G8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm8OyAZ2b8QV+FJ5b0KXHAZgV6NCM26RTZ5E
 V6ic/q6pfCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppvAAKCRAFnS7L/zaE
 w4YqD/9GA7dyQ3bNp3jyFOMja9/o9Ji9UIZNzptXNtp3B/GgUXEyC8ttt0JOPlVcf6yfgGz5EPL
 u9PsuBVUCtTu4Ys6pLKQoFGMVTommbLWaayB2fXB3ITTY0xyouCsLyoz6/PBjNA1gacKkQu/16c
 uFzoME6lrtFwvs68HeWpa/yP4xk1X5nWvHyydgF4Pxc7UTyki+8N8jtIm9CIkAI2a7FJ8o4CJ23
 Arziw8fZOXU+ZPQ0xTKZoFBQx0Bq6kXdQjWJqZJLQaFC+YOnLrM1319LhnFdn42uZXyk8HGuUzk
 QuV+ckFu781H0EW4VFYj83QoP4K8doJHJfqeYvdLfKqu+M1kTsxEv7nBOhCqeGb+/VSiKwqDcwb
 Q0wSY9NDyVKgUT885LfQR+o69hdpRVKoMhcmyPgq5sMnLB/ACMGNv0+pji+3asnfGBb36RlkhWI
 lVjznbCVuDxhKx2VMcV5TjxJhRUcJAO4fVTu1NGU0rTDntigRZV6UDgkd+37HuU9h/T9SSLOGLj
 n6vD8Vne2iZE4nRN0yIWQMqczRS4dsyGDDVBcTroYEf6kyd5BidWU+gfx1x3zrlZdXr3/Abhai+
 7zKKoI91FwooR7gLLVwyqAvjrGijnVFO83mWkehZs84HbtzOfiEKgBxwW023Lz0hxLoqFxs+nF5
 uPtBh2kgz6Uhrsg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JgDNxe6FQV4aPxEbINeTzvpe3RW40h2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzDd4BCkUc7L8
 +euWJKeHiuByv11sKR1izKHs9sDk636PXLLatPgygMKCk0x6b4pVvJVW5xbSrrCf0tBLcauxUeO
 xIB1arZrBJUsZkztDnhycP0pEIV1uI1Cnzg+Uh3YFoqIcJeXdZsssi+hJ9C7T2991Jq3LoxkX1u
 PUvFCuIMvlrFPX/5ZEsV4xf2gRRPyeiBDbSTXnZ0aUlx02/9ZmvLxCmuPOF7p8gNVFnZt+DXoAr
 qh6Bniip2Bx71kEKV2E9Bk0fEDrDq3eEFFQhw/V+3Up28rz7Xt29oEf5e6RE3Er65OXBK907IP7
 HQqfjQb8HdytV28Knw9jezV/EGdhgwgeR7zwUEW8NclSF3DQJhb9xzWv8FxZNhQqWDaGEBY7kH/
 u0gl9oOl0H7V/AB+9g9JIVQpUSvpyjQNVHN48GRun6Vk4FhAPGCR0owp4yO7VxiGq6xT65SVH/O
 JWiVh3B4zkLVCp145Dw==
X-Proofpoint-GUID: JgDNxe6FQV4aPxEbINeTzvpe3RW40h2g
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a69c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IgsMUyhKevcMw2BC1NwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Provide a wrapper around device_set_node() that takes the i2c_adapter as
argument. This allows us to hide more dereferencing of the embedded
struct device as part of working towards fixing the object lifetime
issues in i2c.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..38448bdfac671adcdf341adbe2f52341e5aec41a 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -29,6 +29,7 @@ extern const struct device_type i2c_client_type;
 
 /* --- General options ------------------------------------------------	*/
 
+struct fwnode_handle;
 struct i2c_msg;
 struct i2c_adapter;
 struct i2c_client;
@@ -778,6 +779,12 @@ static inline void i2c_set_adapdata(struct i2c_adapter *adap, void *data)
 	dev_set_drvdata(&adap->dev, data);
 }
 
+static inline void i2c_adapter_set_node(struct i2c_adapter *adap,
+					struct fwnode_handle *fwnode)
+{
+	device_set_node(&adap->dev, fwnode);
+}
+
 static inline struct i2c_adapter *
 i2c_parent_is_i2c_adapter(const struct i2c_adapter *adapter)
 {

-- 
2.47.3


