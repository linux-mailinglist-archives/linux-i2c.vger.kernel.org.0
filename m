Return-Path: <linux-i2c+bounces-13874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD2EC18529
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 06:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E58A74F4001
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 05:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158F52F7ACD;
	Wed, 29 Oct 2025 05:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU4iDMhR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNIwgJPf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B4E2D0C7B
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761716575; cv=none; b=usXHz2wO1k0qrmBMOsH8JJwalRkkUp/qrXqwi6Z3Wves7NWIGK8vHxS9f3mF08QIvRXHPeA+SsRQ5u/PWhrx8vzVQcYpMUVGzn57y01gWmTCRI77c5B8zvfeQJCWUyVV+TrVJN9ZI+6qW5ur1ZMNRztBztdPHEl5TBAp1EPhusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761716575; c=relaxed/simple;
	bh=Hq8XQ7WLCASzgS3W4PqiVhut8mCz2MvByqRttaBS+zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUjZ9n9m/k7sXfyEX2MqbJ3cTN3sj83IRLv92TwaKEaLt6+FSqi3oJV0lF5U4DCqjOBSGW1tdIbpxR2TiOuSXsVQnx/nrwnSJQ+dbRRnHh+U78T8J7AQdkAr6vICHDQXKSuMLu+1Z2dEe605SDijVkNdULZWPiBd+bYeDP5o+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MU4iDMhR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNIwgJPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vKro3643374
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=; b=MU4iDMhRdB5gEpoU
	+Zp/rE6ISERvIz42qDt+G461liT+E0ZZsQG2ahU7C/pB3Tsxmq0I+bgEbtZFbCtW
	88tzkOm/7fJSKQc0mtSTOZXt9pG+egYpSosl4TDFJho8DV9TUwreDBl35WZcPuNM
	PtNuVO+WxiGXJrz0gZqD0puGbPRsovLl4RtUpDNIEk5d1OMpX8d29pJuX7B2luXK
	KsOvw+kEvVjocmHouSOl0tiPvHRTM8vVL4Wykob0Km7hXxiACy3oIN6wQtXxXtzC
	z2D7wN1KL0D4AM1WYFcBf/9HUcIRBFzKh3HCi+UnfhMqV9aL0H8Uj5lT2Q/Tq+Md
	Ea5+Bw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 05:42:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27c62320f16so68964635ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 22:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761716572; x=1762321372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=;
        b=MNIwgJPfnWISd6Ss4T8KCFu6QLph2vMHI2PMMZChFpuGVbknH0ygVVw0AMDDVb3D84
         PDcXFyCoS+Zks4MiKXBKqcbTdf7IyIbqKmdQUlMn0+3P7qEn2VTd9J6TTxCX43icHvCH
         LMxU4RMc5/vScmz2YwmoyUyuKWCYuSnlznVCm7xU9OgK9iv1VwEgiLL9+K9aKQcExzAW
         TMBDNklV0yhgk6hG2CdUojGwqWvfmli300TsHLsy4gCNjyOA5zTuJPQ86eN8wWaV6oAl
         2YZnzabFedMLDWsuEdSuZGeYIkZoHNTAufHCuMJWrawA1zhJTDbsGoKk7Qkm0t1vsc0a
         StZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761716572; x=1762321372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3bKb0RDe7sqcKTtSK80VBkKPBG6lWJuxoKADwOVxbA=;
        b=V1+YL9v49B1X++c2OPQmeYzdff4+FYZ30Yif95TLrOy9+hgKebZpfP5SnTjvQjTsi1
         ZvDUtP4bTLSfkugXaLozQjQFranwM2t6oUUz/WcmkjntAe2ms4KmVNcbUouSw4Hm0qzV
         pIEAKyjMokucipefSLpb9+1I4+849K8puf/YwxS1AX3kkEn5iLMPHSvzsE90agwnicTy
         RnA8hGl5QCuCi+Dnig8AP1RRDQ6o8P/vruFZZzB3Elg3ogrzQM+9zJxi9H8YdOjMNiIo
         1l93Bk0kPF4/ue2nMAw7L1Z8QHGHcQl4IAAUUYncuY6Xyoc+u1gYQERakMsRm/lzbKH8
         elKA==
X-Forwarded-Encrypted: i=1; AJvYcCXQr+tIlZJBw3WTjIxfFhlFm+v/t7hpVgDaB39gMQy8MJnXOluOiW3zGLXL2cXsiYkYaSiN7QQ/a8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vUU7m0rymVorPtQVRfeO1vWiQjORuW3Zu2QD60xX000uNDBg
	toxuPFJZiVHORaEz4fO6KqoI5ucmVCaEFdvKzmYdP9hwyW6tLsk/j85N7HgBdoCJtXE5E3JrpYb
	StInvJwZpfAD/SXHKpYUZllf4+rwNk9EOZHcEl5Wy2HdNMR00kEFebvLonR/cACA=
