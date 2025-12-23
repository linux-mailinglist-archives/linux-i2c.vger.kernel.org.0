Return-Path: <linux-i2c+bounces-14687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25ECD8B9D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9CF304DEB2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0594A32C30A;
	Tue, 23 Dec 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WDiMJ4f5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKl5Ov0n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81213329391
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484170; cv=none; b=CHp99cXb/Nq9shu/83K9emujWOlfnFHH61FJmnKZzx3YLa1B6lj5dK24w30ZFC+payXItEDPyNMy6YfSVWUpvHDPrJmwvJl+6U7x4GQvvFKR5m00FZTUcSVjhgZCsbyXe2dhDdJCCOz4JBIMeqjw+BmNwh9F/VvDjDcppxt758U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484170; c=relaxed/simple;
	bh=mwDZA+PNMAadBUbyVdbpUvC9ahnB+8CAzRi/TqPVUr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zne658sH8niWSNyYa3pPJF59pDYHa93sI7xRix6erjd6Sy8jZsJCjBn7LJYUq+dUY0TwaDYZb7vZeQwIvYY+XEthjanN/lO1k9sh2rcgTPra3v+dJ1qpNcz7LjPCa0ZAApZsGaeOpDMYMOnx+OJWVKxSdJHcbEhj2mqo2FhFzgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WDiMJ4f5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKl5Ov0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8CKEH2570004
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lVsiiqxounOhFt8gtSCLzi
	paRc5xfLwpGpicl4jLsa4=; b=WDiMJ4f55N7JCXL+Mw9JZgABD+OR70NFiCm7PA
	31CrZ6a49X2RmnUk63ssf0Eip02NmxEy5pQI4vDGWfuvpeM5Alv+pcgXeDs9dT+z
	O6wtM3s4itQd1KE9/A9+OpljdGeE695oxgSONLdtngr78tPn4jB8xx/IRV6H239J
	45qpJCB5YcVWYSMMnOcR5ArHvxrzGbBIn7i4Ml7tn6dYOAlp7Fg6hzMkplhmwLpM
	JXCT+R+jc0pFlXd8R+4h7jMIP9V8tPNxf7QmphF002dxJAjY8WNMxiQeTKMGx3es
	TW5sCKD2GTZyZF8doXNw5iQZ6OQSY9Ch4kPb0q+IZ1u1jZjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jka8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed82af96faso96278681cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484165; x=1767088965; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=ZKl5Ov0n7mEhf5+DTXOZwtPY111jnlKMxl7meknYHDo6djQ20Lw+DClpXvlt0f56An
         wx0uaBG3pHYUOaSClIOINpTn9d372vcaPpvBJuu4Rs7FPuFWkzzCJIcIe1+uGQJeOtW7
         uaVNo+T/x1VbXMMhrblPhY4RDnbZ/n1gksuPi2Ioy+6dUUW5CHBAQAHhq8fhsZBNqyNl
         8Wlb1Rmvlqr+ezKgmnxwPi8ITpzq/N11+gK5RMKgAqkhq2f+Q4ZQBwe0jsnY5FyYaTUd
         CUkaP+gdEguda6ccA6Nq74pYRmeE3mle1pQuJofZ1vB3D5y3EM193j5EfUwx5Q/ulvdW
         d+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484165; x=1767088965;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVsiiqxounOhFt8gtSCLzipaRc5xfLwpGpicl4jLsa4=;
        b=kpwBjomTmWZawJRT4BUQ3T77PxW4SIaE5po0d8aWgY/mmcRqqCQKzYXBo51NMzsn6S
         M1plx3M/jwvDxteD2Eq2e4h4kzcdjTwTc/DUHTHf7GHqoUGM5Rpe4HVvwOv8ri8fZfiD
         wsmKfF5VNLNQBolbG01TLUgxbxMi8jb1dKtskpRLS1GgHA2oFTYfMr/0DRKJ0NVe8xXL
         4q/Aj5hV50M6ibkVXGN4i0iykt3AacdszxA5x/1SzXMX0U/IbQSxM9ywbAXKyh4kPU0O
         VQ4XR4TNXvLn1L38Q0RxgafZbsGCYOaYVaj06IsoRrRof8SWcmmV2yTuu5ZGr9Kr9nBt
         zBWg==
X-Gm-Message-State: AOJu0YwB5zncWGWE+Eer+JZZtZkmi0DdvXRg2NxLeZmNEnC1S72eA4yF
	mHnY9rNmXTw9vJMFGxaWNeoig7pmbXQj8mEnVF6VZ+7nsO/ezE0rRO5RFRNoXJT/b6qVOg34pxd
	9FPHJDtgvPFly9XP3ZA+5lGw0imlD+78T2bCuLsSKIFmLhorCpU5WVe4vGR7fl1Q=
X-Gm-Gg: AY/fxX5rMnux52+hzUBCoOh6ORGETR8OoEKxCD+NHPYJYN96Fkpq53MhDJqWsGW9zy5
	2cpNpngmozBko2fwKMA/YCddq61/CKyXngIWL5sXyNkTG+NYuvgx0hvi27dvFRGi+hhB1vmeTla
	YUUix4W2Fq+513tXzB5rPEi0/5kES/1RFGwIsIve3XvoS+9kRCxNUk1yIg8iNhMo/DT++4JAf3C
	bVrznVfb23Zk3bviCaCs7v6IezyNGgpenNwjVT2FB7tAdhDFJRm/KHQt4kQRpgr19K12QGUf3hY
	ExF7us3m2YVKXoJ1lbZG7LwH7UKBWvZudOQ2pT4Ts+jtmz9SvdP2Doa1GBSyv+RFZEOTo3h7N9y
	F15BChDebl8mgHeZTd7SkIWYFw5w8IR0S3nqLTA==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518931cf.2.1766484164787;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgOAvppFe+utmVWSJc5Fi7Osfe16Ny+TBuzlxFntilRe01w0BA2HK+q0XCwAWBLR6sJii+LQ==
X-Received: by 2002:ac8:5845:0:b0:4ee:14c3:4e6e with SMTP id d75a77b69052e-4f4abcb89b4mr199518481cf.2.1766484164162;
        Tue, 23 Dec 2025 02:02:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: add and start using i2c_adapter-specific printk
 helpers
Date: Tue, 23 Dec 2025 11:02:22 +0100
Message-Id: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK5oSmkC/x3MSwqAMAwA0atI1gZq/KFXERelRg1KLamIIN7d4
 vItZh6IrMIR+uwB5UuiHD6hyDNwq/ULo0zJQIbqgohQyGFQ8eeGK++BNaJturmqTOlsayCFQXm
 W+58O4/t+Rw/752QAAAA=
