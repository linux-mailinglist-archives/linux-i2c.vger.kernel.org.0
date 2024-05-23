Return-Path: <linux-i2c+bounces-3668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68C8CDC35
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 23:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615E21C23D00
	for <lists+linux-i2c@lfdr.de>; Thu, 23 May 2024 21:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAD2127E17;
	Thu, 23 May 2024 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BFvoybf8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01B107A8;
	Thu, 23 May 2024 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716500323; cv=none; b=oTj0ERdkZisu+XgjB7P5n07Gbkl6ehlTe+vqzm4PpIf2ztJqA+tHKcMqoDI1PLKraU1h2kOg3NsNe1REQ3mNw7OdFnTZ2GcZC+bEj6flrYkcvMVla29GyzbTRa4z94a12pQ5IJ6JnbNc/PqvK4R9Hfz9CRGXENY3KnxwpBvq2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716500323; c=relaxed/simple;
	bh=MzjdYaN2JntmHSsF6OaPiegFLXOuLtU5g2XL+USSFNw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CYuDIcEfK4CCmxsF0vZOrLgP+L1bq/sfbH0IsofQRJL1NyTukcdmk/NosGuOKcQ2MgoMQlBrMTkhOYVr81s/V7FdW7k/IuOfCAAi0Q3DhdJhTRAiG+5yaCPAwvISe+qLDhRECV1SSaGyK2tRY1Xhwk6dPmVXj7fslmKIfaNzOwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BFvoybf8; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NLLdm9022518;
	Thu, 23 May 2024 21:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MzjdYaN2JntmHSsF6OaPiegFLXOuLtU5g2XL+USSFNw=;
 b=BFvoybf8wfTeXlHCnjGE107/7sZ9A/ht/bz3JGjtk+NeOFZFhB6jxaIY/nWlejh20Xfd
 3CMm/utpLnm31Dz/es0EAM88xFnetV0JWZqTrkPKx1WxrFzXvNEuIbXYrKVieC7SA2Wx
 GiIYw8M9/JDYvIUndCSwVJturoLM/JQwFZ+EOuuEUF+nWWtC8PSXEtfbW+OgStJVlv0g
 qndoneUNGbSpP2x+RWY+xR9FLPXg4aTJGM2E3DoACcQBioeQn6DMw/E/zSko1xuHx3i6
 xsflqdlUKVmhTH6RlXpbiTdI52+gCVrExlbr+MfsXbpCCMnTz9M9Z/0lyeNxvU2FtGAu UA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yac008am0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:38:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NJg9X1022076;
	Thu, 23 May 2024 21:38:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y76nu4smw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:38:28 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NLcPnP14221682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 21:38:27 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDB8B58063;
	Thu, 23 May 2024 21:38:25 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45B4B58061;
	Thu, 23 May 2024 21:38:25 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 May 2024 21:38:25 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com
Cc: andi.shyti@kernel.org, andrew@codeconstruct.com.au, broonie@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au,
        krzk+dt@kernel.org, lakshmiy@us.ibm.com, linux-aspeed@lists.ozlabs.org,
        linux-fsi@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        ninad@linux.ibm.com, robh@kernel.org
Subject: Re: [PATCH v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
Date: Thu, 23 May 2024 16:38:23 -0500
Message-Id: <20240523213823.4087616-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522192524.3286237-18-eajames@linux.ibm.com>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5TnQW-IQyc_P4_QpL-XYlClB69g77Lg_
X-Proofpoint-ORIG-GUID: 5TnQW-IQyc_P4_QpL-XYlClB69g77Lg_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_13,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 mlxlogscore=605
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230149


Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>

