Return-Path: <linux-i2c+bounces-14106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1936AC630BF
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7F61363E66
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F145326D70;
	Mon, 17 Nov 2025 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVu4e0cL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4A4326D62
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370338; cv=none; b=tyHmyGBhy/6fA1ANjgkhKTOnDw1DKsGMBKOSS6cSixZWibAXu4T7Q0MKNP8jbdBgIsHWSd9e7SoSO32GgjaOlsirL8s70Aon4W56INN3y4sGpdrox0XkiOjcBdd0hl1In4hySRvzxmqOJG+qJjCSWb9MxXyBWOff+XptPDhfLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370338; c=relaxed/simple;
	bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=psIz5oaaSuXSpRMEOrSFy4CF1z04b2ems1idimeT7hXQO7ekVI0BlBuMDA5rC7mrssiJg/t/yg1TihnZ5DMG9xSFAQAxD1NHuWUvcuq/oew8doQQ4rLI7omhoEZQ+Tf6pJEjNsuMdNbfXkhzxxvseX4Mh+z4kSEIms1nJhJ6vKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVu4e0cL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-594330147efso3752170e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370334; x=1763975134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=jVu4e0cLgh1GKxxpRecqL8niUHKGguQkqS8VYPU1SFjcgWzToMtRr6afY5ahPOgfWO
         IkpiUEQGQEBKcspDUl8GnL5arU4ct5V7iKq7iz5g4Qc0XkoH5xJb2Vfwi6CgalWt+Bmt
         SvxeN9CCr14+biGlHk1pJSgIPs7RgAvl586ATU4+2OUP2C2BrsrbVCKK+s0NrbTKegmr
         EVSTSSoMAZdln07wWtjrS5o2yP6h/KjhVISkE2+2/zWdi1hEVw3IX0mR8b1Gxr6xd+EZ
         qMzm9weFjZQajddtSc7Xftgp0zgYvm3UkLMROQtcY9O+da289eGRzMo4+0St1qDkraZz
         c6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370334; x=1763975134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=C5zMPR08FrNchO6F87D8a3Zxu6jqWrtWwidSPMf/zfLh0+WBbjfZqKQpzPokZAkJ3i
         mFglDby3oTqFIqVw5D9f8ys0luf6fzaSZB5VVbW6ST/hlfTMjIFxt9QyydxfwO4qPMm6
         yjkUWRY1E2kzfES8alX4d+9M1Q3uzCRZdPhIAaoqDqJ4mVofoGLXmHKhGXcW5MW8CCJy
         rNIExPKBnRyU3JsLtKd6k4wbKDkt2KD8aL6w0kdD8LGgKd2ffHwOGqJinOGIRDaMAs9W
         dY6q+ssWilDWZ/61xkO6P6j9+kNbrB3C0F1VkEM3AdwbFE+nOQ3WwrEuhaACf133o2Jm
         B+iA==
X-Gm-Message-State: AOJu0YzTIlIazXVGGfIlPveSVByjpbaR8wiF32u0SsdRoLldV2zCzEZW
	KomFAY9ygJKhnK9pfcgmmVK/0RvygsNpu2HJ5R5rGXgMlD83AYFOc016
X-Gm-Gg: ASbGncs377mHcU9rjMU2Pm0Ph3pSeksmvKaWFrtbB6LptKRCAohIbNcflrsneCI9pdZ
	iuCcjfyzylcNYjO5R725SrQxVWPbh3UBviwIrMCicOdTduzzibqHUfClAa98DBnyZG0/Ea/ueyQ
	/eM5gdSPW30qox6WbWtN8uggdBbr6UcOZpfg+GNdlOa+UeajFuY9KygNRU5PjLlyVquZ3J1ooxU
	svHZW7FQUnK/LeDJEEkDP+Rm83LBzgfvRZp8HJQRNqNKanSNTjNYMI+m+Y9iU2SVl9S3NF64d1V
	QDlINc3fhUGsUe2iWA0KSa2Iry0I6J/UMuEoLyWIQWiOplHTAxOVtPvE9jSkEYjhvbdPC7pmgj6
	+69NlU/yd/YL4x1mU6/1qdtcf2KiI5HGJOpt9ixFq0BWQyGcUpqIF25MfVTjsc5WbjVTNwg6f0L
	VUe92l0nz0g+qcens0FyXhPdvAnH8OMEiO5aJeOehI2uhL2ApAIrUq5ToM
X-Google-Smtp-Source: AGHT+IF9iVW0fdi7kfbYLREb/n/Cv1Xn4XKgZU7eShHWEirTBc55yfsSKxO9Mv0CCYMHSH/dq/K+Qg==
X-Received: by 2002:a05:6512:230c:b0:595:9386:6b8c with SMTP id 2adb3069b0e04-59593866ea9mr525912e87.52.1763370334306;
        Mon, 17 Nov 2025 01:05:34 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:33 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Date: Mon, 17 Nov 2025 10:04:57 +0100
Message-Id: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVAk+R8nVxy9pFlAJFZVCkYDRmQFIMODmwqp
 f8QEmABpyKJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlQAAKCRCIgE5vWV1S
 Mn7yEADVderhvJe3xkcl3xeQxYz7gC+48h+X12wE5mIKuteQz8HJ6ev//FqO2/SZpfZLeoExA1J
 zqF8QfSRIqwxIA1ReLbQl//ikrLvi/7jHu5IoTcwWkpNO2PKhC4sPI+DqvmTBNgM4tHAs3PPYt1
 bNroESpygkBxpoQgGgiZSbqgUGL6DJDZYFR4SYp94gKC2ZNE+XQBozJgJ46MejWqRS6XvNb0gYn
 gvxnVy3UzCXsruZKTQ974XURw1HI9k3zR+BaWjdf/yNkhfyI01Qib4fOyarbaqqjav7+fsmRVyJ
 5yH60InV0sOIvflQVmK0/sw5GZmrtpMr39UocK8UuK410cETtEbDj1jpOcMFY2Tm2YLN5UgXVBT
 Gs93fkhnHwmwh8Ur3Gh3gG5ndm9luU6jMOxOVL5Huf51qv9D7tKfY6eBMvW2OTSagIgaEmbKSxe
 IWGsdC8kumhYD7+i1qGcvMYMkafacR1nHBlMeCdXAvNCbR529It4/dKvuXMnXp9XN/ziGHkDmMv
 Aayox0mFoLos2rZv0FhoAqln/GM7nU/2JHQmCtMf0T1YrpL9/XiX3ANkGtwzgbZesGKtQzaQvzb
 Ub9Ji9lKbXgGh/WTXkjMvEbJMPZ9g444ZaqqNa8l+lZP7UykZnjjGrWiYdkD3HYJLVIbILm48ZX
 H9+ggXzn3Ss/jww==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 324 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


