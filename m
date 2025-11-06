Return-Path: <linux-i2c+bounces-13994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A33FC3A7DA
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 12:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 690095001BC
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AB830BF67;
	Thu,  6 Nov 2025 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X5bujq0V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4763090F5
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762427382; cv=none; b=Agr62Az3YOkDzGfA9nOUPJSFIcMFPsI9d6Tre+mZp5ifTCcCSP/W6gnqxHGgBy81P/APu4vlLDJa9Z6hfOfRHCqqERN/qtfuzUrIKC2DBocr1WZn2Q1boAh2Naaj2VR4oRhYkhQVjs6K3YrFEuCN4HgZ23kV7LIDAFKBp3ej5zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762427382; c=relaxed/simple;
	bh=D6MUO7W6K4aiFoZK+kBGR+3MGc+5N522t4xFoo/2dgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjFusZL8uGBzkv/sYjykmxYjDoFCkUlWEtYmzfc1J7AE/wYTa1/EUBsZ7eoSbshx1ncsYqNOhJ3hKHiwaLFewHI+47Ftxl6FuE/XxhmjGWB8KTykhrh0nUDR7NtEeMGZWS8sjUPIGrgKy22DIZXt88RefOtfeKDz2fZ9dybvS48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X5bujq0V; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-592f7e50da2so1049421e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 06 Nov 2025 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762427378; x=1763032178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6MUO7W6K4aiFoZK+kBGR+3MGc+5N522t4xFoo/2dgM=;
        b=X5bujq0VbSS63g4UR43z9HjbkT8AmzFQmZunVdcRMJwxGma1Kke+hNH6pK6JGiqQx3
         2836isB7DQNwQ0sjzpoyZd4RHbrpuJJYnlf0XyPAhig9ZgsbKk9XVdoTVUK98ZxyulA7
         lojuT9FVw9QU88pu45dSuEZFBBCvmiji1nC+Of/+7bIgDpTR/debR4r5PKSeKSxWQfFq
         mhmqVpwCnW8I/Kz8pCjuyuTj3d/u9owbPbxECMN5aWL+1P7xWroMLy8Mh3f0QRlzfHTf
         A0IFbAcSLFG2XqLmBEWvnca/N0Ugj6yW+erZUxtiXAEGz+US4W+Cb8ICPNhbV61opybh
         bRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427378; x=1763032178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6MUO7W6K4aiFoZK+kBGR+3MGc+5N522t4xFoo/2dgM=;
        b=fP3zNA52Rcrcq+zqKieNcXQhdvhEwkMMQoURmZ7/HAmcPTCTWlyZaLSUoSn59DeFjx
         3P2PNgassJR2OxPUpoXeFFaNLDyj18EYxGC+GyOZnzVc/jU4GT+T8Cg6QiBuFKl4eEtM
         gtifr7OxQeR681Ydnn+reD5twCxbttg+Y/wvZ8Cj/8Ud5ALYwIy7mxgCeoNbiUGlr4Bn
         gqWMS0PIZ/dxx/7BmNpZ/ZRClj2cxAqVL5VLhsUWZDSKgpSY5fEPonzxWsV2V6dQT/n+
         MepWdeP3NDZETARRhKbz+5mLoyaUvbi+n7PcM69XB86egwdmjoTS65uWyCMSgiz/vKQU
         hEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+2CvyFPmqQnFB1IaWFeDxwkLwZRv2yvfxf2pMI5pbMZXmDdnBfKfB4RB1wwWTb+3PSi8HMPFpNmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxshINIfrfjjFlNELEg67E/iYJnqxW3pImfVwBDpN65GylAWN1c
	3Z9ZQ8o1AvXT34UU9Q2saClfBYeo0EdUU1+HU+ZIuKDpjn2Km5VE459R
X-Gm-Gg: ASbGncs7X5JPVUJu/v+jKCA1rXH0PYdGkeE0nwmtxwlmZIe1CsgYQ9Ntk2Wm2P4byBt
	fzg8cXXdUaPZdWMq8IHcI7WTdg+Kcje8LVQcERiLLHCUn+hBu25C51Hi/WawKxqMLkl3XCNcuMC
	tMs000FbDKhvn5N2noFmT7ozfWNifKRxJvkf4cOPxquSkQ0nnCOQRK/5oya9snYghxBcf3DBnps
	mCN2qr8a14TuA+5f2NNKXlXs5FS4+D1q5ilKIg6WbRUtb/ksefsIapn7I80L8gZ05BmosDVkwoc
	6IxjmztXtT1gZGu9H+5ffOA0DCQwjlwpkZM13R0s7Cs2Y3mUBIm7/ZQRKRcuYNxv3pLrlxxfNUs
	rmIC+yIGDZw1ztIlv3rNV9bFHc+O/cQuUqRZv1UrbeBoFcHOZhQScfVgDLjkEFdF46dk5SbWiFW
	p0dIWUH944kf17y1LqlA==
X-Google-Smtp-Source: AGHT+IHg7YfzZvEtN6mCngPjh3XRjwH5HKG3Rq+sq1Iz6laR/FfiXWjxHYGZW5Q1gopMiO+TIMUcVw==
X-Received: by 2002:a05:6512:118d:b0:594:2c42:abd4 with SMTP id 2adb3069b0e04-594493090d3mr889484e87.5.1762427378302;
        Thu, 06 Nov 2025 03:09:38 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a013af4sm664510e87.3.2025.11.06.03.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:09:37 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: andi.shyti@kernel.org,
	jsd@semihalf.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	Artem Shimko <a.shimko.dev@gmail.com>
Subject: Re: [PATCH] i2c: designware: Replace magic numbers with named constants
Date: Thu,  6 Nov 2025 14:09:35 +0300
Message-ID: <20251106110935.2563071-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aQx-BlL9PjHeR7Dy@smile.fi.intel.com>
References: <aQx-BlL9PjHeR7Dy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mika, Andy,

Thank you both for the reviews! I'll prepare v2 that addresses all feedback.

Best regards,
Artem

