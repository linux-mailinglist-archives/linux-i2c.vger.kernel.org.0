Return-Path: <linux-i2c+bounces-14617-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BACC640F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 07:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6FFB301F7C9
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 06:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230F430C600;
	Wed, 17 Dec 2025 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8Tl+hZP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E130AD1D
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953047; cv=none; b=um/29N7bxutmh3CJwCE3e5XMxtJBu96soPnIEiffivt+8NvFFD+8iQWfBMkq9cr29GOU7godtZtsjTVycwdtTjQ3EF8OrdDlNAF8R5JBqH4LwAGJcdjw1d8GyItDklSagA6M8ojCP88G9WfkQ4GBmNfXE6263BIKjdrSOF/L3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953047; c=relaxed/simple;
	bh=Ex/X+4fPw7L+jqD9c8Qm2fMzUU3tyBxLOYdbYSY/0rE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiGhV0uTq9aDfdOcrwAqNvJ0sn7zRfQbXLuLuO+0rXVxKkcdgZ54Vz3Gkun5jHsnTSfkAU/6oYH5m4nnjQZr3PBskIYTv3ge7hmd4bDoG2/OsbqGJ2bYrmhQCtutYZkSx6Rta/wwK/uvPpg0iTsfEstjEs/5fOPcW26K5sOOF94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8Tl+hZP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5821381b3a.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 22:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953045; x=1766557845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPHEq0elmbHJalGbKxb+0kabma1wzGWzaDOxY+7T2jw=;
        b=L8Tl+hZPRDic/wuqdl4/Qb8jqmWtLy4Ce0InNyzyg8MERWymrYluLVKsDbXRLcbzCN
         3hktC2IDEu1lU1al6mlCEYPR80cO2krM4bNPJvC3vZkqiDeA9FSxpYEuQAa7wATYWDbG
         wYjkMiw61mKny8XamM75yw/H787diJwvaEqnx2/CNLBwCu8ylWtOLnHCgdX96bRJAnCX
         WK3ibe78DI55dF5zSZmiyFfOAofbRYbdFS5xz/hNIwNImrBLUUK7R14/E07BtjYt7Ote
         ICfsby/65mcfW2zRVGY4CAxYtj1BxtSCpM7MQxfpRX6xHZQISvGVuFUbC0nNv+ejwdil
         oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953045; x=1766557845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPHEq0elmbHJalGbKxb+0kabma1wzGWzaDOxY+7T2jw=;
        b=Q8ezw64+wDSRnMSnJKehUt8lTnVBy/3C801FGQBfZ+m/zNNtIcfwPDV7AcdPHMPURR
         0jJmiwET7iVApcnMrQIaHsx3VAOXICHPVl0FpSTNX00YlmEoY/knI8nOoEmUTzf2B0DE
         brqv2e+liaJtN9wY4P/2ZyXxXmT6X3E7eBclHIiHirpyW/d6YKjcyBVj1CmnOzuNiNkq
         rnEPR6xQpIai12XVDlpklwhBWzkTDGGQf/F5O/TvTUodc7Y1pLqikd4PUPhuC40VTqlr
         hBOdfMbj9MAQKhYTJhURLd0LuA3x5gaxKVnKne1TzUSFLsPjvrO8SIDYHcIWL3NuLmki
         avPQ==
X-Gm-Message-State: AOJu0YwV/p6a08aNWGJeSTFH5wKaxFs1ojSFBI+NJaxh38VC7B3Fa4N3
	EFe6MU/KFG14wT72NUFVHSIV9ouwrnnEcDXl4lkJfv0seo4rbQ59FNJZ/60LFw==
X-Gm-Gg: AY/fxX4NT9AT08pvAREPd9snLsgA/RrmM7gZw5f/4VubjakHf+I87B/FTMWelqmE1jj
	w9c7UYsxX3uvvXt5c0ruB1kUGJLAeQ17ENbx4kyeOHZ2HOWIcozJFd82OXPUhffcdaKl1hbwvQr
	GvkA2jQb+FvmZatS3eXG6rzFHOg6lcLYfTgA1jflYTt6AtJzjg14J4CeScZOL4AkS/J3W/lXgeU
	s6qZyGY8+5IF0JLH88hU7UFpgvfSdwCYW+r9TeKPWIf9MsjEAnbT5QBYQLWWEFN/pOJt4wGY8l9
	lSsQdy/iZ11W5aMaYWizwDawSL5lnXQBtUI8+zrA8tjcLo5nUWUUSzUkwL/svoV2fsgxy9K8h1V
	Cay6CXQJGTTGcnAwseoTjMFjJ/cs00uy8VJPRBieUk/hMXMkKUHFE3CJ/FQ4dDutwwg1D
X-Google-Smtp-Source: AGHT+IGU9w3sVmP8pVupfwRQj+gomhEBfWCC+q/CEudmP8ZwDv0kAOz52g2HvK5lcbsVBWHLKIi+eQ==
X-Received: by 2002:a05:7022:3a02:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-11f354dff2cmr14003915c88.41.1765953044595;
        Tue, 16 Dec 2025 22:30:44 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb45csm61585357c88.1.2025.12.16.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:30:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] i2c: rtl9300: two cleanups
Date: Tue, 16 Dec 2025 22:30:25 -0800
Message-ID: <20251217063027.37987-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

const fix and fwnode removal.

Rosen Penev (2):
  i2c: rtl9300: remove const cast
  i2c: rtl9300: use of instead of fwnode

 drivers/i2c/busses/i2c-rtl9300.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

--
2.52.0


