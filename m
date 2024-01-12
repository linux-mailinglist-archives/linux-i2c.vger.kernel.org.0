Return-Path: <linux-i2c+bounces-1274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFB82C3A0
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 739811F2243E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 16:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FBC77623;
	Fri, 12 Jan 2024 16:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhHJs56x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6C77622
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 16:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e62425c60so14182215e9.3
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077380; x=1705682180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn+LSFeIE6cgmvG+tEU3s1iTtjUkavz0Czg37/bP5gM=;
        b=DhHJs56xoMdthQqCaQz5JO0J50qLvVDNZTmB3U+ObnqvxumKs4M4fE+rgeZ52iQviY
         wR3q6U5ib6jxSJGix+DeSLcoKTj6g5ad1/NsRWhxpyzLN/p7UX570v/Ml9zyDArBO+ie
         LJ7Rm2tEeejyFfPNmyaddGvU03kpNLVXqESY2kcnn83XYRRHyOQp1ZbaGOkBxQ0LGY6J
         a1h6ISFaPjywPvJ3uDrO0ZG2JNeHBS4vCvDIdqivOZm1XeCLmXdoawvNY19aXcK5Ppu8
         rEfv28e0jc9rRqr8ue2HYevzKi4Ci7JlSY6rIrrJxqUsvF14NGbvV6uUFPSdiYSbUmVu
         4inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077380; x=1705682180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn+LSFeIE6cgmvG+tEU3s1iTtjUkavz0Czg37/bP5gM=;
        b=NOPrtqd6Hvj+lNSqztBUxQq2KTmjavECL9X/gQLRikPzDr5bRX4zPpNx9LleCNTrrM
         vcQwENzxHi16KZC7Cb+5ML32dUsPuKmIS+C+Qqf9OpVsVRNDGwVWsuL7p4W6mougpUxg
         MvltijGzfddQpWEv8uadPpMLZNIO6BSRYXKW7kTv6M0WCxyd+OvdFyYDpeMAYceckByS
         F87vOlxFOP5ENXOrOsIAEmljI/8eRkK/N8y5b2awHX1BZ3fpychReE0nV2iDIPa5+VBY
         RJI6EiatFaNX955dPdDnGd2LEmOxzdXhAsiCfkfCyXSEkGXVPnVkFyC7YIXwmH0rx4yS
         qDig==
X-Gm-Message-State: AOJu0YwxWOkToCOcSoIDy49JNR6qTAIHvehPha3vxq20m194HPeuH1+t
	0JaLvy5LN0LctDbzjolm03eKCbeaBqLczQ==
X-Google-Smtp-Source: AGHT+IH+yRgfFBXEytnUKCD59ok3rbCy/JtVfxvi0S39fF9MOsVDbm+3HUJ7eJuXjsGI344nf1LKPg==
X-Received: by 2002:a05:600c:1c92:b0:40e:532c:7cb1 with SMTP id k18-20020a05600c1c9200b0040e532c7cb1mr1056935wms.125.1705077380618;
        Fri, 12 Jan 2024 08:36:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 0/5] reset: gpio: ASoC: shared GPIO resets
Date: Fri, 12 Jan 2024 17:36:03 +0100
Message-Id: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes in v3
=============
1. reset-gpio.c:
  - Add reset_gpio_of_xlate (Philipp).
  - reset_gpio_of_args_put->reset_gpio_of_node_put (Philipp).
  - Expect via platdata of_phandle_args.
  - Do not call device_set_node() to attach itself to reset consumer
    (the final device).  This was questionable idea in the first place.
    Bartosz suggested to use GPIO_LOOKUP to solve this.

2. reset/core.c, implement Philipp's feedback. That was a lot:
  - Commit msg fixes.
  - Add new platform_device earlier, when reset core found "reset-gpios" but
    not "resets".
  - Do not overwrite of_phandle_args.
  - Expect matching .of_reset_n_cells.
  - Pass of_phandle_args as platdata to reset-gpio.
  - Rename reset_gpio_device->reset_gpio_lookup and others. Fix few comments
    and code cleanup pointed on review.
  - From Bartosz:
    Use GPIO_LOOKUP and a lot of cleanup.h in __reset_add_reset_gpio_lookup().

3. Include here Chris' patch: "i2c: muxes: pca954x: Allow sharing reset GPIO".

Changes in v2
=============
1. wsa884x.c: add missing return in wsa884x_get_reset(), correct comment.
2. qcom,wsa8840.yaml: fix oneOf syntax.
3. reset-gpio.c:
   - Fix smatch warning on platdata evaluation.
   - Parse GPIO args and store them in rc.of_args.
4. reset/core.c:
   - Revise approach based on Bartosz comments: parse the reset-gpios phandle
     with arguments, do not use deprecated API and do not rely on gpio_desc
     pointer.
   - Create a list of instantiated platform devices to avoid any duplicates.
   - After creating reset-gpio platform device, try to get new reset controller
     or return EPROBE_DEFER.
   - Drop the "cookie" member and add new "of_args" to "struct
     reset_controller_dev".

Description
===========

We have at least few cases where hardware engineers decided to use one
powerdown/shutdown/reset GPIO line for multiple devices:

1. WSA884x (this and previous patch):
https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk/
2. https://lore.kernel.org/all/20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz/
3. https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
4. https://lore.kernel.org/all/20211018234923.1769028-1-sean.anderson@seco.com/
5. https://social.treehouse.systems/@marcan/111268780311634160

I try to solve my case, hopefuly Chris' (2), partially Sean's (4) and maybe
Hectors (5), using Rob's suggestion:

https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/

Best regards,
Krzysztof

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>

Chris Packham (1):
  i2c: muxes: pca954x: Allow sharing reset GPIO

Krzysztof Kozlowski (4):
  reset: gpio: Add GPIO-based reset controller
  reset: Instantiate reset GPIO controller for shared reset-gpios
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |  11 +-
 MAINTAINERS                                   |   5 +
 drivers/i2c/muxes/i2c-mux-pca954x.c           |  46 +++-
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          | 227 ++++++++++++++++--
 drivers/reset/reset-gpio.c                    | 121 ++++++++++
 include/linux/reset-controller.h              |   4 +
 sound/soc/codecs/wsa884x.c                    |  53 +++-
 9 files changed, 444 insertions(+), 33 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1


