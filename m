Return-Path: <linux-i2c+bounces-13459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F668BD10B0
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 03:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3204B1893D0C
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 01:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B3E2248A5;
	Mon, 13 Oct 2025 01:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0k1PdCc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828F22333D
	for <linux-i2c@vger.kernel.org>; Mon, 13 Oct 2025 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317334; cv=none; b=EGFOaYqP4Zk7La+FMEtioO7m2EFLXM/2aiBtQK6iT8vb3texazV6YxUEKa0ANCrIcU6m7zSE4nYrkYjdQLsOihMHnIzBMH2/0bxDZHrvPK4gktynnhus7Tm1UIQSAbWcKTo7sEAV/9Fe4NJUKdypiUB/8wSdw5Y6eUsjmh4BHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317334; c=relaxed/simple;
	bh=hPO3fb9A5GUMjlwesrVBFk2doqpjzcMDbOWwmKe2wnI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eBnM8Mj5BnMLfnVdeO7x6IMlr/rw1sQJwfYAfY7f+PDMQ2nftDXJVjubpwDgO5S6dVteG6qMrYvs/k+jc20StvLo/wsknhwXp0kWHD6iNgo9q4pR3Ed/hWGoek1wsyqO7Is7vsQZveGh63lAhqswNin+rlhg0A2+uTaJZA2S8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0k1PdCc; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27ec3db6131so8373065ad.1
        for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317332; x=1760922132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=v0k1PdCcMHpIJAj+EkMYnEy7cH0xMYWMKeWr5Gu30AL0CUYnG6OzFlIgGi1v/C4so9
         kGNta/zreolQcmUr6TdorZWBctyCclXRKnzW5y5RrGfgVxWsjuJFnj00jRbKTlABScTA
         DxZchP+CiwdCzYdijY5NJL7t7De8anxvxJSiYsPBLOZeCfrtwzqa2hc9dHep663OBJXU
         EO+7TCTBOj9FUcMHPnm1uN2QZV/X2InUp1+vbL8NsDy7DK8Y8C/jfXYVmCtXost56Neu
         GodZ4oRlNPkKmXa5CtA4uIdeJILbfnTHihnaYdFdRdNLfxjVvk3SZRATSbsA+iH6Bycc
         Gplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317332; x=1760922132;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10a4vKq6IEmQUW56jJWKaFLXuKf0sl8IrALpzNZuGbU=;
        b=Nvqao1AzZee36yhGTvED0JpJ+8YhnbrzroL1sNEKgzdSlNoxQrSmk+qNxlgb4W9O5F
         zMZUBPAm/y/AzigxwR2u9FH0ZR4VcDArq/84tI/oj/+10JuyQoydaLDVwUpzHcTNp6XM
         AeCEeJIM4lsPYT5Gqz6jbul3cghwAFAcQvgU44dELZK3P/aDJ8HWqQmtnDCcIrwIrQqS
         L/vVqQJy4x/CFEnm678Uk4KfIaEr2CYnkdResLmq2aBzPU/I3TXZCc1Mp5gLUokQXZkX
         ONRemKMLBF31TBzUdmojnlQUIxNiG7oiN2dILORIEhdDqtrV67DHBGKerXxi/wgn27Yk
         alow==
X-Forwarded-Encrypted: i=1; AJvYcCUImvF0NymihuCI36N6lxfdWFY3spObqTniQvpsU7dCqbKfO8akY1Q7ZwvJvwa9YmrPV22ke3JJm4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxguc0e0ezMetA7qzTrdpLXi5vnqEwlVzBQ5ADdUQLTWLF3z9RE
	/C8nRV76ToXw8QNNeCzcgQhy3o2j+Tu9TaVmc9ne2YrulZKwIrmZlCDWIvbccKYYrGM=
X-Gm-Gg: ASbGncvVzQ7UYxtJefLZTVLEVUqRf4v8FpIbxVySzTHaoL1DA06WxDTJ+x48/fvjc8A
	RqVbepYqQ2dP0n5UJqE2UQWaYEjzeMpkKvA162vI8n7TvgT82Xlf0vlJaTYcuSjB5tldJimnzVy
	R+7MME3FO23hcecRQFR1QI1a56o0A25zOJejtMmTFl0cM5U7Ec0aAUWBaQNG8sN462KEPEHco4b
	mobVnB3ilA8idiXpbsXk9SPSVEsnUIwYPV+7cuTBNMc7AgoMrCaHcHLYrivmXf8/bt6pUG55HtC
	swOI8gijg1mlmFo7Dk+jzLA6ybPjK/qIqFagxMW19U8U6rmtDAqP2qf2seva0k6A1ithMhgW+lR
	ttI8KmulQ319ZdnpI7vt4ZkDVBmTrpwuwbUfqaAxAJxhVg9RbVl+vk9+OnoC1
X-Google-Smtp-Source: AGHT+IEt21JJ0GbW52Ae6IIeXGAxkDnv8PoqVX129SAInTnAX3MkkPG+Hi8yBSex+9tD040Mp73hFw==
X-Received: by 2002:a05:6a20:d526:b0:2f9:74d6:440e with SMTP id adf61e73a8af0-32da8508ec1mr13363457637.8.1760317332410;
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-2-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 2/7] arm64: dts: exynos990: Add sysreg
 nodes for PERIC0 and PERIC1
Message-Id: <176031732773.32330.8134222095806318376.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Sep 2025 21:04:22 +0000, Denzeel Oliva wrote:
> Add syscon nodes for PERIC0 and PERIC1 blocks.
> These are required for configuring the USI, SPI and I2C controllers.
> 
> 

Applied, thanks!

[2/7] arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      https://git.kernel.org/krzk/linux/c/1e6daba7a3c05af0f8b02cb59e71ce18fb913aa6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


