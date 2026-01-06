Return-Path: <linux-i2c+bounces-14931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 61727CFA43A
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13A9E3019696
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C444535028B;
	Tue,  6 Jan 2026 18:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2ftelMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LE5Iqfqu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E334FF6C
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767724852; cv=none; b=QKORB7E5C5K05yHQCeK43J6R8pFuKNZsYhOGO7ylE62fV7kMo0RPQ93o0q2sO3ahbJbLfyH0dsbmysTp45G1yXavbS9/dpCf52rZFOsMepav8AVfss7JVQ54XKUbqn8y0DrVJ870SkHirthv+kma1C3eD3cBa6gIHPtt7IdJqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767724852; c=relaxed/simple;
	bh=++DQGKnOZXg8YlFGgSsaTnIuRLTvbA/gdMLcbw0EMEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBu6GYKp4khu8rG35HO42ddpa5eWuOrVIJjvmGE44jGi1WvpZiK4RRbJvBs+eVvlbCu7vDLthCMMM0Gr8/Lrw31aihISvMh/igIMw6oh0YIRRoYPBUpKgchxwX5zJT8R9GyELAJIbxeFOI90+en8KgqasLfeYP1BizgP+JAliLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2ftelMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LE5Iqfqu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Ghwe1364880
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=; b=m2ftelMRML/dFZvl
	ht2KIE6bYMfPbyV+j9Wm/WIqiBh6MuAaKMwUl8CnHzk5AkFvA4SoSohfNPfa2Thh
	rKDkMYCx7+vWS3QqsTbmHquAoIaMnj4mYeErzGEsa21OpVVSSpd8XxNyIDaMj97Y
	OfUdQpMIiQl7mwyVJJoTHH1ie+a9iYnVx1WDBAN/epH8rjuEYuW9saUtbPkOjkMP
	qdhrU14zP+6bTKqifZw54iBJIqOBtJ3wzyx6dBm5zk7ERYJzQ1L4DFu2/ZCGWvNc
	holB8CgEM6ZSAatXT2br+vup262IRixQILXlE82dV+3d7CVY4NxwUIgLGcSXcaK4
	fPohzw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660rbp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:40:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12055b90b7bso2460033c88.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767724850; x=1768329650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=LE5Iqfqu3CvAz97I/A/aVD5ymgxZ4fL8E1s+h9fW+nm9Sgq437VGjm21QTVjfbIk8q
         KhmF8jkzM09zCbA8GqAn44mI32X+NU4oIL4J8d5cXXWAvXzhYFSH5K5/qrVGPFenTBVE
         BvXwbHJCofprgHxyfZ9dZcpTKPKnPHaQgdMSIlIy/zha/biEIgrCW1LGHhiNLivFmkiw
         6ba0RYB5kU9GqOKrnWEwY6USNnk6TXUFXJcUs21pOlvZyWuujqrhMsP22dwQQ+4x7nCl
         7uD4OW3flv0DeYZKl/BD+gThuy6eBUiywvlA8JDxvQUVZ/erxW9pMAGFHmHPhRsSg7UK
         W6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724850; x=1768329650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PxAPouMyA//31qIYJm+rklBoskPqlYIqSfK+Bd0RZ4=;
        b=SQms1bAFRTF1kuAmiMZH7Y+OApbd4HyGto+2vetagnNEcr7QUFOXAhhA7mnh9edufb
         ckeVe2lyfDy6O2QDYKJrWC0Fba5cbX7bE1u+gWJLHb5pcLcvsN8gY1ll7/yY6EgBvTYr
         opN9jEDKK8C5Zj3+DeWxa28v+VsLzQTixAnix4Z/B1rqgDa+TzkPQ+u93bZREB+JPHVV
         e+XnU2VfYg+9Oc30w5cR62ITrPfHdu8lNwt1ULJBmgij0SaWAZ5LuVHLR8i36awK/Pes
         kwjK4PggYzFWZpxc9x4QzY6Xj7FTS6Jn2GGMyjeKHqJ9ptqiYwVCgUPe0Ho8U5WS2QVF
         Sg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7pv/HaUQxr+UabNafu0JwkO4c3vUolXMX9DPFhzBIjW3vVO/cpCf1XhwOtDwW0YJ9hGhvuGsTY3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YydkK/eVcmFYmmZpXoqy9DK8Pe0Za9ceIxcst0ovzsSPVoDO5Lw
	bVUXxNVy7074JGqDQOUDxhCaw0YS0QohZCSFK6rnlNUMdRYtgw1xrg+8jzBA51GHrrXVdfwTNvc
	fjdrnNb7yuEK0JvSXP11Gm73AXD7vaAJ4OcKZyFjXytFPJn2xHX3BAlzDcMmQbQY=
