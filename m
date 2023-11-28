Return-Path: <linux-i2c+bounces-513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C97FC08F
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 18:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CD691C20C8D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 17:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FE939AFA;
	Tue, 28 Nov 2023 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6b5JWm/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AFBC93;
	Tue, 28 Nov 2023 09:49:34 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a03a900956dso2375566b.1;
        Tue, 28 Nov 2023 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701193772; x=1701798572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
        b=i6b5JWm/Osc81en8u5MDun6d2WX3T2lgYcXr6EDNsslp3MsrN9UGO1lIuwIsO8uelE
         p7Ye+IxD1z8eu+soCqNKCvxuiMg8DllwymR/KoOEKthKXtgoLUaBz2EkJzUncZEgPqFL
         Sl39VY27IQ2XgIsnnv5bBiV3NTmtWd22L6x+vDxo25aqiZ/dJiKEQjHIx8DLvZ1GOJL0
         E0BI49DiZI7AczT8S3AbawIwwQ3LFiZg4c6AAtvQw9pQ63NPrCVpj4Qp4tP9PG8+mSg4
         BW92EwaV8iwL+5vZsnTx7LFjyRcjZq/MTgzCBKw7Wg1PkCPsS416mBpjXwM/yqiHoGTN
         iQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193772; x=1701798572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Q6ar52kT12/oSOUgsQunGkK9992ePoRC0ssPbZWDgw=;
        b=HSCHEJ9tx9fP3ac938yQCRyALwwkzSgU0NA2XKhLkTPBVT3SLcKA2SbDQdCiDA3ElQ
         J6+1QM5AWhrwExibRUh94ftYAxKvkuWiqSTx+zCP25csTHSYn6Wl1MrWH3vT8Fus4w3q
         I/d6URFXxgD8O3EU+pqxuMsF5TEyjahKkqBaN9jsrXL4gjKUD7B1ABiaXZO1blaWMm03
         VYFK4x3mz0mkuQAcxy8HV9KEYEonaw/EiSfw3jw9qoZ04X/EoXy9YobU32SAWL++n5JW
         ZIQtYZlesTy9mhmt1n9HztfNMSd0FOnE6JKa7KoEHYwe9NA1ldHsEbTUPwZ+g88AvhvB
         uXCw==
X-Gm-Message-State: AOJu0YyaouNdzjWolwYz7jj15SqcjG2MMD4Fv1ZHSLwK/6dsL6J+y662
	coBwelqbex2xOQwHLA83h/8=
X-Google-Smtp-Source: AGHT+IFegfjLsT1XNjq4u1dJkNE5gSVojRjltbsyE47RsYa/oKV+OirEmiPZK9QlSr1+eKKQQmVk8w==
X-Received: by 2002:a17:906:f811:b0:a0f:1882:d5e with SMTP id kh17-20020a170906f81100b00a0f18820d5emr5384410ejb.37.1701193772296;
        Tue, 28 Nov 2023 09:49:32 -0800 (PST)
Received: from localhost (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cm26-20020a0564020c9a00b0054ae75dcd6bsm5742280edb.95.2023.11.28.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:49:30 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 00/17] dt-bindings: samsung: add specific compatibles for existing SoC
Date: Tue, 28 Nov 2023 18:49:23 +0100
Message-ID: <170119374454.445690.515311393756577368.b4-ty@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Nov 2023 11:43:26 +0100, Krzysztof Kozlowski wrote:
> Merging
> =======
> I propose to take entire patchset through my tree (Samsung SoC), because:
> 1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
>    they will touch the same lines in some of the DT bindings (not all, though).
>    It is reasonable for me to take the bindings for the new SoCs, to have clean
>    `make dtbs_check` on the new DTS.
> 2. Having it together helps me to have clean `make dtbs_check` within my tree
>    on the existing DTS.
> 3. No drivers are affected by this change.
> 4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
>    follow up patchsets.
> 
> [...]

Applied, thanks!

[12/17] dt-bindings: pwm: samsung: add specific compatibles for existing SoC
        commit: 5d67b8f81b9d598599366214e3b2eb5f84003c9f

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>

