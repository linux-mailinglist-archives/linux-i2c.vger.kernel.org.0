Return-Path: <linux-i2c+bounces-3666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F68CDC22
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93AC61C225A0
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B48127E06;
	Thu, 23 May 2024 21:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="XN4FpWtJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F928839FF;
	Thu, 23 May 2024 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716499937; cv=none; b=Ks025PZnlJvb9DhDwF1FdsixEEjjy1MEOB7ut776p2aEy5z14k2uvnDTMYFUA4D1/eEuBULmk6RAEmXvNCoMyEdncl+9DdcFvmEFcElMUIbGWx0olvVPgp23m5DF+bbmtzpROe5hHRnkwh7qHbpG7q5Uq8V24Dbf58TFmUUqLp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716499937; c=relaxed/simple;
	bh=6DS3VPbtZ6K+MswhTHFpSZiWdd0ezBo62nEDDcuZzRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VD/uesMHaBctk0G6Gp9zBDeZgT1+pGUSqUPIr5ha++6DuRpXkLBXad6Bzm2+6t0TOpz/CcjNvJ/Zkdh5zTqjkwDyR4yvdbh8GxvlborcX6LVB/zwvfMfvA6qxXZ5ucDNF7NEPvfdpP2bGEnQVu1rK1tTZ6UoQ545il2jqxWsQqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=XN4FpWtJ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NLW31Q029683;
	Thu, 23 May 2024 21:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6DS3VPbtZ6K+MswhTHFpSZiWdd0ezBo62nEDDcuZzRc=;
 b=XN4FpWtJqadjMSsctrwFUrQ89cMBoa8QkElnTVc7iC2E1MQhM6j6jAYjWPP4HLgoa6DS
 3ZoF+uRzqBxozXZl/34bmRmxSfnOCAlrG1hw235paKi3FqVzto9H2LnX/jCnn0O5RC7h
 MtSWFzOudN4czMiUKWYY4OjEWTmHCNm0MHGcvFAbiqsqtqHE0xKQ+0tLesXuE83mPKTo
 VZRuQaFywi8Wi4okvFHpMz33KgM2KRKKh+c0N1iVyVuy7eS/NUPc7TLDguizE0mHBjOX
 8nCxo3rz/INX3wdkTIeKm5Q1DKhKWKx4cJiK8msavhpnkuoJZr5sHaAvo/8lLdv0WRui Ww== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yadt08007-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:32:04 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NK14LV000898;
	Thu, 23 May 2024 21:32:03 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y7720mpu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:32:03 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NLVxt314090982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 21:32:02 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C638B58061;
	Thu, 23 May 2024 21:31:59 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88E315803F;
	Thu, 23 May 2024 21:31:59 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 21:31:59 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com
Cc: andi.shyti@kernel.org, andrew@codeconstruct.com.au, broonie@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
        krzk+dt@kernel.org, lakshmiy@us.ibm.com, linux-aspeed@lists.ozlabs.org,
        linux-fsi@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        ninad@linux.ibm.com, robh@kernel.org
Subject: Re: [PATCH v6 19/20] fsi: occ: Find next available child rather than node name match
Date: Thu, 23 May 2024 16:31:57 -0500
Message-Id: <20240523213157.4083494-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522192524.3286237-21-eajames@linux.ibm.com>
References: <20240522192524.3286237-21-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Fw4YdbsuLVbiQYCpqSt1_zlWI-EvdEr
X-Proofpoint-GUID: 9Fw4YdbsuLVbiQYCpqSt1_zlWI-EvdEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_12,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=598 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230149

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

