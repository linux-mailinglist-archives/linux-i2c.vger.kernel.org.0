Return-Path: <linux-i2c+bounces-3665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56A8CDC1B
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD294286E40
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A20D127E25;
	Thu, 23 May 2024 21:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="cKTRDqmo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CF9127E29;
	Thu, 23 May 2024 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716499807; cv=none; b=VPA43IzF4Vz/fYRUnii1/98qlOqzZe428ZS8P21gXebpuKscprxfa9N3qTIY5EYBtViuUalHmAU2A9UU2SdVOmgiEKX1cwz6TADCG1VOxno09AMJFA9Nm1gkQwC1Mzv1cCenv0SV5xTjzkcenCLJJzw/sV/7ouQYGjujymR4+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716499807; c=relaxed/simple;
	bh=6DS3VPbtZ6K+MswhTHFpSZiWdd0ezBo62nEDDcuZzRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VvtF5236G05u6EBFPddQkUfiNAsQV5i+OlmCKRHSHedD6lxWt/+u4ET0pOn+xJd7EaOrihZsW6Ql3rO7Y4jVioyG9jDKDYArRCum0tZGUNbzL9t7sMfdoFu8sciQoMMLUX5yweJhdsxEAZerPVIrrjxrb6o/OGKz4hngiqibGDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=cKTRDqmo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NKuiFE016493;
	Thu, 23 May 2024 21:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6DS3VPbtZ6K+MswhTHFpSZiWdd0ezBo62nEDDcuZzRc=;
 b=cKTRDqmoCkYseLpUyD0p42Z5BaC8227SdVNpC+vHMMJXLj5SGXZqRpZ+tAEPerK/KOyo
 Eym2O5NFT7MxQpU0mApxg7US4T3mdolXafu2bOLQudZZCcUA80yy+k4OpkYzt2BwdszV
 6wir/H6qnEyBc79Tz1hNQBQIsRcj0KGI3H96HGZ7A2NlpIk/p8WEOsGomGJ1gySlfK1i
 cEosdZ7cz/gv+wUNSCZSz9aVKy1RIYkZ6zApkL4qf68oQK7tExoNHcJLyrxJBKu/UXuT
 tr8u5k8XKJOidyQj3pMpyOZEKi1nJkGWxW6Ria1o5GBzwSa68MNU9GEmaxWTCFt05IF5 3Q== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yac0089su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:29:48 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NKuDZU026470;
	Thu, 23 May 2024 21:29:47 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y785mvd46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:29:47 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NLTinE20775564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 21:29:46 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F26F58063;
	Thu, 23 May 2024 21:29:44 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D81AD5803F;
	Thu, 23 May 2024 21:29:43 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 21:29:43 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com
Cc: andi.shyti@kernel.org, andrew@codeconstruct.com.au, broonie@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
        krzk+dt@kernel.org, lakshmiy@us.ibm.com, linux-aspeed@lists.ozlabs.org,
        linux-fsi@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        ninad@linux.ibm.com, robh@kernel.org
Subject: Re: [PATCH v6 20/20] fsi: scom: Update compatible string to match documentation
Date: Thu, 23 May 2024 16:29:40 -0500
Message-Id: <20240523212940.4078787-1-ninad@linux.ibm.com>
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
X-Proofpoint-GUID: VHFoqfan6yYRiNI6-oq_NUv_eYDJg2Sw
X-Proofpoint-ORIG-GUID: VHFoqfan6yYRiNI6-oq_NUv_eYDJg2Sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_12,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=617
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230149

Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

