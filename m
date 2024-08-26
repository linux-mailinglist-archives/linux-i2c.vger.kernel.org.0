Return-Path: <linux-i2c+bounces-5812-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC895F50A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 17:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20443B22685
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15D5193406;
	Mon, 26 Aug 2024 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DEZoxckp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F0192B93
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724686116; cv=none; b=oQJmgM/tJ0Atab4A1s8dWnJcZ8+Lyfs2Nww/SKhV43qOO2CrIha5nrQ2Z+YHptDOGlmxGeZ7mRqOi38DnLlESx11hR8fBlLgZPC+YGxwO1tupZlFbOKhADnb/SgWlhvtHnJ8+CRZfT3/QAw5jwvP9eW37PMHEguXgdlmv2XCzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724686116; c=relaxed/simple;
	bh=8a/sSAadf55NCKFsjerZCdROw7ej/nHvD5TLqr63vV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyFkFxOQUSbjdAhhJ9ZTgRplMMCYIUTq8aKeboNDO2N4i02gfqnA/o08y/JJJwwGW2hDk0EGSFkbkQ9SjYUiIl7S0wF9SsSnri7lxdkUdfG8beKpaMiwg0D2FBwrPrz3w+JyV4ADCjNjYgbfiwpZTnl3Qhi0H3I96rXZs4E9iF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DEZoxckp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8a/sSAadf55NCKFsjerZCdROw7ej/nHvD5TLqr63vV0=; b=DEZoxc
	kpRc8OklXrjEPwaZHxExPotu1Vaqgd1cTiqQX+88ZuRzMNI9tre4csbv3461v05r
	Y3FP7cJ5/s+4MX27cbhMb4Zzp8QP8doF+2+PvRRBEB2I0afpcx/zayHR92Klea5K
	78/C70lVRqTJMmfRbXgAd54MOKf77u914sIOw2iL8VHMHb6HsgYzVrgovPlxg6xa
	d98DflxDAb1VlGUtvtXGXOy7A8bmwy13ikeyNj9NNxJzEPl1AR6uCazLJecYLBQY
	5Blc+f2ju2z/pVQZNry4HeAvko+C1D+JExpIPDoojt8CQP7XLS23T3dGEjXNygBo
	vf71SZXmuMtH2G7w==
Received: (qmail 2037873 invoked from network); 26 Aug 2024 17:28:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 17:28:32 +0200
X-UD-Smtp-Session: l3s3148p1@SUwUx5cgHsUgAwDPXwdRANgvu6DX4+2c
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: kuninori.morimoto.gx@renesas.com
Cc: linux-i2c@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2] i2c: rcar: tidyup priv->devtype handling on rcar_i2c_probe()
Date: Mon, 26 Aug 2024 17:28:25 +0200
Message-ID: <20240826152825.27473-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87r0abq3r0.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0abq3r0.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

