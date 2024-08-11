Return-Path: <linux-i2c+bounces-5287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7027694E2C1
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 21:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4EF281434
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Aug 2024 19:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3024615855F;
	Sun, 11 Aug 2024 19:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0rRvsfug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988F14B96F
	for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723404439; cv=none; b=sy6lz5aFc1JTq0WnFYT6OUbCll2D3vj9HGRQB93SENMKaDgM7uitglkaFKKWg0vYISHv+QmjZJl7Lm1wbe2UNcgLJ/7lCvLY+vOQ6hiSeC47jzSiourH+pO+QfxoDgirAy3XjsMJq4/SGDt1cl0z6E6Iy3C+whQpw7cdBivOCFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723404439; c=relaxed/simple;
	bh=fCMtz0tuHOR4dScOQBteNQbide3c0rC1YBKQmUX5DnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QYWvfUdELjGJWu6NEhaJjUfOTNUbnS3SgiXccgeM6uzu3aBvFZ4TViQ3quikBFYkTRrd/xUX6Jp5+DHgfz6wcvqp0KFXPiAjTdQUjCQZ8IuIE8xwY9JDB9TIeF/DNO/4XV/P2YC6nlTLi9vfTPv5FcS6ZJAtcazwrW7V97sJjp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0rRvsfug; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3687f8fcab5so1903559f8f.3
        for <linux-i2c@vger.kernel.org>; Sun, 11 Aug 2024 12:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723404435; x=1724009235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi4pCNP1Gdr9h0T5um8ZgiG7jkuJMsbVZXb0oh3Hft4=;
        b=0rRvsfugDJv6Q2bwnrcxrI07Te9szTqH9lP6AQX0nFozBLLc6scN3kD5VDmKlIRiiQ
         8RCEtzadsUavkwPOGRFIn7Dy54nA4eS7QxzHkHm+7QCXXJUljVqbTBTdIFqiEHKr7Hjt
         TgxKuY4pH+qIlm9542kb3x4rOhaa1L/F98uKMRxwYBDUPcWpjDxSad+u5DP4rYasmbOY
         O72Owsi5n8HUgIgUkJ3X1DPTY8pfsZBDS4KD9G+UMmVRvK33RAjCBcDJo4kj2G/OWD6M
         xZ0NAzzalFBT1XEdF2pFQgfUwZG2Ge5XdOiMl6L/95Rmpizob4dfJxrXu/68fzE1I5fK
         3BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723404435; x=1724009235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi4pCNP1Gdr9h0T5um8ZgiG7jkuJMsbVZXb0oh3Hft4=;
        b=tTp6APTuY5puWqsOAZmG9e75LiqjSQ7BH6R61KMomEl6jAnx1MjJmPT63uV7MFjYUc
         B23Muwtg7eylEDKP0NJ2rkbrwYax7A0Ny8s2pEnpqs+9aYM8N9Vm0QIrU4EXMr+EzY8/
         wUy5urvB8smJqLByTDCytKMT8fyXjmRCp7ChT6DPEonYHTroR7Oxt8LxRsg4bh9DsJEg
         WytX4GAUdfIiTganEh+i4AF7JiDF7fcoXk1PqhaOfXgJBkaF9GhidqoC4GGwrxHX9Ejz
         5JXCXJgci3Kmd4cP3Qy/r6IbKKxzpt1UrsVCQB2oOXCjqbTfr7TCvhx7ZMI6AWGrXWe7
         iEkw==
X-Forwarded-Encrypted: i=1; AJvYcCUflYO0btJmbiYv1gLWZKMxvMvhNitmgLRlqHl03rQenXS5YUyCbhbfBaGimn9P07cp8fOkt2MRqXJ6nNZrUkIX3Ea7l/4VKXt5
X-Gm-Message-State: AOJu0YxbKLmoeBIvUk5ec2TTrLDaM/cr1507jVUoXwaPSK/v+drZAi0+
	UOsBAJfXGfcWkSdI8wdaUvkbYHA6J+Oz4oUgxjsF5TAs5v/cM0lZ8nqw08meOMo=
X-Google-Smtp-Source: AGHT+IGagufT2xNn/QKQu3bmVrV6jU72TWeF3FBl77gAzQllDDZ8/5qNg/Q6eq++X65pc/tFy4d3Pw==
X-Received: by 2002:adf:f349:0:b0:368:664a:d4f9 with SMTP id ffacd0b85a97d-36d5eb08646mr5681407f8f.28.1723404435210;
        Sun, 11 Aug 2024 12:27:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6978:7b03:bbeb:d1af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfefe71sm5552517f8f.62.2024.08.11.12.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 12:27:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ukleinek@debian.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A
Date: Sun, 11 Aug 2024 21:27:13 +0200
Message-ID: <172340442666.7060.12608274118090495917.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240810211438.286441-2-heiko@sntech.de>
References: <20240810211438.286441-1-heiko@sntech.de> <20240810211438.286441-2-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 10 Aug 2024 23:14:37 +0200, Heiko Stuebner wrote:
> The gt24c04a is just yet another 2404 compatible eeprom, and does not
> follow the generic naming matching, so add a separate compatible for it.
> 
> 

Applied, thanks!

[1/2] dt-bindings: eeprom: at24: Add compatible for Giantec GT24C04A
      commit: a825dea2cd27a30e49816f18b7bc16545d5f0f89

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

