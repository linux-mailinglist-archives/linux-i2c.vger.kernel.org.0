Return-Path: <linux-i2c+bounces-14726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD0CD8D75
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AF71302426F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6130435F8CF;
	Tue, 23 Dec 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NeX/NH35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1rFzd09"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F835E55E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484518; cv=none; b=a4T90vasv0fjFpD+szZ5irmYjCxq2RdOnd0yE78FdES7cwVU2/HAp5zoEuXGXgSbAxEn5x3utrr6GNwWTWljIy9BAIrAuyjCq7L8LRtY6Iy0g1XFrZ+9nhdT3onwUZBbbQZw17AZ2mVdqHfzz0wUpaPFq7WG7XGSt3K0VwJvsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484518; c=relaxed/simple;
	bh=y3xzEcLHLeeFXtr5UhA0O4SQ9uJAPQdZzwUCM8yk96o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoVIR+N/2OFvAEGHY1obfxM9w3sSYdWsdpH7MHQh+iQyeKGj33IYq9giwGxMofzepkPFfgM5PrZPdACRnxjykN1KtaK1WhiJqBqwwbpWYJ5rWDnV5eHj5hmI6svOIucvrcUhmHnadl5aiEvU7LYnpNZewDBdR/vRGf/tR/p/X1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NeX/NH35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1rFzd09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5N7mZ1901938
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r6I79hWQDv7W74VBbCU9HU1v2iplZDXGCOhz1KCXitk=; b=NeX/NH35iJQpnYI3
	YCBZCLlRwuE70GzcxF/qBxvD+yOipMHGQvSmKBGgR4KUZD8KK2yUKVXkzOfio7cn
	K8WS92XRCjl8tj27xAFyoo+y3VOBgezsl4Mn5KOKovqHPcOYK2Qvp2EuIBsYKcI1
	d03vdGBs6iPHXcTLpm+4DKEg04P59irg6U3Y9mNAPjJ/o2TP1BRHtXQxcbqOY2Ws
	mH9rRVHF0AYHD1hJWfPgm0b2xBHkeEI3fRCihZdhihTgSy4eZ5OfPHr26dWweeZC
	UsqrOQ+9cRHjh7w7fouETfMfRlyJ+0nBozQWzA/rPGz53RLHvEo4dMlMRwagY6Dl
	PVwkQw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jm26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1dea13d34so109819611cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484515; x=1767089315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6I79hWQDv7W74VBbCU9HU1v2iplZDXGCOhz1KCXitk=;
        b=I1rFzd091k1DnIEOetH0kSlHVVeXRMUFnANK+Tc7ye1hNC171SGx1o+0ZMSeXYDE3B
         18MieVYa4tJz57Mo+qK/GJxWKBJiL2HTl7CWhd39zaYb+cYjAAl+IgDFRaIK66V14z22
         +I/BjYXwGCp2gDEm1e3O7Iy1jhxpZ6lX30ophANEFprS7EoC50YHxnN71U0cSEDhaUTx
         b7u4hi6yIoK3u3MgfqjlQhi4uasESf69NldGwf8Qcv7gpqrZ+/Bdcl3lk5Kma/Ysdook
         KZJLuslaITYQ+LC1Cjhfqbu4E/ENzOPG20ykaDInNYpwlxcd2qFLFvLUyhn+0ItfTU1r
         xyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484515; x=1767089315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r6I79hWQDv7W74VBbCU9HU1v2iplZDXGCOhz1KCXitk=;
        b=X3dWsX9OcFv9zDiUc7y1t35XQEF/FlNJvQnvplQu/SQTLdH4SxY7lqY9nN5/6WFuxr
         WXZW/hFxtDETfeIjSFfITFoYtiixGrxQCo41rRYi/lzxnIZyy4QK7ymmIAZwzz7Tl5d3
         krFuVSnrmL+dZuhvbiQbFJ/8WDDw/ZR6isyYf3ipRvi4KA6q+pQvGxNHILTQUqlho5nq
         h1/4Rmzy5r5wIdXlx6zTRuw9USDsocM5IvFJvX0pk68C/+sjmH7hZnXE7Ry+Yfe8bbMw
         4zcHqLaxXLJOsWOtxMCYaw6Zuqgek+mjHSFSwvosPXRemC4IxR4nJvOnf+yTCkSWY69V
         7Bsg==
X-Forwarded-Encrypted: i=1; AJvYcCU6n8RABXMTkayxiJqB7bWkByFG/oG6Zzfyw6WzpEUcFoHOL9FkwX9kJtL1eHECxp6hrpFl/pip7Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMk2vjGap5EZUUeeDawiYyGkWJmlCLrUfP+EgygNm6Ct3tCPF
	4voZkI7FujG+UKutzZeTOH2y9DWPMFFYYhVVK6+YHe4/hQK7FAUAPHPEz3wIXgTZL5WuyLMDw8r
	QxUk3qJR5E7tt52j1Ug1w5JWKBm42psckwZVv9JQnSIyu6ORDpXFS7muHXnEG9I4=
X-Gm-Gg: AY/fxX6RLpjsgjbMdwG3ki7Fq2KMECQy78ULeHrDBAg5FCZAXi3/QkkqEotFly6E/Xl
	AHLf0z8qiwJWAZMhpb0l8/XEb+8KApitE6vrQsGnxggTLBaS9ECeu15MPqviOjS9GLtvgcXk3EW
	OImJGU9vXa/Y4pJQsHRFo9q1mC9w66nztAwSpZ4NAwE5djUjiTrE85w2b2deQxFdxx3gj9/AUrO
	lgm+mNwrBRq76cV31Y9LPMPWK16g1dcEyc/HbWWdMWI7AzB0m+VUiN1aZftvAuSYlkQiUjeqydq
	KH8LUOHWWP4cx2n3PV6jGUtzwvqYtTd09Mcxm9y4bNb47B1ip+CunGeyaw40hrNekHvGxKC+S/7
	6czlwGxXeP9YSlvUT7GBSIbzp2l1sNPDS94Duyg==
