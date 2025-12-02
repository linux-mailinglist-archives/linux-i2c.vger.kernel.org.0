Return-Path: <linux-i2c+bounces-14360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C82C5C9AA04
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A98A54E4A73
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113DF221FB4;
	Tue,  2 Dec 2025 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsPy9Mrs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE5305E24
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663073; cv=none; b=sDGQcfjd21d7Gw6BU/rV1jEkhxy4cKOJ/+m//EL4yTrRs5x9BWiuBOQ4ZMiVcPYmV6viLt2CJ8C7qgfYQkZyY06SkSYmXB13eSdN+3FcuaZ2kNtqxoZCqOyifIwwsaeZtPrG3h4tazt13JnV20aqwyWtV+cNjB1vtchzhtiQrZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663073; c=relaxed/simple;
	bh=4QBKB6Il0FtSYd/ap/LeXMOphioqXNw9dMPyFWJ8QJI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=krOJ4kwz5ijtkeWzfwvhLWj/mYUg3FyZZGZBPeSOrmk8I7aXEsw00+aBfH08BreqIeo9Ns613sw6ST0u+noh4YM5JtUx4jlI7sMUedT229Jy32hmUWIa4KLxurjhjpXnGFxNXtY+JSKJPQqU45rocVUpBVSnXy2zIeMr3T5Gx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsPy9Mrs; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5959da48139so5534551e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663068; x=1765267868; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=QsPy9Mrs3ntd2vBB3gHW5+w5Vuq5eMUPpuIiAArPz65YPxnHdbdNN/hlmLxp7j+cYA
         KgdHXp8/haCeykxWwXc4pQkI+108ld9ITbHZJfSl9pk+o4xAqbrzsJhqFSa75MUQTTtb
         Smc5L+l4KejzkkEayDzWX5an6vNHiu+2CdfGLankfazQKLzrFjcDkHnQdw7sTuXV6ZlW
         0UJ5v9SfM9pH6TPeRxJn3FVpopfnJ/6XoIgJNCuqNXk3GOhAWX5QMoasr0ehIq7k9uR6
         Harm3xOOpN1ou9mwAe1IJxBC6ejamQEiQlh4QhAj8CEJ1UdV8GR7RTQj0UUlpLqvWhPM
         KshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663068; x=1765267868;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0V6uSK5r5A6NQwmKa55NukJxjqQrLEAaKU2mAU2+s=;
        b=p19g2GfXR37LuLdcIFLbAE+KFo9MykIyG3Ntk+OM8MqzEPr5GTJVa6jJM+A9hWqd+u
         3Ryyt6yPTSeyhoTJYEkfftN/KS/U96ewQHlUC6H73RK0PGKW7CfT2RPatpJ6Q1ey3sHb
         /zcCRdVe2wo1x0fuAwA6rdQrEBwILQGseAnYg3CY1Clc+Lw61+u6YXQwwGYp33ghkuwi
         lspfoF38gJclvmZtIu/5f2xAFB9x46yqha9bQoZtKaVxGBqS+6vNt5lbh45mKMBew6j3
         1nbNCNmkWKfuZ9tpWuw+5/3J64nzrOMNtts0ik/8V4t7cFtkFAAmigxRj1vEJrgwoCW9
         blCg==
X-Gm-Message-State: AOJu0YwZ5eiKSoM8zYl1XW6YLokMp9GpAJ3NDc2vMP/B9WvaVU03sK4i
	rJvjUe1dBdbEUIE0VyJTX3A/HMdkcjj/tcSUCT25AENphw1maxaOKDpB
X-Gm-Gg: ASbGncuDiqRDuLUuAmkrKdl9PN1sDqwLzeccotIgnxIRkpgZf9rQVBrQb+eliN9Jrf+
	9Yk6V2d2DDHOWo+7zOnb5LDCdGS0Lxf2P+TB6yZsCK/aideroqIcZ3H7TSPCOWJ9qbhZ7CgaII2
	H2cWHNAv834BtZXjYqPTpohd7RSEeL0CL8MGBWBeXNgHA7ZDi6mCe04279QeZlovU5AFWD0aFqR
	X4FdO1haFXhm6uqVQZlMP0U/o22PWX81oFwCYtRIeLF+9FjywKhr9O1R6e7tWNRrlZJ4s9TJrqQ
	oxoL61lY95GNVb2Y/vj3UTnpk5RnnUOqlhRDsc2PAPBXFpX8OIsjkkddwxoWW6co3+OfUfZzEfW
	R5Uq0Z1UEuNLLURF/b70Zpri4eW+cKPAzWtXj8Ok8bNyYYTs14pFhzCJkWKiirBtYT9asIqXjhL
	bZnmy+tCJ6YuzLwn/06sb30xWRl9BCVPOg3RZFJLAxGdTrwiYlam2EUi1/
X-Google-Smtp-Source: AGHT+IGcS7CAMpFll0HDY1O5Zc12OFfNXQCkOaMz5QDXoS3vLroZPpTO+QAD1qGXjYgUcQjKN8+L0Q==
X-Received: by 2002:a05:6512:238c:b0:595:81c1:c55 with SMTP id 2adb3069b0e04-596b4e5291amr9885439e87.8.1764663067375;
        Tue, 02 Dec 2025 00:11:07 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:06 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH RESEND v3 0/5] I2C Mux per channel bus speed
Date: Tue, 02 Dec 2025 09:09:47 +0100
Message-Id: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp78pYwoet71tdqujVKWQY+kM7X6WyKFAkliF
 Xjst0GN/jCJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6e/AAKCRCIgE5vWV1S
 Mv1QD/wMhwHoL7P0C1vQazs6dCzVgyo/k425LFs4zXAn+5CKQ2bz66GMez+ydkttdb5SJBWqSlQ
 8MZcZ9f3oMizlyyRkpWSXhfaxWaNjOCX6MZhXu7nblI3jQQQ0xODz3Sr74G+W2iuGJ74gEO4ye9
 s7+LGvIJ6eJ8DwyRwkYQmaJQA6mRfY6SxH2dMHhPOUNCCRf4QuA4AEnejDhk8QIsqzKZcRpYK4Q
 4+W88jRIDFUF4hwbml/Yc+LtLaTJjdWeLKDVatv+/Dq6/RhUHsF8u723mt3+5li4rUk/FVN/fVq
 0RMarYoOByISWXzB9D8cbcvJt22Voc5ab3yxWBBgRKApHR7v20CGTG7q6LKq0ONKKkmbZl12OGW
 Iwy9rB3SDae4gnConpK+1+qmfZQ61MmlnRhbIBO/P1tIZRHh3t/O80FapUz3uP+WTJqvwqn4Oxi
 CrNZl/bJCNlJrT2OWTJWoTW0D92OD2AfVTsMg+OmDrtlUDthA5U5bDXDotDCwQraaM24TA3KS3J
 69tXDM9D+ThyovYITVrMauPapqr2Sp8Taf6RDm3S8b0gJN9GoDkJunVEfXEn+REu4uBJ1brW1AE
 TLV5T9QspmWzZdq3bT5LzBWgYiTNw0b77foXsHAjZtZyss0T2FzOuJaA5ia5H/M2UGVs+NXV0jP
 Qqk6GHTaggq6Vlw==
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


