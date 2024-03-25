Return-Path: <linux-i2c+bounces-2573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7688A156
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 14:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC7932C1751
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 13:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C1516E88D;
	Mon, 25 Mar 2024 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b="a5fTqiDr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C83D0104;
	Mon, 25 Mar 2024 03:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.148.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711337966; cv=none; b=ek6OAC1HdhGSw2dfRBN101Q3+B2HeXAubFfmKGgET9VwphPukDJNwabIvb7nDGOCy1lxJ9tF3ijOkU14YhJRervC33ffC63P8l5IbUCcfGiGbSVw58lL/NUNJevp8TIdauLJ2umAOARBIuPcsJqeft7laLtP1R/0nObbIgjpd5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711337966; c=relaxed/simple;
	bh=sGIaBtqVxcSLEcbO/RNerhsBc2VftFecwlYKnFirhZo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlrWkBRiQv659ZB0qOhrQ+6Mjcmrfbllnwcmn1Cx5Q2tu9kz1Vwsj8YzoH0RqI30MZLpCQnOQnZh2pajgBKMWNnCb+iV59CvvxO3vMD4+agtETr3+KsiRNnzvKhcCn1GF9kvs00jhj1uy/EeKF2boAtf1qUQbxGyFL5G4cr3gtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (2048-bit key) header.d=marvell.com header.i=@marvell.com header.b=a5fTqiDr; arc=none smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42OMRRkr029557;
	Sun, 24 Mar 2024 20:39:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=pfpt0220; bh=dLzwhtfNCY+WZdFgx7FUWY
	HfsiEqYHSRJavE1/2Ss+M=; b=a5fTqiDrpA0T1ZmjU2PMOmBJB2FcHW7C0Tjo+V
	8dDQaoocLvjlafShe1irRqA5oyXhmjs+aTV0qYJJ2sp7IivaJac4kU4zePReXHDO
	+q9iN/9rSjzGo4kGZ8l8qOmg93lnXrO40VfYIGeB1UxqeZ9iBRasOUbHPxJlLaLf
	txKEWYPO37rMU1eu7D+ia6R3znvtFWXaANr5XuYP1mc/Pv2DrH1XZ1fBRdyj/9eD
	oOwqtYXg+y1Jv1YuW/n/t/ECHXFuaEwSo+bB3y2BaxtWiG3jyjt/TjCHcmF2lVDG
	eRVXr2O2JSfGBRGP7N1MQoq81sm34csHF5w5JqTrWI88MHbA==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3x1vekpkuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 Mar 2024 20:39:09 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 24 Mar 2024 20:39:09 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 24 Mar 2024 20:39:09 -0700
Received: from IPBU-BLR-SERVER1 (IPBU-BLR-SERVER1.marvell.com [10.28.8.41])
	by maili.marvell.com (Postfix) with SMTP id 409353F709D;
	Sun, 24 Mar 2024 20:39:07 -0700 (PDT)
Date: Mon, 25 Mar 2024 09:09:06 +0530
From: George Cherian <george.cherian@marvell.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: <linux-i2c@vger.kernel.org>, George Cherian <gcherian@marvell.com>,
        "Andi
 Shyti" <andi.shyti@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 62/64] i2c: xlp9xx: reword according to newest
 specification
Message-ID: <20240325033906.GA987833@IPBU-BLR-SERVER1>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-63-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-63-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: laSvIC-wDHN7I7_Z6uaFHRIXYG_fl0DB
X-Proofpoint-GUID: laSvIC-wDHN7I7_Z6uaFHRIXYG_fl0DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-24_18,2024-03-21_02,2023-05-22_02

On 2024-03-22 at 18:55:55, Wolfram Sang (wsa+renesas@sang-engineering.com) wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: George Cherian <george.cherian@marvell.com>

