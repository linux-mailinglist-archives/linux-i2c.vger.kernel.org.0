Return-Path: <linux-i2c+bounces-12772-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94512B48CFE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 14:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02601890021
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Sep 2025 12:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F03C2FDC3E;
	Mon,  8 Sep 2025 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmq0prK8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1702EA752;
	Mon,  8 Sep 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333519; cv=none; b=PjAa7GxuC7f+6LEEQPXgVvma/T4ik8IRwQ971G2dTP2AvbC8/IvS4GGMzRZRPdJQ6tRef7z5yS3JBkMofDM9NusnszFYoDkSO/2B//14TlmQWdedR4+lx/pRDIgudJXGojQafYVbrnyq9PXVq/6I3/AIO6EIVzfJ0P6m3QhpEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333519; c=relaxed/simple;
	bh=PwwxKGLfVt4uIzhG+nW45gzD4DREaCAJHFYmbW9vFuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KD93EO41cjBhgCylneYwRCi5o8d5rhLw20CzwrU6x05QnBaGVwopDwMVEMwMMb3LUcPFodkswK7gj0qcDfYvlYA5WcCvd3+se6ywBdmM+DkXhV2oLk6pEphadrwNlWbY8+JLhDJyuWC2DGI+cPoRU53Oj7EUKMWB8Vo+5P2R6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmq0prK8; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5607a240c75so4309941e87.2;
        Mon, 08 Sep 2025 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757333516; x=1757938316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGIqTfiCgUOw2OrpuXsfg2pu2/xENru3s7eFwZpdpBI=;
        b=Dmq0prK83euXaCoAfiZlyRIno4y7PtVNYD9aWnN2cMQ/NfvafLt1YD5LCsulFa36tV
         CS9SDGJCTLkBTuBwhLEO69c42XnidvVsU702ffmyFkqD+ya5cfTeDKZWiI8k3uCugWXZ
         dcbIH21FYqUCvRFYyZy3v9SARUaNyBnfSUWw6oPhyZqFoldAv3qULbNcm2+VKsdyvT3c
         vclC8BdWvmPQvDpFDLqjEKmOXj7SD7GXnaGvME/OBhDWV7H3NmnJkjBjujoBBNjwy7fV
         HUMRWd9wLYsxQ5RiX88B8q1dkVnSocFnZNei97HPVFvme7Dsh30CePqMlZipqcIXu23n
         vOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757333516; x=1757938316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGIqTfiCgUOw2OrpuXsfg2pu2/xENru3s7eFwZpdpBI=;
        b=byDJE+Gu0BUPP17xfI/QpZRPmTfnDzoZem3o9095BioaPQCG8vMDN5idD3yqJTq9A8
         8fmXT1yK2WddknNKaAZ/M2vU7ZOWJqqaZNPpIyV9yW5K1wYHoawfzm2pxSjHDZY93owb
         1nO8X4DnIRT93qz4M/5ttuwH1OUNYhg3rGaGtxMTVH3F7j36Pv3e4Cd5yZHh45jNHME/
         Idr+SDkgTgiZXupQglP8bkNNa7mWlfjy7olWvIS/Nl0eMNkmaeUJkUwopvtq6pnn3/LM
         Yv9tWfyDiUFLe0PIZN8mQTIzr/Zl7s6Gx6etTtQTfkCu9FY3vRKb7Ziq1gT7Hxfwf4eA
         D97A==
X-Forwarded-Encrypted: i=1; AJvYcCVAZs5zDQ7srJr7e4QQrT1RoLmibw00aut6bnlt9vWQmT//VAbFDJbXNdgi6G7++9eSX+6rrxtPoKw=@vger.kernel.org, AJvYcCWDQpIYdkyXpOuUOeYNpl07XuGbdXLjecSQto/g0L57m7u2+p2S62WJ3dFEj1HnT1wM8k50V53NH6MFGFJj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zFblkfGzzrctKbbYwHtNj1O+P/8ESf0+uffGnF8tfppIiEVr
	w3LgWSC+mJtdX7PiiEYCaHvmMpZ29owGx90VONPNWCnv3omP+dZ16we1ZDwSbE+vHI2PpA==
X-Gm-Gg: ASbGncvaUHpfikdIPONu98kbW7b8ND3vwWKsMco+sWMsPUtzzyQJxRUxCr8jPB7Cs6g
	GOCQ3zM4Obnef8zYOt486mN36MZiTYzwB8ayNu+3Gf5W1ZScc+Xv5COuTzXW49xp0Es8yJBSkCM
	RK+6wtaGE1J7x2dzX3mBgQl2A9a5c7Ri3Q2x2X3JGSQUdvhQge9GbGucCTAPnZsl5yBzcpLotf1
	3WKkY1pO16uASl+gCEq4kh9R/Tp9fSpIRBnTslx400sUtRLFKJnzK/qNHryihN47Q0KrSK1y89e
	aD7rIJKlblvdC4JJHji3/6v/nM8tRZVigUMh1Fazmt0egVNQfOC2gIgBzHqMBR4qNS2LSf+L8aY
	Nagj3PYtI6lrpUHiWchph8Pzuk9xYdxP/rMgyexE=
X-Google-Smtp-Source: AGHT+IGqDPFvEpemRKPbrSA6WbGN/lMNtyNud8Sdfr8h9nkR0+GJ8mjVZCwf6E7Kc39/Poufs4qn4g==
X-Received: by 2002:a05:6512:220b:b0:55f:6f5b:8e65 with SMTP id 2adb3069b0e04-562619d7fcemr2361565e87.30.1757333515395;
        Mon, 08 Sep 2025 05:11:55 -0700 (PDT)
Received: from NB-6746.corp.yadro.com ([88.201.206.77])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-564572ac136sm1110235e87.69.2025.09.08.05.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 05:11:55 -0700 (PDT)
From: Artem Shimko <artyom.shimko@gmail.com>
To: 
Cc: Artem Shimko <artyom.shimko@gmail.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] i2c: amd-mp2-pci: Simplify PM code using DEFINE_RUNTIME_DEV_PM_OPS
Date: Mon,  8 Sep 2025 15:11:51 +0300
Message-ID: <20250908121153.754120-1-artyom.shimko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202509070541.ilqlMkml-lkp@intel.com>
References: <202509070541.ilqlMkml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello maintainers and reviewers,

Fix build errors when CONFIG_PM is disabled by:

Removing #ifdef CONFIG_PM guards around suspend/resume function
declarations in i2c-amd-mp2.h

Removing #ifdef CONFIG_PM guards around suspend/resume function
assignments in i2c-amd-mp2-plat.c

Keeping the suspend/resume function pointers defined but unused
when CONFIG_PM is disabled, as the common structure should have
consistent layout regardless of PM configuration

This change reduces preprocessor conditional complexity and ensures
better code elimination for non-PM configurations while maintaining
build correctness in all config scenarios.

Thank you for your consideration.

Best regards,
Artem Shimko

ChangeLog:
        v2:
        * Fixed build errors when CONFIG_PM is disabled by properly
        handling suspend/resume function pointers in i2c-amd-mp2.h
        and i2c-amd-mp2-plat.c

drivers/i2c/busses/i2c-amd-mp2.h | 4 +---
drivers/i2c/busses/i2c-amd-mp2-pci.c | 9 +++------
drivers/i2c/busses/i2c-amd-mp2-plat.c | 5 +----
3 files changed, 5 insertions(+), 13 deletions(-)

-- 
2.43.0


