Return-Path: <linux-i2c+bounces-11417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A296AD8AD0
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 742E41889B41
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1582DFA27;
	Fri, 13 Jun 2025 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vCaZPppF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0EE2DCBEA
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814917; cv=none; b=KL/f1nHIXBY5mcnA3iYR41jsEJRxGiN0JAbIXWvdadhhQLu+dEGJVXBQ4691EB7W72qKSwOIRQPFQyc1crSZsDDQ6eJ5j3tUuxc3Fg32USZiG/72WWDjE40zU91/CpqAXdbMAHW+NG/i03eszlk0OUGDJwf0f+fB9loR7+m6q0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814917; c=relaxed/simple;
	bh=Xu9/tBx7J9HDSStwJKx4qcuH0x0i4S5UUTdM0NWoFms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvM+rCutBuKs1JNsT3zS6yd8YwTisuYBmX3nflAByJ3s9qihzAA5gdyyGqmiQzTJ3fb2jDj6mv2X2m7AlKOibF1qBQd9M0PAPnSCm204xjQ93QdWKF/kBnG76Zjny/rqyyhjt9cc11BvYeqKYTLSYRhBX+riPQczyubqzwUAtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vCaZPppF; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fad79433bbso22444906d6.0
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814915; x=1750419715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=vCaZPppFKldwMOpfY9qwXMyXK2n63c4Y3wPPdUCkD/NsZWDSzWPhcMrXiaMn397fQK
         lpnhZ7mzLivt8EIJyBy6XjV4oMyqIL0XCtWdsgk31eJdw+AOufwlLY+480r64Su+xOMU
         1738ZjQi87AJ6UGtfhqX3hP7zeSo7D72mgGlpsV/qQ+a52flJbbDe2ec/U8Fl/ZB5y5k
         TvXr0njPK4Emygrhl/JeatCHrJgo/c8q6yZ/vAbtZsu7HM+kaR+7wOT2RRnvkc1PLBbZ
         siE5NBO4GzqM+8O1l2XfaB/uQ2c42VI7ShrVgPFbk74bFmCnyXa+5PDGEhQ5hyHhP87+
         ETiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814915; x=1750419715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=q+WzeMWk6siyKMV1rA8JfOuIWRVr8kt/vjtjAOMS45RE3F06oO8OFItYzpHw/yZkbw
         fDzOHhzTgBnODC9zqkap0cyNF0ss9GSv9Mr6dRTqY/wX+2aw2WZ9azaTQvwBykkNlDjG
         KKkY+IS9/kLKrGCuHifezYqQ+8HfK78g/1KWET8thwrszlo1rxOt5C1U3tZwmz1onbbB
         n5YhqGTY8YRFqSp3cKC3SZOm8hGB3bZmmZqU3cUngu6dNTEpywFYXmvtXqiArHVq1jYd
         +VrFAPFJrdpQ0UJ9i8G5glN8/6kWxMvIXgX74lhVuzA2j4wRNuYtroTVx0WsOtgp8qsu
         6Ktg==
X-Forwarded-Encrypted: i=1; AJvYcCUPHvjqBihMe8jQnfIiY0j5Y7NqRt9QSn314NFxdm0wT8gi2awkRBg7ZbgdMefflX+7UTr8/z9VPsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW6pk3VCEVAnb/Qx6pPH4W2O1VSoix4EswDQ9yRF9u78CBirjf
	tNe3VjReepI1EqfD7x4W/zHMvsvTo+m0skItkHsDAEqwXTgOs//Gg5PzCIF2lskssN8=
X-Gm-Gg: ASbGnct2XHtBJ2BPbUzQTDl/4SrqQAIKMQRnAkKjRrVmNm3X4rDEGRXPEbAt7CnZczW
	jNXVexoNMOpBi0AVGzQCZJDhHZaMjqHcNxJR0to3cEqs+/QR+1NBdq6H27CZ1/D7mYXYNbAiiaZ
	XjO5wVYzFnTZJrSlGoUIZx5ZdqggP0Ubgu14i/vcrd2bzh0pgcpSCBSOiFmlDzzRarFRgJng11R
	lKwzEC0GDKzzKgouuI4WYHXZAEZ4+aLkH+w17Bf5AaUTZBaiVCLpZH0U16VXq6P/T2O9h0Z+7Jw
	HBV53X1dC4gqmMh2PH1ePw3iY+Wj9yQxhtnzrI6Dc/8D6YZc1TIvseWYof4qdTeceypqU3s9vyZ
	BhDh4KOMtei/IYUBsKPQsP6GIZeAcsoRM
X-Google-Smtp-Source: AGHT+IEc5wMP8ofTZTO6iGwnPV4OsQNdZGNQL5zwacGNvbNKtJCkrAxEGOyHCjmYXgP1YxiBm+lShw==
X-Received: by 2002:a05:6214:2344:b0:6f5:106a:270e with SMTP id 6a1803df08f44-6fb3e60bc99mr35271836d6.44.1749814914668;
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:35 +0200
Message-ID: <20250613114148.1943267-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself and allows basic peripheral
drivers that are currently marked only for AT91 to be also selected for
LAN969x.

DTS and further driver will be added in follow-up series.

Robert Marko (6):
  arm64: lan969x: Add support for Microchip LAN969x SoC
  spi: atmel: make it selectable for ARCH_LAN969X
  i2c: at91: make it selectable for ARCH_LAN969X
  dma: xdmac: make it selectable for ARCH_LAN969X
  char: hw_random: atmel: make it selectable for ARCH_LAN969X
  crypto: atmel-aes: make it selectable for ARCH_LAN969X

 arch/arm64/Kconfig.platforms   | 14 ++++++++++++++
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/spi/Kconfig            |  2 +-
 6 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.49.0


