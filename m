Return-Path: <linux-i2c+bounces-12881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996CB537D7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 17:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1363FB61F8F
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47FD34F471;
	Thu, 11 Sep 2025 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+wirtxO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041CB2236FD
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604772; cv=none; b=Ho1I6mHEj8sj7tTNiaGW0OPgFqvEuJ6HvHEhHLrXfV75h67aDmImx207dssvfzHh9lWXmpN7J1308Dz16dqngzyJVnV8qBsE/s4BJ46Zg/G82x+rTKlnzoChO8jEmdry/SVdTR8/DW97mdkuTkXztMeBonMLvjZIvKrCUEP8BCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604772; c=relaxed/simple;
	bh=9d5INW21jjr6oErj7y4Sti7BG3O8dXxCjtAuIhufDNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sHIuIsXWKrc14ROarOo5tI1DPzZTQyzEBXObHPwxkMsDJsZlqz7B6t5Bmgm6TfTdN1Rx/Jripi72a4/nIUb4SWfTf7H33UY6eco/FkRq7lpv+PlYVpTfXh73pSQ1n+9vUSZsPRLoJVM4wzqX9ZsHTbt0JlQUA9BU2VaHv3lAbeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+wirtxO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45ed646b656so2825555e9.3
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757604769; x=1758209569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3axJvgEbFXgxfwL/zVY/UXD8zhBqiTBNfyhVw2O5KOA=;
        b=h+wirtxOZcmfcGFV1qt00csoureoSJAWB0UhFy5L2Q3B0L/z0rcYinbD3Nfvd5j4/X
         oaUU0o1jA4H8hKIO4VE74fM14ZQrcGllHA7ivBwEBqz4K4KYPZW/JQlUCbiAbUu0QJwM
         qzToOgJOU6eGR8xtOU89nJtF16v1tpGsaAG0A+ToaVjSnDK8/XhhCQGL/UN3ObGMYOm0
         OHKdOJiACoxgXZqRxHboU3BJoyNo7hx7Rl2UtMTZhB02XaicXy6KzlgJJs6GByibqlzt
         KwF/ca8R+/K2z6LxvdgVzHgrV4GrhzmnQ0sb3cugO9PzOQON//+6+qoVi6LRYHIvpqXH
         gNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604769; x=1758209569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3axJvgEbFXgxfwL/zVY/UXD8zhBqiTBNfyhVw2O5KOA=;
        b=Zn4/GzqMVzrjZOSwlWZbrl5ImnjMnojvtkxe0spC4UW4MYQTWf1xsBjCDXuX9snUEg
         6i86inB7VW5wFBJ6YZ6hkIHua9r/H8ine6n65baXclXK6gKknpSbrwlO7Gc3mCINqM0Z
         hEOziM4rBt0nYcUbxuOXQiunkNC2k0X+X51jQv2ddQIxJlmCGKj4TOZ/phHRmhmj1+bo
         5ASZLdmn6xC5/URSImgQHZ5kC7WvX1IOHKoNlHlAI5D6lZ+pKN0zJ64+JDf2vCB/CplJ
         o+9EexGiQtAf5R+sumRcKvsyR+hZ5HwkrPdQuxfhZFVfb4LzVCdIVHWi+J0qjppFPnIm
         w9wg==
X-Forwarded-Encrypted: i=1; AJvYcCWXFv+z3cWkZCxLS4sOauPV/jHWpTfzzHViUU12Ao6z6sKQxFSsV9fB3dyKBYtrtbFHiGVZ/oSpkLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNziJ0FDHEV8rWBpdPV78IIE4FEWYYnMadDy/3BCd1EqwpNiS+
	QjcANn4heg74aedeHJAofn8s54dPOH1Riq+prBnHe2qLLnkRxyxB7eGL
X-Gm-Gg: ASbGnctWhg1EF1FHJW/QN5CmGS/bTc1//5gWUvcz+E1pTPl7TQTEcX7FwpanrfVmPSe
	Qam1mSaZi810bzZ5BruCg1ulzDxqQOVce64rzoJq/ws/TZP72LsR0rSnqKxDpUt0+QaeE3xR7U7
	AUJZYMSL57rEUdMrMKjCZBrpOmtDVFdO1kjphpRc0qVsjnErJ+m5+pGoRvnn6yb242PxDqkHCN2
	ILsX3134zkNACOCzoU5EVmdbXYkzeXgGRUfrGd7V459MgMx2tlfq9SBbZKK5LkoYYJFJxKi4mSS
	lXnOrtwa+vdH55TgR10Eqhjf1bL9jRWTeR2QsK1o65XFn05HLvygsB6rwJyOPyjNIzzj3BebnDo
	teshcvOjok17PFSts96U1WHxz1j27fli7XZuYZEbqL2P5zryuL1z+n//yj9Loe1RF0nctpgKt7v
	LQeZFfCzU0iu595a/NtZQTO5Us
X-Google-Smtp-Source: AGHT+IF3BLIq3kR/6GHqEPtT2eBTcLlyt514cWOzH9fOkQVX2eOkZCeyPsb05zloZHpD/Z4ENo6UCQ==
X-Received: by 2002:a05:600c:46ca:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45de072e878mr165182475e9.13.1757604769028;
        Thu, 11 Sep 2025 08:32:49 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3cbdsm29794125e9.17.2025.09.11.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:32:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: akhilrajeev@nvidia.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	digetx@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: (subset) [PATCH v6 0/5] Add I2C support for Tegra264
Date: Thu, 11 Sep 2025 17:32:39 +0200
Message-ID: <175760472294.2784204.8145431282909905411.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250828055933.496548-1-kkartik@nvidia.com>
References: <20250828055933.496548-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 28 Aug 2025 11:29:28 +0530, Kartik Rajput wrote:
> Following series of patches add support for Tegra264 and High Speed (HS)
> Mode in i2c-tegra.c driver.
> 
> Akhil R (2):
>   i2c: tegra: Add HS mode support
>   i2c: tegra: Add Tegra264 support
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
      commit: 804ebc2bdcc85f30973708835b47ee023a4be003

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

