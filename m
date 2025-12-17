Return-Path: <linux-i2c+bounces-14623-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068BCC6C90
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 10:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C6F6302A39B
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 09:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769D32765D3;
	Wed, 17 Dec 2025 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJxcfyeu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuuBOyNB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694C314B7A
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963367; cv=none; b=fV3rzLtKpgVzyBfwUQUE01yxJHJjmhnvIk2RL+8Wxd2NIiYnHdTteAH9IiqPivYYBObOAXNJBtDBmcHyOgPz5Od7oItCLycTKsEGXojazw9kHhJmmCH53CLfVH3iorr6Gd0mWhzzBQjQtwf+g4RpLWPP/M0qfzF3+ixc9T4Pb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963367; c=relaxed/simple;
	bh=EjENaxdW6lbGlLwV65HWRMJ4CDsz5CnlWW9WN/bo1gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cfyvi/u5dKzMUXQLFKQ3W7ZAASFGI+Vk67Z7WpE1DkJ5rBShZMFTrlR+LVZ9F/yDPtcIQMA+gbzBaca56bYmlvndMNPh3zeSZoYuaptbHWCK2GHd9lSCHlVBkFfGKmQqJ60Pe/GQ4j2RM8Z5HGU9pyjvCJHWlQ/R++Drqe63H5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJxcfyeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuuBOyNB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FVJS870378
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=; b=fJxcfyeupE+KBkwg
	8HsSWBvX6ByeFicZ5K+1ERHiE035LvuB5D9/oCYlSa4R6ihwK+gD+BrVl6wfMh5U
	eCyxMASjiA6YWECfmzooInwq9NkbD74Xeeg1jfxeqoY3pxkyug+0onNdw9gz5FSc
	1JMRypKejwtoqn6zYmmSUNrjAHl/K6UWf4yf+zhGmvkfXslD9NkFNOQ79p5+njpX
	5ALv8wekljt9jZkkiWaLzkxhfPwo5nhCNqroG2aKoi1oK++bCAC80UOj5GIhVQfX
	9r/eD7IplFYut5Djtz0z46lvamhvqVOmi5IY1SpdyNDtAflmuO0PwCzMCjrzhaCb
	YmW6nA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1stsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 09:22:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09211413so144271771cf.2
        for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963363; x=1766568163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=;
        b=XuuBOyNBOV5/FVHjxnOolKv27rWcG+pfM19nUFX3t+YWAZ+SbeSU0kauUHqoqRKjvd
         4XrNd9T9R0dUbNTHq81wzVjSqIc9icuWWsFHh4smwchvW037v2JVXtbf6gJlfaGCsLxp
         IKLPSkRsJ8+Eyo1lj4Lun8SqqpFowRWz1jBNc3Rt3Vw1VKz+bgm0kPqv63E7YyhgRxGK
         KTWMHsA6/aek15j6ktNrQen6DPjU/Gnftj01tOJ2P2vgUW7hTVvulqnfIRJTOA0Ct3Cl
         E3a56yKUOQYv5pmY4CGnAmbVPu/RlNzM1bPHukJyGG4EKsqCCWM8c3fnPos9V0joHlDC
         nLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963363; x=1766568163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VApM9a75be5yBxEpWhyZqdydIcBo5rRRrgOh8r2VHCg=;
        b=K95U8PHM2VjWzZadHb4x03Tn3d/hTODwFZr1YJCumdKrOjNDPS5zkuT5dyhBrNYfx1
         jct2VUPzfWf3G+vRoFin6yhAlMuIp6AQFwta6aVoguJ+17RrGbs6g8QpgjqiFbelQHQ+
         JMQmH7rmd+QUCctfcmYeuEni8q5Obj9y0oDtvGE6UL1POHbzT5hY0d6dnVxDfm97249Z
         jY/Cx6k8BcHcMa6J3SseKLzM9g+rWCBIdxXBYm/cUjQeZ2Dp7xazrUF6wtT05t42l3Mi
         kAKXUa01I3Cvph9IHi12yEL+d1nlWFTl7U1NSWeguWPQ3gB3kUYEETLT0w97xlrp6KH1
         AAbg==
