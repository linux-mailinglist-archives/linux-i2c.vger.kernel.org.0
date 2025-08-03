Return-Path: <linux-i2c+bounces-12122-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A1AB1935F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 12:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E80D176608
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 10:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB722594BE;
	Sun,  3 Aug 2025 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="jsrJCngE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50901F4C98;
	Sun,  3 Aug 2025 10:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.156.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754216130; cv=none; b=X+pPJEvUg7EfQw2XOxDghiOS2JDHbjzOFP7ggB9OlegnvqCUJiw+E+/hCX7omkAH8VhZPh9mkeCC57VjoUj8stHPwrmbtoYXnrhy/g0TI9YairDP7zBG9xVLWdpiYpw7vux51XYFALHC4h/IbeRNZx188MswUSKYxHdxJwf9DCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754216130; c=relaxed/simple;
	bh=u0gYgcurvJvuxCJdL2kmVx6HaLs82eVJcckSFSd1/04=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hq5WdvMpmkOoLAiVFFPAex2YBAXdoB0opDlq+Pdp1dG3OEbq2rqrJdQ5Bk/LLsyxlLfNvSFWr7ZuW9oN5HS9H7NxqXx+LJ0gldEgEo6QuR+KplLKwBWZ7YBfGcl+703UFczv9QmlGSPRJuA4eD7s6RS7BV8V6kZcpSjxVHcs1Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=jsrJCngE; arc=none smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739tnqr013472;
	Sun, 3 Aug 2025 03:15:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=KeLvK3uXQSBaJ/tZzR4sYTJ
	YOmobQG0DA8wd5Lt3Rg4=; b=jsrJCngEivJJO+8s25ux4aXkiqh/yz0h/zrIrE2
	hSESF9HOB3bvPL5csaxi2hU6FTrNwSOw9Tyz56mVd6h8Xe+fTk2D6EXNmagGQ9Zt
	46wF5Gl0TyHBKyvV+laqYGsecyIWH+2+ma1Tuih3JUDVNy4lmE1BmfzfGYsSQ05q
	JrF8XVRT1QPmjmFi+izVjp9uJpEysfhU7/yNOo8lgKeErWgAvv4zcR96PCn4AwgZ
	pI6m3TGbXwRmSa+SfAZQsasR/2B8XTIgiZ8HyB7YgJW77l2ivJpZqodTJd1XGeVw
	D9DzuceceRCzFhUzyP62xmJimCRdWWfQhof3gJ9kCJ6BlEw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 489j6kscv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 03:15:11 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 3 Aug 2025 03:15:12 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 3 Aug 2025 03:15:12 -0700
Received: from c1illp-saixps-016.eng.marvell.com (c1illp-saixps-016.eng.marvell.com [10.205.40.247])
	by maili.marvell.com (Postfix) with ESMTP id B631B3F70A5;
	Sun,  3 Aug 2025 03:15:08 -0700 (PDT)
From: <enachman@marvell.com>
To: <gregory.clement@bootlin.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <enachman@marvell.com>
Subject: [PATCH v2 0/1] i2c: mv64xxx: prevent illegal pointer access
Date: Sun, 3 Aug 2025 13:15:06 +0300
Message-ID: <20250803101507.659984-1-enachman@marvell.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: X1APkbDE_JAsnZ7b8zx1USf7go5zOMeD
X-Proofpoint-ORIG-GUID: X1APkbDE_JAsnZ7b8zx1USf7go5zOMeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MCBTYWx0ZWRfX5lkW3+1GSdEr 3efexEmaXqtsVhkNIGZnbu49LZCKQGesCYu61cMffCuMkAT8d3/RNVXiUay3w+hnT7eenpKjoc/ H/70du66BuxKIYj9cThp/JIbIBSt4LC/lYYubu+g7+hYEs4qonU/POJNsp3NAUgQejZSgir7SSH
 YvimZxE4svlt7ns2ezlaMpvhDaYAAADBaTktKzEicIXLvriBwDn9a9wLeGGZBJnZ3KRoAov/SJP vdgF5BmuWxb5K+EvfsgJ6ytmMEj8KTMYILKoKVXsNacNNfodUcSjr3Hu9FqzUVMtvFihOP3yBjj 80JkHaJv74v7118H50WSeQ8FAuKp21Lo2Gc1tKaUFhtX72WR6EUpsO8Q6q/IIeam6AgwFdn+FRr
 ncKKbO6zmnTwrSLIoutLKW33CKsduJax8CjVXHTQamyrc7HRbgkYfCIuzfimusWwkmOZqtUr
X-Authority-Analysis: v=2.4 cv=D4tHKuRj c=1 sm=1 tr=0 ts=688f36af cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=2OwXVqhp2XgA:10 a=M5GUcnROAAAA:8 a=-R8kdXyaJbF8QKB8q54A:9 a=oYmgUABA0lAA:10 a=zZCYzV9kfG8A:10
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01

From: Elad Nachman <enachman@marvell.com>

v2:
  1) rewrap commit message

Elad Nachman (1):
  i2c: mv64xxx: prevent illegal pointer access

 drivers/i2c/busses/i2c-mv64xxx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1


