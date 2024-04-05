Return-Path: <linux-i2c+bounces-2775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B13ED899A61
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 12:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2F841C20FC2
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 10:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D04161913;
	Fri,  5 Apr 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="q0LAEyuc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CD6161339;
	Fri,  5 Apr 2024 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311826; cv=none; b=bo9EzkkDkzvavMruOxAmPBfVfSuJ4PJHbjTyn8BrNcj8DRzMRpTZUMbhEbtKtAEB5nNszZ6r/tUNWa96yjLrRQpgxfl+ZI/53SrQAfjHqp0Ryio2CpcFLwujSryZAJQN0DSO7jQuFMkXQXiMcm6wIj2kcFOL7tny9jmLbQtXFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311826; c=relaxed/simple;
	bh=71yKhmZuNdU9lyq418HQ7sPSXvHmC1CePNkf4gV9Jo8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aeP3N2hE3zNntC1uai/3qRKN+Ntn8i0OZ4QKl5dKmHUU6rfH4jThp9lagFNvxjzgtHoYRV/5iQHfLX+YnH9sa5Zh63DNrHR21plrXVfZd80NXcDzepgfxTyyNEgPxd4lZcizota+Mr1gCfxIgxcglU0Da0msdr7QvoyarZo5oLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=q0LAEyuc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4359Turj031940;
	Fri, 5 Apr 2024 10:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=id5sUKVtQKYVZP/8b/VbvPIT4asGnWWxKnMW734qOQI=;
 b=q0LAEyuceBCmz94gjvUfY3hI27PifrHEcuWLHEv7jztKXleX5C2KWDyzfGcbodrxhso2
 AqHSxTfx0RCGiS/AhaX63AejLqmJbltwYJklXh8WRYXApHBsNvJF0VajMWa+p7FzyG6K
 IUkgGstC5cCrkzu1qsyR7JaH6QJ8D5soqNQ5W31tjFKMeTTYakz3hnXMhOb2021pHI9M
 oocb7C9NxL/mbeCr8Bl2weJwpe4lxkwdgb+4mkB9yxA8hL+4KUzmoHpYBu1zpRb8R2Vc
 JqrVp+x8JqYgKIAzowbZAfpoLF58tb0yBrgO7CS65obE9Q6IJrUsTQcxSEqx9LMBPJvu 6A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xadxrg6kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 10:10:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4359iih4022281;
	Fri, 5 Apr 2024 10:10:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x9eq0ht6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 10:10:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435AAAnU36438506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 10:10:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52CAC20076;
	Fri,  5 Apr 2024 10:10:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FC1520070;
	Fri,  5 Apr 2024 10:10:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 10:10:10 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v2 0/1] i2c: Handle HAS_IOPORT dependencies
Date: Fri,  5 Apr 2024 12:10:08 +0200
Message-Id: <20240405101009.2807447-1-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 86RKLJwQsLKET8wTrp6xgdEjNq7Uh7oS
X-Proofpoint-ORIG-GUID: 86RKLJwQsLKET8wTrp6xgdEjNq7Uh7oS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_09,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404050074

Hi,

This is a follow up in my ongoing effort of making inb()/outb() and
similar I/O port accessors compile-time optional. Previously I sent this
as a treewide series titled "treewide: Remove I/O port accessors for
HAS_IOPORT=n" with the latest being its 5th version[0]. With a significant
subset of patches merged I've changed over to per-subsystem series. These
series are stand alone and should be merged via the relevant tree such
that with all subsystems complete we can follow this up with the final
patch that will make the I/O port accessors compile-time optional.

The current state of the full series with changes to the remaining subsystems
and the aforementioned final patch can be found for your convenience on my
git.kernel.org tree in the has_ioport branch[1]. As for compile-time vs runtime
see Linus' reply to my first attempt[2].

Thanks,
Niklas

[0] https://lore.kernel.org/all/20230522105049.1467313-1-schnelle@linux.ibm.com/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/log/?h=has_ioport
[2] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/

Changes since v1:
- Removed HAS_IOPORT dependency for I2C_PARPORT as it could be used with MMIO
  based parallel port driver

Niklas Schnelle (1):
  i2c: add HAS_IOPORT dependencies

 drivers/i2c/busses/Kconfig | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

-- 
2.40.1


