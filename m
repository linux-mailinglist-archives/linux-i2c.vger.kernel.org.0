Return-Path: <linux-i2c+bounces-12334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5497EB2B6A9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 04:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175CB626B6F
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Aug 2025 02:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE43928642D;
	Tue, 19 Aug 2025 02:03:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9BC221FBF
	for <linux-i2c@vger.kernel.org>; Tue, 19 Aug 2025 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755569037; cv=none; b=hjSffHH1IIGNadI8U4ia2kYFLkT04Br8TWugRkOEgP1XOFND4qYec3kUNAU6BJUQkjDDlTCMVXLenENUk+50UO6t4Snrp68+MJCw3FvDakVJ3+dJKh6+RJSbxJzbfqMpFh7+QQBk2GeoIBYqCzOqik5K/Dg3+2xOqgHXb3+g5sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755569037; c=relaxed/simple;
	bh=IPWQk34hdm2Z6+L+7D8qeiGXOo0h500j3XBzj+o3cqU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PgUV4VQlytGftkCFgfMSTZPEAa+a59kfUA8/iSwRlw0nEM0iK/ct1pBGn4srspGdVyEHZivJj6bSSvU8YhmXWJDUqon/4k6sjp2ZsZSu7IFfzBCSIAyjx0O2RzHKuYm/Fpn0I0wby7kdeGhx3x5Dxv4R/xhV+uv+e9JouMsBBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=h-partners.com; spf=pass smtp.mailfrom=h-partners.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=h-partners.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c5XqZ0p7gz2gL7p;
	Tue, 19 Aug 2025 10:00:58 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FC02140230;
	Tue, 19 Aug 2025 10:03:50 +0800 (CST)
Received: from kwepemn200006.china.huawei.com (7.202.194.129) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 10:03:50 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn200006.china.huawei.com (7.202.194.129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 19 Aug 2025 10:03:49 +0800
From: Devyn Liu <liudingyuan@h-partners.com>
To: <andi.shyti@kernel.org>
CC: <yangyicong@huawei.com>, <linux-i2c@vger.kernel.org>,
	<prime.zeng@huawei.com>, <liuyonglong@huawei.com>, <kangfenglong@huawei.com>,
	<lujunhua7@h-partners.com>, <huyihua4@huawei.com>,
	<jonathan.cameron@huawei.com>, <liudingyuan@h-partners.com>
Subject: [PATCH] i2c: MAINTAINERS: Update i2c_hisi entry
Date: Tue, 19 Aug 2025 10:03:49 +0800
Message-ID: <20250819020349.4027842-1-liudingyuan@h-partners.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn200006.china.huawei.com (7.202.194.129)

Because Yicong Yang will no longer work on
i2c_hisi driver, update the maintainer
information for i2c_hisi.

Signed-off-by: Devyn Liu <liudingyuan@h-partners.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b57dd4fcf01..26c8b8d60195 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11013,7 +11013,7 @@ F:	Documentation/admin-guide/perf/hns3-pmu.rst
 F:	drivers/perf/hisilicon/hns3_pmu.c
 
 HISILICON I2C CONTROLLER DRIVER
-M:	Yicong Yang <yangyicong@hisilicon.com>
+M:	Devyn Liu <liudingyuan@h-partners.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://www.hisilicon.com
-- 
2.33.0


