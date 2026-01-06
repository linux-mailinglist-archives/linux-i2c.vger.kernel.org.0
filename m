Return-Path: <linux-i2c+bounces-14928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C1CFA321
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 19:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30E24302C863
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 18:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414E7363C41;
	Tue,  6 Jan 2026 18:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7I9pxfw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QeUK8ZmB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963653624C4
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767723795; cv=none; b=VVnphf20IE8tDqmNxc9b9cH2tbr5kLa5DfpjnEIx7u6rdkGk0HHB4tltxFvpKiO7yFlJd9tlx4EDWrhhc6inVfjFShEhAipPsKOlSftFmwNanskznv6lHLv3RfKN3sKdb1zCPMX0ZOKLcSfUqolKsleJUDULghQY+BMfz32XVRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767723795; c=relaxed/simple;
	bh=f9TlxRT9rvC0hlEWuOkdtUiQeEM6Pel/7EGZBRfrXJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxFN8udBJMP++3LzedJYgWbC2aS/1L/jNqPLXdfoK6czkROiqlgbnazVsCODOh3XP7dMTQOkomSLn7ZcA/tjFQ96zXYHZRVDPNA2XMvNtgaDmeH31SN7qGzLRfUfpZOJGHswx6D6p9sw5S0D0BYLGMfZIEmWg1/YFHVwG2qnqic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7I9pxfw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeUK8ZmB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AgnLh1462600
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 18:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H6b2JxB1173oCI8iM+PjDJVx
	B3Kk+Q+MqMhzz29nX24=; b=c7I9pxfwElq9rVTekH2oECKFm4GgkrNZ1ZzC/w2q
	jCshehjPbHan9u7X1m3BJ7tDrnnc1vyXaBkux7D9ny0fozixuleD0imnSKtGeuOU
	acVacXtz/LqTIyo17c7TfTSOdRSdDuN0oVwe9Pvmp0D2oqdSTZAKht3HSC/rEFk7
	rl8+e7OYq2iO4a9RNrpME6viCJpZaMIYnTFQnrn4rcTBvqw3qwbHWACUKE4H/9+Y
	upfO+mbyWl48KK9knNsn7M+R0aIYHZ3Mz1x5Y7MXiIJSeffpb2/DTNJ+DeTQnAgr
	ldGga23WgKx9M0TrgRTla7bQpqVc0XgjKXqoMTzKdBXvzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh0vm1btg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 18:23:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so298758085a.2
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767723791; x=1768328591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H6b2JxB1173oCI8iM+PjDJVxB3Kk+Q+MqMhzz29nX24=;
        b=QeUK8ZmBSnGw4MO4MwOPCkJghU6CcaLN40mDxrOTfXc8tTHbXdw2qzrFMi3d4c0YjQ
         A2PjAEzPh/8mLzUzUCGkr8WcSnpxcDCm+iVn/u6dbfzyYP+yT4zAc75wHER55ieeTtwp
         ycTJ32x3B0MLGza9oaureDQQ29eLimWTPkOhvwZV6MpiI8L62nWon+0mXlnoE5rRBTIJ
         DSzZ+qLgBi0i+D+xbhB5nvJFLqP4zOVCdoi27F2lXMbDRKfJSmXWDMwZusdUqMbBGrBP
         lOM4tmWNlqhIKttrne4XIViy2C9JHwntHWSYXSAqdai7PkYHXc2EVSqYmn2tMZfw7u7Q
         ocLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767723791; x=1768328591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6b2JxB1173oCI8iM+PjDJVxB3Kk+Q+MqMhzz29nX24=;
        b=EavSxweNpC3hBg00vFI3nvWkBLeKbtFhaAymw1D3WB2Hcn/LQqyedMGud4vZVZQW56
         O0bRUS3XAm6FWC98zzC/wyFtF6qn5eXrJbycIki0ahcHJhbEh/B/DcE6dpk/qINLiYuQ
         WJ2gDbRY/aOjrS59R5Uu3UisnhkYRNkcfBqv5FuGZbigK7hMPvJTJRo2NuQn78Cd9lFF
         LaATOOdYXgEgkUK6P9lKbQt9ssFrRSvLEf+UiX0jS2i4xM3TYmrxoN89DSgo3cDbdpkz
         nFafzNQLHQWF9bS75aHa3zGePYa6LRIMfY7WSKLUiWhafbZsxFCvfn9eI/KTdyAlHQsf
         KYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMP4pcIfOD9o2WrJoNx0tcH6MP7qygQifSQfJC22x7QZOaD+FOrtWljKBW91XbtwPRq8uMv5yqzhc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8QKfZGzzIW3JUSinwS5gCVwIGlsyXaFcV+UxdQTwNrW9YvJY+
	ZcddpDGOFWk09uxGCLmwzTVfUw/+I9holqpuvaqSt2pMEssEyQhbXGUFMDJOGHIHXs35gj3Hi5D
	0r4XUfJLcPJNnFV9nqk3GQXkxLgHON9/3JTFps7kpuuUIwEjQKHn320/S+7CBGs0=
