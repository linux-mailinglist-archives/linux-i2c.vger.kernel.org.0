Return-Path: <linux-i2c+bounces-14721-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC4CD8C16
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EB00302EE5A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A9A35CB8A;
	Tue, 23 Dec 2025 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="laegVvlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBCk+Hsp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF0835CB80
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484511; cv=none; b=htNeh6hKelMx32BQwmGV/C6xa5cIUY/6fGC8rxJ55iYSSDrsFtq+UgtOlOAD58BcIMQ08zqFFc5wE2Waxk1H2HS7fR0kFZ0Npxqe3OEK7E0Ns/geQR4qSX+Zevd+3TuHPsVE4rxRGiWbyCgZlcsUcm73q2BPit88eIoydCz3Zuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484511; c=relaxed/simple;
	bh=jFZVQfYQJNB18DWJ2VPo4uHlYMZ+qVcnwZ6BjUm/n4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M8TxpUfA0FwL9rESBza3xXQWO9GcLOAKbT5MVXv+/XfWpkDls0qBcAn3++kKvAXg1/zhyfmsuX3K52sKni9ZG3P1mu8743VwiDX2UPaPGvS9mmBmw8FTzxv72upPNRjgufCRjXeg1Lfy/OWQ9wUhUE2uRXiUQUrNHpxAvZUIzfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laegVvlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBCk+Hsp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2wUa51894982
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MUkkPvR0eBeCChriG2mbKz
	77pF1eSKwmyVq/BXnNsCI=; b=laegVvlGNMeq7Im5Tlp6hRRiYsqSLtKR4ePulZ
	aqM/oTNIH6Rh+A5EAbbMPMLALp1zmX8nAUYbix0xToqjx4wzt0W+Yb3aGy+sXlvV
	u2ueLDkDe2HptIKjj9zZ9Qmsm7NydsPs9aFVopGwq+nsmzAUcNtt5wqXTARbBuDr
	x0q35ufdIdLUjcTyMhCZ/S1b4eY3y3Z3fUwxj/pZdc2gOqvZL3vkSo4oPVmAHDJB
	ICYDL1ptajyy0Jb2f3z8999QIpx/zSrLwIWBtjoArVHRXnMgFB/SSJU3/64wIjeP
	CFy2TOHG1Q5Fez5hQ8poSxf4SCBw7UztMHHsD9KgrZ9KrUxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takf8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d60f037bso103625701cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484508; x=1767089308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUkkPvR0eBeCChriG2mbKz77pF1eSKwmyVq/BXnNsCI=;
        b=eBCk+HspCkVM0Ovu7RBtUzwdHUAxwjpCndGoLtaMwLdVJTb3fSxL1WsemoYLI8Y046
         nbbxs50xfN2AyuxVQMwrOzSwY5H4gKNre4l4JmXGfN9jgwJQ0Amp9ixHRlb95WDekhhG
         1Uj7fXwsvObr4wD9PfQ+MsLIdjJTi10nZ23VIuzgkWVVbuHTkoYEuSKgdkzitkT6uBb1
         o8ButCmiWC57fnulJ3U7V7lsINeU6Axzt6jIDEdfWN5XYNAcDmTE1ekEuq0lgKqi3Ki0
         KIpEX3YMw34s+Fg6Y6sN3hQf55bwsS5p+zvfbpVaVR7LRDRtx6Dp6hb5lNXxuSsYLC9/
         co7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484508; x=1767089308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUkkPvR0eBeCChriG2mbKz77pF1eSKwmyVq/BXnNsCI=;
        b=lgzDYZbF7Kb/05nZkjRUZEXVTTpY0yQYFSEt7QPtFWDrjUIV2nVdeEDW/Z2KWUirP0
         kqwv3a93GJODoFIdYufc/u1GULT5Odurdym6qfHfMKfclG5YrDJrgMKzU2hK6nO6yqvT
         inG2oaMvmSS6uBYUjOtxEcVQ3LCV3nh0DldjSBS+lB32gaGqbPqywnr4ZfVayjPOiEiK
         ofi2RJmad9VUtuvnXvKuZApnJx/7ntFYnfEp8XJ9DpinkA/yvGOVVFeCRxlVg2FuyWoe
         XGNzez3NLttKVh58yz4LvyddSjA6kyG4IoBa26KVrCbq/0MpDqSTp1yr7mgSSEL9uftj
         d9VA==
