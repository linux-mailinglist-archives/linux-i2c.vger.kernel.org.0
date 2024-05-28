Return-Path: <linux-i2c+bounces-3689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1660C8D1F50
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 16:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C57B21485
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 14:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C14116FF49;
	Tue, 28 May 2024 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qkbRdsUd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501811E886;
	Tue, 28 May 2024 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716907984; cv=none; b=cXynhF5gA7EeWL/EpokYyM82mz3PniIFNXkcK73kVnBJsDLX2dgzou4mcRASe7lwBETpPoDrsqD/hx4I3UOPWaW6B8+GZWAFzPhh6hxNd17lhWJ+wrQfBNy/3Hfm//98+qDZNCT9T6rU6j8l/PfUb230OwZ1pUhT9e1NKdmc1Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716907984; c=relaxed/simple;
	bh=ibWri2e7aV7kKGd9z7TStSKeci5H+utCiZFOLKXx/5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KeRVtCtKRXoXzZTl9uLWYHKv9ZalId+558/9Pd9HPKgaWDDtTGiuO3N5OTcGjBMpimw+mf89CO2K+YsgjUELiwe1wUUyNmRdYebSOm70jpM1BxjM+GIwovtH8t62F/uv4OCu3BjjUbm140lw5By0mw0ydPI80sGHUIfjkSsG/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qkbRdsUd; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SElbMB007284;
	Tue, 28 May 2024 14:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=o9+3kDnLrc7JCHXQXr78xCMvmabUv1s7h/3uhWF4yLU=;
 b=qkbRdsUddMAa3elm0uRvSrmhThOOe/TgtcWUeiX/G1fFSFKKJraO0oH8NoppboJ6n5+R
 Iu+OKAyRxCJ6sXuoqJI+rUTzNh/ddyEqM7VG1cfaC2O8aKrqs13nNlXOLC8DM8jn5H0d
 SON+g8fz8fs6wL/OwoqPQgyck1zbwYP/MKiKZ2n5/1RWBzLN6cL4kVKAQuYEDJOoilKF
 JmRZ0Cmsr7DBZkKd34DmhW6U0uuKDsxQy1AGixoeAIxLN0Ok1RAp4cf3469JYCXXa0zP
 9pkwRwoVbEj98rMtxF/P/BQBsbm2smeXnUQ36OZMqtvThn2+ADGtdmm6kIYJBlZZxoEX jQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydhb680b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:52:15 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SDY1pc032276;
	Tue, 28 May 2024 14:52:14 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ybutm77k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:52:14 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SEqBhL7995710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:52:13 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E97745806A;
	Tue, 28 May 2024 14:52:10 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FD4058064;
	Tue, 28 May 2024 14:52:10 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:52:10 +0000 (GMT)
Message-ID: <3c7fd737-c410-40a3-9994-282f214bad61@linux.ibm.com>
Date: Tue, 28 May 2024 09:52:10 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/20] dt-bindings: i2c: i2c-fsi: Convert to
 json-schema
To: Eddie James <eajames@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
        broonie@kernel.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-12-eajames@linux.ibm.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20240522192524.3286237-12-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jRes7fg_2wU65S26qKhIKfzoEE91q9nR
X-Proofpoint-ORIG-GUID: jRes7fg_2wU65S26qKhIKfzoEE91q9nR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405280112

Hi Eddie,

On 5/22/24 14:25, Eddie James wrote:
> Convert to json-schema for the FSI-attached I2C controller.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v5:
>   - Use more specific regex for node names
>
>   .../devicetree/bindings/i2c/i2c-fsi.txt       | 40 ----------
>   .../devicetree/bindings/i2c/ibm,i2c-fsi.yaml  | 76 +++++++++++++++++++
>   MAINTAINERS                                   |  2 +-
>   3 files changed, 77 insertions(+), 41 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-fsi.txt
>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,i2c-fsi.yaml


Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

Thanks & Regards,
Ninad