X-Change-ID: 20251222-i2c-printk-helpers-a69f4403ca70
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3113;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mwDZA+PNMAadBUbyVdbpUvC9ahnB+8CAzRi/TqPVUr0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmiyrwadEPSafSYG+ZitmVmW9YHm1TBBa5m3n
 aBg7Itr6lSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUposgAKCRAFnS7L/zaE
 w7lCEACFwc1erjteHjPbCchFkjEMwie8N3o/WH17ZxwRtvpaSLRqGA0OTi8psX5Dz8P3MxWysrg
 QTcJvUk7lt2X908rAsTZaJJ49baytToXbX9qx3i3dSUwpAibeeksU9Nmhtbi1+ty8L9j7dzNzN6
 yZBh25hLS6xK5SnJLPe11uY0M517V+7MvPtObQnqZnB56iG0hvI4E3w5WSbmzfvAPG24KSQYMqn
 BTTx/OlmcfwhULH+UHPyIcLvL5Nnz243GpwRbKgXjA+ErHh7ym2Och8IAPhQCwMDJQcUNsIu9se
 hX2W54J9zrM9DjASpJh30ECj0/FKJSN2NvrXu0vAVcm74LksPFfJuvNk30Aq/nmA1zPIYaJrVm6
 BwhTUL8zyWwMsYiu4tKuDP/t+zsFWfvjbDBqMh4x/8mpWQblzmpytqCud1GIrZc90KJxgZU9bdG
 ibCw4xwFY+GWFyHCYg1wvcZa38xPlQH0IYrmkb/ZBvhpSZj3N8+672ZwsnvODeOJegkufYNhunx
 DGB0ZpgJbUpNrY/z9YGrcXW3Y/IKO+grB0VzvNE3WEW1kYnTYZI9RU7ZPI0R5l7WALlwW3u7xpn
 HWlTHkmI5GG3dZri+dZG6jH1RADUEamjmOZRPnPJltogZNsUmV6hPLPJnQ3VneAJVnzpjhxbLUi
 MqCv6TWIcl6iAQw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2FSWtHNZiVNo
 D1wlM9iSPxgw5aus/bPGTWRKZfisdkIep8ci0UiibHGzfbvvXtM70Py0vDTjgqO6JEFSV/zfoOe
 O7w9IY+X6dJ00dgUTdE1fR7mnhiwXf0noXdZdiHJItvXdGZ6P0ZmjW79ZszkCBbpPwsiXV2GbpE
 9t/+2ptp/OKjVMHbKaIMRs0oJ9HJWMDG/l3XE6JrZ4qd+nlKVAohkDCLIS3EScA1Eagt5qeGh+z
 ys1i8uF56ezWoilW5T4ux/5k3D+A9iYjX+69PE8Y1MGT1OUv5o92ZNeZB0nr3wEF2So1HbeQpuB
 qYEFw/4PRGqmS33l2G8KfiCtGpnpN1z6am6K3dkIRaumHZox7pk5BHvAXzeFqEDm1CORf5bOvFw
 FCfkwUdgt3Dj/F3ciiBxTmW/pGSIhg1A0Tsj1aau0b1QHPxPqXPM1Qxas41eOxGGVsOdn1Un2J9
 5pCQ3zC6w17IHGxsRAg==
X-Proofpoint-GUID: s5YknK-Sotj0yYeUq4bl-k7vNUUWoODG
X-Proofpoint-ORIG-GUID: s5YknK-Sotj0yYeUq4bl-k7vNUUWoODG
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7r7wYDzB2Ki_6CY1cMA:9 a=QEXdDO2ut3YA:10
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

This series addresses the usage of adap->dev in device printk() helpers
(dev_err() et al). It introduces a set of i2c-specific helpers and
starts using them across bus drivers. For now just 12 patches but I'll
keep on doing it if these get accepted. Once these get upstream for
v6.20/7.0, we'll be able to also start converting i2c drivers outside of
drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: add i2c_adapter-specific printk helpers
      i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
      i2c: mlxbf: use i2c_adapter-specific printk helpers
      i2c: isch: use i2c_adapter-specific printk helpers
      i2c: ali1535: use i2c_adapter-specific printk helpers
      i2c: scmi: use i2c_adapter-specific printk helpers
      i2c: ali15x3: use i2c_adapter-specific printk helpers
      i2c: powermac: use i2c_adapter-specific printk helpers
      i2c: owl: use i2c_adapter-specific printk helpers
      i2c: nforce2: use i2c_adapter-specific printk helpers
      i2c: amd756: use i2c_adapter-specific printk helpers
      i2c: piix4: use i2c_adapter-specific printk helpers

 drivers/i2c/busses/i2c-ali1535.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-ali15x3.c    | 20 ++++++++++----------
 drivers/i2c/busses/i2c-amd756.c     | 24 ++++++++++++------------
 drivers/i2c/busses/i2c-isch.c       | 32 ++++++++++++++++----------------
 drivers/i2c/busses/i2c-mlxbf.c      | 19 +++++++++----------
 drivers/i2c/busses/i2c-nforce2.c    | 14 +++++++-------
 drivers/i2c/busses/i2c-owl.c        |  4 ++--
 drivers/i2c/busses/i2c-piix4.c      |  8 ++++----
 drivers/i2c/busses/i2c-powermac.c   | 26 +++++++++++++-------------
 drivers/i2c/busses/i2c-scmi.c       |  6 +++---
 drivers/i2c/busses/i2c-sun6i-p2wi.c |  8 ++++----
 include/linux/i2c.h                 |  6 ++++++
 12 files changed, 96 insertions(+), 91 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-i2c-printk-helpers-a69f4403ca70

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


