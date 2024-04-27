Return-Path: <linux-i2c+bounces-3252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E720A8B47EA
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 249421C20C49
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3A5145359;
	Sat, 27 Apr 2024 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J/dbn4NF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDC0127E3B
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250181; cv=none; b=rdC3NUgs+8z3FkUBnjogFkQkphEzoEBXF60pIW7s8+nalEc4O35k7/l6hk534r1BED59kShybXTL6A05qrby/VbryEK+9o5jnnUFMvZKjO4tm9u7IaikSOmfVhUi3o6hrPlYO4fd796AxcwmJcRGJnCodrTYwmnc31Oa+OWiqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250181; c=relaxed/simple;
	bh=Tx0G6b9JwQMFmz7pulrhML1UHa1rgqE/GzFQrCputUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IdPjEglh3718zZEbABysrEKay+AqpINoXiiTGwtf1TlVABgEtfmXbNYv9QZIzB//pw7QVCN0v3l6t/vnOtpOS1Tn48yjoiCWhifsfyMjKLD5erSi0//LpfYsXQh0CYeD9DbQ6rn8UlEDyGyc9551UjgXc0qB/fm0U4o9qYk1HxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J/dbn4NF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=vucjjM3RsCbo5+
	FPCKzNEmVbLons1oLEEtyP6oygaEw=; b=J/dbn4NFhpPLnpA2UHgTAGogwIkFVU
	c1Oe144PmBmlBY7G1bZjfrO64wUSfJItMs30Ey1vHza/lqVrpXpu3HBC64PtE6wm
	PM643I22QuBpe+FQCCFBy9C1g8B/+qKR2wnguasGV7MKIQhjrLfC6ogaEikc7wZg
	NXKz5ylEb6ox+6JSJCa222bDqBSM7wjjeZmD2itN/VEqY86s1JzjVcawhMT0dNBB
	ZfrCpu0HSx1LJTveW87o2Bi1Cr36obPwq5lvaoeqdeUgwJOFx2FSWFozO2gDVB1+
	r2IRSzGgTFNtpEl2Svq5p+/Wg9jwOurnZVwcxRc0W7D4YqCilqvAW/8A==
Received: (qmail 1781755 invoked from network); 27 Apr 2024 22:36:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:14 +0200
X-UD-Smtp-Session: l3s3148p1@ZFeo+BkXsI9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 00/15] i2c: use 'time_left' with wait_for_*
Date: Sat, 27 Apr 2024 22:35:52 +0200
Message-ID: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_*() causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

This is the I2C part of a tree-wide series. The rest of the patches can
be found here (slightly WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, they need manual audit. So, I will
send them step by step. This is part 1 and also a call for opinions if
this is a desirable change. But at least in the I2C realm, I really want
to have it proper.

Build bot is happy with these patches and I also compile tested them
(except two). No functional changes intended.

Wolfram Sang (15):
  i2c: amd-mp2-plat: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: digicolor: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: exynos5: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: hix5hd2: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: imx-lpi2c: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
  i2c: st: use 'time_left' variable with wait_for_completion_timeout()
  i2c: stm32f4: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: stm32f7: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: synquacer: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: jz4780: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: qcom-geni: use 'time_left' variable with
    wait_for_completion_timeout()
  i2c: rk3x: use 'time_left' variable with wait_event_timeout()
  i2c: s3c2410: use 'time_left' variable with wait_event_timeout()
  i2c: pxa: use 'time_left' variable with wait_event_timeout()

-- 
2.43.0