X-Gm-Gg: AY/fxX7YiM+8stZiIUAuQCk06mwzKFik0ggg594bkXICGh4mS15UEIQWIkq+Pligura
	tdVCec2drOfLdc6aDlApHm4rddVvpIqHBHKFJYeE/wOYrpRvrkNHmW/7p3I8bTH/kurct9s9XGA
	1B9MMpYbValmh7OunKiuoZCFgZZe2qahG/sMebkgWHv9x/gQ+DIy9ysHMySr5rG0WtdNUGbU2vw
	22/b/rxfKqCcxFO1Az9HoRAbzXqpSjdSYIZEdbhf+nIjTDx9SDEnAOfayJLB7IDeZi9bZ5RF7rV
	oVAyOm9qEfPplrW3igz/D8FOl2Oh8o/lxREppNAAun77uuvBh+9FEC+ufnisGFRUfTzJO5H8dxN
	fx229Jeod+NY2wn/2FCJGDYkuSFPDYxJA+GDyq8PzpYkm6KjmopEDyH8Lw3QaL9Je3Q==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234845c88.7.1767724849568;
        Tue, 06 Jan 2026 10:40:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSlzX+i3g8MbsJ2Eno/vHUKFXWMpqLnsUNOpaetZ9ZfpcQ9g/t+UHkyP6dmuOdvPwPx2CiQA==
X-Received: by 2002:a05:7022:418a:b0:11e:70d8:5dbb with SMTP id a92af1059eb24-121f188e0a6mr3234816c88.7.1767724848999;
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Received: from [10.62.37.112] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm6788547c88.5.2026.01.06.10.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 10:40:48 -0800 (PST)
Message-ID: <6aa8ffc4-2fe5-44ad-8ac8-581e0697360f@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 10:40:46 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Add support for camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-7-646fee2eb720@oss.qualcomm.com>
 <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251127-steadfast-red-koel-8c9bc8@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695d5732 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jRZ_Em-5SMcKJbQpHL4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: J6nzGKKu_GfOtHICM9J1U5akeJnMzsXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2MiBTYWx0ZWRfX92tp1nj9ZXpJ
 Y4N/dDWzHKXXSEz1SFRL9iuBR6JzjgBA2IxFAXmeGhZ4cNTDeaAFvkWZgCA4eeXg5IGSo2AdlSz
 5bJQhlOHduhcA5HaO8bqzeqdmXGG8AvDPaKuXUlwm1JoWjqCGYqLpSxSykiAyOh4khEhHHYrfNG
 nvPvD1hbpVZBeNJSRql0jdcvW7Q678MQd+33OF7uPWxTM9r6c2/FlwmZnXY0FNjl8IkwAuhrPTv
 7we5Qgl5niOi8Z+K3GIBjT9Ag9O+S1gH/DP+8ztDVF00pepU4ZSsV+KQ7llB4QOFc7o/12hDqQ8
 cuSb1EagvkiDRR6nQQL+nqW7qcIvAw0TSkcDQA9UsIQ/DUAoiD0Dt47jkKoeVoQCp4LYGP5PBaw
 C21/XAxjxuenxskxaMuyxmMOzZ+qHM/BjdTU65pHBWyZGlKIs4XqYbcQaYF2d/mpoJjB1ZpTReC
 E81z05tAtSe2mw0IgYg==
X-Proofpoint-GUID: J6nzGKKu_GfOtHICM9J1U5akeJnMzsXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060162


On 11/27/2025 12:12 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 01:38:40AM -0800, Hangxiang Ma wrote:
>   +
>> +			cci1_1_default: cci1-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci1_1_sleep: cci1-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio111";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio164";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_0_default: cci2-0-default-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_0_sleep: cci2-0-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio112";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio153";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			cci2_1_default: cci2-1-default-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-up;
>> +				};
>> +			};
>> +
>> +			cci2_1_sleep: cci2-1-sleep-state {
>> +				sda-pins {
>> +					pins = "gpio119";
>> +					function = "cci_i2c_sda";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				scl-pins {
>> +					pins = "gpio120";
>> +					function = "cci_i2c_scl";
>> +					drive-strength = <2>;
>> +					bias-pull-down;
>> +				};
>> +			};
>> +		};
>> +
>> +		cci0: cci@ac7b000 {
> Looks completely mis-ordered/sorted. What are the nodes above and below?
Hi Krzysztof, sorry, not sure how you mean exactly. The ones above are 
the pinctrl nodes. Each CCI has two masters using two GPIOs each, one 
for clk and one for data. The ones below are the actual CCI HW nodes 
that make use of the pinctrls. I believe this is inline with previous 
generations. Have I missed something? Thanks.
>
>
>> +			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
>> +			reg = <0x0 0x0ac7b000 0x0 0x1000>;
> Best regards,
> Krzysztof
>

