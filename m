Return-Path: <linux-i2c+bounces-13075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254FB8F1DD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F0B179538
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 06:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E7D2F49E5;
	Mon, 22 Sep 2025 06:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQcwVUQz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD22F3C10
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522116; cv=none; b=BW5uNAzTixOE+7YbO0ofqOY+YNnYNtKnHI3qKw+aeFSeRnDYePNe93aUGy7XWKAKZG9cZNRga02MC7QSBwY6n0seTaViaUqxlS9h46iv6KYhwqjrnXZVsR4JYD86fS+w+J9B2t6A9M+uWbZyyTVo6BtqGnK0HNa/QIpfK9Ps/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522116; c=relaxed/simple;
	bh=S7HyOptvlFZG+2Q7UACyCuq7yJ1BzDh+UGhw42y2UVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwbuD/42+B4VjdHMtp2qfNjCUZNpLjT6oCirZJtQVXs6SGodfEzkBrlhT9YeYZs5p5DYPxeC0KFpFV0T3OmT/oDs+vllKZ4oZcn0+7f2HWBXc1d+5pYBqL1el/mWKHRJBYmPRBJXKd+NXgjPPQyBOPyPzSHXKDIDe01B40IjUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQcwVUQz; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3613574aecdso29245961fa.3
        for <linux-i2c@vger.kernel.org>; Sun, 21 Sep 2025 23:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522112; x=1759126912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Qc4JRX4CtnEK9xKvde6W63LFABE82wXLRsYMp9oSo0=;
        b=nQcwVUQzX9t5lsmyZW4kYQFjIEvwPGEqMrqQ439Ww1CWcVK3vKFtEMSS//bVj2FLta
         ocAX3CZhXgrleTWCpaDPFlccaZoj4MTfmXPCNllakFQFpmO2GgcRdyeJvXKcGXjJycQ0
         /4ydlXpfpFsbA2VLjRQA6Y08oTJmSJ2c3O6eGuUfjlER6zgppb/tKxMcm05VBiLeTS3C
         H3yeO/A+INtpV4gR5as3jWxiWPVcvA2W715Xx1wGyNVb1KvsWYo1qxkJBpdAzx2jjZTt
         8diH1al16BA0oup3ncXpiPAr08yOWzyxm06BeV0dihrMZ/sV7nE/0R6vAc67t7KpvXNG
         Spbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522112; x=1759126912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Qc4JRX4CtnEK9xKvde6W63LFABE82wXLRsYMp9oSo0=;
        b=X+dysST5vycB1/qjJ26Yz4HIr9wkF9yHscBIRwbxrRG7YJjV3DdKlswSLqg1r+wTos
         dHzlLKCGXw8rj6envVj3MsqewizqSD2QvQJfGkbHimLR9VP2KBLm/9rM5M66n6/tA+Fv
         +PcRqlVE2DvyxvSPsttE5FxSO/u75HZ9oiEXz4t8JNSMeSIauO4S/Xgcsu8S5Dki/cTn
         DazCfeKJdiXCzm7YTVohtU9BsnXPjl7zIWX0ttRFjWPWHkoBjY0eu2bhnWCH9Xl7yAoq
         BxqTt2nkgL0BFjP3inTcnTUU7DGdRUUjCrUCq4aGMDAsmZ9cXqfNmtaOuznAS0i65bnB
         XXzA==
X-Gm-Message-State: AOJu0YxYS+jTD8v1IFAlpgdTjjbQEUEvDC8IUhEb+VWTrn4YcuT1Ki2u
	7O1sHp01O4vHI2dirtaJluJPQBM8T4siRb0X8tc/R0YAd5301DCBzZF3
X-Gm-Gg: ASbGncujV1Bzo95+kxtal5FcxCeO5Ve9i411YQxkn6ElXuKdFkrpgl7aMXKkIx7mFyw
	ftkGWIJ+TMPPDER1wMztV5VsWsDuXh24tavJb4unhAa0j5uUjffEkiZB44xhgCKoaC4p/0mIYvY
	iE50DT8UolS8T33CqfyWRKzLbvPr49VRrkPlXNlU0DOU2tNvWkR+GZ2gtsRiSPNck0uqc204Vk1
	0Vat/Xc8EdztUJy2mY0jWa1iUPWKHA5d7+zh8vZykqRY81lJ5LVFXKg4epmpfYGcaWj3BXNwuXW
	TAwbP2jNaX3wVDG8Mqfaq9PgVoTP68J4CX3eFXzG0lJbXOLvwzJpswQn3zrRLIYCG9l9/sm3eVL
	I9VoGXYwQIBv4zT/HjUkTe3NGPlDXy6GNZ/3h2d7Y2UwLKz83FgS7pDjeT9EhR3wHTAg=
