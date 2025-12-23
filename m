Return-Path: <linux-i2c+bounces-14713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE04CD8C2E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39D88304F65B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541651D5146;
	Tue, 23 Dec 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHL1HvxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2OFlZRS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488C428A1E6
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484425; cv=none; b=vElK/zXu/ESBoDJwLb5CN0QgRmSaZZil09BkC6TQl9R1yh2nLc4UkVkVdjNskgb9+YE8yUBVPz4ds1nVusSNTEHZwTjOTXrJYM7mmpVLT8fqD3oSs0aXXWeQPjUUCy5BXzMl1uB67WJWaqXTPr3WgLNydhKi99T7EaW8eHVAzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484425; c=relaxed/simple;
	bh=4liG80eegRKzVP6ub+S13GEjrdWbxD9v62fLqSuQW3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=osvTOUDSQzygzNLwk3ngp5FWheLYujmFqRnJI0FvvvCi1PAuUjDbid/l0hf8Z///hNWl9De0sXxCL7F67be99AJtTSkBek2zLKeFq8rRurvcbKRn10p9iDKQrGo+gFkFOmg5u9yRs5TenVZWVd3aeiJY+Hp24Ykd4HERUxeFL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHL1HvxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2OFlZRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7Sgqo1630835
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BpGzdD+YISdiozYSnlIYG9
	jIT6FuvbT1k7YyC46Ff+g=; b=UHL1HvxQ+FDjIaC6Z0CffS5N0D5s9D7lqJslOJ
	yCBLJyqe/P4TGVRfm06/ErzKTSmpHWNKlH7gjQBhmnXk9y9sK2elCBvzZRAH65Wh
	BUuDUQAuWULZOOfhN8fp0Qj3gyTNk5ljw/O+wwJBcIOX/aRlyaWPu3pNP6NkI08t
	ttwEBHgPfx3uQptMQ8lXUU//RaUPlME2IK+lV6TwpVdU3srpLmXEAAmN5Dlc1Ykd
	kTuSKvFkr6Vzm829Rv5LXcfFJcKLAP9nm763IK2y8CtaieyBH53ASF2DW7XIO5QF
	b5s7gLa1NfN0ATbg8RMgGRC6ggZoqZh4iUd8WQEJFXhpJDOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8ja78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so157604651cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484422; x=1767089222; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpGzdD+YISdiozYSnlIYG9jIT6FuvbT1k7YyC46Ff+g=;
        b=J2OFlZRSlaqtBwAZ0Sf00YGDwhjE5kFlOeU1A/OPjY8/U/O5Mkz1zSfEwAHIe6wRtF
         QsRROWoqkcFPufqJCEoCDjDrs5TCWorx/Bo8pDBzFcL0+fh7YF8vmSzkIkLGCuc8K7BQ
         LI3AOYE1EQ//ig/Zh9dS7HGvFPvnf64sjtKmq2cQJ2cMyZL25D8He+WmyN9snLa3wI7a
         cGn3Rg3sVAkYvTGS0G/svKFBre/eNQp47gvY3MNOIILngy7R828QQfVvUOxuN/zxotE0
         ffBiTwbgJOvITf4qxYiHR/+ynPwqv+rTvy2aoY3rIhwAehxaYC+SkoBdLXWFsiphvdMj
         tiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484422; x=1767089222;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpGzdD+YISdiozYSnlIYG9jIT6FuvbT1k7YyC46Ff+g=;
        b=s9q1VCG5a3/yD3hrnYzT/4LaTmyoWxtXIVL3kE5k///LyRwpPWs1ltZzC7+CvsJV7b
         AYP/0RDMCoBWSfnpTjGLsyJ7YNmkA4G6hFwtvdQHF8zKCsSEnwBsBcfq/BmMTiNXdhi/
         oVJhWHVfe1lUka57Z2cVtzLjZobXaNWxJ8wm5NivRhPDVpZFDO56nBwPS0h6z/BkD8+x
         ECRDjaiTBVNQE+e9fIl5WB9cn7sMpVxLXLs91PXXyFzSZ1Chp5DdlIQCzbEOPNACijnG
         DG34HIYJeKcGofI/EJo4VeuXPxyx5NtatOqvp16urGzvU4fDulzNNRGzFeA/S2a9/PZ8
         0GRg==
