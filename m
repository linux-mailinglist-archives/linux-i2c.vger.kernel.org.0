Return-Path: <linux-i2c+bounces-11883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86436AFED87
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 17:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D07C161D48
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 15:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5551B2E6113;
	Wed,  9 Jul 2025 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mw+ZBd/H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD2A2D3ECF
	for <linux-i2c@vger.kernel.org>; Wed,  9 Jul 2025 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752074061; cv=none; b=pWwVs2WyUVKoR7Ww1OrhilirFKwm5NyyPc7oxMC766v7NwRTircvvYuc59B1ZNdPOL9IX3ZLAMV6RiXtno3UOSAbKzVGQRIDkun2ND6NY6SR5yUw58tRCL2E16i8eDZBww4/+mqb+KnD9mt68FSkkFE4X0iFMzHBrQiHMmPTu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752074061; c=relaxed/simple;
	bh=e3N4Xp6JPlK5md+uz0UBnKU0UJOt/545XXumV/2gaBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPZtBrr9OiiY8N6WTPaBGVzmPYOoGcRFRuPLM+UCRChzoo2Loi3zGYiBOnNAjRJeZ9tgqD0l/zuukCnEKIdQ2BVIla7pM7D5d6+czcLVd/ZPmxCWf3E1MFRjc/r7uDnkmqUy2N8KTzxKkzpiLK39dgTsx+LRorozBD0kl/bSC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mw+ZBd/H; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3928598b3a.2
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jul 2025 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752074059; x=1752678859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3N4Xp6JPlK5md+uz0UBnKU0UJOt/545XXumV/2gaBI=;
        b=Mw+ZBd/H+ihSIs0+LPCF8YPY/EcGT8WTCPbVeLhXt8BN8zwWo4CE67mXH+wuOoS7S7
         YzZ+Bm3xOj+0F9CLaIZlL5pKXcz1Uxb1cf7mq+79BTc18qzgR4KhSQM0uA7cIGBVfoAG
         fCmWQiWW3nmNZTZA9dlH+BstvR/hpjwUsbXxujOoRfF2YHo/y0pFCJDfRxTQIeq5VuQ9
         DrQXCcwJbj2sOo7VRADo1B9eSgoaTQqEG1rTEOo8hcfiS0CFV6h0DL7dTW7/Mmhlusx3
         EVt+8gZO4afRNdoCqW2bDJta1HpEQfH03mCNPFiVJb2XeqtFoequBTFgGhVkYALJPUg6
         tYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074059; x=1752678859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3N4Xp6JPlK5md+uz0UBnKU0UJOt/545XXumV/2gaBI=;
        b=Qt5w16TPfk8AfXYwfIgbo1OhYJayaslcAiA/4E9PgK3GHYk5e4dWMbJSY7VI3xjLkr
         pAj9JDrFYzUUYhuAylKFOmSkCBjU2diBohYg8NjnypH4auHgzsqfyNlq99+Q8EOoCCfy
         N/6RlGCedzQ2Yj6BYKR2Pc4Rn7HPFvXPood/8irgXmAHZ6Dro1IdPgp8gFdnY3wcGVZP
         uIIgL7AFcDV9ifGZFQ996ZF23MP98q5XMcfODzWbrbU/t9gc0Prgn6LSWUIjYHoFNR4T
         8x7DgsqRhR1ycwAGHI/0UYCZ+mQc1EbgkaYH20tu2iYoV0CisXzFAn45Q9VLqQgCSFdj
         x/5Q==
X-Gm-Message-State: AOJu0YyDhWoSWyRpFGWv30fw78G1Q5157EaRFQCN64hBYO1m5pqYkmh8
	1zFr/5c662Gta/QKv1tzkBNBGMd35GSwiwxq/qAaLgmt8P0d4vDYKW4h
X-Gm-Gg: ASbGncu71J4QoKSzZ2byyWyPKVcjbLNFdCJolWlEMuAMJyP45vRnjGOu0ZElD34iUUF
	cBnmVv0q6Wuheb0WyPhXPRufHTbSABjbCJaaNh8qT7CINwb+bLevLh7aOyzd24R+EOKwSs/vv0p
	SoC14nlQshm8lexXghyuxGAxir2ftq61Dw/miJKX2inVYM+VQ/ebEdO1qGDgtaQRwfJQWP+WOH2
	J8Z3vPqni4HKT3c6G0aZ6afkpsfIr4NU/5f6GLR/41mGqt0sD39lYyJStVHG1O/oxtY2CXYagsB
	ihothJ5zsfEpoKOzA8fYph/kLXzllHslJw9RJ76pFRJkFk7LxseWvnYInjANYF2lVDtF+e6/hTa
	xPlcSAE68NtoSiL8eXnqL
X-Google-Smtp-Source: AGHT+IHRNwPVVLvpzQcz3P8diZn673+iVgHpTjlwlQm8K4aztVaMSnGanTxVyBfHq6GIcv+onMf75g==
X-Received: by 2002:a05:6a21:339b:b0:21a:d061:2f84 with SMTP id adf61e73a8af0-22cd8a3ff68mr5288048637.30.1752074059004;
        Wed, 09 Jul 2025 08:14:19 -0700 (PDT)
Received: from localhost.localdomain ([223.181.118.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm13558373a12.44.2025.07.09.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:14:18 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	viswanathiyyappan@gmail.com
Subject: Re: [PATCH v2] i2c: Clarify behavior of I2C_M_RD flag
Date: Wed,  9 Jul 2025 20:37:17 +0530
Message-ID: <20250709151402.7811-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aCtgNpWs1tJ1FltB@shikoro>
References: <aCtgNpWs1tJ1FltB@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apologies, resending my previous reply with a proper subject line.

Hi Wolfram,

Updated the Signed-off-by line with my full legal name, as requested.

Thanks,
I Viswanath