X-Google-Smtp-Source: AGHT+IE3BRCwhlaSY/yzdOewH/qgttb6VJWE4iIrGrjD9WPQORlK7oUt2XV9C7AMcbiiewXRLggrcg==
X-Received: by 2002:a2e:be24:0:b0:36b:2a0a:b906 with SMTP id 38308e7fff4ca-36b2a1a1125mr8259561fa.12.1758522112136;
        Sun, 21 Sep 2025 23:21:52 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:50 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:02 +0200
Subject: [PATCH RFC 7/7] docs: i2c: i2c-topology: add section about bus
 speed
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-7-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8207;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=S7HyOptvlFZG+2Q7UACyCuq7yJ1BzDh+UGhw42y2UVE=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OrsQeH/4jt8AADCJJyWsja9PeShuzxIPhK2N
 ReEuabziq6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq7AAKCRCIgE5vWV1S
 MrL8EAC71SR0gv0PMX2fkCz6yQlh2q10PmcUOvMym57YsKUaU6uYOnPodRtxThthpqvd0SLlPe5
 9JuEl0zRpP1S+J2Hx3Tc3KAEz/aki4zF+S4kEUlWn6cAsq73U5qHxhcbIGe2/d6wRR/0F6i9KWP
 x6a54MHoJeMWa9a+1xP2kPqqcTWyZMhfe7LYeci5eLqjplD99203lcCzbZYm2gtVXwyfikEHpin
 9RJrrJr8xv/a6LA/1soMj1u3mXbEnPP7hrDCQy3b3PjO2oX17LNulfi+Wh9AY62tITR9R9rOFQU
 P3hMEUnFPRJWU2UgQZ0c1P6Q1SqwsSRxncNf9edn+1gi9bnMMKTqUn5t6avCQyJhR9y7/W1oPq1
 jA4aewAG/TITkhKn0xBpfdA3MBiaPWR17McEEYGt1oZa7yKYWpmmVhbJWi+rRm4+Lfm605hPd2Q
 6CvIF3ejobCKXMagRW8SUO+hXaipbHKbjwi1E8iFFESRDH7Cx0ewM4N2YEi51w6EaWAd6LQZFLM
 87dLaMjehPMdEN9hLzAo78NRJiliy8AiQ1ze/bzehww5cozuRYgOpl9Xg885z5KKDX514HI+Os+
 cB40NlNalpBbn/hGVBX08Et23lJEUccmCpXvNbrYEhdGLghYEouK/fWtj64pxNmT6iukF1EX9iN
 1AlG9a3DvERIcIg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Describe what needs to be consideraed and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491bf1bcd4a851f685b010386c9ce0d2..362859b5de224272941576a9c82a04843e56f0d0 100644
--- a/Documentation/i2c/i2c-topology.rst
+++ b/Documentation/i2c/i2c-topology.rst
@@ -367,6 +367,182 @@ When D1 or D2 are accessed, accesses to D3 and D4 are locked out while
 accesses to D5 may interleave. When D3 or D4 are accessed, accesses to
 all other devices are locked out.
 
