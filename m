Return-Path: <linux-i2c+bounces-14570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA5CC28FF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A05A730269BE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22553659F5;
	Tue, 16 Dec 2025 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TgRp9V1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmhLe93j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588A3659E6
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887042; cv=none; b=p5wJ3ZgOnMhPfGL5V07IvSIfiSReQj8XOwA1qkeVUjfCnrMs7NzKKueMQKv8togzp8m7sEXtF/91wAN1Pjn1Ok8S3spA4+csYhrMUQe7vdT9hisrVguYV4uOzzgHdwE5wUjoohKxS3RsdwI4Ag8X3tYcZ88gy1MAQkkuq9NsAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887042; c=relaxed/simple;
	bh=43+lAu4/5WmLdRsHNdpR7bsrhDMq2bxfywhBh5ZqLa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG0VXlAGSkSFuHD9WakaASp1dIyTOTR+L8Z22rNtLTISjyfXGzEhj1Efh9k77G04J2e2nmi9CnDUpmmGuh4v5YCVx/CYKhFmqt/+S7lkpndA8RZxSH6zGDIlY/vvLgj6P+S8dlYvfn2TXk6n5Y1e7jrzYIQ2ODY3/OiImBb47ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TgRp9V1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmhLe93j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAMBpI3829526
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=; b=TgRp9V1jqvXgyh+c
	sje5tWDieAyC359I3DrQ5Oi8WmbCnzxelUTsShF8/sYkMl3f9TBrdjIOKozaDwVz
	xF9oazJOoWLldFq6QJnNVnMcaAnICg82F6VcdvhtGIuFPhXa+jIL701D5IhZRMd1
	XiA3H54UWaRBNtnAKaR8Ky76K31r9wpgUFCHmjlRsJ5zjaZArLsUJt6IGrd9/wdK
	zES5qOtAKbmBIsrxTqqoKdB9CZwLU6Z9p/8N/3ryWqubr9qfU2JzcJcJFEHNM1YV
	8yFP0yh0XrWwO24FaTxzDriW5EMzXKdefgJkejKwc0RhWCYM1eDRFK3oTCuR0xfc
	upwANw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35m2rdxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso957011cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 04:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887039; x=1766491839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=bmhLe93jFGL/u6yU0s6eEoRNKrDA44/QA9xsD72PGA3wuv/fRrY2tHx2IQ4rHxLEpr
         u1xUqVj0j+pw8RssN62XZ1lAzGdGljCA6RhLHHielO+RgpYUMcy8yobMYA9UItcZPtKL
         TZf8A+dKNTWjrsuQM6VVm2VRfuvIxh6jTJrzD5mSIfoMWlm9E8DgZChIJltaiB0LLdK/
         ws9ztwA87v+myvZ0vzVF5147rI2PYVMvWxw5A0iNz6rMXZOZWspxzJZydRL55SdtSBLc
         vOGfG2TSJ/Y8uZlfO2BLS5f1sFpBXZGb7+9kZsPHS+HjDuW7/804QK8yoEmrdYIp9alf
         bRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887039; x=1766491839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GTK982GZBp1GOR2TR2xUNEEQ8UbFyBdxOqqUYpfZow=;
        b=mzV/r1k2Y56L3K7lh3OJxSiF5VTCoyyqMjL8y6+8RuE7s5FV4tx9GbiGKJN3LiCMpD
         Zc8m1NI/qBvSZGOsCVEc4L4aQdx3hwy+lldt/3FewEHl08N01xm8TncydaqkBVU+h1lc
         KqCD9Tv3z2YLKK7Km5Tr6ElNI/rUkpHUv9mVVa7xGMGNavvBC3tUtfKkKVYgVjrNNUqG
         5dL3MogLNHRsWm2hRio8YveUdSfcizj3+pr9aaJUs36OIIX0ek6cMBe+nNfNGjnE4Jao
         NBJK28BlDyy5/R4g/XKZyxkmnboefnm8AylxLNfrK/5P2m8midPps6R1KAetYdkb697m
         bpZA==