X-Received: by 2002:ac8:5795:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4f4abdd1c29mr220080631cf.83.1766484515110;
        Tue, 23 Dec 2025 02:08:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIsfjwww0hZUVJ1EPMtgqXs0caekCVJt4soDeGQjok8SNtVA79yCESzlNvVQb8Pn9kRWktng==
X-Received: by 2002:ac8:5795:0:b0:4e8:af8a:f951 with SMTP id d75a77b69052e-4f4abdd1c29mr220080241cf.83.1766484514526;
        Tue, 23 Dec 2025 02:08:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:22 +0100
Subject: [PATCH 5/6] i2c: mv64xxx: use i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-5-bcf960a48fa9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=y3xzEcLHLeeFXtr5UhA0O4SQ9uJAPQdZzwUCM8yk96o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoYZR0ZKztXOuSfvK2+I1CJEH9AX8A3Dyy8c
 c+c8vpihE6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqGAAKCRAFnS7L/zaE
 w8IyEACtyT5eSHP8UZw7+ymyIVVNUUi0tNj8gZM7B546wNeqgIpIBSn518OXBepeBt1nnyvIkMX
 hPyBwK2NXtLUUNaYy6gTqas9AZug9fscMW/+vixloYKxSswjo3WaqClpLhhksbUo7smdTZGa6IX
 c2x3NBzdSVk5Ayigw0/PBzpBfk3wz/eqKjKZeYV/tZ/xifxD9a5bHllAPqKwCnmN+6+qXT5+Keu
 tJBY1s0PW7haT23tm0Tp07sfuKk+8PQ/WyxdkN3Sh9rczCmI7KCW3/SzI08Ywa/5PQ77sMYUVDn
 DgZ5cvSRAeSLJw0zX9dfiUfaOwdZtVdRjGsK/5SfuO7ch7oe2GcoWMsmksk7hEJPN+h5QUkCuxF
 2BrJMIrd+bJrv44LOlRyd587H00g/YlCmd2eLLlmQ9JmQEtrqTijc/DLX/OSH3Ws9GuJ3/8xbpd
 TC3y5Me4o2ZqPQv6cgwpv82r4TqdD+QwqzCV9fH0N4NB7rahZ7vXXAmkEKjjGDAYJYG0CTb+UEu
 m0KXWZ9qshWY50mNINskH6QuKLhNDJ9WnDFLRtQfKgIYqkYkVzvU6hK4WFDKVdcRojE8mBJphrJ
 TLpjXv7RmYiqrLtXX1JY7wk8JWRjV/U1uu/ef4DWt3ThL+cpyqkkh9z9om6dzOnUV10ndLnQumI
 +0FXBp/ThW6Kuxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3vXc5jXzTeWM
 oyTBbKD+U2o+xAM2nXO62lnfIbIGnB+2TCgIscva71PRe67MpuLEHhDKhmFGI2waCXiwB0pti9W
 ErrAsJRsf/m7gsO8+9ubA+NM9frZ2jtidtfsKjIavWFTgjgyO4qVYpyK9xnx/+ZOdsZKClbirM4
 NjHUkzvZCdVhTLUHnSx33Di02UZv4Q2jSkXp2G/RcbHWCpD/8WUP7nsR5FcfIYhbJ7eUqd3OL9o
 /JM3iZmFJO3WkUv7+8qbYuMQYhtmSuzWFJBEljZkLdWTdE+9YYsVqVdyBVBDWK2BxyO9nrcLDv+
 aR97CeKGDKZdhZ4l13/9SePcTeXudP2BCArRgB9Qh/cE+U4AuwL3jH2WQfMp1Ur5qHqTi/FN0jp
 JJxtt049Xuq3BCafRhml8Ww8x0YiK4TR9R7UgvYO0+gS2IrqwSncK5Vff/ecWYraJMJj9RMhDfJ
 za18FjirSfuH0bIxySw==
X-Proofpoint-GUID: HYj1KOaDtpm9WgpWcepjW60tvs5fa3_y
X-Proofpoint-ORIG-GUID: HYj1KOaDtpm9WgpWcepjW60tvs5fa3_y
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a6a23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GBZ916XDBFmreC34BHYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Use i2c_adapter_dev() where applicable in order to avoid direct
dereferencing of struct device embedded within struct i2c_adapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mv64xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 1acba628e16c3bd1dbf82c777162870cbe3815ef..7892793d2a1cabf3376efcec1d031c3d764f7731 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -747,7 +747,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	struct mv64xxx_i2c_data *drv_data = i2c_get_adapdata(adap);
 	int rc, ret = num;
 
-	rc = pm_runtime_resume_and_get(&adap->dev);
+	rc = pm_runtime_resume_and_get(i2c_adapter_dev(adap));
 	if (rc)
 		return rc;
 
@@ -766,7 +766,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->num_msgs = 0;
 	drv_data->msgs = NULL;
 
-	pm_runtime_put_autosuspend(&adap->dev);
+	pm_runtime_put_autosuspend(i2c_adapter_dev(adap));
 
 	return ret;
 }

-- 
2.47.3


