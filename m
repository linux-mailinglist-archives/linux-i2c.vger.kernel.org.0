Return-Path: <linux-i2c+bounces-7955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 004149C7776
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0571F21F25
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 15:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A5115C139;
	Wed, 13 Nov 2024 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Rzsn1zz8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0B3139578
	for <linux-i2c@vger.kernel.org>; Wed, 13 Nov 2024 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512368; cv=none; b=Hi7U2Jf1iZc5izmhAwj4dGL08kbXCVU+AzBIQbY3JqBmQC40fYnhZmUyVl0EeqYChevhVoF+ylbNN39YTA7FMkItBRYyTEBBC2bXZktNwoRnoVagYvbUJKN0CZqVJjWBwwH8lv+1mCwAB1hqUsb0u+RtJbAyFzv+hV+uEcv7QuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512368; c=relaxed/simple;
	bh=xAWJcl+eo8fDG63BX3szgOn6IaJOIPMK6Bb4yZDvNEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pmbZo4MYIZB0y1mYlc4ChxSnMflAbjsR+2mq2kkprpw8kYiNK3f7FMM1SwVQu8pVJs0s0PLiGxbofFk8NZ9JBRTp7iGLBpuAYFHgNLwNmAu40cXodmlKYa/2UO3oTIVXe3z/o9hxSK3A6HUrDDh0tFG4iENb/4F7LyFhidfMFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Rzsn1zz8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cf745608c8so109621a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 13 Nov 2024 07:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731512366; x=1732117166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJEl/Mmjz/g2W7QrHkYPcZb6PPJpxdKufP7Duu2dNVc=;
        b=Rzsn1zz8D7TT7QX9e9vkHZJOYM3ed/7eoQJjnRVfdvtagzRbeo4Bl8kZIkCcL/kK56
         uegoCuAFJegeYki9wUYf/Nl+m04rSqQGdXzCSudTarkvkdyLRSyPk2SjkpRx1YE3C7mk
         1z/1syFsZfV5iz3bLjvTISZmR1KhWK7XFU2bh/hRgDwXPcrs5mFZRFRExrLXsA1YIxaZ
         PuNmrINyVXifaPhYkfouoswKyJsVSaRz6wImhuAS3ReaqnpJQZ6A5yUl4pRIdC/0+od1
         waIaa05RA03H6haw29zChn9RF/eF17Ci3A5pyrbLHDNM6z6VzZ7ebcpJaR7d+6DFJpE9
         fwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512366; x=1732117166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJEl/Mmjz/g2W7QrHkYPcZb6PPJpxdKufP7Duu2dNVc=;
        b=vMaiQxV4cuakVKzHMf8S9PpBMZXnwa2zFHFy9TQUIEms2wxyGGFbfT7TKyfMTeD+i6
         GJ/gjDrtv7k5sbvoTac7vRb4vb6Efc1EPZdKcBhHvkX1q7pgMYu5xVbIZIYORZMxa1XL
         FhypvmF8zyAUzsMJKtlHfzMf170FytECgO/VFc2MygoflAuewiwwRW4dosIZckOt4SV4
         O38xnJzXXUNYg2+CcBznkYNyrgLOEYo7OPG0To5m2rDLBFlfZ2kVoSicw77P+y0jzrZg
         /tuceeXUTJEbly1CYK63xbn6xGn93t77E+eFNMR+0Rc5VUTe82GxmD15V8aClBWL8Pnt
         iFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4A13O92ZxTVzau/ZOAQ9Oe6US9cLHGSBGSDCn3zrUc/ZOVfAsWGVXa8xzh2a53kNuBUPW1w/nqHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPb//80chhh63xWBtSoS5CEQGKmvH6gSoiGQomZbFNpHthqlSZ
	88rj47pqRjEhenyOG0nioTVEYU1hLBVoHHztlKI3rlSwCACywA6CH45jE157QgU=
X-Google-Smtp-Source: AGHT+IEH31trENazh65pWh+DuCi9K649WDgplI3ecb3+way3WoWqkg3GJ5Qx7vBZEHweQ+aIMZ3bWg==
X-Received: by 2002:a17:907:7e8f:b0:a99:f887:ec09 with SMTP id a640c23a62f3a-a9eeff39e7amr2164151766b.35.1731512365541;
        Wed, 13 Nov 2024 07:39:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:1b75:191:f7eb:da75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def8ecsm876882866b.152.2024.11.13.07.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:39:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
Date: Wed, 13 Nov 2024 16:39:23 +0100
Message-ID: <173151232541.92239.8233789832026323394.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>
References: <20241008160947.81045-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Oct 2024 18:09:47 +0200, Bartosz Golaszewski wrote:
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
> 
> 

Applied, to the GPIO tree as the maintainer has been unresposive for two
months and the change is trivial.

[1/1] i2c: qup: use generic device property accessors
      commit: 400913bd4edd76ef1775bfd95543846bd6f5ed71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

