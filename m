Return-Path: <linux-i2c+bounces-9302-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03DA2860E
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 09:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 712C27A6448
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Feb 2025 08:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F255C22A4D1;
	Wed,  5 Feb 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qsTZvYSf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B87922A4C7
	for <linux-i2c@vger.kernel.org>; Wed,  5 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745989; cv=none; b=GeB6efEf7JId4KhbOJDfQwCVlT9U+K1e515WRzKgkoAgiWc3WrIcD/nlaVWzV1YWpJD2gGReeeHpc0Hot1cJ2BWxWFMVwGZjBuO6qRx2c2hN4MYl4DhaUrU3cLvvBnrQyoRL3SKBswbMsFpV+befrKIVgM33qYgeCXbPYfzD9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745989; c=relaxed/simple;
	bh=4rdH6GrIXB8lz8HjYqpZ22C0ajtDCyflT20HUHPnBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAjsmQkhAvHlkck0JW4DdCxan8zmnEUTLPEGlVENMbmLIBgLP1dYshStz7vJvFpT0EwusVM+uedy7cKSuhjxKO5p/BKv+PtAwo3pukCdRppMZvI2BIABqmCGixvwHUmtvV792G5qB1XkrCe8jf4zfW4I0OhScYyLhMuty7E2wak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qsTZvYSf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dada77686so1296719f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 05 Feb 2025 00:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738745986; x=1739350786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=qsTZvYSfA2iAaSvNAmjNIfOyMh4C4XDBJbJ8lEHGaDffN7K8UItLD8F2opmcBQGBbU
         4OvshB2mP8fSP5DC/dJouuENaIueeg1zN1v/q/ek8n1EhT9kaJnL+pq0ESMyhS5QXApi
         u5nUTgUPgVrel3MlJQ8n1kSiwHvoJyVjLe4T6QDnA2cisHp0ty/SoTB6AN7jczb3zCVU
         GczYmndR+a0IXfCqlvWXB003PQn3wApz5cJ66kr0/dxfrsFZKh1x6TYblP0bggXNbHuy
         7te44fmlbzVnwfi0zPYVp7vTM2QmmM8Veoy47SGXZr0kCplpWUjfZefVgHl6JRQQ6Eto
         jEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738745986; x=1739350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=dSKxCPzwLo962c15eDm79GQ0osl6kvTvUJYCoy/VYaV87IuD9bCrkw46+gJ26re1KN
         y2vRx/QuwTV+zI7TCa1poX39vy9/M/BRfFePH/0E01MRDuJPsA7yjmSH6M9B9n0PCPYS
         rtCC++kgk4Yx1ZmjOuwPTYrObaeKvP1kSpxsGzgKlJ1Y+KkqDvoKhKGTtMZvQm7BECIr
         Ob2vH/I2Ca3b9zO8/leeSW9SwhbJKda5F8axrmYkb0iUgnY9gTckOQpYjSqwmwV2ijfi
         VpA/QgPX/8igSbae4Ih2xQ7krTdBZWc7tf/Kr/zE9/S80B194CHYfDD9iNi8Y1wABxDl
         UiaA==
X-Forwarded-Encrypted: i=1; AJvYcCUFy81v/H1jeKjiVSIK+290GQRatVEYofPEnKu0UDMmjB6GlbUIJl5XqyxIFTvcwk4syBAR95rQY6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YykjkD4PhFTX7KQx+pY2BM2LP0F58V+dw3p3b9Hfv5vfysEXFTi
	uDNTi2z6PoOAawR/1c/YT+m5GPtd0WM21y/NCJKGY6jjLleV3yJeRU3FgPyBEX8=
X-Gm-Gg: ASbGncsiuvQjhWaR9fG3069yU8Ug+EIZm+BZQioClYrmwmc7viv6oqUiV0pX0HwsR51
	YSy15QT3MMMyWrV7WC6Jub0s4nsObHBt2vBSwPrtoO1QCn24w6cFPt5FCuRoSHA/oIVkxMM+1M0
	k8OAANz1j4gOy45p/dDJ9ITkxvlfEP/3pQ/I1NAAf+oqYQn+Ag7vEmlQ+YipP1ZRKklyB1Qd9Yh
	cPDF3fB2EM12bzb7CGJS/VjWM1wavgDifbOcPHJqPNFz1Kab51GsE/j0ZHAecqqV2kzmqiqcNvc
	LIBYFc29EzbiRiY=
X-Google-Smtp-Source: AGHT+IHvujR6ocyaWXRib9FJP8dFsztpMFdYT+nb0yAfmtcuRsRIBa6C6+A4Dxp5o66bjEcIRw+i0g==
X-Received: by 2002:a05:6000:2cd:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-38db49009a6mr1396467f8f.37.1738745985676;
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a766:1fb1:99b5:1d5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm33940815e9.1.2025.02.05.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/4] sm7325-nothing-spacewar: Preparing for the cameras
Date: Wed,  5 Feb 2025 09:59:43 +0100
Message-ID: <173874597816.7784.10623106141376200723.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 14:14:25 +0300, Danila Tikhonov wrote:
> Nothing Phone (1) - sm7325-nothing-spacewar has three camera sensors:
> - Wide sony,imx766
> - Ultra wide samsung,s5kjn1
> - Front sony,imx471
> We tested the UW and Front cameras by hacking the IMX412 in our fork and
> they work as expected. Wide is a C-PHY sensor, so unfortunately we haven't
> tested it fully yet.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
      commit: 78d9ee370ed33cd8b662981fe1f47cff7b4f0e43
[3/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E
      commit: 03480898cefe9cb5ba921dba9304703f7574b687

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

