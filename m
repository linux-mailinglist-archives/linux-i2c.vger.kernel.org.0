Return-Path: <linux-i2c+bounces-15260-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242ED3A493
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 11:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 159A730263F6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 10:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14BA27B336;
	Mon, 19 Jan 2026 10:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ft7GmItb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eh0M/6di"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C979CD
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768817742; cv=none; b=ZkY3uK6M9DE1GOK190NhF0PTdQpOx4MrRPwF2rQgtP4bwOEI4sK5JIdtsOFjxdnjxT4JsUJad0GihugUU2HvHg/Fm39Jr7alyl8rOZ0aNvSqTG7XMdFS7E5NfJ09apRYWILOy1dhG7NXhECX0D1E1Zx/d1ZxBA+rvoocUljwUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768817742; c=relaxed/simple;
	bh=M8vmGrv1KiCcDm+3p8w+eSt3k6pyTrlsyhN3Ww/++yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZnZ3N7ZqQuovpz0eOxp8IrFkyqPw6658R3c+tDMpn9nSgQdaz5TlejPun9lTsNVClKzFkAJ41FJezKBqVDiWshX5OQ6HA/zQ//5KtmX2bv/MFjg5zBXcWc7Dtt02j3j6quKwCoV7DVUWeJgfsx1Wx9+4pV4ICjZdPXXiB1AbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ft7GmItb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eh0M/6di; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91DLq1150104
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=; b=ft7GmItbyrSZs8h2
	xc981bLKxdyzan+xhms98N1rHZ3yDIX7polQP8LaAuegUoAEHUZHNuhM+Ny7YQUZ
	nEcrojkM+ka9pOiXyQwiZ/wc7XhgmBYJvaV3ln5lWX5VGp6RWisNoV408hjR00y0
	TpGyp8RbboU38ttdlyj5GM+2OiA2qFIzYF8gwMX539luntGnYdto1/sO3ios0qft
	sVEgTgcf+mxXgGFZf6QH/h4q8k4nA6nN307umhs7+Ue6DgZiHJHxjoZdJKjWCXUy
	uL5WZdin8GJg3Qla+GA2Khz2YgCLAGj/1BQQ0I5aRDxvwcbjbso4eqqqfxmo4CSY
	JF7U6g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e51ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 10:15:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6b20137a6so472159385a.3
        for <linux-i2c@vger.kernel.org>; Mon, 19 Jan 2026 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768817739; x=1769422539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=;
        b=eh0M/6diCVRGEpts0BbXXFMet0MB5WN9hAYBEYjvRCYRm6vcNWBc9uLBwVtInRbkBU
         7y7koxY2/0oYjmpmjtP28ARUhQc/DgFRXboZ4PIfvkSCrNRMXoMOO7oB4j9Y8V6F4FG1
         QoX0AuX3du1rebsnrVyRUH8MyGbkkv2PJk1B7uJa82m4e0/6tL1c3VytE03Cpu7SHuF8
         INbTD30+FfIwLPdQ++bcvc26EOYRnfJZXj8SiyPC93FTiVcQVbpyHAqkm8fblHGELMfL
         0V/V1zbsqyBE8bVgrZGho47MM5L/AgzNFUrmL4EZH4Oi411K5lQLgyFxQ7abXVMySQ4P
         N7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817739; x=1769422539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dk6p4tDuo2SuuKCuh4Z0JrgDUUEQWrTdte7wbwvhXDY=;
        b=fUgu93j9UO00ROU3pZ/oCYfWek6f/uJOu+/pc6cWe6lIDZ9YnQA8QSOQFN1DeR3xIe
         zkhhoto1tOexpBMYcq48qoZv6ZLR1oU2zIwXshVVn9uiAsPJyW+Hl8nbP9fhVOWRC+fX
         YdPM1lbj4CWbiRicWoyh3dxDkS8XxlSVpauSiK4vbhMb9gbnD/OFj9Uh0PK5xVBPGZa4
         VPjvkfnZQ9rdOYjzxqVzr6J1gDrM5WvM9AZnywetUZG6pQ/77gTSEhLom0BEBlyh43ft
         wDFxK13jr+9z2wBV9vyyOX1NQqrmZe1wFxe+WtHQwvLJnYQgEUjiukWbVNlhd+HliG9T
         GKZA==