X-Forwarded-Encrypted: i=1; AJvYcCWfrD7yLCwXm7+P5Y+bs+qtXfaUuWbDYgS1y5vJV+qD1rCguYwtehFKHoKrmJlrLQLeOiS2UbYRRug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEPp7EJHR5jqiO6AcbRr4xqSf3NtM3PhAGe/WAr0CkBRT5I1c
	tvKNWt09WxXqwJjwz/XlLOpAxKvxKHZJWHRki5ks4e5PgA7W+jTPiNiXwUacTuttOMBVwzkhf2P
	tTi+Me7/lWODnlTXl3GT4DOndstDez7asa1Esg1kk6+dAXetFove95MlKd4DB/xQ=
X-Gm-Gg: AY/fxX6IBmLIcvF9x3vK7f38HY2dO+jyLCyWHaYlm82xp6+6AsY6RQmPs35a/QOnXsc
	HJfi4UpfXVOL7TfUM06lVR/mLMfDe+CTEdJuDBPZ9hJ5YBDeA8D4+AHXvmRRpIpgEIet6Q1i4ew
	fwgl/l/vYw6MNgUuU0c/vODZ8Js555kfEhDY1j9b0VAess5elz0XlXmG89A6AAPSWtAcwnZcCDc
	C1a55oxsSDF4xfkbwV9W3FEQhnWz2ucl4iWHlNFgj6MaM8QPsBd59wudi6P7wyysQHmSbYiRlfe
	NdcbN1ZcgOFH8/dVvmpaDmF9bPvfKmvPxoj/LM1ue2tqm+R4lHGtljYSjVlP8uYqr4PnGf2DcU9
	2H19su4BjfkL8J3vcTGy0HNspfT4qcl5l86saFI4=
X-Received: by 2002:a05:622a:4c9:b0:4f1:c701:f7a with SMTP id d75a77b69052e-4f4abd9dd9emr203244181cf.60.1766484421657;
        Tue, 23 Dec 2025 02:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPrdTFHmzURF7H6QqrVoSNh9xbxAyykUnF8oZi9AVH3uVmB6xUj2hW0seRMzCEHn0zokdwEA==
X-Received: by 2002:a05:622a:4c9:b0:4f1:c701:f7a with SMTP id d75a77b69052e-4f4abd9dd9emr203243871cf.60.1766484421253;
        Tue, 23 Dec 2025 02:07:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/7] i2c: provide and use i2c_adapter_set_node()
Date: Tue, 23 Dec 2025 11:06:47 +0100
Message-Id: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdpSmkC/x3MMQqAMAxA0atIZgOaYhCvIg6liZqlSisiSO9uc
 XzD/y9kTaYZpuaFpLdlO2JF3zYQdh83RZNqoI6GnsihUUAvHkVvzHphPESxY8d+FMfMAWp6Jl3
 t+bfzUsoHafdBLmYAAAA=
