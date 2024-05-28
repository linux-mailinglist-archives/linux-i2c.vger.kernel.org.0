Return-Path: <linux-i2c+bounces-3687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B771B8D1F38
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 16:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5086DB234A0
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 14:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA36F171063;
	Tue, 28 May 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="akYo21qx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107616FF58;
	Tue, 28 May 2024 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716907654; cv=none; b=JvV7vBHb4+HwMIdeV8gEt/3YVyYWd5ge/Od5gGNge5QYfkOq20e9FGfODZR0SKdMew9LQzvHEw91aolzj57YG5cOTfmnmFSsEHJIylVYwoTPKukQo8F5F9EJB8QGO4gx72IK0jVRDeFNdZ3qcB+/kRMaeVqSs9mx4NWN1i/8D28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716907654; c=relaxed/simple;
	bh=1hUVOnE6FdNvQ9UmuEpKFIpJIn+C0KyL7AQWfhEh1/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vbpggkaf03YRXOJODsaFCAg1y1tR7aH22YAeF2x8PloxVc4yUdyB/+7yRH2PU3yb2SKQ0MCWNJvlbHEkujKTBlzLAmKFOTLACG5h/eBzsl07h4RsZ4WJOlawifXKfkbT2VlfefINhcglU3yup44GlAzuyccPaLXrN1REF52sq9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=akYo21qx; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44SElIR0006175;
	Tue, 28 May 2024 14:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=YoX6MGL9GkOP9j60jFJarnWsdE9khgTiZnqJ48HidSY=;
 b=akYo21qx+QyPFixPK9gTPha/fMglWd7oAS21hvfBOHaIWR3vdIJSba/zAEOnvdwn/2ht
 dy6ehpINKOLvIJtGnMRo2pFdYmNlyBi3mFZkvHotPvbNdrmhV+/cwSSqvgfMvRhDMhFg
 F2G6qriOi9ehVzPt/JNsocS5WjwjEEzoiw1S9zN6EzukEl0UhDbYtdaWbSGZwdXOGSlj
 vCHBjfI4XBHMlKnQcJcxqtai14qm0ckB1Yug90/gWiwXQhUkVk0B2uE5ORwAG/adHfO0
 SNaIN3TzxdEZhPao14rUYMJyOa1O/I+e/xjmCu3RfSOT+kYd4k6rCHo54fPHXx5WANo8 tQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ydhb6800f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:47:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44SERo2E027098;
	Tue, 28 May 2024 14:47:19 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ybvhkq1eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:47:19 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44SElGNT21955090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 May 2024 14:47:18 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22AC05805A;
	Tue, 28 May 2024 14:47:16 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DCA658064;
	Tue, 28 May 2024 14:47:15 +0000 (GMT)
Received: from [9.61.45.62] (unknown [9.61.45.62])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 May 2024 14:47:15 +0000 (GMT)
Message-ID: <1966e65d-4cde-4a91-99b3-126d1b5d3d84@linux.ibm.com>
Date: Tue, 28 May 2024 09:47:15 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/20] ARM: dts: aspeed: Add IBM P11 Fuji BMC system
To: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        lakshmiy@us.ibm.com, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        andrew@codeconstruct.com.au, joel@jms.id.au, robh@kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, andi.shyti@kernel.org,
        broonie@kernel.org
References: <20240522192524.3286237-1-eajames@linux.ibm.com>
 <20240522192524.3286237-17-eajames@linux.ibm.com>
 <3ac517f0-0394-4310-8840-d806de5ec082@linux.ibm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <3ac517f0-0394-4310-8840-d806de5ec082@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ewznzRPmnToI7745RkNHUUvXi9FSb8Ii
X-Proofpoint-ORIG-GUID: ewznzRPmnToI7745RkNHUUvXi9FSb8Ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405280111


On 5/28/24 09:08, Ninad Palsule wrote:
>
> Hi Eddie,
>
>> +
>> +		led@6 {
>> +			reg = <6>;
>> +			default-state = "keep";
>> +			label = "opencapi-connector5";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
> is led@7 not connected?


Correct.


>> +
>> +		led@8 {
>> +			reg = <8>;
>> +			default-state = "keep";
>> +			label = "vrm4";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +
>> +		led@9 {
>> +			reg = <9>;
>> +			default-state = "keep";
>> +			label = "vrm5";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +
>> +		led@10 {
>> +			reg = <10>;
>> +			default-state = "keep";
>> +			label = "vrm6";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +
>> +		led@11 {
>> +			reg = <11>;
>> +			default-state = "keep";
>> +			label = "vrm7";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
>> +
>> +		led@12 {
>> +			reg = <12>;
>> +			default-state = "keep";
>> +			label = "vrm12";
>> +			retain-state-shutdown;
>> +			type = <PCA955X_TYPE_LED>;
>> +		};
> curious about label jump from vrm7 to vrm12.


vrm0-3 and 8-11 are on the previous pca chip. I believe this is correct 
based on the wiring in the spec, though the numberings are really just 
convention established by the guy who managed the LEDs on the system.


>> +			cfam4_i2c10: i2c-bus@a {
>> +				reg = <10>;	/* OP3A */
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> It will be more readable to have "reg" value in hex too. I have seen similar stuff in this FSI nodes. It will be consistent with other places.
>> +
>
> Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
>

Sure, thanks!

Eddie