X-Gm-Gg: ASbGncuc8w6l4b/oF8bMUjY/xiskNgDD4W/9PuszSRRGZSTFx8bbJfU50IVymvs7qLW
	3t6bzUv+I1OIfMfvRHglTsqeGW2SvCsiIluHGqgZXljvWOyklNYNB8YtCUvMcVIEiCgjMUyswko
	UP/LuGqnFQrHwQFei8BPgEaX0nBInr5OpgOdu/ZNKOq0xnyL3ptvJaXuADhzBUPaHsAnDdyqLCO
	lMQ5sPhG4Wi14BBKopVzgjdU8i0y9Iq7VNDMMsl3a8O/zaZOfT0w5jY/bF9boTrWXIrNJTBI1m4
	cD5PCf8VyzZBbt/U3oQVvCxgmL8OxrByZbtX5000Dj7uFj6/NfKho/BBJwl/V2B6g8SKw4OSzzn
	dsRevKNCJB4UQxOj1jb2yh+i0sd0jlqF0J8iLyJx7PiJJgBzRGvuL7mwcodw=
X-Received: by 2002:a17:902:cec6:b0:26e:e6ab:66fe with SMTP id d9443c01a7336-294dedd1f75mr20591305ad.5.1761716572212;
        Tue, 28 Oct 2025 22:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0J62yU+cW/tUQvL7VRAYtrnfeGLHRB6xGqt8DJOtnOMkh89UIRroDUUeQ58BKxUmHrLwaFw==
X-Received: by 2002:a17:902:cec6:b0:26e:e6ab:66fe with SMTP id d9443c01a7336-294dedd1f75mr20591015ad.5.1761716571699;
        Tue, 28 Oct 2025 22:42:51 -0700 (PDT)
Received: from [10.133.33.214] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4b17sm140263785ad.5.2025.10.28.22.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 22:42:51 -0700 (PDT)
Message-ID: <a1b02978-8c6b-4480-b2cb-305865ddb7a4@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:42:45 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
 <84ae4280-d0f0-42a2-acfd-e85e0263be1d@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <84ae4280-d0f0-42a2-acfd-e85e0263be1d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901a95d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=FnPmbW6RWPOSwBWwTPYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Zxx39B2v_rGrQe1xS50FxxBbaP81CNwk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA0MSBTYWx0ZWRfXyDnxzOnw38Ce
 GNJTWyOs/Xio+y+jbCNRUiw6GwP13AuelmqArlMQdYMHfm7gx+3qPoLMS+UuWSL6vDpIMyazFZd
 hV8/FHTV9veiCmKHXmhpp0CZ1lhf+MB9ae4dUNwFEwjG+pH5MOwVK69Y0WX1z/sjbbc7kac0Kdt
 Tg4H1m4ZSbAaP/8bubRMJq767Ny2xcfTr5hAG/aP71L21dsfkdO8ZZtBQs55SViDNHKoJHxN8Ji
 0IqAZxM5ukSI5IvRNE73QFAlNQyJ885aGidjw+eqMJZxuqLtIP4Le095Z2PzZqe5HmU7Rz2dPC2
 lk4RnJMG3aVTo3J9hDGw0p4wcyjgeQYUbVl1qyyToV9/kDsJZUwcl7ia1hX1Ua6iSSLs8Ga6fq3
 BAG+kCYUim/jvy5kn0QOmQajcvwViA==
X-Proofpoint-GUID: Zxx39B2v_rGrQe1xS50FxxBbaP81CNwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290041

On 10/28/2025 4:10 PM, Krzysztof Kozlowski wrote:
> On 28/10/2025 09:09, Krzysztof Kozlowski wrote:
>> On Thu, Oct 23, 2025 at 02:14:34AM -0700, Hangxiang Ma wrote:
>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>
>> What is qcom,kaanapali-camss? Sounds like a compatible and you cannot
>> add bindings for a compatible. Instead add bindings for hardware, so
>> explain here hardware.
>>
>> You could easily use `git log` to see how such commits are written
>> instead of pasting here your downstream practice.
>>
> 
> 
> And of course standard comment:
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> 
> Best regards,
> Krzysztof
Will address other comments and follow this standard in next revision.

---
Hangxiang

