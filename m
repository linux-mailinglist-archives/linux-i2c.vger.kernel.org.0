Return-Path: <linux-i2c+bounces-5106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD90946067
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 17:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739F62871A8
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Aug 2024 15:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFF81537BC;
	Fri,  2 Aug 2024 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SuFDgDl0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9791537BD;
	Fri,  2 Aug 2024 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722612179; cv=none; b=MuG9SJ9zZGdDilZaP18krq2miHsSp1YQJynho0hpRb5qG6lY8Kvf63ZMqsl4Dnv814V91HfOSErmrHdGw40gdiSOfcS2vp8RohHNRaznfT6WfLNMg3clDv4ju2B7PuLeJ1tEpj3JOlHFWoZ/wXFjZF7xfYbIpY5m9Pdn4X9TkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722612179; c=relaxed/simple;
	bh=qmO8Afb0ITSyz3Wvztp9dJR/+ITzZdyyGYiZdKFV+58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQK+5xptf0hmftaAm9VgPRXPfC9DSAL4Eq+b2TQAY9d0d76SItN4vQ6pDvkyvnmZYWZHQNci1nni5NfFQO7L2T7/hHyjPEjLwaks5CfSHDI0JuA5MqXOxWMdYn3UVOuPNqLMmhkBECxvPgmBIZzw78DG9+mhDFLbZzTtgP0e38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SuFDgDl0; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726UoSi029760;
	Fri, 2 Aug 2024 10:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=C6m8JoKvErussHKL
	6W/3s+9rZ54Dx70GvhYubzG6P6E=; b=SuFDgDl0XtUNKFM7PFULqawaADBKi43/
	KaXAseMC5N3g03rkSUHFuO23sgYpkSm23+Hz0msUuffzQ+XyRTN4RJgbf7TxMoZx
	+ERwnJlyd4lKGZhX1xSIcW4nmi0QiAl/Hr5fM8uxkloQQiG4Tqvf5CAEODTrpBR2
	epCH6JhRYDpdwrfJLHL/R5UMd0gb8yb+GQTiiziKJcAXhn1oI7DaX4qb8VGtns6L
	GUcI9jjgagpZYFRbZkXjV5X36+Acbtl6jMX+4nSntZpVtRcEqNMiGpP5FCiUmu38
	YbNo5BFhpcPh46/wEoiA3L1qNd5mTGR6cHx2lWFVolvnfWFZmNSmng==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdnrvxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 10:22:19 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 16:22:17 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 16:22:17 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7660E820244;
	Fri,  2 Aug 2024 15:22:17 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <wsa+renesas@sang-engineering.com>,
        <mika.westerberg@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2 0/3] ALSA: Add support for new HP G12 laptops
Date: Fri, 2 Aug 2024 16:22:12 +0100
Message-ID: <20240802152215.20831-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x04U890QmDezCYKZWV3Fe3Adhr0Jzj5a
X-Proofpoint-GUID: x04U890QmDezCYKZWV3Fe3Adhr0Jzj5a
X-Proofpoint-Spam-Reason: safe

Add support for HP G12 laptops that use CS35L54 or CS35L56 amplifiers
with Realtek HDA codecs. Some of these use the same SSID for models with
CS35L54 and models with CS35L56 so the ACPI entries are examined to
determine which amp is present.

To avoid having to #ifdef around this code we've fixed the definitions
of SPI and I2C functions that were not correctly supplying dummy functions
when the real functions are not in the build.

Changes since V1:
Added I2C and SPI patches to provide dummy functions.

Richard Fitzgerald (2):
  spi: Add empty versions of ACPI functions
  i2c: Fix conditional for substituting empty ACPI functions

Simon Trimmer (1):
  ALSA: hda/realtek: Add support for new HP G12 laptops

 include/linux/i2c.h           |  2 +-
 include/linux/spi/spi.h       | 19 ++++++-
 sound/pci/hda/patch_realtek.c | 99 +++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+), 2 deletions(-)

-- 
2.39.2


