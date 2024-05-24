Return-Path: <linux-i2c+bounces-3674-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28758CEC65
	for <lists+linux-i2c@lfdr.de>; Sat, 25 May 2024 00:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3D952825DA
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 22:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9F885C4E;
	Fri, 24 May 2024 22:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P8f73AVw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B41DFFC;
	Fri, 24 May 2024 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716589668; cv=none; b=b+5gbZGT3OIxnvc5yTcF4ZNWNnoXk6UDHITOIiocCCjNqJrI7zRVwS+I62NX1hewWrqgeTg007pPXnTKESxvYOpRZWr4L8VWO/BceYmYPtETTHayeZCLbUj2EhZpyRI07cQyegpOecrDIsOjq3yMWn/pXgBgdmITNqY2ZGdDIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716589668; c=relaxed/simple;
	bh=iXH9XdZj6ElZjG8H8PzcGVxUnfrO4WKMqmUf3o3c0g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgIjjHVXKn96PLvmc6eBFoQp1E6vE4V7FC0U6yIzcFHi+WcQm5O1My/RG31JATgnwHUgYH+B3e3Pky0vQPW9OY1Pzhl4MgdHtyOmlMgr+P1T8egUlkIboaPusHSVhKQulEzdPYXqDi6TxD4gRVcGoAgNUN+IOnXAvWQJvYxhisc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P8f73AVw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44OMMQtW013623;
	Fri, 24 May 2024 22:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mABNMy86l8KP+yPjxHU9m+yjpNAlq2nHkJ+scDyy1GM=;
 b=P8f73AVw1LmH0i02WkI9DVxVeuNX7Lx8wjYDfzcDFmFvALpnPGURyB1StQJE/VbHHF+J
 sWCQ3lko8kv1dkSrslLKJns4kFTHNCPvWwl0jruCRVNNca7mFhh1a/2Tx18uR8hscDrR
 syFww0t1FzXvRCbo4dM5HKEEQmFDbJyhK0zYCY68hcDm7KnSJnDfHDCGmFnf+ngUQuCq
 mg1Geon2KPqnJQGK8mR+gqmPfOf5VRMAylRRswFswGRd2zlGCz+L/j3S/6mzSBpA3qdr
 Z342gwyivv5rfoc1mlKu7ftY3z8GBeFOavtzAdMbxR70jowLFCP5/MRAzCjTfaga/rHh cQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yb3me00cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 22:27:31 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44OJEqYG026457;
	Fri, 24 May 2024 22:27:30 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785n38f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 22:27:30 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44OMRRLv49808028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 May 2024 22:27:29 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E920B5805C;
	Fri, 24 May 2024 22:27:26 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66E815805A;
	Fri, 24 May 2024 22:27:25 +0000 (GMT)
Received: from [9.61.107.154] (unknown [9.61.107.154])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 May 2024 22:27:25 +0000 (GMT)
Message-ID: <56d16579-137f-4473-a9f1-44f7d030c166@linux.ibm.com>
Date: Fri, 24 May 2024 17:27:24 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/20] ARM: dts: aspeed: Add IBM P11 Blueridge 4U BMC
 system
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
        broonie@kernel.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-16-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-16-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CEKzfqnM2HtdiKClRyl_p3omOimFr-Zu
X-Proofpoint-ORIG-GUID: CEKzfqnM2HtdiKClRyl_p3omOimFr-Zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_08,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=736 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405240162

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

On 5/22/24 14:25, Eddie James wrote:
> The 4U Blueridge is identical to the Blueridge system but has two extra
> power supplies.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>   .../aspeed/aspeed-bmc-ibm-blueridge-4u.dts    | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts

