Return-Path: <linux-i2c+bounces-14715-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FCCD8C31
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2A2030223EF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3273587DF;
	Tue, 23 Dec 2025 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPqYVv8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLsnA0O4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58283587B1
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484427; cv=none; b=lyaZWp/6naQLS8OtsqHo8LUEDrwuwuWGEa0Mat2hZgebIPK9A1kcz/KCgIGV2ODxfZFJYG4th0vwNV6iL6gc8zkcgZ7fgj6Ua7wgokzj67nIEsdH+iVPuAr77qXnG9AWkdgLLxSXvU1yTC38GVrxo8/JKOCe56r12NUtJJxzMwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484427; c=relaxed/simple;
	bh=uPrU69jJjjDzzPs9zTVkGBRLuMqIa+yux5ApYzUjbR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hkiyNmf+f/pXT8hfdlaCXKq3iatHa4Vev1K3rsCFrEktk7P+Qg7TZvdNbFtthiTvZgd47gBixm+t840yTL3TrUFVNpIY2inbfNUoXCjNV9JPXwZhg44vyC+A8oDjVfT2tOWfLQDi6pDum0aOyabGQwYMtQRr1BHu/Iu3ZJ4ELs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPqYVv8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLsnA0O4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA1DDK1895207
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	juweMgYejSYrSpmZ77UqrcC6Z77+e3yS58Y60ZwfBrg=; b=XPqYVv8Z8TfvIRYI
	Oyn72LHLA+mmMAoA22pfnp7Es4pBKvajVePRig8zTTLBh28Xl5opOixp7EQapPCC
	26y5dj6zH4Wf48ka5KwV/uQ9gciyNsgLhvg4FqqbXwBXlJWnzzsTGZfv7LT4GK3+
	sTMtAIA9HMhSIzk3yjyKNTTpXPNioB87f6Z6yMz5BvjzJ+L4fyOAwhSWuNLxQJZG
	KATeGbLH90CP7Urnlqv47nfH3k9YW5w3BRfkWjMPIo9QeEZZg2dbuMYGL8NccLo0
	eSM9oLEkVlPeV3S06sIG+5ROh58BTEoYslSrT/Ir87y263kaR6AIqBpMQWnR9+lY
	nQM5rw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takf4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9ff555d2dso1107430285a.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484424; x=1767089224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juweMgYejSYrSpmZ77UqrcC6Z77+e3yS58Y60ZwfBrg=;
        b=cLsnA0O4g88ZONsU4j9/WnGfpZnVr7SD4WZIulp1zPSXE1djo+/tqnz6G9Rd2c7PTM
         eBDnOydS8sMorJCip81SUeqT/HMbXVrQNo3FaH3h5aaoyYQhNRf7ucsGR/98E7FSNRbM
         wITiqzeDeI26UwyXgDKnc8H/9NsMmFNiqmgC4XESEowF0DtNt1zDmfBquzbeRyrdZ6TM
         FbNsZy4VPeqrb7NUNLQZjLWL9Q+Ll9ppglY1xFJz2dlC8t1AjMhlsD3TKKUMMzw1sQrq
         sQSojYcunUDIb4UACck9EQ8eZGw1b0QkmxjXcP+f43aN6213M5R683XlqQsIbwANiVzX
         kbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484424; x=1767089224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=juweMgYejSYrSpmZ77UqrcC6Z77+e3yS58Y60ZwfBrg=;
        b=Itdb2y1GfSD/BYzgGgnZ6gfFOiu2iG495pXwJU60crms10kxDZskpBL6tquc+hFTFg
         lmoG7jpisxNtXKHFj47tFwwQDjhJ+VuShKjxCktL+BoOLEGSZzXTFr85XLLAcJ2Imq+m
         qXdvii92+jGlYGH5/DFCqs7n1u47yXbJNcRe/zvVBjNajmkUzSCLriB/LGoTQgoru+Uo
         6X5EnH6MdJv2lF/WoBzsi2qg35oaqCR1DVUcSelTsXk1L2hlhuKGt2G5LghSZX+BGOsQ
         N+NAzc7NLKB66SOx7QjHX3k3aCUURsBawPBqorCd7iBtuUhlM2NJ+C++vLNt5fhSmFZo
         JTpw==
X-Forwarded-Encrypted: i=1; AJvYcCXFzH297W+Xt1yKkaZAVVwNtvyLKt3Uv063LCB8Tp12HX0JeskoidFxya35EOUz7o2Z6uhUIx9x4LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMKRMwfqJwkocZC8kJGMJoqh180/xhEhnFQ952im4yG2MKLn6
	aQW9gKF1zczjfySQFH12dCSV3fsrl5BsXXo9dG9M2hJVtzDYLAsYNfd4AK+KSNr/iPqj5eCSQon
	kXU8guwLVf7iiJhLnR9Ja6gsDID/SwvNFz37gMA9XuzZBmYX5sk3fJEHRkX/eurM=