X-Forwarded-Encrypted: i=1; AJvYcCU0u38BcMNwNaPk9pouXtkClIwRL84lu7OCz/gIimvRFLCHK6OflY9/cza0fEPZ1aoAQUdTTtwO3OI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5g9xwLCXBEEaLlsVSjXpykc/uG+61//6tK4khMW5G+clQv8nM
	gQkoRXiBMbknYCkjEHBOB7OqI4tLLwsFaL1jGjzLdSpWgxuHJMnskUl3NzX6Nm3mjlF2Kq4/RJQ
	BzxrFt5NrfPHes+qihCMHGbR63QNvpe4h1+x1qI/LF2IOHb0U4GAvEZAohg+zRDw=
X-Gm-Gg: AY/fxX46zCv10Se1LFDj1STQR7gC0+ahusdfgfCNarGeFpmi9HjdOFr8PVz1gD2wbr1
	zzZlSQcrJMZ72b03i+8X6zbdwgKov3gst6WQChAbMWT1QqGP+AU9Zl0Of2fs2i/K2VmstxkUwVz
	3VQBUoIdxWqpfQcIkCnwwXNuRmNoVYfMOv52T4R0qZHotSOZ8DAv/esMAtiavQtOzYEne5uAOBi
	uJxbb4VzR53+Lw9IdAYWG3pVIXWPg3A6QTKmA/qTpj+SbCrAPzTaC1prN4SzvLtLJJ5Qg+Yovx9
	MhH60xsJiA9KXm+kZIsFJ5PeZz4dcgElV5klmEQFf9wmeSB+u1pBgdHKgwMqUK/jXMsCMYDc076
	PqS6BBKP3f3Oa3QHHCXUnqpgOiVW0VilLYXYdBg==
X-Received: by 2002:ac8:584c:0:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4f4abdc83c4mr184675761cf.67.1766484507928;
        Tue, 23 Dec 2025 02:08:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcdwTi+DBcNXQnjjYGf2fe44itAek2WrJv+uhC5Xgc7jdSERdoHcSRivvHymp98RDvkICRQA==
X-Received: by 2002:ac8:584c:0:b0:4ee:2508:3934 with SMTP id d75a77b69052e-4f4abdc83c4mr184675431cf.67.1766484507449;
        Tue, 23 Dec 2025 02:08:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/6] i2c: provide and use i2c_adapter_dev()
Date: Tue, 23 Dec 2025 11:08:17 +0100
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABFqSmkC/x2MMQqAMAwAvyKZDbQBRf2KOIQ2ahYtqagg/t3id
 jfcPZDFVDIM1QMmp2bdtyK+riCsvC2CGosDOWo8EaFSQI6cDjGMcuJlnFLh0HXUts73jglKnUx
 mvf/zOL3vB1GNRwJpAAAA
