Return-Path: <linux-i2c+bounces-12709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CFB479FA
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 11:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01FC7202554
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 09:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB2C22126C;
	Sun,  7 Sep 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDTv/Lne"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F221FF2E
	for <linux-i2c@vger.kernel.org>; Sun,  7 Sep 2025 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757236448; cv=none; b=dMQARJbb30n5A3v7Xg9SKoy6EJPl9D2/e13a/dDn9eB09TBNG6Hiok2u75ghMbYM5nadt5xm9SkDOiLVE1AMYh3w2LTcqtWS8nV8FwkQRpwnV2+SMXEsnG3ji75VV5w6K1+7dyW4yGjuwpjZIHTxjdWz/6P9m1r7yT+AlcyNcQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757236448; c=relaxed/simple;
	bh=sU7+/OKR3H0AJm7QtOcIJdDLNqhe68RVRMMpjau/P+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pn2VpoE3FqQVFRyUiOFbYuG6Fm3SkLZOQBeNnzDX0Qu78cYb09DIiITDwMS16lqwxVP0WcoKxsyvJvkIbRwNAP4HLkK1x8pqI+fAf+8jvEeXjmR7aeRm8YqDHF9u91iGW+AiBCkqwGg3sGSic8y014wO7hbLRnvj1zqAkHX5Jho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDTv/Lne; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45cb5c60ed3so5446135e9.2
        for <linux-i2c@vger.kernel.org>; Sun, 07 Sep 2025 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757236445; x=1757841245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=DDTv/LnerbbkADMhaf0ViJTmnp0va3tlnP3KfUkxQW08vIRYDEbbg90JTkoeWBxHx1
         aC8fVjv74oV00AMw+fg0q6La1qcsKlsJ/lnEkccvbJg/kzDDh+2jAlbmjDuQn/08jAnF
         q1TwFkT4VMiBU1zWeCcrcfoykhIytvS0tKB/1m441AwAp7N4NcGuril7uPmZAyODtmj7
         OdMYif0Bo6wEnjSRYnJtyQHkFR2u0PNEq4AAPrvdM0L8m7r8xhnCwKHzwCpwzOBAneq6
         Fo9rlW1LY3wiA67CVBR1ndTbdxlKcjzRdPw3lhUUW1+tHFJkcnQJ6AAkgswaspx1vv6X
         H0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757236445; x=1757841245;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h09TDfJ0VCIYwMjqv+nUCRRx8qKcN59ZJYX5ff84mD8=;
        b=EYYb2LmgJV1Y/oXSGOzFLccNyqKtUA2s995asSrp3jwPl3QelXSTNfZaIjzOJfsaNx
         Q2WWvX+adL2n8ugUUnQ5jhbGSWxmXXseQsBrPsl1e/QMEM7EMWdXYlcvqs8Dd/8uYwI2
         PHSca1J9/+YvKiBBipX5MhzbN5+fO+fb7yVfV4uTAyv6RLu9BCruaz2pSiBlTgau7ntY
         JTgyXYvl/RxQDfFQQVios4CpFgFnVrFveZBPRk3UzGslqU/qTX0tdG3Wo4H5U4ssCSgJ
         FKcweYQfL6B4M76ImijYfmicE1yKdbr5t585pHzpZiEBGigm3LTgIJjXu7DLijUpHMnc
         4oSg==
X-Forwarded-Encrypted: i=1; AJvYcCU2NgirhP3jw/YVdFw6qB9yEykZWtul6o+y/3A4/ebgoNlsTNVdkINNNyYeWTm/LZYxQ+Fz+UBsEQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymTuRjpNKIIy/1bcspurk/N8YtjuNnygSvdqYm3/9XH8UuInFj
	I4g/TqoVtxMNe/k+AxTs2JKj3BCtqzCqy4SJEZPBVh3XYSQNKJoTz5fpiSOaucSs/04=
X-Gm-Gg: ASbGncvMB/O5AQr1wm+asE9lG+9FWZ45YyAg1aFdTjrA9Bsr8efUlqOMAvOhfJFsOQk
	iyxdX6z1NN12hY/4gsK7EECT07crQF81Wg9w0hqkUQihVXHYjI/OoC9e+j8JgQuW2/ZwXQLCaaR
	uZrFkm763RerXCEAmJY60y6YYCR9HLmQGxyuyHbVu22HFkjC42CsYOERos9uzxUVG2qIc2++vcH
	Ak+xXP7GVZMbNCv0+Cn9KahG2Bp5nQiYMG2N02Bbc2JObXV5poDdcaLAYY+kJkso38mVh22Fnx0
	4O4k4VmyFFtGCB4RCn5Qape228nNo/HZgX+SXW+BjxDt5Lbpg5xPnBrCsFq4qv2c5dQCLYlhDHD
	35D8c+BV9FLAkDzkIJP9UK29HYf+BIFFm/CFtTm4=
X-Google-Smtp-Source: AGHT+IEs+zHj+nZWtDLKO7AMy5vUsh2MOF4u8kwkXxf2nwQ+E1nf9C+MVn+vLhdElVbV4Wh2U+33Gw==
X-Received: by 2002:a05:6000:4107:b0:3e6:e931:b428 with SMTP id ffacd0b85a97d-3e6e931f97dmr1115038f8f.10.1757236444776;
        Sun, 07 Sep 2025 02:14:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e21e4c0e6fsm10918962f8f.17.2025.09.07.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 02:14:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
In-Reply-To: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
 <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: exynos990: Add
 PERIC0 and PERIC1 clock units
Message-Id: <175723644300.30719.16385900171586342437.b4-ty@linaro.org>
Date: Sun, 07 Sep 2025 11:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 04 Sep 2025 14:07:11 +0000, Denzeel Oliva wrote:
> Add clock management unit bindings for PERIC0 and PERIC1 blocks
> which provide clocks for USI, I2C and UART peripherals.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynos990: Add PERIC0 and PERIC1 clock units
      https://git.kernel.org/krzk/linux/c/43bd82eb33b2ac33232724a8ddb9e07cde492328

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


