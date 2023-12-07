Return-Path: <linux-i2c+bounces-646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0A80893E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327E01C20B91
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 13:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D062E40BEE;
	Thu,  7 Dec 2023 13:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d29IBFFj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EBB10CA
	for <linux-i2c@vger.kernel.org>; Thu,  7 Dec 2023 05:33:45 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33330a5617fso951146f8f.2
        for <linux-i2c@vger.kernel.org>; Thu, 07 Dec 2023 05:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701956024; x=1702560824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOjuvQ1knDsOf99mi3hFggOSmu3Whc7MN8Fp35NQ1P8=;
        b=d29IBFFja8GOlr7TD5iaQ1dAGpzoPVT7meFpiFFPx5MK6N0VwJIBYd7EB+PxJDc4pF
         KqAW9oPgnS5BRlOTVP6BpR9rDYzETzBB3J3qJdKM82fGOqjTg6fX7zYraeUaT7GxCQUa
         QK1y2zxxynWuBEXYANutgdLUoYXl/KudC4/RzdKEa0ogZcmlZgdVIoZxv4gfzunrl/8h
         6vKlMYQbYEhjdtxzAOT2c/KPpQSCytYetG7RIMk51cs+t55oMXUl3zMh+sBgkh2RwbpU
         tFxP3IuZ0GcxY8NvvPHpNzR1H60k1+enzOjvj7bpyz0E7P+SpI9fnZMxcE/1LMN/FFWD
         0xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701956024; x=1702560824;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOjuvQ1knDsOf99mi3hFggOSmu3Whc7MN8Fp35NQ1P8=;
        b=K5xwmIq6n+j9HmqzKN5m60yzOl0KKN/18ZEx8ejVSMzXCu99Tivqg35vdd7FIzIs/d
         2OZ+wX6XqAz+f62pAb1M8gBRm13YE62+7P6T3HUlzJIbXBuWllISMBEWkh37IDcBCcte
         iXtsWnZ1H3FQd1vtbPIvUtp3wngNOtcyG7CyBlmK4KaMh8xZxfrJ9Kgfd5hLDMFtj/Mb
         1KRxOwmRJRfyIjRirFOc3E72LVm452IbYnWbEhuvDWnfpqf+efG4EI8t9dPS4s1uaj4J
         D/MjVi813Jpf7kDIRGz4qF552fUeL0AgmLGiF8iViH1Sr8rAWBohKvapYYXbP5XdzVba
         Urnw==
X-Gm-Message-State: AOJu0YzZ2Vkzx7Cb9ORS8n9NVc6+jmGLSNi+Dkainf7l3bu1i/ERsOUc
	sXg7MG1YhnKcBDINkfUCXoYr/w==
X-Google-Smtp-Source: AGHT+IEl9KbxTbmb8n+WvISyxYm/HTeQm70dDUbz9cfV9RUKa1Wk27SjB9FMgD9xanu+1rN8Jo3LOw==
X-Received: by 2002:adf:ec0c:0:b0:333:2fd2:5d30 with SMTP id x12-20020adfec0c000000b003332fd25d30mr1678939wrn.98.1701956024085;
        Thu, 07 Dec 2023 05:33:44 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id p6-20020adfcc86000000b00333371c7382sm1471548wrj.72.2023.12.07.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 05:33:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-fsd@tesla.com, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/6] dt-bindings: samsung: continued - add specific
 compatibles for Tesla FSD Hi,
Message-Id: <170195602173.92721.14927713507913101589.b4-ty@linaro.org>
Date: Thu, 07 Dec 2023 14:33:41 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Tue, 05 Dec 2023 10:22:23 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> I propose to take entire patchset through my tree (Samsung SoC), because:
> 1. I already took similar work this cycle:
>    https://lore.kernel.org/all/169997520487.6747.17671551558724027958.b4-ty@linaro.org/
> 2. Two new SoCs are coming (Google GS101 and ExynosAutov920) and they might
>    touch the same lines.  It is reasonable for me to take the bindings for the new
>    SoCs, to have clean `make dtbs_check` on the new DTS.
> 3. Having it together helps me to have clean `make dtbs_check` within my tree
>    on the existing DTS.
> 4. No drivers are affected by this change.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: i2c: exynos5: add specific compatible for Tesla FSD
      https://git.kernel.org/krzk/linux/c/7677fdbc036b93a882f660ca2484a6807e72f0be
[2/6] dt-bindings: pwm: samsung: add specific compatible for Tesla FSD
      https://git.kernel.org/krzk/linux/c/edb32ec3cea79b518e6af841ecb01c839818f562
[3/6] dt-bindings: serial: samsung: add specific compatible for Tesla FSD
      https://git.kernel.org/krzk/linux/c/921f4f1db7f5bf6798349db8a4382c032f144b98
[4/6] dt-bindings: samsung: exynos-pmu: add specific compatible for Tesla FSD
      https://git.kernel.org/krzk/linux/c/54772f1d61cd99ea1ed0febd4187bf24ef63bccd
[5/6] dt-bindings: watchdog: samsung: add specific compatible for Tesla FSD
      https://git.kernel.org/krzk/linux/c/bf1e24c5330af06b2f7f1a166a1011d8d48e8651
[6/6] arm64: dts: fsd: add specific compatibles for Tesla FSD
      https://git.kernel.org/krzk/linux/c/5f257922c5948c58669346d5cda371632108f266

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


