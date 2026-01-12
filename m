Return-Path: <linux-i2c+bounces-15034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD4D1203B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DAD43104ABA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB41833AD95;
	Mon, 12 Jan 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Be0fztsU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="chnEBn7D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB533DED4
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214856; cv=none; b=OEcaKHknYtZX2fYF0laI1gI3DCZSjCVc5vlQAPUD76xEuMbRH37tceTxnRnjBoaSXS91aXM/dAngEw7SWomiZR8WyBvvuoDtZLHcXL/m3gW8yp8RSXI2DchIto70a7M3jjRB8eTsHyzT+ZNTpUrzYZdEngOgJeTqrJgqFDie1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214856; c=relaxed/simple;
	bh=TH/OvXj8sYUbUXnDQUkzPPvxmzCBBtnHvicuQMgEIRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=im6aOIfi0jI2mXOwDzoylUPfKr9QX27dfs9QIhCPkYBNGRJOH5Vfq+jPnsbRrJpcvUpUNNzm2PFNssXUIiiu8ZydRvnBQgQ310CCXYiWtOhqY1w8lUrHBSjWbPOomS+ZT5c+TPTo1NeifZO/Jhfq4Njg/ReU3FYKaWpyIK578uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Be0fztsU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=chnEBn7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C9Wdvs309123
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l5/tcavTg8NZPfk1dSm59H2bLp6tv/6ANh0
	YzDNiBYo=; b=Be0fztsUnC91y5giKVe28/gT1r/D3CAXm5EnN7KLOE/r4YGro8w
	CoeFinb9t1JlzPDYI9zxlXI6DdmSJGNlvpGgi7GD+v6MHzihNf74ABJCV7v9OWTr
	Q0lUNG5tOjBKKCZUZMqUpFzHYYVmOrJe4jRz+tbSs+lsE9gZWXjCBGI4IJ98MIy8
	XvjSLITfySkHlX5P5hEnITutA8gAa2ToEmFGBLiX6n3ep7s1Nok96yEB4BGSOxxe
	QzhRhS5DCC5OBeCuJzqnJWwTaQ9DMK+FP57H/9yEBRmNz/sLKb4xt3Gd57EfGOR+
	o74MgcR4ZDUnqig8GKz3khLLaiZIWS/x74w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxdvr75m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81c765b9b03so3253932b3a.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214853; x=1768819653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5/tcavTg8NZPfk1dSm59H2bLp6tv/6ANh0YzDNiBYo=;
        b=chnEBn7DgOMAYB+eLOlk5SUzYPl00d24Qi9/np/IC+6TQ4IMD57ezkFMxlyMKpeU8n
         2PtmxuleaQKCkaCSET3MyDm56HjB+41a827AKpcqR38KGQoj9SENZnotLsiXxRUlpNjB
         yNrhhu9UZlKhfSI6yOaNIOxyo4mvXmRGyUiyOjwcdhugnaZh7UjN/ngVnFdX4Th8KYL/
         7dd0EHtANFe2KCIfiAOfFb7sH8qU1CIJ22CTNyyt9vfF22l/4WJw0bRTOO7S96An76ci
         SSZ4HonFybq8Ncu0jGNsUsZTy3T07OunP6IXK6M27ZpOPEM/IXwumwA7SrD65obPIx9F
         A4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214853; x=1768819653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5/tcavTg8NZPfk1dSm59H2bLp6tv/6ANh0YzDNiBYo=;
        b=edOEmoKmqU22QUO00YeqNWv5sijvf3N4+rXhRoQ8awa/GQ4OWqsa7JLL5GzJtt/dzk
         EFeBJ9GFeXhtUo2wFgfWjvDRtwCkD6DbxgWeFM7GXAlpRt/LLcg7ysMDB/ezb8h/qwR4
         7+eiDhHUyz5isENzem4MfiDeTB6VAhOmo5Gr+g1kIgvBCuoQUYs4okx/EBpRaaztcTUy
         zHFzwen/2FYuiNdxwmASpoDVnaZMi2pUM1BKIYBO3Nn532xiZ0ZYQ9XujLRxbWLWsh8n
         p0y9hK0ayt6/Af8GC4lGoR3lb5Tl9zmqEGnBtSQGk5Y4Q2Q8EwuzfXmeJ3g5zBA+tmNv
         u/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW3nMBX6hsyHq7bo9PvYBjdQTnvGqBVgQ6XqKQU/Q7wzYDTZe1J8iGkMafWMZeEowZe6M/JlETUs7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOS3BM6EYFFoI/WOhYXm94rhCKI3M+jZPgrxO/WJ550nZQOhm
	pMwzakwv+K/mr1B+ppSpfSIYoO9KcYWRM+C5WPlqJPGvKreYvi9E02W0dzY/eEDiLtBiVH90JB6
	D6ntffIgB5QYe8ugIMaJ0VbOOWav+T9/ZpQjlYcryM/12Wd0Y9wqKM3fNh8Ek9Lk=
