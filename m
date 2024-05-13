Return-Path: <linux-i2c+bounces-3485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28B8C4816
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 22:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC751C21630
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 20:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A4D7E110;
	Mon, 13 May 2024 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kdo0IEK1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6778283
	for <linux-i2c@vger.kernel.org>; Mon, 13 May 2024 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715631257; cv=none; b=IsDa4XVOgiKgx5X/WdaNlDUjQU6jPrIorwBrQvU5JuuTuaQcsprmJgb//PPu+wx/ccY1lRyGuBiOXQJUhRw3vmsp7yoyRV/OzfbctEs5tdh/eUPiaCVqXtBn3t7WkZULZeoSOqasOJzvhm40QAQ6f3rMM4YVInL8KXPhNL4hMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715631257; c=relaxed/simple;
	bh=55Wf+mAaH9z5EnP3Stxwcm/ef1ex9U3o3+2+2kyCC94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ittHDlN3ia6GexPSZGkO6/9aam8FpvIGhmYY2OcjYPTc6kRFYFjsRFk+egiDkEcAt3xzd6K/Xu7RcWJzubr0RL47+qdX16BalvLzNHeG/Ka/5u5a4fcZd1co5Uz1SD5KQ/Po+4ZlfilrVLciJVJMuMORlPpi3xBHuEJ+RRR2rw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kdo0IEK1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=KRH5X+1HYEC761
	1+i5xKKN04opWRJp5Kz9WR7lisqg0=; b=kdo0IEK1grh6ayBKMfTKflTiiICWC1
	09xIzeBzFOmJCJ9JeaCjsEz76VDMedXuXoySUgiy7ncqBSWrgEZeTBGbMYDL5DfC
	R3OSu2QhpOV9TUrgECCiGplQ6aTuAo+gYYtVsWjT79HlT1dYROAiX8yvCEruT8Tj
	R3c6qE5nAg21zoqP4CePY74oGI37Grx3gjbHSpCEuCecfGiycQaq7f1XLB5VokII
	la9yt/unHDYuZgJnpbqV73vowZElBgOXjrTTDZTAAVzCN+Y5sJ4GaTQvvBanrZ7a
	GzhXubv8FRtdhgJFpveHkFVZ4nGwcDbpUdFec5a44wS1PHbRVnopC50w==
Received: (qmail 2269724 invoked from network); 13 May 2024 22:14:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2024 22:14:10 +0200
X-UD-Smtp-Session: l3s3148p1@Z3A3h1sY4IdehhtP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sebastian Reichel <sre@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] power: supply: sbs-manager: Remove class argument from i2c_mux_add_adapter()
Date: Mon, 13 May 2024 22:11:16 +0200
Message-ID: <20240513201400.16589-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based
device instantiation") removed the last call to i2c_mux_add_adapter()
with a non-null class argument. Therefore the class argument can be
removed.

Note: Class-based device instantiation is a legacy mechanism which
shouldn't be used in new code, so we can rule out that this argument
may be needed again in the future.

This driver was forgotten by the patch in the Fixes tag.

Fixes: fec1982d7072 ("i2c: mux: Remove class argument from i2c_mux_add_adapter()")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The to-be-fixed patch is only in linux-next in my i2c/for-next tree. We
want to remove this unneeded parameter in the next mergewindow. I
suggest that I just put it on top of my branch to avoid the
dependencies. A quick ack would be super-awesome! Thanks.

 drivers/power/supply/sbs-manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/sbs-manager.c b/drivers/power/supply/sbs-manager.c
index 9e4141cffbf9..933b04806d10 100644
--- a/drivers/power/supply/sbs-manager.c
+++ b/drivers/power/supply/sbs-manager.c
@@ -358,7 +358,7 @@ static int sbsm_probe(struct i2c_client *client)
 	/* register muxed i2c channels. One for each supported battery */
 	for (i = 0; i < SBSM_MAX_BATS; ++i) {
 		if (data->supported_bats & BIT(i)) {
-			ret = i2c_mux_add_adapter(data->muxc, 0, i + 1, 0);
+			ret = i2c_mux_add_adapter(data->muxc, 0, i + 1);
 			if (ret)
 				break;
 		}
-- 
2.43.0