X-Forwarded-Encrypted: i=1; AJvYcCXgWUFE+m4ADQ04rsZMl1uxGfMVZidjgv36xcp+IDS+c3AQVek4Y1SPEklgW+Smp0bR4ijJ1B6A2jk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBPBMtp7DZs6sORBvMGGUUkhY7x4A+yzn4ZoXh0CjS86nIXi1
	H0xfRPS3jkhPVZ7EucZecBktcX6gZG4qI7LUnWGx+bbLZgWsJyhQvdG4QTR7T6dKbEjUDwMBZtg
	QB+LLdoeev+PVi7bj+NiXl6m4xTkL9cTPvjpKS9wGcL/+DVPGY+0Wl7qSx6aVCcc=
X-Gm-Gg: AY/fxX5XxBa/T6OL7zGvZscUYJNTDH+QSOFP+k00h7OVpR8AVzhh/3dqaDBVJTZxb1n
	L9t0ADQoFrKu9HdW53TY2O1k08DMpYb5zzGKllq3F9KjXz4v06rMtOM/7/rQeFYRxRyWPtrnGXq
	XFDYjgzB5THlG/si/oaRHpsPeIdvmSey8GT0g7O3wB56gctLkW07FH+u8Z/VmMGh1CmY64MTtXw
	w3UFdfdlw3aRNgGITK1J/U7N81OBd/nAVn2bHaewP7f3LrSaNKGv0cv8JUKWxvaDbsUbbXAfJlQ
	dU3kxPkg8xSMu43odXY/fWxztQ1Cic6sci3yu1HOnyjtHOzFy7HgmKgeWLtlPLa4g7gFm58ALPR
	7q0uGQCDUSUUnlXzl6vA9QaUv+aTIlO6wfS60Cw==
X-Received: by 2002:a05:620a:31a0:b0:827:1bda:ca68 with SMTP id af79cd13be357-8c6a6768546mr1388579385a.46.1768817739582;
        Mon, 19 Jan 2026 02:15:39 -0800 (PST)
X-Received: by 2002:a05:620a:31a0:b0:827:1bda:ca68 with SMTP id af79cd13be357-8c6a6768546mr1388576885a.46.1768817739091;
        Mon, 19 Jan 2026 02:15:39 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921facsm21220514f8f.5.2026.01.19.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:15:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C128F
Date: Mon, 19 Jan 2026 11:15:36 +0100
Message-ID: <176881773405.15929.11747885724390635318.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com> <20260116-milos-cci-v1-1-28e01128da9c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e044c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=d49ADMIpjG4RuIGA6bcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NCBTYWx0ZWRfX58tPXzZjzbba
 qTQq2fUE/vuSiJCjcFBsJ7eAQT2TM5Qv9TSNAt4EmiznzrkXDIjI5AHUGj1pLa8Fs36F6QNaAFi
 f4H8mZ6Yb9bprcXp5vdz1lLqgy4taIuDTknpFsxmPzyVHG7q7wT3DlY1PfJrjuZwsj/gT1rQUOE
 oZbxUFXc9AtqQkioyQne+Tq+fRZAwpE9knb7plx9+nAGliCKvLO7S1rmIs8yR6bxeU8qtvzrCdw
 0wXFUpcP6pzgM8MbbXGI+mHQgjRhWdTBFmhYWY5Kd5YGZ6XfXpjycPS/B6Xh9gz71kBDMmRvo9c
 uD39ixO37aBfxmbzcgnhhAhUcaxZVAsh6yrWBKfhhweWArCsf/978LHcRt1XKg7C1K5KO9+W/BG
 31XK3qXgDtQHGoHT0KiWhEmD8++kFAu/UGFfa01AjZ8Itp0z8OEljP6WOwYabxNSV1ko640jWUT
 +1v58MLisw/W6OjVa3A==
X-Proofpoint-GUID: QbcnEEo__SC_nJV-KbJOwLxH2q6nz5uM
X-Proofpoint-ORIG-GUID: QbcnEEo__SC_nJV-KbJOwLxH2q6nz5uM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190084


On Fri, 16 Jan 2026 14:38:55 +0100, Luca Weiss wrote:
> Add the compatible for an 128Kb EEPROM from Puya.
> 
> 

Applied, thanks!

[1/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C128F
      commit: c6e79d34bf80c008e5f5fba2c8cce3df81a84335

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