X-Forwarded-Encrypted: i=1; AJvYcCX84BfxnEBznFbfbylVzPANQh4GTTBCcL/M/yiyyeSTGyNclMrMDmV8WugMawySNmdQVR1uBV+qurY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdJj+QcojfGJngsLS51Honk0Pn2CKgvmoR5QkdEQafwR6ZscvZ
	//BQkDVPCg8koTPZXHu1/2rZXrPL1hUpSul/ctP0daUZEaT8fPnVPfmwqO5h5gp0QZrBIYHnPy1
	1570ahG7R5wzKYD+y60sSRQ8/15WtyXFwnozPEVapn6je01s2941J6OuDgjff3wk=
X-Gm-Gg: AY/fxX7R7Z0MZFgUbDiD5+0szCy3ptxhD/Gqxz8QW7QLKxYw39y/HiO5MzXrT24Czj6
	Os5f7NwuRFUkisC72y+mPAwwIK4nNwk29sXugF1/58nhXYVQkXJKEzxi+1bWcr6mvQhY5oO2+mz
	tMhSlN/C+gCUJB4gyvIEb5elA+vwkz6ueozx7N+cVoWoGSQemG4Nz99sMZCmhf8FBkRtLhwXBr9
	UO8u6uxOWApWaT0GsAhLRlDHV6y9TUTPLNQpWWUBfCI9RksPJ1D+XOOsf/rOm5JQH+VdADXNqvC
	FByGwMIljbu49z2QGL4jMvgi5/L1Ba0Lm2krOh7yygzhrHIoEb1cMW5Dzg63RUcA2v8QQ3cRhPM
	XFgOCstvNabAZH4O/je5kyO18R9Wq9hZ6s8+m
X-Received: by 2002:a05:622a:1f19:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f1d05d59cbmr242213921cf.48.1765963363045;
        Wed, 17 Dec 2025 01:22:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI3b7d+/qT5rVGwUnNLudj4HqUEmDZPFToOEAewMOI/77utHiuI0w29s7lV5G/J1OIiI+rEw==
X-Received: by 2002:a05:622a:1f19:b0:4ec:f628:ea6c with SMTP id d75a77b69052e-4f1d05d59cbmr242213761cf.48.1765963362653;
        Wed, 17 Dec 2025 01:22:42 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade7bf9sm3806668f8f.24.2025.12.17.01.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:22:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Preparations for camera support on Fairphone 4
Date: Wed, 17 Dec 2025 10:22:36 +0100
Message-ID: <176596335028.7296.6383434017089749301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NCBTYWx0ZWRfX/JP9nD6LAnoR
 RfDHFm+btQ/d656ptGv+MKY/wuRZ6DNqaoaf2LGLBj8XLzkPTBypLy8vQNB1cXh7XbqZ013kjnC
 kKPBjFKpcWZGJM0orfo03SqmDrKvuA+vrwe59sjUVRJsB2n/MfNpuSBMfjfasCTu3ATCqIi1sof
 mnxtY6BGNIa7b928t500KHAlXI1xXXaaR12aLJGIg6BUB3WE3zdRwkzgp6AWozYsEyZdf7kS8IE
 uh8FBM4Zks5zeUDBLtGwPjy5YtBzUJMAYlyMVhUBZrWnBUrCTHbwBPFyNucR4bIqEOn7JGtCywV
 Fc9SZiKnttD+61Sho+/GeyBi6JcZ4DhkyhJvS0gfQJ4PN7s7TLh2R/WYJYLNrPbUfvY8/VYiKx/
 mOUjqnTWc5vLLWFyNUFbJau19PzqhQ==
X-Proofpoint-ORIG-GUID: iA3Ol1MM8xnuccigjtmLyUwVLPhjvIj6
X-Proofpoint-GUID: iA3Ol1MM8xnuccigjtmLyUwVLPhjvIj6
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=69427664 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ErV4QAY03Z9ma4_nCwAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170074


On Wed, 10 Dec 2025 10:05:26 +0900, Luca Weiss wrote:
> Start adding some camera-related parts which can easily be upstreamed.
> 
> This contains the EEPROMs, fixed-regulators and enabling the CCI pull-up
> voltage source.
> 
> 

Applied, thanks!

[1/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P64A
      commit: 30116121412b1aef99899bacb51f7ccf2511f223

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

