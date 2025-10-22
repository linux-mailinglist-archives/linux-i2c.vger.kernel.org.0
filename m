Return-Path: <linux-i2c+bounces-13716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F8BF9A74
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 03:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B3293528CA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 01:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE5119D087;
	Wed, 22 Oct 2025 01:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEckUI7k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9C1FE451
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761097989; cv=none; b=tydYWY2OjOsowUOUKl45e2AVOm3SevmbVHb28YMKGUMH6gshziqt+g1e8A2yGuPsaab3in0bbUDvkFUVwoyCwVfQEclVpUHeuiECYd4N91f3BfRNytKvB/01sN+7XHhC4E2GKIhNxRywcyCo2GW0eHJ6edJgZE0Glac0gUiOTpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761097989; c=relaxed/simple;
	bh=YmooPlppYzD8AJ6B+UA5wt7s7kf3vmhiMoFB0E590M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWgzAD1/jZdOQD9SEnu2RPc7pRMWV4NkN0gvMVSMYID7sZZdXsM/PqJYkqbihsUIuRCPeAF/FJb0oUrXjUbutqNCHSXI+jhSdP8mNskEMR/tpxGhnN2/YI6JqAWOvD8NBPgX8kiyowuC7VZysIhp+BC335ViyTLLJookyZSy+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEckUI7k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso53150675e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 21 Oct 2025 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761097986; x=1761702786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5zU9EhD8Vfp36ASaBqsSl4/OEXrV7y8KWJuIts6MOg=;
        b=QEckUI7kcefCCXmku+IzGYs6uB2HocYONB3s9PAZvh3QFR1tcuhE91n883z7FXGT5l
         iLqn9+mFpZHkpwX97gJof7cZeNpcn/F9216RanU78BAEoNY/t82Qf4hLmwlhL21PVCoO
         fhn8LJYQR2vpyMb+zaJLZj1Y9DlY0avnyQAm/AW37vI6aEYqVq4fMyu6UQr+JDdHitsw
         LOAoKJ1kvVAQXwnpPbGJYTOrYUOnNqXPs/5RcfHdD5PDYWNDCy+jdTyaiDH3vPyG3c4o
         +XG43Jtl09KcQ/q4hXmORtxyp7uQc2A3Ne78JNmncWwDnJfgwDZrOumhVzmTqNwC90EC
         2tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761097986; x=1761702786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5zU9EhD8Vfp36ASaBqsSl4/OEXrV7y8KWJuIts6MOg=;
        b=W/4+x7U3FLysUl86S57Xh+s6m+uYcgqfpUf5OPmC6ksIleZCwubSmOeXNvgGTrW7lG
         /4DHMPPNnPPICjGYV5ctH4Dhm2E6BazBKaLA6wh4U1r+xEcFyxP5f99Un3kfvz59kLf4
         kXS1Ohi02eg0XNqp3Elgt7b0HnO5MTwOVPPaCv6DDEPwZLYydsWnZ4aoE1UTALf+8lYf
         Ky93C8beNH6z8OE4o9mGr7ZViUOqCjrGwkDI0bwSALauUrW8NQ7UywoJ7FkThMKKYAqH
         gEuiFSSBDwtE2JYRAo49yY15XtptFNQEscaMfqpyC7YTyVh1b3v4mHLgrxEER/irFVzb
         6tzQ==
X-Gm-Message-State: AOJu0YyrRhNqR07h3xuDf6SQdaSQV95rZqPOHewxyKgHzHbRA/HvX8dC
	Z/fAID40nNVRdeV5CypplArd6xQzOc18mSyYuvMesMkM3BCIRFLx7RGuSLRJQEOD
X-Gm-Gg: ASbGncsQSlTCaEEkP4JPkpI3KZPPQJpB2lfr4uRxrJeco1aC7cv781JMdv7a3Y2YKwD
	t5eulg/M5pri5zr/1wfZAGg1dK2GVlLm/JcFdm3HZWnC6pQEY5PLF14hh/AlqxYZLp8JMtD2N4N
	dwSIF7xvJ9n3e+Blmqc6ZoBGVuAUSN8M8/c6kBbmiWuG1vUj29WfSqaCgwvVKxh00+Bgx6JGucr
	sn+5qLfg95yu4tzYRzTrangafN2UmzSY4+PyYrOlAVcWzjZabe4X7Ar8b03+f3yHvZaymF1RSqa
	5QzPccaP3wSnAyaQL/BZMGYpDPF3Ax7EFVRg1E0yYyiwOSnDuhM4Lf7JDderX5CEhMwYIfmZGan
	RHyM/zo2DsrVkW9TAQif3+gWMpYhPdQKyK0eLgqpBrWL4jzxo55gjPzivl4VonlIoyQqeHTM0/6
	3ZH/RBgZUurRyz7seuvFjGm5lWJQ==
X-Google-Smtp-Source: AGHT+IHoJtC1b/1vgTj/lC2EI1r/fL9qZK/cWaeVa7X2QqiHD66axbu7lEcZJouBLxxjRX1xoFF9Hg==
X-Received: by 2002:a05:600c:3145:b0:45d:e6b6:55fe with SMTP id 5b1f17b1804b1-4711791e7a4mr164600665e9.34.1761097985548;
        Tue, 21 Oct 2025 18:53:05 -0700 (PDT)
Received: from shift.. ([86.124.201.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428dafesm18557345e9.6.2025.10.21.18.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 18:53:05 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v8 0/1] Improve usage of 'ret' variable
Date: Wed, 22 Oct 2025 04:52:12 +0300
Message-ID: <20251022015213.6988-1-chiru.cezar.89@gmail.com>
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

Change Requests v7->v8:
 -Move 'ret' variable inside for loop of pcf_xfer() function.
 -remove initialization of 'ret' variable inside for loop of pcf_xfer() as
 it is not needed

PATCH 1/1: i2c: pcf8584: Move 'ret' variable inside for loop, break if ret
< 0.
This patch add spaces around binary operators as reported by checkpatch.pl
Move 'ret' variable inside for loop of pcf_xfer() function.

Testing:
   *built kernel and modules with I2C_ALGOPCF=m and my 3 patches applied on
   top of 6.18.0-rc1.
   *installed kernel and external modules generated by build on my laptop
   *rebooted and loaded i2c-algo-pcf.ko without i2c_debug parameter.
   *when loading the .ko with i2c_debug parameter an error is seen in dmesg
   and this is expected as the parameter was removed.
   *No success message related to i2c_algo_pcf was seen in dmesg but also
   no failures.
   *Module loading and unloading successful.
   *No PCF8584 Hardware was available.



Cezar Chiru (1):
  i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.

 drivers/i2c/algos/i2c-algo-pcf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--
2.43.0


