Return-Path: <linux-i2c+bounces-9685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89240A4BDD6
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 12:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16AA13BBDD2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 11:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0EA1F4299;
	Mon,  3 Mar 2025 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bFaaqw3Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF71F3FE8
	for <linux-i2c@vger.kernel.org>; Mon,  3 Mar 2025 11:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741000066; cv=none; b=mztB/1XT2RR0XubRD5xRRQW3MKwLQ3BBPuB+ydbfxLdBZBwuauCYyncr55mX5xFHjGAUTeekAUL1cAhaiITANKxUHzbrXzJvHpcDrilUHra2h2OyCV5fBD4DCtkarxCmoQgfwelkCRDDFdwAo2UA7w6FGlPKkItIIz9en5uYGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741000066; c=relaxed/simple;
	bh=1GgecRLa2f5MkYVd5GEY2hn4u5tEWq9NVu34El0c/8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QNkBSGx4+mBPCVb9vIsY9l0PlY+/jQYrn+9BOhF50K/iW4rvMu2vtAW0gz3hdTAH5PAOv3p9tdTah0BqtnzNMv21ErsWcwnd8SSHaq7Q7j4EKB+KX66T7aLvEgz63ptbqp811P0NLi9QS+DrYWEtnLIBV9zR/F2Fa4bpw+Gx20k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bFaaqw3Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27020305e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 03 Mar 2025 03:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741000063; x=1741604863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR6klagFtyciqTScqCxSlheZkToLksMe/ghF+ax1bKA=;
        b=bFaaqw3QdAfnuFGuAvtD1FNPpvOGlXqwPIAePppTseM4vLJMn2vMeKzPIBtgwgdVLZ
         No2Xxe6Tj5CLYoc4y7NJVgPMh9EumBiFNamHzJPBFNqpUb11T/4dLt2Mp1pVScLvxBAP
         KGSV8EbFPhyClemSbjJatilzT7C4yXVjaezDaAS3oSlvHp5PH1X2WmycuWORbp0W1UU7
         a7w26gElvlgEjAWznMQXCXpMDjUUr9ZuLP1UQjugX2NTh7W8wvuOztrSY1lr7NlAC963
         SzbNRbgjV66bM5jb+VCc0N32ZFC1eoJR8PVVQfnBoKt5L2j65b//WYLREzLnQ3EY8fa/
         RAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741000063; x=1741604863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hR6klagFtyciqTScqCxSlheZkToLksMe/ghF+ax1bKA=;
        b=X0yX3c/XOSMUXCwEBVFGCDeqbU9X61nyNhKlP+4PE8W8csVnk2nxHSivpJ+kDuJXQH
         fV/MvW37FliohdL0sN0laVPBTyUaCD8vcARX4JdBp6EUhppfexAwYNgoGFV3ilfsVT0n
         CqbX1v5dPqh1Aqfi5yceWn0u363EH1g+GN/gZ8VDcW4pNQCT2vnUHZym34wopyQQDXVy
         +/Z32izAVh7EOxSvmaobxvkXvYlTutoHpjFal0HLIBWzphV6awvfYct4BZMDxT1pV2r3
         wIrT73b7oWMhkOGUh8FH6D+0b8PRWQ603czUJuC/CkaIZZM0lsmaZwyO2Gguslre3nkV
         EFkw==
X-Gm-Message-State: AOJu0YxqSan+BRWkcVq4VtpLbxyQNJXjEX2wlGShp4EuieCecOmoHCft
	1RVCqasfHDtATN5eKe/YMVF/oziThKDY74VuzBa5pp9dfAx+tWAtwvLHEuBj/nRV6k8Tavz0v7J
	O
X-Gm-Gg: ASbGnctonUe2G8D9gbit19lfGBhwW3m4cBWhOtFicYfMTNV9Xwwu5iLp3XOXn9TvcUq
	MLjLZssuSXPtkpeLoGzcYi28adl+S6K3JQf4ZU3F9zX6/u5Q4uFz2rAShF5UP4x4zava1pbNXeh
	WHRKG9jVfKC2e9dQR+K8gGVNyQqmcgSLLqJanJv0w1IpizI99wR0bkfJ5pbO/XPDNChKFDlrJ1o
	W1/FL+qcivMAIVuxIUkz/Z8rKg5Exk87B5nb4PEW2CwJqD9qOkmITnoTsQWwMRIowMLnqLzM6wL
	xAF7WxSHBrknpt5c3bfjt++/Tl4Ohgb2XGZKHH9nE8GL
X-Google-Smtp-Source: AGHT+IFBGs8EDHlTN+81XRenAyQXyDufJuVA47cl0O3zAj0oS0wkjJQ0biMXNxnI2ZLtaTTO2C/nJw==
X-Received: by 2002:a05:6000:154b:b0:391:5f:fa10 with SMTP id ffacd0b85a97d-391005ffbc6mr4581143f8f.24.1741000061418;
        Mon, 03 Mar 2025 03:07:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6a87sm14344403f8f.32.2025.03.03.03.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:07:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
Date: Mon,  3 Mar 2025 12:07:39 +0100
Message-ID: <174100005548.29353.2871325520350905330.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
References: <20250225100838.362125-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 25 Feb 2025 12:08:38 +0200, Andy Shevchenko wrote:
> These result in a very small reduction in driver size, but at the cost
> of more complex build and slightly harder to read code. In the case of
> of_match_ptr() it also prevents use of PRP0001 ACPI based identification.
> In this particular case we have a valid ACPI/PNP ID that should be used
> in preference to PRP0001 but doesn't mean we should prevent that route.
> 
> With this done, drop unneeded of*.h inclusions and __maybe_unused markers.
> 
> [...]

Applied, thanks!

[1/1] at24: Drop of_match_ptr() and ACPI_PTR() protections
      commit: 51e36ca2251c5a47d8f7069d60fd07153cff3f36

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

