Return-Path: <linux-i2c+bounces-7499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5349A9AA5
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 09:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D489B22680
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 07:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39331487FE;
	Tue, 22 Oct 2024 07:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ITBx2/Io"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D101487D1
	for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581243; cv=none; b=QUDzVYsd9Y9XIPem8/Ykd5UkdeCASkZpN7cdq8+8G3ATZMvfSfnzxi5Kw7HTiWBNhKht2YOhWym6I2RSHgFD1ouWKFNM9HT7gkv8mxaNdMPMN4ILy5BP2p3qsAHG/IoneZL/8jDyIJ2BlLvGl05q+2MFqtRTTme9AxGRDDeXukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581243; c=relaxed/simple;
	bh=rg6eNn4n7KKuhoN847xjNM4A6AinYmC7pL0O7ui5KnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHHeB93Cxw8+vGGxDXiYRJYiU/NC+tUFzRHVcUZ86SqQqrjAB8DG6EF0+THo+FR+K/C3ZOzxlc3dPNjIkxokE0An3RhmhCE+yqYfE5PDM4pcTmpHdx2dh0FlzDOicYDAXNaVqQIfMY2ZBu/razlbT0QrhAzXAB8OjeXqFEY9QBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ITBx2/Io; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43158625112so51968805e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 00:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729581239; x=1730186039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DpZoo6yO9Hfgv4N61HzJjjkVfEBeub6eC9TjyXKIOI=;
        b=ITBx2/Io9mEbD6WDkZTeUX4+aOAYx5BvH/ETO2pCP5rRkHEt6p2oSU7wbMlXbtkkna
         iFWXmA0SuYpEXQwW4NG2NAmzVf03qkXG/qtXZmwVKPLi9fjtRTzhTL684zUHDhk+H0H9
         wRrcTZIKv2XDXNMWJJ1KTepFET/hRe10uEWAOYB49lMtbPYG2N0K3o0wLNwU7/LWqBxy
         2a9U3zbceCPt9WlsoPoOACu5OlpB6mYtAoShwTImMzh6KhEPSTxD/+BDG40ezFPxBFFx
         GrsaUiNY56iAR9ePNs1O/mqHqkxYmn623zDTY2ghPTrCKJfcQLV4LmSnfy3KHW6dtg8J
         Ib0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581239; x=1730186039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DpZoo6yO9Hfgv4N61HzJjjkVfEBeub6eC9TjyXKIOI=;
        b=HDau4nbkUcXNUV61psWHVi64MzExJGOnHUZLO4VEoGQdhir5zsBM/nWzi3ZELZvf+U
         bWfH0mHJW8xNPVW+DTS0H8JtFtsZfv6l0FB6sSlxPw0SN6QieJgPT7IqoWDCX7jAtBR0
         NptzmnLAOuI9D95on9bhivl4iEPdJy66jVhMCmcOysiKyscJ43mV3BU3/ShrW4/Upggh
         YskbJ7v5CvnDzKyjtZHTS1sVkh2/fNcBCuaOBNP99/cH8sY9KaZ9ia6Ixe7XTpblOah0
         2AkVX8NyNT1VsW7MbIwOLiz30Dm0rLybFfjHDNQf4bpDKMRSatNaeAvpAmjqOONKl9Kl
         KeDg==
X-Gm-Message-State: AOJu0YweQXHBbDuA0A3o7olgeXnxOJNYktPwT/jGnh3l5sz6RCqfwh6R
	SzvFFOTQZaFJkdWu2RNbl58u/bE/3MkpUqSKg9u5Y1T05bjEt0GXJsuLwZDUuxQKjPlXkaTatfA
	c
X-Google-Smtp-Source: AGHT+IF7poMWB5wXDFbQZpRfCv/lvFJvmJjWztGtzS5HoWO0iyjQWrSGbADDmRVBaQjNId/3pravTQ==
X-Received: by 2002:a05:600c:3553:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-431616a3c1bmr112210255e9.24.1729581237606;
        Tue, 22 Oct 2024 00:13:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c8b:c7e5:66f5:b8f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ae36sm5955801f8f.43.2024.10.22.00.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:13:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-i2c@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write lockable page support
Date: Tue, 22 Oct 2024 09:13:52 +0200
Message-ID: <172958121344.18422.8336462727519958263.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241017184152.128395-1-marex@denx.de>
References: <20241017184152.128395-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 17 Oct 2024 20:41:25 +0200, Marek Vasut wrote:
> The ST M24256E behaves as a regular M24C256, except for the E variant
> which uses up another I2C address for Additional Write lockable page.
> This page is 64 Bytes long and can contain additional data. Add entry
> for it, so users can describe that page in DT. Note that users still
> have to describe the main M24C256 area separately as that is on separate
> I2C address from this page.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: at24: add ST M24256E Additional Write lockable page support
      (no commit info)
[2/2] eeprom: at24: add ST M24256E Additional Write lockable page support
      (no commit info)

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

