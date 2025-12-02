Return-Path: <linux-i2c+bounces-14364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C641EC9AA11
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F37BB4E42A2
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE313081B0;
	Tue,  2 Dec 2025 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5AZlVFO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9883064B2
	for <linux-i2c@vger.kernel.org>; Tue,  2 Dec 2025 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764663080; cv=none; b=NK0bOgoPd9HAYMdeODhPFM1qyGk8OAlS4SZ8gEATothCOp9ScxBmSOMl4490vyMwfo0avRzPNOx3qs4n1yTwl/fQ+VLVKhmkzRObCDWsniWPUV0m0mVxyrKhtug+mZT/rm84q1rRLkG7MigCxhRgVV9lq92I/ze/XVMAcVD181s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764663080; c=relaxed/simple;
	bh=Pi8rg8aDh1DzKC60rhi2IjK0Atc4BXPx6hzEn3Z2p8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhZ5BbIRghB8mahmfDvk2aZqobxte6uNn60nk4ixBbSuaN2xaTCiP+7uoZuMlgjzwkcXi67z9x8mbV8ZKZkZQIkPORZ3jRCa4XZpD75sLrm7p6e7EVuHJhAvwn79w711XF4pJTQlyeXB0HViKbdiZ6SgYlmU3454rUFRj/Kx/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5AZlVFO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5943d20f352so4117518e87.0
        for <linux-i2c@vger.kernel.org>; Tue, 02 Dec 2025 00:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663076; x=1765267876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=L5AZlVFO1hun0/pgujLeRqPc6RYmDhDG26/fO4iAfwpN0x5B67DPR75Q1B00LCsULf
         mcLuoYn2neVl7Fawgz0VDyyJOLQ9phLePSjt3Sk+Vk4clqrvjwcO215F3lAbGFUyfT58
         s8ryKQ3a40eqbJ0O8j10AdQcxtR8KSj4s0vVAT4rFK/WWC91nspEJmW3XDPsotDu2qx7
         qpFxuPOnliJxhLwn0sFiwIm96Ik7ExHuXBeXbBlL1OxupDJ1f/aZxfCQmMHypIbdx0XH
         XE0wJHfyIgYjqwnI7mzRyldLiGPN8uWCy7Ti+vR+/nMza3opOr23VsrLOtvK4ZvovKzq
         P/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663076; x=1765267876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=QE/VktdbkhbesbYpNSOjbWtHsOPgNOS7LMKGXgF8gYFbXJR6ninvam1teRLu5WuyBt
         OrrcpYEcU1mx5TtLesfZRhoUZLHuldQIK4g2wGkw8V2qfmLoVoQDY0aCdEFMK6Wv96+T
         W6s8LmFw4proh3r9pKVsxCZU91SoYy2QzoCPrQgzvCZzXU3I8/9LsTsB1vNiT81BWk4C
         Y9QIa5sz+XhviFyzaxM3m2OAkHkwPY7jnbqUoyVD8rM5lkR/QedpfTvMjyk0pN/giQ+w
         m3nWRqmDIkcMjheWkL1bYka1XiO10SyCEqi64t4m7eLoPqSqVAe8MWf/CVMDrucijPmb
         Hzuw==
X-Gm-Message-State: AOJu0Yw+cpX79k/FObw6CSELQBPOZs17NR+Pv8pABL2QnpUsC4ff9Xmb
	ZjWeqHDcrUjLk6ezDWWAloqER74sBUCHdsye+po3ppNRfosErsd0CYUS
X-Gm-Gg: ASbGnctkRwlnr4VF8CiQP3oBkJI4VzUXFtqxE3wi/zbqVLoPgbnMmlzEg6Y2J26GFdI
	78PYIhw9pIHD6A0NhF4k6zcU7W/OfkO5eEYaFBWaErIEmZM34e9bg50zhzKMLnEGIG7EQvb3iPu
	wjhT0dMYuO3k4aMzy59CEM+ZlM3zZ7gmxtn9LM0lOJg+mBe7a+NS1ZQWe8Ass1o96qW1vXxL04F
	WX1ZuEoe1wC/nkDqC9jyrv5Vny4zYzbpD6HjjTrtB5Gq5HX+ySfnjkLquh7KJVYTzX0L5r+wVfy
	VkmcwCA15iN3eifLlN68VUAXakJznMZhl1kNWIz/hJnafoasPkBoIxoi8d6qrBBX7EMuTKAZk0o
	1H+Q3lVqzkR32CSeDucQGjjwHX1mmpAFEyfv1W+r6dvwBGANoj7nU1tColS4Ru3Kc0diVDy5ub5
	WBY/09OcPe/o3MrbI/XhvXj6d4S+2shD3P2P3M5wxf6kcW5hEnR2ZYsiqB
X-Google-Smtp-Source: AGHT+IEb+VBCVNyagDT5gPRiB5WmDm7HGOACR9Uni4jwKE/gsWWylWuJbEZZd03WMkUc4VFrHJiujA==
X-Received: by 2002:a05:6512:b05:b0:595:7fa2:acf with SMTP id 2adb3069b0e04-596a3ec5f2dmr14180182e87.31.1764663075934;
        Tue, 02 Dec 2025 00:11:15 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:15 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:52 +0100
Subject: [PATCH RESEND v3 5/5] docs: i2c: i2c-topology: add section about
 bus speed
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-5-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8159;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=Pi8rg8aDh1DzKC60rhi2IjK0Atc4BXPx6hzEn3Z2p8o=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8VLTl5xCyf2EQf7wT9s/dzhWz/rFWA8dubB
 OV3UgpqHRqJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fFQAKCRCIgE5vWV1S
 MkUVEAChVEaAjhda0fCwByquOerUJWkhKRl4FGW3qXonGb3Ma7D4RdRzBLV93voH998w5p/MqTs
 lYhAPv2qInDSlEBmMVsR96vh1dv5gTW7yi8R+ti2X5za1pfp5nTVgYixDAsqsBa3oNyjAGCTkcz
 qstgqqCFe+/7Ya6pMq9QkyhufY5oi5yU6Ag69RNlhc+NHRq5m3E/Ay+wiTqrxxQGRBImQOS562P
 MuHX/W/OmtmVUA1U5sfr4bKBHgo5UnNsYBIUFLXOV0lrGsqIRWHE4kWxfP1l1AfBXVjUxHTWYwr
 n9+nZg74gQ0Xvr6Dz5VTNGKfsEJYO+/4EOx55Bl8fYeIDVzyjHTjONSZkdh/Zw5RQLupBzIudov
 KFqdUq7VUK53B4AbufrtYN5sF8om0HqSuqMFoBrNTDjBrUKOoFyRLU2hfrS5C9rWb0Ibdm0Ufah
 1ym7vrKv325JS3g28QuNQTWWfbjSgKi7YCfM0pd8c0xYGdfnsUgN1gXBWahGz6QSS+8dLyHF5dQ
 mSyuDYziGbAxw8SDCDwgoWsBH+by9XfM//CHpvGNgw6ps7HVlRcRGVmhlI5shgyUXC/9QCu3kXT
 rY6lFqOtgBwZibw0nPHJvvxj1cyof4If/1e34OetFiY3h3Nj/x85DsEis4QI5v6UyK5tXMKPcN7
 EYvlva3XGyvKwmQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Describe what needs to be consideraed and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491b..2c4a1364ce82 100644
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
+root adapter would have to be is set to 400kHz, a speed that D2 may not support.
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
+is supposed to be. This is usually not a problem.
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
2.51.2


