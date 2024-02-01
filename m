Return-Path: <linux-i2c+bounces-1570-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2F845151
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:18:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39911F2BC13
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A004F6313D;
	Thu,  1 Feb 2024 06:17:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2FF6166F
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706768275; cv=none; b=sHcvTYeGR2sf9+aG9cUPVVFzv3GGjhRiX6lsGIGtb8+c40VIDRl6C47au2Uao225x2vm8ch5rsFCbVqPDh8YqsX7xqa53TUrHQicjGmNGt1pCZNG3vWXff1fpMXC4A8PEyqbsGV1hl4OoAlwHBr2VXFhGEK0Ox2q3zOuH/LshdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706768275; c=relaxed/simple;
	bh=d5ugMrXHRL7Yp3qKdeg3llCXLTzVGx2kX+sBj+Nv/4k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lddJFAA6tFGcsuvhjZ41Diq3byEso/L8qraTtwRN2knwCQfSaEyeat5hfH46qNm+mhRfFJB24t56XwZiPXXyhovZqQDTay0xr3mh7m/PnJg/CMkvqPgADYnBV2aM0I9gAKgg69I1QwQANN2PMvqXta1nlsmuGNPF55ts/cSwt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TQTFX2sHXz1xn1Y;
	Thu,  1 Feb 2024 14:16:48 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (unknown [7.193.23.29])
	by mail.maildlp.com (Postfix) with ESMTPS id 2BED01400D4;
	Thu,  1 Feb 2024 14:17:49 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 14:17:48 +0800
From: Devyn Liu <liudingyuan@huawei.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>,
	<liudingyuan@huawei.com>
Subject: [PATCH v2 0/2] i2c: hisi: Clear the interrupt status and optimize writing limitation
Date: Thu, 1 Feb 2024 14:13:43 +0800
Message-ID: <20240201061345.3111600-1-liudingyuan@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600002.china.huawei.com (7.193.23.29)

Devyn Liu (2):
  i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
    - 1
  i2c: hisi: Add clearing tx aempty interrupt operation

 drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.30.0


