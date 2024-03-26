Return-Path: <linux-i2c+bounces-2602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58B88CE48
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 21:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06BA2C7BE9
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC5013D604;
	Tue, 26 Mar 2024 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqMvEOxI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0E13D2A3
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 20:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484644; cv=none; b=U3WNiU3mC4HevxLZnbG5qbwt3e5icJomO18YNBBgb6NhMT30gWI+t/X5g4/RouXnb3dmh36+iET3FFyuB+FoxJvOtQYg+JgJQN2n6J/jdPXvy+iqBFGN1/W1ETH4y9Arcc1HMgi9gqC4QqcG5KDMreb4dSwHO35SdlUGcjvoKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484644; c=relaxed/simple;
	bh=vLJVttyU0unj5HjuSsO9gb5EMeZQpEnywYmaCFIJqoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MJZLRchc2jyECU5lUU+M+5e5x7lqKVqr/2bEZERD0Z83V1g2aVZblr29DoipKnLLTo6Y3jfVshBmsHo5X7qM4I9iOhNtWzOn7bI9NwaSD5Hbj7NFEUl+fhoZ68kG1cG6G2ECpuRSqGw7b0JAGfYzzztThN3eWpVyPA0KE88nCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqMvEOxI; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso761959166b.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711484639; x=1712089439; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knEQ4mryQwBiq0ncopBZJftzfm8XTJ3CLErQObi0yU0=;
        b=dqMvEOxIGZMr0g6hOQQzeQzMFpmza3FbjTpmtVSMFPaIrfa5BZnG8EZ5C+tYUQ7+ga
         uOJv6BThAViX0MVLUV8cQXsrCpMu4oGzEBFyb3y9dh8lu4TexeqaWhMLxFDw+oXG1Y6b
         ldtDuK3ueoaAhvUwUIES35Dmbm0K3uW0y43DkMRTIOOVLEnxmvqYnGFboWee3AXoEbGw
         XwZZ7OlFzi+AVvO8XqBjG2D+F00U1uVJXY8s2ct0QCYf8koKVfs5TidYxY6imx+DaiUA
         c9SDClm/2B90g5B3QGxIVc7ZGADRcD6Jjc/Gi1YlPMb2MTQSllANnKVJ4zJvCyAVSsU+
         c9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484639; x=1712089439;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knEQ4mryQwBiq0ncopBZJftzfm8XTJ3CLErQObi0yU0=;
        b=Brh9R+jSQOmwzzzuho5Ke3y/KcueDu/9Y84Ql1idL4VKXI04tbL/5oBrP5ZDBsl1BZ
         CvPtiVHHpvhTSTFHKnE5NPMYZKgQrTbMhqixyN9x2/Ns9sbgLv5/eBcMbrIlU0TuemZY
         MqbE+Qr9qjDY8Ml/30R4pn4e/UODGQywG9BWeAvn6FlKnCDPClj290ZTF9zuZ5LKT+3C
         zxRgl/p7Mj0re508uga0DbcbboUzUiKgqaCMi2uISoU0I/at6q8rGC9IpOE1wFqsh3BJ
         JKvWF+Ag72EDlyq04j56N2lEtpDLe630qnDKhsDTaD86pmuxdv5BQoVquF7BmaXishUI
         7SPA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ne8jpLiCa3xX499rQtNOWuFoNy4D8ObUor80c9lq38XEtnj/Moia6XXAD/62FIfG3CPKHiaEKJ7EClrEaAe4CY7snSIsVWES
X-Gm-Message-State: AOJu0Yy1xY5nidXhi1jv783L/c08QLdDpAdfTCq7evaNhAtX/MtmVym6
	j2Gq+VVnpNjRSC4A/FC7Ww0RBj4EsWJSAd+9sM7UjIoIwG9zhviwlz0MgYMaZ1M=
X-Google-Smtp-Source: AGHT+IH0dK859sUAUhEQqGBCv46vWClhoFv9qf1bBqBgtaiUINfNf3lrctA8c7WDHIrVwNuBvhWlKA==
X-Received: by 2002:a17:906:b806:b0:a4d:ff6a:1d93 with SMTP id dv6-20020a170906b80600b00a4dff6a1d93mr262242ejb.60.1711484638972;
        Tue, 26 Mar 2024 13:23:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm4584492ejg.40.2024.03.26.13.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:23:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Date: Tue, 26 Mar 2024 21:23:30 +0100
Message-Id: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIuA2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyMz3dz8lNKcVN388rzUIt3E3KREXePUpCQzUyNTs6RUcyWgvoKi1LT
 MCrCZ0bG1tQCgwIKfYwAAAA==