X-Gm-Gg: AY/fxX5AdEV6MNi92PgL6mnfHow48Xsr4quPBb606feK3SkjEtHJDnId6Ygy+hjPrxy
	tU33ZY6Wl9h0wZ+kSn2vX7Rx3kOd1W16ckkmhorBt4x2maKnguX3UF9H5vPGwCfugJIwwlgiNFu
	Ti1ymg/p8bAYNf7AOi8BuQzTPnGTIwc0oCRq76zxx8cuxySqQu4FrXqcbc+Hmot5ytkc94BIxK3
	LsWesNudffddFydrsqoXnjuXqRsm64+7lL6GHzsP0LPPLHq36wLG2BpevrlL+zIMOSKMUfrVhjJ
	B6aNRUino3grJl37qkMIkNDoC0R2RiRx5jPlK9iKyIV7BwhsHLU+5xmC3mhDcwxdIUJCj9EwrLX
	8rEtzLSJ/bB0Fm1rL9TyvccTfkNcGJUjB9aM5A+7CCoA=
X-Received: by 2002:a05:6a00:35ce:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-81b76274120mr14513534b3a.7.1768214853181;
        Mon, 12 Jan 2026 02:47:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETF5aXl3RQtF0n8/7zHavXoICmgD+WwxgXy++DsCZObiNhE6vwnBQGHd5xAD3v31dkc6F/yQ==
X-Received: by 2002:a05:6a00:35ce:b0:7a2:7058:ab89 with SMTP id d2e1a72fcca58-81b76274120mr14513514b3a.7.1768214852582;
        Mon, 12 Jan 2026 02:47:32 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:31 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 00/12] Enable I2C on SA8255p Qualcomm platforms
Date: Mon, 12 Jan 2026 16:17:10 +0530
Message-Id: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IpBmwZmDnr_Bc7TDTXweC6eDqxbzMuSL
X-Proofpoint-GUID: IpBmwZmDnr_Bc7TDTXweC6eDqxbzMuSL
X-Authority-Analysis: v=2.4 cv=HoZ72kTS c=1 sm=1 tr=0 ts=6964d146 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8413JC8MLbS8ckBEwAwA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXx08aSk6GUGt0
 3IYi6y4nQpiAmPn7IWzK2sfuBwOYIh68g46pb+XeRht3r2XYJBgIS5IBoP6ug+/fyHxBfDWEq4w
 /EAHcAMIxB3EdsnDX9ZaZSosB4couDR7FwSp/qsjf2LkPwKGAv7arCVwN2EOLtyOdDDcvWxzJNN
 QUVt0Zl3VAMNpu6TYFgDaV9n4J9t2oz2ARjqv2QDCRkrQ7CXged71Wcu3LRzbKZB1Y/g5eCPy+k
 74+A8ZJQYnl0BeZkRkcE+eg4Ky1vRKPbh0RJJdCbGtIV9fv31tWxzQX4w2QZS9kj15uPbvSFgdK
 z7zoRUwqTxAZuws+uGAfzJCF6Nc1mmbKma/xGluQNKMRjdKip/BjPyCRfYv70EdMeuoyX89tIul
 pXCCwzS+r49OEg14NTQLwzbDaMGUtxRcpKxdgkxxO+fqDH9gl6TRUa/LkGjgZq0TzeLk1Pb0ymo
 Q0Maz0EeNlkCLr/+32w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (12):
  soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
    path optional
  soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
  soc: qcom: geni-se: Introduce helper API for resource initialization
  soc: qcom: geni-se: Add resources activation/deactivation helpers
  soc: qcom: geni-se: Introduce helper API for attaching power domains
  soc: qcom: geni-se: Introduce helper APIs for performance control
  dt-bindings: i2c: Describe SA8255p
  i2c: qcom-geni: Isolate serial engine setup
  i2c: qcom-geni: Move resource initialization to separate function
  i2c: qcom-geni: Use resources helper APIs in runtime PM functions
  i2c: qcom-geni: Store of_device_id data in driver private struct
  i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 300 +++++++++---------
 drivers/soc/qcom/qcom-geni-se.c               | 263 ++++++++++++++-
 include/linux/soc/qcom/geni-se.h              |  19 ++
 4 files changed, 475 insertions(+), 171 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml


base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
-- 
2.34.1