X-Change-ID: 20251223-i2c-ada-dev-set-node-0636a8d3666c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4liG80eegRKzVP6ub+S13GEjrdWbxD9v62fLqSuQW3s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm7u43pvUKXsW02la4OEt23/V4Tk5e9vMe0r
 rBMFPRMkJmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppuwAKCRAFnS7L/zaE
 wzIeEAC9DYy50U09jVGCQFLzL0QLtcZIn3g60Zo/bdfOKkTXKZy6fvO3aXEiXXU8uDN0u9cWRNS
 Uc1i6Z+1gc690+f2ZH6UUKIz4Ce3Mtf+H0iNOpIpuQvbXk/XVfTuhDusWWDP/L1d53rmBGK65al
 2wDx+vgHcXVBsmagieF+xNsbFBPc+LNWQxAUkEwqkLN6bPyOcLTaacY4MNg0zlgWro/BB69apXk
 Hsy3z1y1dTv1d67kgHzI8pEShxLSo+s1UuFM1AwTCYN7TIcaTmGUv613fvdYTze1SX/puo29Qpi
 K/gio9y218vLkEcMYIUsqFZFdr8ojekxl1ekCSl+qg8yqWTjqfwA9hf+HC/3X2IiIN0ehaIWMzX
 CMbnGSDEo81hFzxErokrcDnFBGrUJDsVb5wjqgTbxNLrt76kICr5kQg/8EXts9CGyhFY/SFcZIT
 y2mAq3kMUV7XYpTKV/l/w2QdruEEw+cy58CcocWkKXbnoQkkwKTF4N80dbpb4sLSDnhTA6uZMgb
 /dqyEOZgXKGDXjnzS0lIY77H0oaCTG7M/yw3lJx4WWKSahxfuIuVdV85MxhspthcBGv8HVh6e5+
 DojJBUuHy1VPhmEOeWas4cNIO++VaHgkvQ2zvwJEhY/Vl75EuG+bAVtkE8FbUOUDK7HX6+UuAHx
 +BVszrRvC5pNflA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: m7cvdR02mNlIyUMDNZNiiAcjNhCMRh3p
X-Proofpoint-GUID: m7cvdR02mNlIyUMDNZNiiAcjNhCMRh3p
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a69c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lUC9hMLxrJuMSK10UuYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9Yf6xGHJstmZ
 DjGXErVnWcVunDlLxF63W0FgF8X8fwQjgp2vWR49H86rq/8X7GIAic3i8YXga5YArsP3cWVmV2C
 TBhfrrQe5xHChkB16Z2Z05mH3ZDGUJlDoh3Aemno4qlcHE+0yMucOqhk+ZVuxIE8V3a7PNUba7e
 dL2/tEna8ZJAWKmj1iaJEEBsPLwunba/neS8euSZAsxjKa6+IbAW//bWm87onjDxErYtJqV6eN6
 yh3SOoUmN5xI7iSngPWGSuF1BJYi5Vqm+eKKtLqS+cav1PhBklWbF7KB1QowTn18qKzwSkRLVtM
 f7wVfVrL0MX/7N+FJ7eBnb0CYpoZWH6aXP9ezvEItoFAwW9YpgJaL3T/kkG0MCk626/AbjPt/zy
 rZkHRFPL1QsOlBe0cqbeOrQSXPHnrQCTcpn6T5ym/OZFMYz8OH2Wdi92H+XvguGH/KJk21V6HmD
 LiRgGCUiwKXpZwM2tuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

I2C drivers use device_set_node() to assign a firmware node directly to
the struct device embedded in i2c_adapter. In order to hide the direct
dereferencing: provide a dedicated interface that wraps the call to
device_set_node() but takes the adapter as argument instead.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (7):
      i2c: provide i2c_adapter_set_node()
      i2c: designware-common: use i2c_adapter_set_node()
      i2c: gpio: use i2c_adapter_set_node()
      i2c: ljca: use i2c_adapter_set_node()
      i2c: ls2x: use i2c_adapter_set_node()
      i2c: rzv2m: use i2c_adapter_set_node()
      i2c: usbio: use i2c_adapter_set_node()

 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 drivers/i2c/busses/i2c-gpio.c              | 2 +-
 drivers/i2c/busses/i2c-ljca.c              | 2 +-
 drivers/i2c/busses/i2c-ls2x.c              | 2 +-
 drivers/i2c/busses/i2c-rzv2m.c             | 2 +-
 drivers/i2c/busses/i2c-usbio.c             | 2 +-
 include/linux/i2c.h                        | 7 +++++++
 7 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-ada-dev-set-node-0636a8d3666c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


