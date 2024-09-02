Return-Path: <linux-i2c+bounces-5997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 717069687BB
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 14:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7B21F22DAA
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 12:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0FE181B80;
	Mon,  2 Sep 2024 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g8gp07J2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C319E990
	for <linux-i2c@vger.kernel.org>; Mon,  2 Sep 2024 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725280998; cv=none; b=RRJSU9qdXViJAXOqQkPIxm09qUd7AlldShlvfxyULLb604A8194+4t/jf18inQjH4vXfm7zrfTNEiMa38jc1QDaX2eXQAA2N/tfJF8klKxwBYImehcvPkwULRPcWdMWnsfrLafv0AofM+qx0YGpISvT8XLxIFvmIaM7cUuxIBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725280998; c=relaxed/simple;
	bh=BtONj7m+iJ9hZB91YXEOPllAiF7/pcWcdFV73RdBb/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gINilAFfL19/UOCW4nhTnOTHRK1ebnkc2OkvRfTVlNj0qj/bO020S7A/rnJr3i6Loe6sjZEjKMdjb1tTCTQNGfD4Ob/9BDRWpoP9hy6aZah/Yl2Jn9vR88uZWbGcz37tenAsebaavrZ3tmy/UhhnWu6Rew3mv8GZ8lhvn+cNrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g8gp07J2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so35065025e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2024 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725280995; x=1725885795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNcABBUv5ECTDChVdd8G0QwrXlgsnZ4Fvs/9+n3Mr+w=;
        b=g8gp07J28fTlwxy3zo5xITFPrEUejjgKo9DunwH5OvC7tE48nWGmkiiI7XI3Xu7GzO
         nUeJXHiDl8Sv6jTt/ZexBf6ttjLX+yYJwKY65E5/OT2OXjocCh9z7sbI8sbW7JmXeGyJ
         oUP8ZeFheAzy8Qka80gPPq4SYMxGMQveMgC/KckOqmz+BTtbWGIiIXe2jfYnZMVSGoR1
         guBBgtCuijYlvRx2zsaSLM96cYgqF1fPRMtZJHkoMTSWP5Tae/BsYujQTH0PJ778QXu7
         46B5n+qiTjsHr4KCxIDVvKrazWDWI5JGi66SrnwoHddtnsxdceFMVhKnEQCHTC//9HX5
         epnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725280995; x=1725885795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNcABBUv5ECTDChVdd8G0QwrXlgsnZ4Fvs/9+n3Mr+w=;
        b=kqM33qx3bx83nft5xf8JPp+cjUuoRcONlqlQdmDX0pwYcicadpygITNj4CsbQfss2w
         +/TCfT8wooQffAeyoxxmV6N1L5MWPM+zRsSlD+R5hG4d7N4PyliPjqpmkLFq2noRDn8j
         ryABf5l2B+gfejPjB9XqQ/jXoEgQQZ48Z24tLpP0VmEOkft8o55Mhncj94nThXFw3K3K
         oRpbchdjD0vyPi/glhPqQsRMZ2Afqrqrago7F6JMe0AGOECn7tYv8vVhn7HSQmcGWVv4
         Cuw7ec34hY8cgnFPWo0hSGM45lJOZ9q8Pbj+lT9qPPr32MNm/iZKQqU0fJr0k7f0nvyu
         /TYA==
X-Gm-Message-State: AOJu0YzK/yqfe/3aVVGbJ/t0gjj8LM6Ct8K/HN+Ew5ty3B31z+H/RPBC
	pDLNAOVN6pHEtrqcpIvwWSpvG9GMsTnCodLgh30sL8sdM0xvDz+i0uPaNRT7pJg=
X-Google-Smtp-Source: AGHT+IG4ST6grmm78fPKBSVUgn3WNwa/jhgiYnlhKk12m0wUd9YCM5OJ7i9NoAjYBCgOMxM01Jpr+A==
X-Received: by 2002:a05:600c:4f86:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-42c82f6741dmr26302725e9.28.1725280994571;
        Mon, 02 Sep 2024 05:43:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c17fed40csm87931125e9.0.2024.09.02.05.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 05:43:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24 updates for v6.12-rc1
Date: Mon,  2 Sep 2024 14:43:11 +0200
Message-ID: <20240902124311.31147-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following commit adding a new device-tree compatible for
at24 for the next release cycle.

Thanks,
Bartosz

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.12-rc1

for you to fetch changes up to 36e071d2a1522eeb3d38fb9c257cac8e5907979f:

  dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A (2024-08-11 21:28:06 +0200)

----------------------------------------------------------------
at24 updates for v6.12-rc1

- document a new model from giantec in DT bindings

----------------------------------------------------------------
Heiko Stuebner (1):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A

 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