X-Forwarded-Encrypted: i=1; AJvYcCWWZwwkDUotjqMRq9UNMhXGSEygTzXtuDFXXgKhEtEPei3IUzlfLFPfkSyT9iNClzU9e1rdHOKV6f8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mHYOFrCSn+IdEuHR35X3LhNfiQyGr2sMla9PC39CrazxIuBU
	5vYfUtDtBF/QeaYfNE2lJlBfIqihBWCnfzuZVuQCP0lL3v6ElguljhXzu4UEz4KEYqL4/jDGI9w
	65Q3H+9QMnBQ1W9qulo9gbaE3kqEwCfZu0usGbZw6yBUSOpuuTjxJoN2Vq72FzTM=
X-Gm-Gg: AY/fxX6jIUNGOveGGqrPPupjoc9ER4sAgjpKqPDB3y2Jmt1bDOhgm/DI73D/iyH1ccr
	Z6LVdEPZI6F8nmz0g1xD9fQRL53QYmejmc2SnJTl+qHM9MuApxBB8SmLp4jQ6N18ZZDFJl6m1YT
	4ija3R51+GV/Bi9KiMnQGOGx982/FIdJvBu2dGHz/TzTNjq+tZlXXz4TITbhkyJl69cjC+mxDRx
	6n3mMhMbTRcrzICkccRgQAdgQjcSsRf/MHABnouZnuraHj6cRRMBPLTX+I57tXLvzBFfHlm61YK
	yj9NyNkVP0or8faAHzXPvaSKLgGYFbgxnuLpWMedcJz6vOC9CIJRFbS8hjUYJMHJnUbkL+s7iPt
	GbbKBgSmiv5HGeOK/ymThMVjLPGDzBH4ZLz+TAHO/gzS2uOXXAhM5WHEXkC2qylq7Dw==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409591cf.1.1765887039281;
        Tue, 16 Dec 2025 04:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5SKyHqraDstQKYfG+VACVomM10/dBkE94VnGiSDuFI8KaBQVrShZgqcZyy8XV2Gy0HK5RbA==
X-Received: by 2002:a05:622a:1347:b0:4ee:4482:e838 with SMTP id d75a77b69052e-4f1d047bbb4mr152409101cf.1.1765887038712;
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1682686566b.8.2025.12.16.04.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:10:38 -0800 (PST)
Message-ID: <8612c8f6-659d-475a-85e7-4049586a5962@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:10:36 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI
 pull-up
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-4-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=69414c3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=BzSMFxQJ_lGk4zzpiGkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2TcuytQaCzWVoFBecRmJQcjfuIDMQUZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX1EDVTg/MESkG
 lzu5hDh0zVtLHODYI+7ODYpvs3tMDkNuN47wpUBIQQtXU3fl5z2z3STPwifiVVq7TRTPxYHd5qo
 7eFIKKFa+ETf1jHIHZ4HOj1dyPoKYVs26houGS598DKLbdPj0Ht2sZLo/aZop6sbT641hTxQYOl
 Ow1ST2Hi2zMIZWkKyyG+VUCPyRx94iQ0/xLMIWU9KHfUVgmcs4eAihpxpi/uZlKfShMnreq4KPW
 U5SKH8x/I1SCf9gEZIAZsu4ym9S9HSlSDNFquuRc4onHtd0HvvkimFbW0xKvXk+RSNdmVnMFQSb
 aKTHrEnX9fE4qbzHxt5t1JsqhCLrWO/A79IsZEfvMl2Uzy6dlPCXQdPPZCFWkxW4dFBJND35Nzp
 c7JtQBlCwo9XcUkNTj/B7XSdDJZ/HA==
X-Proofpoint-ORIG-GUID: 2TcuytQaCzWVoFBecRmJQcjfuIDMQUZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160103

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Enable vreg_l6p, which is the voltage source for the pull-up resistor of
> the CCI busses.
> 
> This ensures that I2C communication works as expected.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