+Bus Speed and I2C Multiplexers
+================================
+
+I2C bus multiplexers allows multiple downstream channels to be exposed
+as separate I2C adapters which also could set their own bus speed.
+
+The multiplexer itself cannot change the bus speed as it use the upstream
+clock and data lines to communicate with the downstream devices. The speed
+is therfor changed in the root adapter resulting in that the whole bus is
+affected.
+
+This increases the complexity of the topology and some considerations must
+be taken into.
+
+Bus speed
+----------
+
+Downstream channels of an I2C multiplexer can only operate at the same or
+lower bus speed as the upstream bus. This is because the upstream bus may
+have devices that cannot operate at higher speeds and those will be affected
+by the speed change.
+
+The example below illustrates the problem.
+The root adapter is operating at 100kHz. D2 can only operate with 100kHz,
+but D2 can operate at 400kHz. When D1 is selected, the bus speed of the
+root adapter would have to be is set to 400kHz, a speed that D2 cannot support.
+
+This topology is therefor not allowed: ::
+
+                          .----------. 400kHz .--------.
+        .--------. 100kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |
+                    |     '----------'
+                    |  .--------.
+                    '--| dev D2 |
+                       '--------'
+
+
+This topology is allowed: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+
+Preferred topology
+-------------------
+
+The preferred topology when using different bus speeds is to have the multiplexer
+connected directly to the root adapter without any devices as siblings.
+By this arrangement, the bus speed can be changed without affecting any other devices
+and many of the caveats are avoided.
+
+Other multiplexers in parallell is still okay as those are locked out during transfers.
+
+This is the preferred topology: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D2 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'        |  mux M1  |--. 400kHz .--------.
+                          '----------'  '--------| dev D1 |
+                                                 '--------'
+Locking
+--------
+
+If the multiplexer is mux-locked, transfers to D3 may interleave between the
+select-transfer-deselect to D1 or D2.
+This results in a situation where the bus speed to D3 may be lower than it
+can handle. This is usually not a problem.
+
+This topology is allowed but some transfers to D3 may be at 100kHz: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+Multiple muxes in series
+--------------------------
+
+When multiple muxes are used in series the same rules applies.
+
+Transfers to D3 may interleave between select-transfer-deselect to D1, which
+results that the bus speed to D2 or D3 will be at 100KHz.
+
+Transfers to D2 may interleave between select-transfer-deselect to D1, which
+results in that the bus speed to D1 may be at 400kHz as the transfer to D2
+will set the bus speed to before the transfer to D1 starts.
+
+This is probably a bad topology ::
+
+                     .----------. 400kHz .----------. 100kHz .--------.
+    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
+    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
+    '--------'  |    |  mux M1  |--.     |  mux M2  |
+                |    '----------'  |     '----------'
+                |  .--------.      |  .--------.
+                '--| dev D3 |      '--| dev D2 |
+                   '--------'         '--------'
+
+Multiple muxes in parallell
+----------------------------
+
+When multiple muxes are used in parallell all access to other muxes are locked out
+so this is not a problem.
+
+If the muxes are mux-locked, access to D3 may still interleave though.
+
+In the example below, D3 may not interleave between select-transfer-deselect for D1
+or D2 as both muxes are parent-locked: ::
+
+
+                   .----------. 100kHz   .--------.
+                   |  parent- |----------| dev D1 |
+                .--|  locked  |          '--------'
+                |  |  mux M1  |
+                |  '----------'
+                |      .----------. 400KHz  .--------.
+    .--------. 400kHz  |  parent- |---------| dev D2 |
+    |  root  |--+------|  locked  |         '--------'
+    '--------'  |      |  mux M2  |
+                |      '----------'
+                |  .--------.
+                '--| dev D3 |
+                   '--------'
+
+Idle state
+-----------
+
+Muxes have an idle state, which is the state the channels is put into when no channel
+is active. The state is typically one of the following:
+
+- All channels are disconnected
+- The last selected channel is left as-is
+- A predefined channel is selected
+
+Muxes that support an idle state where all channels are disconnected are preferred when using
+different bus speeds. Otherwise high bus speeds may "leak" through to devices that
+may not support that higher speed.
+
+Consider the following example: ::
+
+                          .----------. 100kHz .--------.
+        .--------. 400kHz |   mux-   |--------| dev D1 |
+        |  root  |--+-----|  locked  |        '--------'
+        '--------'  |     |  mux M1  |--. 400kHz .--------.
+                    |     '----------'  '--------| dev D2 |
+                    |  .--------.                '--------'
+                    '--| dev D3 |
+                       '--------'
+
+If the idle state of M1 is:
+- All channels disconnected: No problem, D1 and D2 are not affected by communication
+  to D3.
+- Last selected channel: Problem if D1 was the last selected channel. High speed
+  communication to D3 will be "leaked" to D1.
+- Predefined channel: Problem, if the predefined channel D1. Set predefined channel
+  to D2 as D2 may handle 400kHz.
+
+Supported controllers
+-----------------------
+
+Not all I2C controllers support setting the bus speed dynamically.
+At the time of writint, the following controllers has support:
+
+============================   =============================================
+i2c-davinci                    Supports dynamic bus speed
+============================   =============================================
 
 Mux type of existing device drivers
 ===================================

-- 
2.50.1


