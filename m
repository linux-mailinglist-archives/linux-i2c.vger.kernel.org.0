Return-Path: <linux-i2c+bounces-3686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3D8D1EB8
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 16:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476E3286605
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 14:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BF4171E6A;
	Tue, 28 May 2024 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dkfAzheO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C116F91B;
	Tue, 28 May 2024 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906296; cv=none; b=LJcpRXlBYVbk+Hs1XK5YP4/a9UQ1EhS2Dy6IiiGxeWJ4KsBUawBxVI6RON8YQ9PpAGB2YxBoidIsgVzx2GcLAMcifSAGWr+b8tuzQb0LvjRxS4RM7E0fZdo+cV09lsAzRrj4mNz9ONr06CLGdkUfIuI9iQCLOIls7Z7H9GnBdFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906296; c=relaxed/simple;
	bh=xun32F+pwycR2i6M5Qc05sPjH1q13dj7yV3+CZH3z/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hamykL2y4QN8a/vkC8oQ5sg8s6voQ8QYOg4V9DfCSILpu52p2kq2uS2bUf/VHMlJ7kJWmzFrv1XCEpkteftLScH2yPy4vwnfneJVvEffKRra5bhHEKY7oVxSqKFJQDrujVt8IzE3biMjGsm2sP8K3gb0EQ+TnY02Oc0HfWAhAJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dkfAzheO; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SEGhOB019403;
	Tue, 28 May 2024 14:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=L0SIMnvjy3bPkcqbcDvDvy9JIytWtxBDbDemq4t6duQ=;
 b=dkfAzheOEmJk/WYPi5qpVCWqzYcMq7rhzNugmqpn50XTLAvdJfqvbFcOTPausym8iWDi
 yDK4L3bFW4axnWAP6g4yRU3gtOTEHGDw+y2HNLAWdZxxS/g8CvgfeHHJdI8GaFjQLWrq
 Dr4NMrkcVOQylg0u7xpL4PIHVjbP8zLKpcFyBVYQWWS4NkReJzobwYk9IA+7KZMuBUGE
 8Ch2goi7NlO7FzTnoFDCR23fYcLzUdZZYf/LNd3OagEo9YzJdyoQREScrvQYbybNTBvX
 EWk3k9PsxGHWORmGkaMRaUIZTgndkEhDWZg81OpRdofSGICTgJRViJvxwbCChbq8L9Kp mQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydgvsr0mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:24:43 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SE1xpw032255;
	Tue, 28 May 2024 14:24:43 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ybutm73ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:24:43 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SEOdh550201068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:24:42 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9791E58070;
	Tue, 28 May 2024 14:24:39 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2167358063;
	Tue, 28 May 2024 14:24:39 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:24:39 +0000 (GMT)
Message-ID: <e7ea186a-bf46-4cce-9d95-a4a242334ab6@linux.ibm.com>
Date: Tue, 28 May 2024 09:24:38 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/20] dt-bindings: arm: aspeed: add IBM P11 BMC boards
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
        broonie@kernel.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-13-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-13-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l8b8ITKhaVlT3OoXXVF8kYqEiDx3IvRy
X-Proofpoint-GUID: l8b8ITKhaVlT3OoXXVF8kYqEiDx3IvRy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405280108

Hi Eddie

On 5/22/24 14:25, Eddie James wrote:
> Document two new AST2600 BMC boards for IBM P11 systems.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 95113df178cc5..e386d0ebfb14a 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -86,7 +86,9 @@ properties:
>                 - facebook,harma-bmc
>                 - facebook,minerva-cmc
>                 - facebook,yosemite4-bmc
> +              - ibm,blueridge-bmc
>                 - ibm,everest-bmc
> +              - ibm,fuji-bmc
>                 - ibm,rainier-bmc
>                 - ibm,system1-bmc
>                 - ibm,tacoma-bmc

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>


