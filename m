Return-Path: <linux-i2c+bounces-5192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B96194A6DE
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 13:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31475281F1A
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 11:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4CF1C579A;
	Wed,  7 Aug 2024 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="brsDGEwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6839D1E3CA2
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029733; cv=none; b=G1K6aagE/Dge3lt81rUIVl5dmPvV92U/7cYZ6SLGzGyuI9/JbDneBult6zodpmKQJ88DEM638VEYEKi1CavKZ5hen5r2YjAo0qNNkGjwtbfY1Y9JzNbeaevOru5aXTcpGaAEGl3j4Ff/lDfE68bxcTDY1E9NYI213yzLZGwxUY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029733; c=relaxed/simple;
	bh=ESRZteBZVOEtkQXBI6pLw9tnBLD7ALKq7zC4hqlpVLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHxshtV6e6ros/B7gGziGQGlE4A8eRyK1I98AEvMQqYgmE5690DIrez4VN7hycHmGFBR4xCmol64e3J0bIfySGS0JpiGKWWA0sYDU6BU3dqMmoh5NSpSlajCVOeCLGBUnMPfzmJCId+cAJF2u7Gi3raqZvwm7wyZ9JQ36WcCU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=brsDGEwT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=qITu0zG3DYTbS3
	NGmq6RkE29WbBxWGRMPOIpiAuVNrw=; b=brsDGEwTJuLjjLkvq57jz82wYjG+os
	YtKnfLlHtkuv6KRF5BNt9QK++lClL5TX2szd6XEbcrRhylT3ALOc6ynJqGwEdaTD
	cU9D2PIfCZk+EStiR95HuUKqVVPy9Rtaz2r04wzDTuhoiX8x4IFiddd/D7YlXfCq
	LvhL7xOJAh2S8jw3hNQZRtkmSqrT/b7lO2nkrrEzfnIxSf2iPwGY4OAIjnqiHvbp
	DLe07ot4MyJSl99GKohyqCpMz1KnfTapIoI12lKgHGBgvB+GdB2czrwpIgrrhu+R
	yfZzttOiUgyTlhSLte9tmCiYytixXo0f67kQjfsg6L02N3TpLlrKFrHw==
Received: (qmail 534495 invoked from network); 7 Aug 2024 13:22:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 13:22:01 +0200
X-UD-Smtp-Session: l3s3148p1@meVyHhYfnswgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 0/3] i2ctransfer: cleanups & add binary data option
Date: Wed,  7 Aug 2024 13:21:56 +0200
Message-ID: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I wanted to print out read data as-is, so I added a binary printout
option (patch 2). The other two patches are cleanups found on the way.

Looking forward to comments!


Wolfram Sang (3):
  i2ctransfer: sort command line options and add to help text
  i2ctransfer: add option to print binary data
  i2ctransfer: don't use plain 'unsigned'

 tools/i2ctransfer.8 | 40 ++++++++++++++++++++--------------
 tools/i2ctransfer.c | 53 ++++++++++++++++++++++++++++++---------------
 2 files changed, 60 insertions(+), 33 deletions(-)

-- 
2.43.0


