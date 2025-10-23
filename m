Return-Path: <linux-i2c+bounces-13744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C61C009B4
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 13:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F813AE974
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F054D30AAD4;
	Thu, 23 Oct 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMpFqx/u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0C318A6B0
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761217290; cv=none; b=FPBK6Dp+D6WaBC2sgEWns28NboRZa/cxPqJvBs5fUNtsIL1nWF4jwtGuKTl5zQnIcDS6k2CjL6HPbriiD1X8q0jpXIAwnmrJS6srcdJ7qvumocqvhFyWhiBgvmVmtyBIAppFMpAJAeFXPce9slyLh70Imk0Rx8PVgt3gSc7NfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761217290; c=relaxed/simple;
	bh=DFWDJk+24pNet0OJCXEpo9V/rxDdmMAnFVU1/Xh7xn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8ougL+A5vf+KbEuL/+TfkKJFAx+Q7Y7oQs3mqrkIOE5vX1nTdaYIl9yG0MYLn0s6itYiOC4ofcwM5OOuJWVvS5CvA62ei15XFGeICeNvFajS0KuYzricw3ll9OPafLsM7NwbeqOauyHVbVwUy2eqSgGRB7CE8Acvnrs4JtxykI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMpFqx/u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so4079185e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761217287; x=1761822087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3zVGoM8Ba9ML7IhgEq3CN+S8ajIfauDGxxTBvQosUo=;
        b=cMpFqx/u1z7GvLTJV24fS57aztDG5MhX6IVawPCEQMAJuY4pjLjGVLnEqZEFWsdFin
         KvE2TsdNLmhU5Hg0jwq1SpomX1TUpMyX4MWzXzT8wJ7cF+rrUBPg2yTHzCEJVSLryCtV
         IHSyrQoLZfc9pTFLGbb6izU/jqy5mAB198WKuNtVwN3SjM4ofH5AcnqKRU0yGrMOdgrg
         JE2IlWOeu9pmdOd1iEXZMK5dGUVUfppqlady/UF48KxejaoG6stlfVc9pOQ8POks/117
         9zTOjH5LQzSOlVJs4pGSKgdp8IsKriNvlp/ygnJa14df17S21alGeahNxPnxEKpoCxXc
         XXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761217287; x=1761822087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3zVGoM8Ba9ML7IhgEq3CN+S8ajIfauDGxxTBvQosUo=;
        b=eMFFeCUoE90EDqiGEt0XlUaFpQ0K1N6/zACi8sUDNe8tRQgLhEAFgLKtAe6eBOkHzQ
         CAJVWcrUY8Q+WQze2PYNleCGsBxcIBHP3wEdbTfduvRJbNcEm4yRxfVs1u5dv4VdZrDY
         xclIRtN64vMtF2ObhylRxvCpGZ3LAiOjwdVFPUnCgUgPG2VsiAX50w1WDryXOxvg22xu
         aEH6lPUYj2PAr5U9yZy8CCHB0WmJk0an+Bn/LS7B3qJnJeQecpYELnntc2HL8//KMLcp
         LdwELyguexZsjsHkcUHD7hIkErds6QEo6njItIedPmaWlg8Y+e0a1venwpC89FJaIit/
         I/iQ==
X-Gm-Message-State: AOJu0YyUVlvSaCAxk8aM7QjMJXGF9kR2InC8vbN6U5osF7y3LZo/2l3a
	fgMmld2bpTL7BZCvdOutYCy6Rr+aTtcm+JAH3ND2KGTqdpow/RVz8t2ibwdrkZpd
X-Gm-Gg: ASbGncuy723Rq8I1F8nt9Ihxk53CYaM1xDeuMxQXuM6v4sYqxCR3rpp8OgcAgSvJVRd
	zsY7mqMJh4LqX2aq/rDsxNL3De2Xlzu1HOoUbLALE4YgahmYrJ6GjiWj+/p4SPQiIvKwnLQJJoW
	WjmsOXkEZwLtPkqv86k51+BHwuHppNuXq4JWR4ZZQtwtzuZdc9dRmk9zG7ZQPL1wiaBZchMS6QW
	oeeFwy2dYfPR+Ckpo7N+kVHDLjxAHPdqnOFHyNdB1FlniqPPNBUAn5hVRCt7itsR0/4aAYvlJ92
	DPNS9PpAoKAbOMLl2sUlqOMUbq5tjIs2PJnm3Wi/MFvzUJKmkl6hezwbwERuF9tt8zvLe8Zd6Yl
	9lT+TOvw+Ahi8N6TRGnqwyCzesyJ02efBQUNW8cUgNNVxrDb7drnvOZIaiiybsnlA6BP9yfYaQG
	+nXG0XCfw12JKS/hA=
X-Google-Smtp-Source: AGHT+IGlmTs8m7q4shBnRaaAsE/Ntj7jFVQ6UYemZLCvrKk7CmzQZgK+t429WLi9WLsw960Agh6WUA==
X-Received: by 2002:a05:600c:45c7:b0:471:1337:7220 with SMTP id 5b1f17b1804b1-475caf9324fmr16345075e9.3.1761217286997;
        Thu, 23 Oct 2025 04:01:26 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm3596420f8f.32.2025.10.23.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:01:26 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v1 0/2] Improve usage of 'ret' variable and make pcf_doAdress() void
Date: Thu, 23 Oct 2025 14:01:15 +0300
Message-ID: <20251023110118.7940-1-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers,

This patch series is a response to Change Requests made by Andi Shyti on
[PATCH v7 0/3] i2c: pcf8584: Fix errors and warnings reported by checkpatch
and more specific on PATCH: i2c: pcf8584: Move 'ret' variable inside for
loop, break if ret < 0.
Also a comment from Andy Shevchenko about using goto instead of break
since the goto was used in other error path branches so it makes sense
to be consistent.

Patches are dependent on each other that's why the need for a new patch
series.

Change Requests:
 -remove initialization of 'ret' variable inside for loop of pcf_xfer() as
 it is not needed
 -change pcf_doAddress() function type from int to void as it always
 returns 0.

Testing:
 *built kernel and modules with I2C_ALGOPCF=m and my 2 patches applied on
 top of 6.18.0-rc1.
 *installed kernel and external modules generated by build on my laptop
 *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
 *when loading the .ko with i2c_debug parameter an error is seen in dmesg
 and this is expected as the parameter was removed.
 *No success message related to i2c_algo_pcf was seen in dmesg but also
 no failures.
 *Module loading and unloading successful.
 *No PCF8584 Hardware was available


Cezar Chiru (2):
  i2c: pcf8584: Move 'ret' variable inside for loop, goto out if ret <
    0.
  i2c: pcf8584: Make pcf_doAddress() function void

 drivers/i2c/algos/i2c-algo-pcf.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

--
2.43.0


