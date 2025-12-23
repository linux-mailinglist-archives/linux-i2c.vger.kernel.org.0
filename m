Return-Path: <linux-i2c+bounces-14717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A0CD90E8
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 12:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B841308946E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42B4358D1A;
	Tue, 23 Dec 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIz0Cr4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/3rbNWx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793ED3587DA
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484432; cv=none; b=P25i6RigHFrGlstZiiJ4mDmH/oblLkF0T3bm8vyPXHyLd0t9M3WBktF9M2sBjDsKRQwUF/qCgQToV2UTDe1VvmKqqKOZVR8WZKDN615Z6pk7Hz6dEnXO93LTb8MXCcVVajZgZIgt5ApfadADbOQCWbUvkyuwRqOQrjO9AtlEh3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484432; c=relaxed/simple;
	bh=0JbXOIpZEOrx1UfxFnWPcpRphP3LOMkZf57KPyKL5GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdBoIT2tGusPbbh6nztiUM1KvhJyGsnbUqCpfYoNAGV+a1D7mf4F72GCjm1W9dW47rgXhBW3ELZrAGGLXgkDeSTGqesCuYkvt2UGhRbUqvqBAxajjb+tumY+zrhut8oAC6gu+BSj98H4m4b954X7qswGiAy63wLlv8xjsbIYemk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIz0Cr4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/3rbNWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7H4oo4044741
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=; b=gIz0Cr4dSuuru6bo
	QedNKSjuGvpdShAtpksIJoYVRbGSuMBr55+P8UFJ4JYzZNfzWG5wEBESKon1jBRO
	CTpyoZXllma7cp5d5vtT8GgCO5YP6YPgVi4GWyJFg6Sp1ikWrM1dMp+EuSdnXYAL
	1ORaRyYRW/h+glmPgJ2BrCP974flOQxkQzXO8p9ZYq6i9mbZPT7SyGuDM0iT2ExC
	V2SoemtjI2ECJotB9tDsTs2x//N6gAZ8kf5ePRetdxvEsBNPSM0kOJ4t9IgYgdfw
	Oa5LwqUggiTl9rV+ej02/ORwjx3w+ma4pUEwDGOv1OLAI8j/2VRvV0+OExqpnf08
	B3Hk/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha72n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee416413a8so52866871cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484428; x=1767089228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=;
        b=I/3rbNWxhjum+PF2f0ZNVotEl7fmFfkWSMMMY8jGDZItnKRe68hwBQF4TDatYmeH4M
         4+Es+0A/sCvNtaS+Y+QZZ/CXrSTgOPdh9LyaPVqfRzPyssdcKENauWGho7j0qq1fo7o7
         KEpDc94jeoRObUIf32wgVEr9O4xRyy6QqxzaUq6D39GQqzi+0JFz/8KNX/RQoyRGzf27
         u40NGxHM/x83TVUKq9ctrrSsnlDdpX8eGGzyPWUZq5+Jh4UqMwy4jqlqmvQYkjuLwx6H
         XdhWbXY/uGmnnAj7mvCZheQ2xGAAgiOpaSKVJYgdJpKck+Mu0hZwWpKbTUXFIzq4B+bP
         cLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484428; x=1767089228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=;
        b=FwfF5qC0czUmFGpNQoCntQaS+Czfokmgdlfo6hTd7fRR/6n+STTSZwNGGu5V4d1WgL
         i9obKZbvL9kMrvX8p37DGsExVuLrYnNeGjKez6Fe928+yW3Az3KhW3b5WJYmxNYKoHeD
         cY4ljqOICOCZbRNyGn3ERVlaGKiFNhBZwCvqwQd23bcEVOEMneq81PrKJqO5BP8lShVJ
         Y736HXG2Eh7FEWijGCibRy7EPmIBJdF9gJNVSw54JudSQ6DrxJlZ+mePd+gTjuQjSKo0
         p8Jkl849qZ2pLTpJppSNMDfN2TVjgxZ8wHc19+ycdb4Y6sNGVI4xqLs/1tIshCVnZ34+
         R6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUO+duCg3nJDqobDbTV3619074fX2z2Tky1gmGysOSRCljJAtDDwMOfQB4fVqJ+MwWnBx2NoZVRSdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNBiu3g/rnTOSy/k5wMZs6YkzlxbAfMSiyJE0qtVftCNlBLo1O
	mHZZn8NsD5eObw/qmxHU+y1yaG74IBbxTZ9AWLF2jD6cAgISkvM6v+75z+7b5iHJb0RuUnHxLSc
	eeZ/xGLyIUOMsyHJBpKMTTHRWyqhyG/NqgR//eJS0KrIR6omX7vDB4XAUQvFQnE0=
