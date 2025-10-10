Return-Path: <linux-i2c+bounces-13439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5F2BCBA92
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 06:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E38D188FF40
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 04:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFD423BCED;
	Fri, 10 Oct 2025 04:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jJlEjJTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D1E238D52
	for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760072169; cv=none; b=uRCY0uwvj4Mh7j4apVk/5DFKXTj5St2tetYY5U2XA6un5nqu2wBGdPshv47Xc0NBkZkTBXCOXgab18sUQ6A9XllhAZeBg6OV2VqjubQbp8WS3BJnlSnU6VyZuQ1hwoyUk2urD6XZmRrpZW+u3vywnYc+u2PqURhxVsZ+t6KHNM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760072169; c=relaxed/simple;
	bh=BXQBEg49WGrsvFjprcDLou8kFWrRywhvTMF300kqw/0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=cWFbUNxSDKuD8tvwEvdb394PtKX3irL465Fr8ZnHKZNI1CDAUmlK1eMFfJBz9yQgklxBa6nk+rBL0x5+4ppRq/rv2R0UCtiLj6ETBeMmSvRNOPIqGz7oT/IuT5mET2uhTlwvJEcd3KHXWOMgDUiVTFO5dOmSvk5MrtwpoEc5lgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jJlEjJTp; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20251010045604epoutp01972ba22cb7dafb28871b05dc4dcafc8b~tCE7XKwt73002330023epoutp01-
	for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 04:56:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20251010045604epoutp01972ba22cb7dafb28871b05dc4dcafc8b~tCE7XKwt73002330023epoutp01-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760072164;
	bh=b96lHOK7OOj9AgDqZ6liSCCMlFccuKNhL36Drok74AE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jJlEjJTp5sq57ROgGm3SWlApL12iSHqaj1ZbI6qq+WRcptfj+qZv/BkrqBRfmdWoj
	 WvTgmBaoyC+oOpFea+UpqRBUZ5dFLq/IIGN60LO9y/EgOfWwCdPm8xvpkbMXL622eu
	 CbOb58rmLk7VrljvIGzseAayWQYJ5d1NehI8HocM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251010045603epcas5p100e8b22da565c8ddedc855e3eee2a63d~tCE639vYj2303523035epcas5p1O;
	Fri, 10 Oct 2025 04:56:03 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cjZFZ2QhXz3hhTD; Fri, 10 Oct
	2025 04:56:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251010045601epcas5p29c5dc8d86df33b732d285b1ab7821bfd~tCE5MyevZ0899008990epcas5p2H;
	Fri, 10 Oct 2025 04:56:01 +0000 (GMT)
Received: from INBRO000519 (unknown [107.122.1.150]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251010045559epsmtip1ef22b9497c9caa63d35fb46e3b9ed6e6~tCE3gwKOS3107331073epsmtip1L;
	Fri, 10 Oct 2025 04:55:59 +0000 (GMT)
From: "Faraz Ata" <faraz.ata@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <andi.shyti@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rosa.pila@samsung.com>,
	<dev.tailor@samsung.com>
In-Reply-To: <4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org>
Subject: RE: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
 exynosautov920-hsi2c compatible
Date: Fri, 10 Oct 2025 10:25:50 +0530
Message-ID: <000001dc39a2$2cf5e570$86e1b050$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHZnjCsweC3oVP5Ejv6M2pHGPEXvgKyFlopAbdTD1i0nLvhcA==
Content-Language: en-us
X-CMS-MailID: 20251010045601epcas5p29c5dc8d86df33b732d285b1ab7821bfd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336
References: <CGME20251009101023epcas5p2de61d08e2d4a180bbcf2f2708d267336@epcas5p2.samsung.com>
	<20251009101911.2802433-1-faraz.ata@samsung.com>
	<4a03bec1-34e2-444e-acb8-cae72dcbe6c2@kernel.org>

HI Krzysztof

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, October 9, 2025 3:43 PM
> To: Faraz Ata <faraz.ata@samsung.com>; andi.shyti@kernel.org;
> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> alim.akhtar@samsung.com
> Cc: linux-i2c@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> kernel@vger.kernel.org; rosa.pila@samsung.com; dev.tailor@samsung.com
> Subject: Re: [RESEND PATCH 1/2] dt-bindings: i2c: exynos5: add
> exynosautov920-hsi2c compatible
> 
> On 09/10/2025 19:19, Faraz Ata wrote:
> > Add "samsung,exynosautov920-hsi2c" dedicated compatible for HSI2C
> > found in ExynosAutov920 SoC.
> >
> > Signed-off-by: Faraz Ata <faraz.ata@samsung.com>
> > ---
> > Note: This patch was previously sent separately. Resending now as part
> > of a two-patch series to avoid dt-binding check error. No functional
> > changes from the earlier submission[1]
> 
> It's not necessary. You only need to provide lore link to bindings in patch
> changelog. Read carefully report you received.
> 
> Also, do not resend non-fix patches during merge window. It's just noise.

Thanks for your comment
I will send v2 of dt patch with lore link to binding 
> 
> 
> Best regards,
> Krzysztof


