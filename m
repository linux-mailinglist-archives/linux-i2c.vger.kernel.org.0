Return-Path: <linux-i2c+bounces-14622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11637CC6C60
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 10:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EA85300A6E7
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 09:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23EA338F25;
	Wed, 17 Dec 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/fkq/CE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIsV+GTN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF1335BAD
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963365; cv=none; b=A++9O5hALlGDomsu+KvIdHldPGcJTsPM9DWuO8wAxGPfymcwLngXbHy4wI8MW0jMgXtClqrfPy1hRamtD8F4cBXBLUI3jp1XGzlC4rFtfkIoNuYTkYLl+U9t8VI+xuNiMCxST5pCbUeNOturU32GRafWfZSwlFyVa8ZbxoYjCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963365; c=relaxed/simple;
	bh=m70tIpB/YuhA9uBK54IGLSCrUJX/R31PRND8UIW85gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r80Xpvs+t29RfpFZEh+8oTXDIkT2tKlDVrk/cQDcL6ZKRwvfBdZ7qaj9wvtOMxUzQRpyc7xoaHE6d1JYZp5iePQFyut47jecf3mQA1uPSV0JvjDiNkDFkrVhGPiCgeE8ARlxaIprIc/OygCa3UjopQHnDP5HVy5kDmroe6SiQJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/fkq/CE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIsV+GTN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FV3B870381
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7bJgCMueLxUP1TwrWFsb/aLg7YRG1Y8Yb6CmmTdfsyk=; b=G/fkq/CEq5A8WlCD
	rh1NgiCWotdySTYxQ9kOZwD8Xdf60du1pOqiGTm9xqEaVtJ8D2adIj8sCTIG0uAg
	PCnDl0sAuE7mcpFlfdZYVq6L8wCgGDIWrYOWeykJX2DHUg68oJenVnh1eue9thBN
	Hq63ImcnaaKCzhDZNGVZyPi3f0haHBm4FF70eJKAtxqrOV0C7X0X4ZxbO0YM/YUP
	mwyZ6GMI5I7quDF0j8gt7uY2NxLnb0NNpZDy3kVLCj7vvXrY1iyM4p2eLVYGPkw+
	qW08m9PBVX8aOZKkTQmF1YZnMr6AVdReCQ9Mx+a8SwXKfkUIL/rNZoBJmZ7YB+ok
	Kh0OfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1stsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0193a239so57078051cf.0
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 01:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963362; x=1766568162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bJgCMueLxUP1TwrWFsb/aLg7YRG1Y8Yb6CmmTdfsyk=;
        b=aIsV+GTNs45RepEjPyh4nmpXkFBRVgGsB98EiUeSZjCoJWMQMBfkgXapV9W0wNKfPf
         0CcAbGTtli5Xhu8vTNDID/2P0P+HAmid4mc4l2b9uzOHlvuRWbwulP41HVfskgeRdWaa
         fixL3FC8DiavD2c8057U+QX321y00ICKfnZiAvn8kQQk0zvyZoVqHHZ2vLBQZLsDF+WU
         4fpD5B4LR2u8Dl4Fury8r0jExe0S4+B6CJCcXNW+Q0VXzyfvnfzHrRWywyM4qfB3xmpo
         Lj3CyPR5vYBp0/qL0KpJhW4Cn1cIFhHjrbuILv/1N90hakJY077IagUVozTBgqznEs7+
         fO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963362; x=1766568162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bJgCMueLxUP1TwrWFsb/aLg7YRG1Y8Yb6CmmTdfsyk=;
        b=nrmZWtNxgng0SIZjefsQs9KbjTS4wBflFa04gxsDnE0TimsPpXNnBVrZ3zfVBHQgH6
         QkeXVJxXVJ2wkWV3zhGTnri3xr+PCPZ1/jkw0Dqas+AHxy7ZJewrOUDMI3DdNTSuy1ma
         aTggN3cCJ7lClnucouQ5MzHwnEjtV3Xw/2RAkwuw4ugZKchcU9Y7PgeZrAieDjDFGj93
         0e2L72rYyrl6nwt8axDsgM/NgVjp49Nb9JpPvZ5tun/0L4zu9XsYOzq7qJkI1aY/7+++
         fi4xRF8sqFT4aYSUXSk1n+HdbnYKAlY8U3ei1fKOI772qQ5zWNodpeevHx9Xw7gsDr9U
         53kg==
