Return-Path: <linux-i2c+bounces-1428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D291838879
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 09:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E71FA284013
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 08:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E64825731E;
	Tue, 23 Jan 2024 08:06:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB75730B
	for <linux-i2c@vger.kernel.org>; Tue, 23 Jan 2024 08:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705997191; cv=none; b=BT/mPyaGrfInUgqZ1MveIFbOnG9XqCV6WY5S7HhN3J9NJG2P6HGSK7guD1dKnlIHr7YBRWHpdvDgKLeZroydyCATMC6yWqobqbUvIRHRvgvq9qC041CytDr9tRLGCUUOM8wLNzp0nT97Q4iOEfE27s5VSkSaSX/8jj21PgevC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705997191; c=relaxed/simple;
	bh=d5ugMrXHRL7Yp3qKdeg3llCXLTzVGx2kX+sBj+Nv/4k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pw0enSvglj2nB1qM/ZXAGX2PCQuEDppnEUqBDjbZsSKGsWS1463JkM1sFbTiNavBzFhS6NhTHWFFWyGNOAIDAgOSKSpnGKh6r5VisM+t1e9aUoNigcWQzILJzkBIAnE/ZnHBUz7Xb5rJwNLVCtJi1c0NCt1NShtcaV6tAdYl4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TK04M2KLzzvVDg;
	Tue, 23 Jan 2024 16:04:51 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (unknown [7.193.23.29])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B877140410;
	Tue, 23 Jan 2024 16:06:22 +0800 (CST)
Received: from localhost.localdomain (10.67.165.2) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 16:06:21 +0800
From: Devyn Liu <liudingyuan@huawei.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@hisilicon.com>, <f.fangjian@huawei.com>,
	<jonathan.cameron@huawei.com>, <linux-i2c@vger.kernel.org>,
	<liudingyuan@huawei.com>
Subject: [PATCH]i2c: hisi: Clear the interrupt status and optimize writing limitation
Date: Tue, 23 Jan 2024 16:02:20 +0800
Message-ID: <20240123080222.1512009-1-liudingyuan@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600002.china.huawei.com (7.193.23.29)

Devyn Liu (2):
  i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
    - 1
  i2c: hisi: Add clearing tx aempty interrupt operation

 drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.30.0


