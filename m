Return-Path: <linux-i2c+bounces-9835-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DCCA6348C
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 08:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F2487A84DA
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Mar 2025 07:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03A341A8F;
	Sun, 16 Mar 2025 07:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPgDAqvK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00647149C6F;
	Sun, 16 Mar 2025 07:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742111171; cv=none; b=Ulsy7uy1P3TChPbkAsdwMuBPn+Fpkh0lEYobUr+YU8My9/igQUZA9S26Xd8aRNGuGhaYZrC0uNzcI5H0Yatn5KKsX/VKgyQ87aTVLBxotkgL6hrFo/nR1FIRYfz1J82u4FkWm86NVYUr/pj1Hqu1AkXKd6+giVJBB0qpztl/M0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742111171; c=relaxed/simple;
	bh=/O6L7QiZ8zFKZWd4bNiBePCbud6VGcPpsDUPMRXsf+A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PS39/x1j/QhtJy1oumAHt5Op6CEDv4i5hi8Kp+x0Q6VZVnx+OulaUUWOUOh2FpNIzliZjoQVEXrwJcF1ZUnPA9929fIvgZfTRGs0oQH58ORYLgzkxXrAsEb6qaS8Zy5j/nOI2Q0FPrCz1R7Ps+Y9lVf8UzORlA0xg4mwlLUVGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPgDAqvK; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-225d66a4839so39460495ad.1;
        Sun, 16 Mar 2025 00:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111169; x=1742715969; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IkSfkjVGK93Nfu1mrVNAL701+LlNJUfQ8vvVyUgSzo=;
        b=FPgDAqvKl9nSAsj59frmsGjxPRaEnmWfJy/5NP2qd7cF6sUgOKTTdXDolRAknG6eXU
         CET+dZglAUm/s1W0VYMR/c5XmkXJ/4yDNeC/VA9Cs1sazCs9vsETZnZpMdpyeqZDnR8d
         FzUMjqVjTbbkmQc+y/C+HBENeOGMIO6FLkVhzPvy700IgfVpbBy2W+sRjDo9mqakCU3Q
         0b3yNvAXBigO5gtwvMdaa5x2nEdMBOYoYcOmAiId6bHHB3QWDf3SZkVEMtwBzR7Ggm4q
         lDyuaYoa32GitT6gfv5PhZ87VokXf/fGKw/3yie8zjp8dYpWAHQ+K9FWCAgSp1L2VcO/
         eTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111169; x=1742715969;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IkSfkjVGK93Nfu1mrVNAL701+LlNJUfQ8vvVyUgSzo=;
        b=PvT9xvTt+pEh1JOPFBTOXgjdbvId8t72nLRfmk0yCy7mUAODWXotn1M1uhq4eIkLOD
         mr/T3l9WlOmj98S5paXR66c2B5H+dxc9Me8vzGJdbv8nPc5+2bu8AsXQglnYSNGcPJE3
         Oad17onEYoRZcIsm8tChM9eCk9t+XSyRfl2pr3wtlBCtHNYlFgneA1fxqIm8ytyL6L5u
         GPwg3hobOllVBJOUBah0sy2Y0JWMG7LFS5URPZOFfeXq7QT+XtNRGop83yGUD4whrU95
         fH6roy7dU+W7j9c7XbDPnWMRoeaQeeuoCzPrWQfStExJDh6vdpxZxseBD6IQ239SPWMC
         KV5g==
X-Forwarded-Encrypted: i=1; AJvYcCU82Eo3DpGD+aHUMwuwA8xQIqLkItUR0MuYMO9/3J6zKTqZSmAXzJ/E7YSq6peMQ6fmKx9+JpzPlV+G@vger.kernel.org, AJvYcCVe+7dREJYxa4JXSxsVaNeYs/yTEjhPy3wOeTi/Hh6CDArlSdc2foEkXui2RiwpFb2yykTkHLuqsWyFMUhj@vger.kernel.org, AJvYcCVeefyzhITng68aN41ZPksrLAGRFEpA5ewcAPDplYxKLk+qH1P5CkljtoXbVTxdCnFR85dneTC3XsEi@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZdla8VoBihVAUUxSk89Ct6YvhwDFoQxnsFAEemkEFSaRf0QS
	FU/sNVqOpOoWa6N2WcYLMQ1x+tr/uBF/r0OKGnRAhETj7zPhqJN+
X-Gm-Gg: ASbGncufi4Q3kUyD3fBBPCwVde8qkqokn2MyAWvPXiV1OMG8LBn+E9/TMjyHpkSDiRu
	gPycntZm8uxZzR/DM91q8hbfvHCXvO+eA66/qYVLi9VJ8Hm/mLdxoezJ7u9Mt+RQQwmIVg1xW2C
	cB+V50mUvkPZb0mKb76DnBEk+4pLMmfKNfYwyX8ODiHLk0AoU9Ddml9cv+RS9bBMUSqGMEn+hME
	2Yu5LswTJWqzm3K2CiFXRtDj271jEXlovn8W0Oovocqnoj5JoXK23oB2JFcHCN+KJqwHgUXgjqj
	R6tohIT3ZVOALjzFvIJl5r0VJcVJ
