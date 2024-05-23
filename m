Return-Path: <linux-i2c+bounces-3667-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC88CDC2F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4EDBB22125
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66929127E17;
	Thu, 23 May 2024 21:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="KgMkoNXu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C707101E2;
	Thu, 23 May 2024 21:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500199; cv=none; b=RZOWNnsJiLumHk685d/oPzoDCf3VNl5k0pmivfSP/PDpinMl2mI8N90R2fkW8NPy0jNOdGRAevN9D3HQH6U1+M+XCaXgaiNmBh0WtrNarKsMhlRnnE7jvU3ndacdATuLkFHF1vvM2JwpWYOI/AOwZQ1aZg+4DGVEjxn6+CfTGS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500199; c=relaxed/simple;
	bh=MzjdYaN2JntmHSsF6OaPiegFLXOuLtU5g2XL+USSFNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RICSh/UUZSW8Lm4XDLKGe9om6yJ2vrSzJumnTIKB6mTZoFPAdcqKuZ3GI93gu0LhD2KbhT6ywGtXTcPPpoVEBoduyh8qMQdZJTuAyWzZv54A7+4jzi7U6OHq//adaJwzQnzA65HVrSm9PxDkSnI36tBvT6lqQnJMWTq06Ht++qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KgMkoNXu; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NLBrob014427;
	Thu, 23 May 2024 21:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MzjdYaN2JntmHSsF6OaPiegFLXOuLtU5g2XL+USSFNw=;
 b=KgMkoNXu8wRukJKwy1zBtg5ZTqc48luT8j3fK47WMYTSo2sQ0cjGAeWtYX/AXNe07o71
 yEA2T3AVFhbA+C2eokZZszdiIZ4PQh/7OgG/Qu0iRuaYdyjj1F47mT9y/k0dM3IRPJdA
 n7x24NB/3EpXZ8+N0/sMEpsUdlraSCWqvgxaamokWPtF1mH1vP2TJVbzz1BIfTZ9oDNQ
 A/1llASAykTS4+L5W2VRQcnFMhuBk7M1xLCVbf9fnUbw/JVPBJC86UwGo/vi+dJLX1Oz
 YALsJF9PFjgZtojonuXVlkEq3O+zGfTMSibQunxnd8D27wH0OL0iwc7znedVtAmfO5VS ew== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yadg3g2ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:36:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NL2PWi026453;
	Thu, 23 May 2024 21:36:22 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785mve3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:36:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NLaJ3L1770164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 21:36:21 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77CD558060;
	Thu, 23 May 2024 21:36:19 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 218995803F;
	Thu, 23 May 2024 21:36:19 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 21:36:19 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com
Cc: andi.shyti@kernel.org, andrew@codeconstruct.com.au, broonie@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
        krzk+dt@kernel.org, lakshmiy@us.ibm.com, linux-aspeed@lists.ozlabs.org,
        linux-fsi@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        ninad@linux.ibm.com, robh@kernel.org
Subject: Re: [PATCH v6 18/20] fsi: occ: Get device number from FSI minor number API
Date: Thu, 23 May 2024 16:36:16 -0500
Message-Id: <20240523213616.4087472-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522192524.3286237-19-eajames@linux.ibm.com>
References: <20240522192524.3286237-19-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -Ani03N30rzIGwfav1bvLDAEuIBHop0Z
X-Proofpoint-ORIG-GUID: -Ani03N30rzIGwfav1bvLDAEuIBHop0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_12,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=658
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230149


Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