X-Gm-Message-State: AOJu0YzhibYg4y5g9ZohGfcMTygHiK3NOcyFKh6NZDTyyOIW9HEU0H94
	e0LacRdmMvBfX1y8Hu/09BJ/18rJU3v/F5aO2c+LgjFql/aLgZMENDXTf1bZIwn1NjACJxEKJGg
	djldTJgs0asZBu1TGb7E7SVlVJRJHvKr8btp/HWp8fDAfEo89V+Gb5tt6Wp/1UZ/5Q5CIeE0=
X-Gm-Gg: AY/fxX51xEOCHCSVhZxeNhbyD5kjsHN006szkKbqHWahQtgQQzg6vxovzhKvWZPkndD
	73BgXK4jAZKqz8STnGhqPIFxu5ZxOIUOPnGIsxSkKJkQLR2uuxcge+FbQ1K6Q9BSKSWEaDedixJ
	ilNliskms9KqtwW+Aw/12/T6hAN/JUblDBKaVxsv3wM6lmRMUHbRJHDvanjxflHi7hyGi3yI+cu
	ByOmv8iD+2HMpT1pvgYvO2R9yGmp5WF2lCeNs/5YH9tFCdZ7XeO5zQO9BjlZs1ag+RNfskUMg4B
	9XTADZVAarrIyDAb17RJahFjAAdI1Gijfx5O7Dthgv0ws/SAi+y9x9pcpVgxh8DnaGLKAoTK/sz
	Wt8KI9v7R0wI1pkghNSZ/9E8IYlnM/NItfNpK
X-Received: by 2002:a05:622a:8d01:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f1e46ba93bmr152608571cf.26.1765963361785;
        Wed, 17 Dec 2025 01:22:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH1AYLT5J6Dl8f6COFAX0E5oCC3uSIPhnU3J6onAzjzcinMsiBQHX62atkk0BOLtA1Ot1ZzA==
X-Received: by 2002:a05:622a:8d01:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f1e46ba93bmr152608471cf.26.1765963361370;
        Wed, 17 Dec 2025 01:22:41 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade7bf9sm3806668f8f.24.2025.12.17.01.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:22:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eeprom: at24: use dev_err_probe() consistently
Date: Wed, 17 Dec 2025 10:22:35 +0100
Message-ID: <176596335028.7296.11089425704158573637.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251212032646.49336-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251212032646.49336-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NCBTYWx0ZWRfX2CVTVTeACauT
 lME1wsPTINJ4LxeOuLi9W2IhFir5j8XEJk8d7x8lIuaCHrzkLDT4jBhSt2NMYaA2FYu6pwvrUen
 Kv0ttHUdi5BXktxowHbCooX7u4BUCZXhIF8FTGXxBaebf7FXKecrCLKrhKGIkHbmfQAz0ddvzZq
 VF3sdlXoXWKOt+SoI6rMeaJSLe+tHdgrPCHjmmhX8J0Fpf1HL+6uzY4sOtN6+x0xPFfpAJB75Y+
 FFhe699obNrQSjOetjHA3NiejnPNObw8YaaU+hSr60yQnxjmQ6Fuje4h9sixV1pmsG9uX5e8z78
 mAgj7snB+Ovs/43n0D5njSIl2Z13fN1T8Y96ezc3feYouIpZbPtZWk8/StOnQtWk4zqR7YesuFG
 VINslDMSg95+NvCMXTSq3TzSx5/OCQ==
X-Proofpoint-ORIG-GUID: eQtvvMMv3wtV2FU3V0TGcF-DQxoHqNNW
X-Proofpoint-GUID: eQtvvMMv3wtV2FU3V0TGcF-DQxoHqNNW
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=69427662 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3Oejc3j16LMbRDOvZ-EA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170074


On Fri, 12 Dec 2025 04:26:46 +0100, Bartosz Golaszewski wrote:
> Save some lines by consistently using dev_err_probe() when bailing out
> with an error message.
> 
> 

Applied, thanks!

[1/1] eeprom: at24: use dev_err_probe() consistently
      commit: 7a29af24b288eace769ccd9eb8044742dfbd5944

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