X-Gm-Gg: AY/fxX7C+4mbybmczUXXkPiEhosS/l6ckEtbJrXm0zagRsjFHXD+TO7Wo/K/w7kq0Xf
	w9QrJCZdwFGu7QoqQh1aCFKYGgZBRlYonN14J596/LVZ3uFL9WiSMXv/VyCF/U0/LbpjdHP+9II
	vV5XYUnXoU2rZ92KNrGQDiiqkuxb7lA1gHbE11PsuZdkYeM0KuVN1wm6RMUYL99PF+eWsL9jepu
	HaQwCWtgmpOh2uK1akx2CWqsdZrGQHazkZ7MOmSmjS9ZsoYdX0K99CiEShJvuoWk5zBwtyU8p+0
	47YTgFQwfoXtqMxqWamXmgJc4d3H2b6loNXXCenXClMUt0F6Wll4IBBbbDySPTep0tcM4/KjNse
	SE0n0Ypk7lloKHgrvrh596FKlr8KMIvMK9MD0Yinl05H6zRYJZHzWDU7ll/BEKtXdXQfM6GZXGR
	bq++j6uEM0lBnV2kWX7vdinls=
X-Received: by 2002:ac8:5746:0:b0:4ed:42a2:1293 with SMTP id d75a77b69052e-4ffa769fc96mr57250471cf.1.1767723790985;
        Tue, 06 Jan 2026 10:23:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZjmwHkb6x979cBiP8hvqPchXkRrIP2+pImdPuIe5/Ktbf/46OuXXNUdlI4G7PoYgGi38RA==
X-Received: by 2002:ac8:5746:0:b0:4ed:42a2:1293 with SMTP id d75a77b69052e-4ffa769fc96mr57249891cf.1.1767723790440;
        Tue, 06 Jan 2026 10:23:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8dadd1sm6115241fa.34.2026.01.06.10.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:23:08 -0800 (PST)
Date: Tue, 6 Jan 2026 20:23:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Message-ID: <ndexzb5bo2rxjsj7jkf3bevbb6vmtjpuuhxbonpf3v5csxnjtu@sotufkkvfc4r>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Pa3yRyhd c=1 sm=1 tr=0 ts=695d5310 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IdMp0vDf30minsVrjOEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 7IVY-RwIF7Z0Rs8XU9Hmf4ZVUKILZwpD
X-Proofpoint-ORIG-GUID: 7IVY-RwIF7Z0Rs8XU9Hmf4ZVUKILZwpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE1OSBTYWx0ZWRfX2wzuuI4Ne/Id
 i7Ivid+0Zxz0JpV/yLzeiKE+kRGfGSTAr84++7XuN+7vpqkjaqckf+hVSjDPtoexXPOKTrY/9bA
 cTb0S9MHEk0nwuj+poX/lCC79Yg8drNSIE43qKqlS+F4Du1TDi9Is66Gsy3wFNAgRuoRBjH0LGE
 T0QWo2WKZFuYWOkI4YjT4ekzm2IfT9hEru2l6TBB+Xw26mY6LMx/d4Ly6a2D1Rud6Zfu3VSaGFJ
 Rrkvgu8YOA7sDl+Cm4hV0G9BmWjOdGzY1g6IKo+3hefm/AIEpgoU0vo/BgJhjN6HIVlY2tmASEw
 hJOFa1kc87eoKldbywUeV6qb64I0bkV4dClu2/hij/P1gMXRTwypvW6mZLCxoQOpkBNCXiEmFkg
 w+9PbcpkiO83Zi0nI5dpm5BPCJlK14kox4wY9IjI42rOc5dKXvcHC6gP8CiojQWRERl+nc0D3l6
 b9grZIk1GdYC+ZgSNfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060159

On Tue, Jan 06, 2026 at 05:39:56PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile              |  2 +
>  arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++

Is it possible to attach other sensors? If so, overlay name should
depicit which sensors are attached (compare this to the RBn boards where
specifying "vision kit" defines all sensors attached to the device).

>  2 files changed, 65 insertions(+)
> 

-- 
With best wishes
Dmitry