X-Google-Smtp-Source: AGHT+IE2O3uFJ+yF3EAYj3QGzcCAyvKMtu0Ii6LYiJpbv2l7DbZH2GxXxFMzaZQmFwu0WiuMyJgpuA==
X-Received: by 2002:a05:6a20:914e:b0:1f3:3864:bbe0 with SMTP id adf61e73a8af0-1f5c28109cbmr9421291637.8.1742111169041;
        Sun, 16 Mar 2025 00:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm5575907b3a.130.2025.03.16.00.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:46:08 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH v7 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Sun, 16 Mar 2025 15:43:20 +0800
Message-Id: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmB1mcC/5WQy27bMBBFf8XQOjQ4M3zJq/xAd90VWVDkMCZiR
 S2lCgkM/3soJYEFbYouLwbn4M69NiOXzGNzOlybwnMe8/Bag304NOHsX59Z5FhzgxIVSALxAiJ
 jEL0fJy4isU22kzFwS01lfhdO+W31/XqqOZWhF9O5sN9Y0ElNiPJIyqAjAeJnGd5/5Cmc+XJpn
 Xt87n2+HMPQfzkL//lbq02f4nuz02ExSoNm6SVBdH7MQcRJgPcEzNyFiKdZL556Y1GdfZ5OB8c
 ttqHTyjArDK03EFElz0YaqbllghZJq2b54pzHaSjv60izWiusnwDq3R6zElLIRFE7Z4hMt3llM
 c20oQH3NFVaS6k7WydF6fY03un/WnGFYQODllYDqSMo1Srt/k3rb1pLkrQvrmtxhJiC9TEx2T1
 ttrTd06bSpBLYiNEzhC19u90+AHJPF8WlAgAA
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742111004; l=6000;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=/O6L7QiZ8zFKZWd4bNiBePCbud6VGcPpsDUPMRXsf+A=;
 b=9XsbVcSTaSuv3OKjj1YONesUpSxojveXf3fy2BiosADWY+eIzTLsg+2NqN2GeUSMujkeTGRgE
 fFzvgJX0rqnAiU+RwmrQyf5n98GpC1ksQ3QNhtb3eU1Q8L2wYdonu8t
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
---
Changes in v7:
- Patch #2:
        - Adjust structure member types  
        - Default to 400,000 Hz if `clock-frequency` is unavailable  
        - Fix code style
        - Fix comments  
        - Kconfig: Rename "Spacemit" to "SpacemiT"  
        - Use local variables in `spacemit_xfer_msgs`
        - Rename `spacemit_i2c_wait_bus_busy` to `spacemit_i2c_wait_bus_idle`
        - Reduce transmission timeout in `spacemit_i2c_calc_timeout`  
Link to v6:
https://lore.kernel.org/r/20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com

Change in v6:
- Patch #1:
        - Give a brief clock description and a clear clock name
        - Changed the clock numbers in the example to match those
          in the mainline clock driver
- Patch #2:
        - Fix incorrect comments in macro definitions
        - Fix code style
        - Merge `spacemit_i2c_xfer_core` into `spacemit_i2c_xfer`
        - Remove `reset` and `enable_irq` before each transfer
          and place `reset` in the probe function.
        - SPACEMIT_I2C_GET_ERR -> SPACEMIT_I2C_SR_ERR
        - spacemit_i2c_recover_bus_busy -> spacemit_i2c_wait_bus_busy
        - Support standard mode
Link to v5:
https://lore.kernel.org/all/20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com/

Change in v5:
- Patch #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Patch #2:
        - Enable the APB clock
        - Fix comment and code styles
        - Fix typo and drop unnecessary description in Kconfig
        - Prefix all macro definitions with SPACEMIT_
        - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
        - Remove all `unlikely` and `likely`
        - Remove unused register and bit macros
        - Remove the "err" field, as it only contains a subset of the status field
        - Retrieve `clock-frequency` from the device tree instead of using a macro
        - Use a local variable to track the current message
        - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`
Link to v4:
https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/

Change in v4:
- Patch #1:
	- Change the default value of clock-frequency from 100000 to
	  400000. This is to correspond to the driver's default value.
	- Drop the minimum of clock-frequency
	- Modify the description of clock-frequency
- Patch #2:
	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
	- Drop useless wrap
Link to v3:
https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/

Change in v3:
- Patch #1:
	- Change the maxItems of reg from 2 to 1 in properties
	- Modify reg in dts example
	- Changed the enum selection for clock-frequency to a range,
	  setting a minimum value of 1 and a maximum value of 3,300,000.
- Patch #2:
	- Drop unused judgement in `spacemit_i2c_xfer_msg`
	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
	- Fix the error check for `i2c->base`
	- Modify Kconfig dependencies
Link to v2:
https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/

Change in v2:
- Patch #1:
	- Change the maxItems of reg from 1 to 2 in properties
	- Change 'i2c' to 'I2C' in the commit message.
	- Drop fifo-disable property
	- Drop alias in dts example
	- Move `unevaluatedProperties` after `required:` block
- Patch #2:
	- Alphabetize Makefile and Kconfig
	- Change `.remove_new` to `.remove` in `struct platform_driver`
	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
	- Change `spacemit_i2c_read/write_reg` to `read/writel`
	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
	- Clean up code flow
	- Fix unnecessary line wraps
	- Move `spacemit_i2c_handle_err` to a suitable location
	- Modify Kconfig dependencies
	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
	  the intermediate variable
Link to v1:
https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  61 +++
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 605 +++++++++++++++++++++
 4 files changed, 684 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241031-k1-i2c-master-fe7f7b0dce93
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <troymitchell988@gmail.com>


