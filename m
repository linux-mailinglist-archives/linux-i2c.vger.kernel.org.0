Return-Path: <linux-i2c+bounces-5440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 006AC953CC9
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FAE41C2552D
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 21:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DF3153837;
	Thu, 15 Aug 2024 21:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VO1nuYHN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1911214EC51
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723758019; cv=none; b=uRgQnyg+A7PF3mbkaYbzX6P/T5H0sVMv4m6h8Ml3ekuq9FEulrCgW7l5UKZ0PcAl7O9iUc5X+xQ0ViKzJSVdLYEbZInbQiag4RzUkGSwZtkuvveRWamgGTOXqowDJHT6lIeAxS1tK6e5hureLyqm/4ndRVCmn+5gcxhsKOmDOhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723758019; c=relaxed/simple;
	bh=cJaVGYUenxRIG1LOJqIzqkTj+afPq78Oz29juMpk2gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDFHfBjnPKMIU1IbtKOWGdOYniuyMeM1OhVspev2w8HhNT2AF+wMa08FnPYzr2CGDZeZ1f04F/bsgtEf2opkTxzwVZH248Sx+RLNj1dk1LBULTB4/5Q2oQ8dMZgaprLyDtn/hRq7iB8D2vbe+cE8e2N+cDtKvzXN8jtTSfDuLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VO1nuYHN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4XmfelGNV5Z2+G
	Sgo/72Ljhp4B5UEyAL9EE3eiFgyVk=; b=VO1nuYHNnfftzwEtRcQrFIC4ALM4y9
	Y1ew00AP+lZhhHWK1mn0rq60GSiMU1OnIbnY/bycqxwAso/fWfnx0Jtq6Agw2WCh
	8UlJK1uB7fDzIDb81aPcLqMst0Yh+zZbMvN1HVjaMpG51KIPokHwV1EByAgJZRoV
	CzNbcOlV/lpB4dxfR/IEvpLU1a7N9liV2ycrG3pjXXzrjdVK+bLCLBuFfH/H5m/x
	FMgYCXrGn6kJEboyViyGvw3bHlEP9qHn8/FXt3H0lwUnhEjygvMsFwLLziNYyVn/
	vWXmei59Mu7zjzO1TnA2GYGTdI/fFJYZ+vliArrftbDDMSNPpEV4X33Q==
Received: (qmail 2404078 invoked from network); 15 Aug 2024 23:40:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 23:40:15 +0200
X-UD-Smtp-Session: l3s3148p1@VqsnsL8fbKsgAQnoAH4zAClVBN/DeGcx
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
Date: Thu, 15 Aug 2024 23:40:10 +0200
Message-ID: <20240815214013.6519-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"smbus_alert" is currently listed as an interrupt for targets. This is
wrong, it is an interrupt for the controller. The mistake (mea culpa!)
was already in the originating "i2c.txt" file in the Linux Kernel. Time
to fix it. Make small changes to descriptions to use inclusive language
while we are here.

Changes since v1:
* use "contains" instead of "items" in patch 2+3
* drop "irq" binding from patch 3
* checked with dt-doc-validate now

Thanks, Rob, for the support!


Wolfram Sang (3):
  schemas: i2c: reword descriptions for inclusive language
  schemas: i2c: clean up interrupt descriptions for I2C targets
  schemas: i2c: add generic interrupt name for I2C controllers

 dtschema/schemas/i2c/i2c-controller.yaml | 37 +++++++++++++++++-------
 1 file changed, 26 insertions(+), 11 deletions(-)

-- 
2.43.0