X-Gm-Gg: AY/fxX4a4Jgc5xIWWwFcwU4mh3ZZ36t3/loLZDcq0BEVS2JaJTwF+8/tVLUzakZ8DIE
	LgXuaU3El6dNZe9UDP9+KwiZS/DWMwLQO2LTAmEWSVYEaWQGrYZnGy2IP/rCrVKz8fPbEuTOmI/
	NbepKuTZT2fUoY0Oh39soqYpKYQ2H7Zxkac9qSBAALic/0el6iJ0fYe9yB41FCZ/h1wWMdeTJMs
	Wsz7CoMn2nI4q6r4uwFeUy2uzEJ7km2zuUbBoMSf3m6w6qVwPp+pcLhOrsZK+9+ca+Tc7jN0BS+
	OYhlooQLBh4Vzc3V1Yf131YZfhiBW0OYpLCNn93upwUjmoePmOcCw0a/qWVmquuAHE7vcZvOGYs
	OuS2y72Y84RxS6ozqgKEDfyAVOtdiiM686UY2qSw=
X-Received: by 2002:a05:620a:190a:b0:8b2:eea5:32f8 with SMTP id af79cd13be357-8c08f6763bamr2176048485a.34.1766484424378;
        Tue, 23 Dec 2025 02:07:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWDu6zt+DQfYWz+vTTO2WOUyFPSLyx1bGaLD1TftZal8WomrstizMKzf/LBcwHBoELoQVwGQ==
X-Received: by 2002:a05:620a:190a:b0:8b2:eea5:32f8 with SMTP id af79cd13be357-8c08f6763bamr2176046085a.34.1766484423981;
        Tue, 23 Dec 2025 02:07:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:49 +0100
Subject: [PATCH 2/7] i2c: designware-common: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-2-2e36e0e785b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uPrU69jJjjDzzPs9zTVkGBRLuMqIa+yux5ApYzUjbR0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm9mlhyvvLd6rGEB/dLZcstNc+uNT3vWjEq9
 ho8sVSQnnaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppvQAKCRAFnS7L/zaE
 w9kZD/9sZtCWXoW0LHH/ibfIyYSjZRsoInsB4We16rK2iMOuj7e/A/N7/RScuWTA98TbhBZKc29
 FJErwHcvlsFHdz3qT6RWYV50OHPoc1v/lw+iLGsKJazffltiChWHQGKL+bcO5RCcWF5JZHSJHyp
 RE60jtbVLb6TD116xBWD8hTr6fsM6+1M6dR+EQef1lgYVyRlzhvJ6kEXknSEQR/mtvcGV70swI4
 3KDU/iVUnllwKmci9DTQNmqNQkKHtsVdqlyymid76oLMbSrYwp6YiT3rwgCkJDM2QpjYuPN5fv7
 9RWuf4MsDJJC8md7u7AVitT4PoctjH2kYpZSyc3u4JYdxkqj3Z315i+lebS2PXcywxDXqtU9qbB
 WUGdrT9Fcs7FrbPr/fhsMviGJitM4nQENMWmHTqLATVRPynPaEyax7b/gslU2iWHNEQ4dhkOi5J
 SpYw5POEeYzpXU1UG7XUrp0efsRSqG1qJn1moKXMbCDpY6kAxiaLz052QYti4wNQkvC9D7tvt40
 PM83D2QmlULk/TxOwsRZK+uMixAcMZQa0M6txn0sHFhjgLkGBf20Z9bOlN9ObBHJXF34RYYA1q7
 /kVMy8uoXxXZtk5uaQrKINq0fytACI5OSWmPHE5y51rhBrC6FUrT+N2hl8YBH91goUUBZih27k/
 +dSVDSrMSWf36DA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a69c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=k_62T-OXn5zvXEb1i58A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w-XoFbAEdGe39Nh2n8zkelD-_boQq1hI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX8KnEWs6fCvSC
 rKmr4qnpxfcsxDeJ0db/H5tYbQ39ClOt5tIxUi6pwgRfC8l96YUgw2AQ0iK6siMijY4v1+9hOW4
 Jj24BCovFt0T8Z14eb9xVLzl6eRW9WuEOThKslh0V7D1zHlQD+SSFIbL3j8nxT7770+r6hguBFn
 YoWxht4ebh9MUVlxbkjIftE/G3ny6UdaJREwpiGxJ3AaB+WxLSGfwaVFKXYLNBPTACufQ7qxpz9
 wee/BZQvobD3SI796SuACHCws91Nb8eRjkegZj94DUJ11im/wqECpQmdTIzcmQNC/r79gTaGvPL
 Y6oZL7BQuUfmh9L+lRV7AAoEUckcHweE2N3jOqH7gZR+G+GreOxImy5mGiROaOhZzkA7ZIU092G
 /+UdMDt9OcNUWF4VRFJNKLxO7Gj8E2uYtRutJfAUitx7Q/3sIO2zUQwHqdzr12ecjx7R1Mowi7H
 9/sTp/WfyVB2fgZCR4Q==
X-Proofpoint-ORIG-GUID: w-XoFbAEdGe39Nh2n8zkelD-_boQq1hI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4acf4ca875beb1fdc736a89e4a357b9..c9644c927b4adf29dccf7e377bfed744844c5512 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -743,7 +743,7 @@ EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
 int i2c_dw_probe(struct dw_i2c_dev *dev)
 {
-	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
+	i2c_adapter_set_node(&dev->adapter, dev_fwnode(dev->dev));
 
 	switch (dev->mode) {
 	case DW_IC_SLAVE:

-- 
2.47.3


