Return-Path: <linux-i2c+bounces-13360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98655BB4337
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A171F19E10C6
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CA0313D46;
	Thu,  2 Oct 2025 14:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9KfRFI+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B391E31329E
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416142; cv=none; b=K4+bHcGECG3iaA/tM4gGWPfNBXmqazlqnYZCrqrBiSIK318EzoVtqhMYW7/0Z6x9PTYbFxxqzf6AfrPnAsFrKq02kriS4AKf7s5OS98YYgRvzcIJj6p6tRETdmCWfs3FBYoZOVSbhwS8XzhLq4CwRQqe7aWsSGKmMYJblPNPkyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416142; c=relaxed/simple;
	bh=RcFIrKoSgnto39HXDCzkc41AKHrLdxTXBU7nIzeA4ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTpFdxPjL3ENsyOGX4qmETt3T36i9qsptcA2qYOfr5zQxHWW8/lw3gnm/Q/9uL8qcwpx8LKRxNolF46jkGNdvp7qeDH6bBdJdIvlR7EMGbB3oMCLIuYhkpF2EMyS0W4DBh6cqWRCgFSB51CTOlPU+hrj7ze4Se67v3XOla+PXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9KfRFI+; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1477074e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416138; x=1760020938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=Q9KfRFI+V4p2NrutMaXfLfLM8EgNpNyJZp4pkIibiCL09hkFLiiQTzzMMBG6Jg7tQI
         r/YAoSDPZrMae77KxBoAezTfDXyQ8ZIX6t9Xq5phkBdXKEGvihIguOXasg2gCpCPrKxT
         rNBoWn22NYHjBabQ50lQLxmk77Ad2CMIH6K4KbbjtmV0oEVE6Nk4vQQFGMdyNf85gN33
         IUr8jfIsFlz2yl9c6mpB+tcMSfVwauunObWILMzf33Pj/vPkAkFQkYd1GsmpC1gJqFkz
         KtHM4WNG3tNF5QgVzXgKgdu3kOW7G6MJcJmk9LnTIOUQ1Ah9FGXfGT76VeKSp9bMgTSb
         m4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416138; x=1760020938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=wYBzjaUDkXiPvXbfT0+zxR2ymVS5T//RV6ttqhv4Uk7xqjPjtms4HOAfxAuDooU8N1
         Kkwzm+1iUuqWI0qULumZP3jVxRtdNvKBYN5KE1sfU02MbHtvGY0j1n7yxRyCvXeTP7Nb
         nrxT08jGc+Jp/8AQ0C97mWZHNI15Utjisi4EeE0Aci0/mG+AZBO04xODCvbIpY2jstV2
         EzDdekJB5lvq9mO4FMYjffeewDussMHvRHgQ7aK/FGk4cHW1qBdxUdAh4N0aLT7UMP0r
         lPrtQls8YZvWgeWCuM8JHlHsFPGlTQFB9sut7OeQ0jF5nbJfY8IcIVjCWvJaqFyRe4PV
         +0KQ==
X-Gm-Message-State: AOJu0YzfFwXR53pcu+u+2iL3SUgZZqnKkNHiIUfj9+CHa7InhFGF75Pi
	LEYEjtDEgEe6RcpgTDyrd93hi9sKaOBFmyukpEYuGX0JGGXo6eaG0fZ53+uPsUqh0so=
X-Gm-Gg: ASbGncusDMPHJ4ThsRkhOrhxqNnrZjsokmztnt7y+uIvKHuTS7uwDb7QtC9hVYGUVzQ
	JtMxczLqUJ/WvUoJcJJMXlJ/lnnryvQLZp+xXClqZ3fzZ2SD/HmKYCK8efUJv+d5L5bM3lA8vfV
	gD9nP29vxEOyxfpBneAI6rRUm5SNAEEllARTpy990rAzw7JRzHu3mKM7rJjArxRpkVySBT5hEWM
	b/LuGu00VjwxEL8RYj8B0WPfq+oMTVG4pCBc9A4AIafCU5l2aZHlUUkfp5CmtdmU+L5cmmKJuHA
	0uRxx22dSQqQgpwxVqYt6WSeq0sJmX/VeqXXUfWGgW+skWA4Ax2QCwFS9CZ15EMRVo5hJYShBtg
	jF5ae3XzN6MTpZul46OwG37RCNzc6JV49XmI6fl2RnjG/+09S9CTSZuJlQcBnQCLcHuq9HfjtnC
	no7ywwSETKvXbMnNjssYgoUrxXUA==
X-Google-Smtp-Source: AGHT+IGOtzlaSk4pcU9eh33X/Hi+M2goQksZbtKwAH/v2LSHcSlzpXGeAeOPN1PpfWcqe7I4kfeXnw==
X-Received: by 2002:a05:6512:2356:b0:55c:d62b:d0fc with SMTP id 2adb3069b0e04-58af9f0f3cfmr2665238e87.10.1759416138032;
        Thu, 02 Oct 2025 07:42:18 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:17 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:36 +0200
Subject: [PATCH v2 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-5-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8215;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=RcFIrKoSgnto39HXDCzkc41AKHrLdxTXBU7nIzeA4ck=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o89diRzxaElr4YwuimquAd0U3fRuYUfF6kui
 ED5Vph5J1CJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PPQAKCRCIgE5vWV1S
 MkfmD/92ZWCqZ+QbeUVymKqEGOTxJKzOoYBSjuURXjqmGPk0f0frTtk7kloYMLTIVVzB1zxwJh/
 vBq4l6zRtFShK/uC42KCcnZ7tKup/o9D9IJxO8KBECwFjn08HowEAP8+EsBP0LiL4qrMrcHjZSM
 qNJd+njT7tz+IOxrYeDxJyC4XYNcoagRR09VsoJGdBp0oKHNUr+fsqiUwLriErQrBbXN00xId4l
 9FQ7qiwiAuUSN8r/3EOMRUFKBJr7CJA0q2t6ImDhT5wGMCOkdt9xjrgXHd2EuG8NVayOtIVLJW+
 L1/99h62x3xYWbf806rrwdvzUBJ6XTGlSeAMOhNR08Uu15egDxcyU+f7x3+wDLd24HpTLqy/biK
 JJPwATk8+qUgJtOBve9DUG1ApYnk9vUnxwlcmpmeR5buV9uwaM9R1plIxEnAemVNADW0zIlweKN
 wwjJejhCDwmb+ztMoxZ4XN/R3kyqXXMJOftsFoN52ETBLHZDTtvlj2XzHWs/xmHZPsBqDKk5To+
 ZPEn/G3Yil9tf0QuQhMVXbWVx+jx/j9d+fEnwtsu/T6N17u9SMiPWBjHInSXfjBBalVEXYctDyM
 JX9htBROmH5/E/pgtErT+JcsmdshvrWE9TmP7M6SCA0ZDepW+trMReOwtdf7mcnfdXRkqDRwCj8
 OHStS1HZ5zBHzhg==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Describe what needs to be consideraed and taken into account
when using different bus speeds for different mux channels.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/i2c/i2c-topology.rst b/Documentation/i2c/i2c-topology.rst
index 48fce0f7491bf1bcd4a851f685b010386c9ce0d2..2c4a1364ce82e353f51608e60d08535f80523fea 100644
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
2.50.1