X-Gm-Gg: AY/fxX4FVv6z58dstQeylhP/C7VicBWPoopm/FIR+OSJ8W0+KEofg/ytYjePiGaqRO/
	dDL63P4CHX0N3epALk+sVsRFKNBvmMyngfjxKlLhTHRpUEzzVSLFtWDP0OUYNob9/BxBKwlM+g8
	SZEzla3Alald2SDSlCO4dF4blzj6IByE1DnHGIrpb8f9QttPe1BJT3zc8jmB+gOgfWssOvRRvRQ
	h79AEX2WzdEVmAhn4n1yiL3SKkHYS3PRLoMX9Er2maWRPT1cWlqypi6ENm84SpZlsPXDjyl1mDx
	2wimynFKx6nxs44Dy+5QzGuUBx0uq4hsQdSL5PGADw/KrDaM9HB6Dfw+2BQzndXTZU+VbnDwIRl
	WL7JqmjCYO+Q71VZ9ehWga0PzEVH7U75omzSX/cs=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221858411cf.1.1766484428143;
        Tue, 23 Dec 2025 02:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTVHsBl7gHuLA4sPTGJC9mEObuSiIFs0tCZLdNa3Qm5vipCEr5kWx+2CkQRJei/cDzqN46Aw==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221858091cf.1.1766484427683;
        Tue, 23 Dec 2025 02:07:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:51 +0100
Subject: [PATCH 4/7] i2c: ljca: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0JbXOIpZEOrx1UfxFnWPcpRphP3LOMkZf57KPyKL5GY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm/8SGGLBzQGTGhTcja8llpPIPgzzq4eLmri
 TcVEP30kwiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppvwAKCRAFnS7L/zaE
 w3ceEACSx3WHgq5tFvfjhzXF5VbN14F+LXYUtYwqSQ0lTcNQlW55lMZZjPiDsmd3qdYhn2Hgpuh
 IY8+Zm0SoosQJrRjnatbGJjj+TugQtkpbGL8JBFrO0N9dqNnQWu0fI86lBoHrN6z35e0hDKZyGN
 x42xPk/vc9nTWcHIzT6Nf9puJgb/lq9TU5m5qUgDSAfzQxNoUAgpPmLJdKu7OcJ6DtvWGVGvMPF
 MVa0IbwZzNIVATt89iD+ujhrOkWziFNeOsyFQG2VYbVN/Z1QpVRkc5E0wRRaTXXoealAfiQe23C
 xdUDrR9skR/HJrmFBTRZ+T+6E6qV6QvLIb7ZfFl/xJkKL6pLGef8/RBIYB2SWnJcavSTlZQIAvw
 DDy0NkDP8Q091fR3nyRnWAhJSpSspUko3wmkAl74AlC+S9SmJ5zHQzinzGO81eQZMXzZb9Wbmrk
 2gKkS4KucOkuZC8ZQtEZ8FxdL5K2sky1eOWH45DG1Le1HMuzK9GtU+cEtW9ZOQfIaVbtnoB+STe
 es/ilbqCnfZm4+SJySqbbLa1O88mOYgYqf7c2Utl/jwg83885ayytGlDDKPJWjuMlFx00gj06of
 EojNfHX2JS1G/+pGH/nbehAnFnPdNldQWC/rNLMHYLGPO4MFdQ4NI0+pPtNgXkc1s0dNS6w5Qo5
 jno4DP5BtxpBZpA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: cBjiyyCJH6IUcO4DEfiZty2CdjHJjWyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0QDDtljHfNLI
 w14JWjC56cUVj/FC77RGfaq8cFabvaNTngAMPvBanHbSsktiomtzrzYJcg/LO/SWSkUbdUlF869
 9kvHk4krqbAQUzyJX5gmeAz7oW4/Y8HVo6B2qFUZCv1WYDY6IpK+q8VJrBGQ9nHFBZB4VnDi+a3
 3pOavdGOxiEUKZu51gQ9UOoXKqTqkQKvTpsPhG9zYI1sxZ0pcr/JWaWxNGN5T/MPoSdUR7UWfpL
 P3+wfk7dkZvkZ8bV/bph1qN/WwgZJw/WCVuwX32t7r6CUZyh24EX878pudXMdj8jXY65kpM8Ski
 ITQ9sZYsQJHoTTQ+MpzvXrC5aig2yiE+42LyhH/+rLDonDF4PaQqTOz7aflMRvPNW6Sp0xg35HU
 bbaVBEE1Ic/4UnHJ2MGKYcj64UCjlbYyyfN3i2deEAbmcGjXBLrjghBdtA04mpBuCB40vjJUNmY
 CSutL+PUZ0EuEfG0+2Q==
X-Proofpoint-GUID: cBjiyyCJH6IUcO4DEfiZty2CdjHJjWyR
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a69cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qef5meMf4vxnS_XW8foA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index 93274f0c2d72166bf017f65af797f418743b6a57..fb45019b1a0c583f19bce3523983a79d632da3da 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -294,7 +294,7 @@ static int ljca_i2c_probe(struct auxiliary_device *auxdev,
 		 dev_name(&auxdev->dev), dev_name(auxdev->dev.parent),
 		 ljca_i2c->i2c_info->id);
 
-	device_set_node(&ljca_i2c->adap.dev, dev_fwnode(&auxdev->dev));
+	i2c_adapter_set_node(&ljca_i2c->adap, dev_fwnode(&auxdev->dev));
 
 	i2c_set_adapdata(&ljca_i2c->adap, ljca_i2c);
 	auxiliary_set_drvdata(auxdev, ljca_i2c);

-- 
2.47.3