To: Russell King <linux@armlinux.org.uk>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Auger <eric.auger@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-input@vger.kernel.org, kvm@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2890;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vLJVttyU0unj5HjuSsO9gb5EMeZQpEnywYmaCFIJqoc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmAy7IJ8hV8xU+Fvg50aj7Bm1TrFxta5NflDG5C
 Z0GX9z3UjOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgMuyAAKCRDBN2bmhouD
 1zMeD/4j+he5Lc0O5CAxCQTaYhyHw2jsG/5EdmADJJfjbMxmsMOFRSqBgFCmMTYlikBybNpMvGX
 Njz5qu6tleCNVFVzX64LgMF9CHk/qK88sFohHb9gDLy3INj8Cc7dCQay4J1RKYsX9JgvTm//yhG
 1i0kOuGUFGiUgkNVllH7OPSUBI01iGXoYWh3MIdiP4adZO5ydPW87HOHzk0K8fGWClJyOsN1l8o
 pk2Nfo0PeoM8o8H2QIcet14VfBgi9QJyqr77GM5vJnpR45KaRc3l93yej3zFWQ6OZHULyGayEtK
 8IUUp9ruU6fkzqDKIEsERhna3Fa1GacQADv0twz9n616/L1pcFTJaoLhItOUm1R+UfMX4mCtXOV
 Xs+nlz7EefbYDT1rvvHDuJ9q1gwp68PBnzMIHQFPM4BMXk25A2Wvjmk6YvBYIrhIMl3azHYFCRQ
 8x9/ojjzQkmBBvAp3CfFUGFpNadd6tLrlZnPySeeHRVnKbaqHw/AQ8h5RiTcTyrIzTqFSFufol7
 FoHmrA7z7yzQukzlsIcq27iQ0ObssgXHnSS1ZjXve056mJ8eQEJ/AAm2QJJW2Qqc1ay32P52oSj
 EE9gfAssEm8pTYJuc2ctEJu4BHdP9Sr+CAZ098xlIaFOiAEwGyAwmrrUoGgp7jm8R9lk0whhQwY
 ZdsRrJGwUkr5EFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Merging
=======
All further patches depend on the first amba patch, therefore please ack
and this should go via one tree.

Description
===========
Modules registering driver with amba_driver_register() often forget to
set .owner field.

Solve the problem by moving this task away from the drivers to the core
amba bus code, just like we did for platform_driver in commit
9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Best regards,
Krzysztof

---
Krzysztof Kozlowski (19):
      amba: store owner from modules with amba_driver_register()
      coresight: cti: drop owner assignment
      coresight: catu: drop owner assignment
      coresight: etm3x: drop owner assignment
      coresight: etm4x: drop owner assignment
      coresight: funnel: drop owner assignment
      coresight: replicator: drop owner assignment
      coresight: etb10: drop owner assignment
      coresight: stm: drop owner assignment
      coresight: tmc: drop owner assignment
      coresight: tpda: drop owner assignment
      coresight: tpdm: drop owner assignment
      coresight: tpiu: drop owner assignment
      i2c: nomadik: drop owner assignment
      hwrng: nomadik: drop owner assignment
      dmaengine: pl330: drop owner assignment
      Input: ambakmi - drop owner assignment
      memory: pl353-smc: drop owner assignment
      vfio: amba: drop owner assignment

 drivers/amba/bus.c                                 | 11 +++++++----
 drivers/char/hw_random/nomadik-rng.c               |  1 -
 drivers/dma/pl330.c                                |  1 -
 drivers/hwtracing/coresight/coresight-catu.c       |  1 -
 drivers/hwtracing/coresight/coresight-cti-core.c   |  1 -
 drivers/hwtracing/coresight/coresight-etb10.c      |  1 -
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  1 -
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  1 -
 drivers/hwtracing/coresight/coresight-funnel.c     |  1 -
 drivers/hwtracing/coresight/coresight-replicator.c |  1 -
 drivers/hwtracing/coresight/coresight-stm.c        |  1 -
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  1 -
 drivers/hwtracing/coresight/coresight-tpda.c       |  1 -
 drivers/hwtracing/coresight/coresight-tpdm.c       |  1 -
 drivers/hwtracing/coresight/coresight-tpiu.c       |  1 -
 drivers/i2c/busses/i2c-nomadik.c                   |  1 -
 drivers/input/serio/ambakmi.c                      |  1 -
 drivers/memory/pl353-smc.c                         |  1 -
 drivers/vfio/platform/vfio_amba.c                  |  1 -
 include/linux/amba/bus.h                           | 11 +++++++++--
 20 files changed, 16 insertions(+), 24 deletions(-)
---
base-commit: 1fdad13606e104ff103ca19d2d660830cb36d43e
change-id: 20240326-module-owner-amba-3ebb65256be7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


