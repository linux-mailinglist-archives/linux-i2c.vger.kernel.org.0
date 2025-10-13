Return-Path: <linux-i2c+bounces-13458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74039BD10C5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 03:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB76A3BC2C9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 01:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6BF221DB0;
	Mon, 13 Oct 2025 01:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pAPvZrGf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D322068D
	for <linux-i2c@vger.kernel.org>; Mon, 13 Oct 2025 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760317329; cv=none; b=k2H0A+gOftv+4bE5WVKyCQrdbNE3EfdN6ulEM5Jpp4j3/R+8OWJVLJQnyrgVigCkAFfgGTLsNfD3gj0phloKSH81RcJ8BwFnFRXIrHky+ajXZ+gZe++N8fvNX9otp8xAU7wodvB8uKoXSMlDU4kLYXA9+C3siMvPhL/dqZRvJTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760317329; c=relaxed/simple;
	bh=6M7PF3xNLpktje0EOKWg4z9Nu9yKC8jqvoHS+dTKYjo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j4K4EJ0moQMI2WcsLcFi73Zvy9n6NsSswP5/cNtvWs7H2weoU7WwkFPZL10xstRrquJEAwYz3c+kurSN9BFiLqkZGAknbkEMmevDRl8Ri9FtZvXVP0o2SSPPaS/OtB/x65+dPp6gXk0RKXMlTaWEFQC+Q78uZ5w8cGjGqnacjgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pAPvZrGf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781257bd4e2so269138b3a.3
        for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317327; x=1760922127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=pAPvZrGf06WxIkf+1gAxdUEmVjrAS2lXR5mK7jR+EGRi289foPcqoJ6GpuDLidDMKW
         wo2cF6M/mnn3kj9sEVwlNH7apR4oIf+Fg1gDr8WCPnpuPHiWZIIFd/eb84fTPMjDmR6z
         njyKzztl32ZwWymDbBzDtfe68aw3sCMVlV5NUJhTwp5sn/BQTgULijqNlAsVyo2L2ZhG
         UK+mFnW1go12VzJUFUpx1PjlyVqu8ckiQfT1wje+V6hThVOPbjiCYZ2/QFSYAUrktrgv
         kQqLy89UsSHcrQhE7o+gp8MkhcQjcCKumn/4U5NBasXwaEaqAtJY8z6acT/GFL+9HYK5
         P0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317327; x=1760922127;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8h7DDrA7j+9540Tqy/6NV+bqJw0DCMI3GYZXvoLWyYk=;
        b=bPHPzSHlP1a/Oj9FXaKtcB6kfV1rUGe41KmPEwtnFn2oNH/xsvgNJaVrssPU+Z+iIe
         fEyVPdiDm9HstuqEQsH1fJ5LbSdhaZvJENZUwG8COsCvZMmc9ndJv/ddqsU9d2jyGYSr
         MroEMW97re98ygXFXFfKk+XTznQ2GmAGMVAViTIlH9YDN2XWQHeDD0WCGI1XMD885d+r
         CYee/bxk+Yy6EaEe2nQGsk4dxvPf6qmTRk3+YlnZsaseHiW07bA0Hv0UrJzqnN3b3P7q
         3T3upLSeoK37Hm/jV2wsqpMhCC3cKwMnPifxh9/Mz9Uzqgsgzfscz7cUrg+2MwFh4rtx
         1jfg==
X-Forwarded-Encrypted: i=1; AJvYcCVLvwT+pDSr8azEHo609TuqOnEvuJ0E8mtw1t8xXMWWzVWHXowkRTCRQltpbmh4sLvex+rz79BarIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxptpSwqPOiQDb1MRPR3OS5ZuDhw44tG75ujuHjSPah1Oy/kGBW
	2CX90o9C3bDjqB/FejSzYOu3e12vdsBMaFaP2SOPXOSJXtlcu+/llSnKXKgkZb93I/c=
X-Gm-Gg: ASbGncuVPoNSvFJxadgLMiGts9BYhPrhmwBrovZDp5kFPYOu2+G5xE5n022dLQjpu3n
	TJRSIY1ypmu4vJtQMTRgMIg/pfHyicvQtZZCsGiLIu9YjdQY+Vv1tdCYhQpCcz9F9ma4uvr7a5B
	CGCzfy2mrr/Mhxnnj9FD+klDPHy7f6aQtWwIhTAgLcEiIF0Xa+Ik3fseiwzJyrBzIy55NtKxQ/a
	NTIz81lQGEa9ZtBua19Rc4+1TRrMEVACqwDFeLujk8oW1JzhRtFUiJ2PQ6HuESV8mBI0cssZB+7
	Ja5FMq8L5zF3NHRHtbtKf5N/5VRegfuNlDc575a3UWpW2YVrLU9vMv/vF7CesfPy7/6NKyHlks7
	bJb2h2h/qgdCPcTO93k8j+PkgIjiQYh0SsXspSdd4LJKijzgmzKgtnRDiQnWcGBNxedG36Y4=
X-Google-Smtp-Source: AGHT+IGnD/2S9vnckWUYx+lQefO8k9+6JLQFNxeCb9U29jbHzHiJy1UtLcBAdXedqp1xT25g8Y9crw==
X-Received: by 2002:a05:6a00:1705:b0:781:229b:cf82 with SMTP id d2e1a72fcca58-7938762f1fdmr11941331b3a.3.1760317327480;
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:07 -0700 (PDT)
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
In-Reply-To: <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
 <20250917-perics-add-usinodes-v3-1-a3629e4666ef@gmail.com>
Subject: Re: (subset) [PATCH v3 1/7] dt-bindings: soc: samsung:
 exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
Message-Id: <176031732291.32330.1246219208832468083.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 17 Sep 2025 21:04:21 +0000, Denzeel Oliva wrote:
> Add compatible strings for Exynos990 PERIC0 and PERIC1 system register
> controllers.
> 
> 

Applied, thanks!

[1/7] dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      https://git.kernel.org/krzk/linux/c/ca4bd675ec459bb7bb008f15f5d866c9ce35f4e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