X-Change-ID: 20251222-i2c-adapter-dev-wrapper-c882660190a2
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jFZVQfYQJNB18DWJ2VPo4uHlYMZ+qVcnwZ6BjUm/n4s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoSRmEWGHoQvcHqy4uKCmMgkc8ExoIbV3+N6
 puzuaVbgD+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqEgAKCRAFnS7L/zaE
 w2eRD/9HMTPZkb2sPtEscdyX4IqDCYqapytDee3mQ+a5ISJ5Z0x8rqZSUbm4NQZ8JhB4u7SJBVO
 Rzieh1hqyni1qn4aOP3ZVSAzZn4en3Pvz6mIRu922FGp8uKm4CqaDKiyaNNdDAAye3d+jXQOenu
 O3VwMfeNBc4wC+oZdN/aTjQUfQXtkpQFkLVaIZAcpMx3b8ho2sT6CwYEu5iHg156OQvrXDHFO16
 BTQiby0p5nJI6soPP9vKHkw8YIBI2Z/uGrPnhbiZ0+cq1qSZpsxbNcNzJkGmCP1vULXk/Yc3kyW
 11FYVPVLydOGohiDnzn8mbQtOcjST7wInsMdAuDNGzZycYhgW/fCNEOXbyTLPqa+VH5XIxBU8NR
 Nof+cb9aJlncFM1GACKQeKCgzlUSrZmAh00r5RGQyawVMOGkD+sPKWa5MCt9S8QEkmX3+coNmA4
 mlWaMOQIbdrYEqF7HV7Q5rmwxJpUvpAYWK3TkntH/o223qP3Xp6wO4EoPLj3IK5cAZf56Oa7Oom
 uahcuSh/hLkodAY0jCTYTWkgGUT85mEVXkj6EXxbwFZWnrgT1xZZNuPQOPNhUtLlHigbY4frs1E
 57whdUH8ZKUoyd8CHJgpYFVmV/7/vY6uJAeaQWvL1f85GF9KDbuZtNUBK2aM7Q6LubpCvQX7UXg
 QbVwllnSt7aAfUQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a6a1c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lUC9hMLxrJuMSK10UuYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nkfNKEtdXiPnsVuDPPNiMNq1jM7Z9r8F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX60pKFp1eBqO/
 1eQsOdrslQkD+5WkMsaC0TM6kK/FrrJDbo9NTgLNJKkdKeHro73Elozhc+EhpxTX+ejOrYjjFkO
 2y3fIjMuBI3cUh1qOGAWiFl63qu1sLUNFwwxmGvpo94U9frOUosS62+Zh7nqAFqY/V9sAZF+RFU
 ZX0SUGFc2Km/gq8SFOO6AGmI8CSW+VYHvRUrHjSP+XRbqiRNXbbYqUkfOFbo00rTFNkX75p1JI0
 HVTNsliim0T8kU2eILdJNicPHSVFKuBoB285lUgDERZegWQOzNkgv5xjJwdmrcMwTNvb/bAVT6L
 PMvgvVIoHUoGptCWlSnxbrMaCbv3vt7I0KXaR2lVtfBZhqDLUKeTDvC5uwxHaEGWVpxHhQxfd7/
 EuRL3FmBDd+GCjHFDFYj7gqfY1aa2dz2aaU4LI8pc52uhBhn5FoIgy3eottiEV7nH7XNLQub+Sf
 4l44HZkW/6qiXjSaHCQ==
X-Proofpoint-ORIG-GUID: nkfNKEtdXiPnsVuDPPNiMNq1jM7Z9r8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
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

Other series address more generic problems - like printk helpers and
parent/of_node setting - but there are still some more specific
use-cases of drivers dereferencing the internal struct device of
i2c_adapters. We need to hide the fact that the device is embedded in
i2c_adapter before we can move it out so provide a helper that provides
the address of struct device without showing how it's stored and use it
in some drivers.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (6):
      i2c: provide i2c_adapter_dev()
      i2c: piix4: use i2c_adapter_dev()
      i2c: amd-asf-plat: use i2c_adapter_dev()
      i2c: designware-amdisp: use i2c_adapter_dev()
      i2c: mv64xxx: use i2c_adapter_dev()
      i2c: viai2c-zhaoxin: use i2c_adapter_dev()

 drivers/i2c/busses/i2c-amd-asf-plat.c      | 4 ++--
 drivers/i2c/busses/i2c-designware-amdisp.c | 2 +-
 drivers/i2c/busses/i2c-mv64xxx.c           | 4 ++--
 drivers/i2c/busses/i2c-piix4.c             | 6 +++---
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c    | 2 +-
 include/linux/i2c.h                        | 5 +++++
 6 files changed, 14 insertions(+), 9 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-i2c-adapter-dev-wrapper-c882660190a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


