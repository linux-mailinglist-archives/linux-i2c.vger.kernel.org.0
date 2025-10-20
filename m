Return-Path: <linux-i2c+bounces-13662-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B0BEFA76
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB5F64F14DD
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B892DBF5B;
	Mon, 20 Oct 2025 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqnhWe7x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B582DFA38
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944690; cv=none; b=BfsdWB4P0MOLJJ01rw8FW1n+VQLK74R/rWk+/z8HE5DdX9HQKTdbz5EKinUpm93Dpqmzoe5woUwBQFU/pzeFUQ4T35/wIbhXl6YaydgT2rwtbpEfKZNuXpUStG3yrkR01VBy66iyXUnrhArQi2Kwbuzjf793oBpue6vEdHCdFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944690; c=relaxed/simple;
	bh=RcFIrKoSgnto39HXDCzkc41AKHrLdxTXBU7nIzeA4ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJLCeUA/SRssCCFH1ycPjv2sK58oVjNfvx4+a15RuU0pvO5yvlgvSTYcU2EpqnerXwPlD+xyfMqjBKqKQqW51n1uvw56kppwTvc/JT21/sd/EW9DY+I2maQmueQ1Nv8RdQFd7dPErLsrVxCPDd11WEF6XlHb+KAZtsgf9qulYYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqnhWe7x; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-36ba647ac9fso35616501fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 00:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760944684; x=1761549484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=WqnhWe7xiVmG7MuI2MHLLUfaYfaM5AdzEBAYUXPW8urn0+i52z3iyMqEsYsB8btTSk
         YaDo5rcD/BiACFZhSEqonVOTi8HJ1SKWXpEihQvXPB9P3IC2IhEgNvE2z2RR2G+FsvVh
         gaxlolCTLOAr5HfogFO3mN/sVrsd9HyWO54WUuHmjdQNTt/Y7U+inDOX2P9JRO0ZhYCH
         nV5LHXd6tn9nYHmPyVK1Fju8RlDA8jv6LSg6HwirBN+RyTbrwVGMAoEHSUwb78MK1CBu
         VsCdY9qqFZ8Oab4v0CFQr+enJ0ahrQl2Sv2NlydYRGAetrONYJnMIWFaoJynBW8lfnrj
         mg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760944684; x=1761549484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//TUA5vuRqCmK3LhoKxiqeBc8EfoelaRnhe5iPSMmkU=;
        b=SEXTEbczvlW1yVkjHdpqYQXZqP3qQC/K5L6G2lVg1O+SI4kRa8SGv09qxzdCP4VhsF
         Tqp9nB3rr2wpp3z/XufgkQZe9tcBmq54KjxRQiSFOoYZa2mTdwcs2QmFUb30W11mYVlG
         1nXqgWYhkXAlM/1jOUh7F1YKa3XT5yMutXKKn1bdbmCngDzU4EuTk7cydaHffNZ4FMtl
         oWPbvNRVHXtKxZk7KtQjNHFNa8ycW/Kd34qdU5z1+0fouhgJjEDlSZN7LliWW3E+59ST
         q4bW3KDUb/Ty7K2goCjNTj2e7Ct3pROGRKLmaAyHxv/B/cPuMZJxZxjk5wT7SudydRgf
         rYzQ==
X-Gm-Message-State: AOJu0YzQxer4e/TAx7OaBRTELlo7ob1k2FwQFd10JjqFzWiKoDkvT/9A
	0NRX0VEC5gPdeTa8jNcfTWgm0w1N4yiJzjhiyb0LLrMeXmNIwRv1TFE2
X-Gm-Gg: ASbGnctu4F/LwLgjKitCntOQESgEjwvWIZHBQinXIqOcX/HM23nRupmzzhxxRZ4ProQ
	ra8UXwC5+aEecAV37Zi6C5WEmfA3q8pzJomAfVv6U3T8k8RYULNkhsPhYz4uY0YF0+oQwN/Yu66
	LhtexFbNqcncgQYl7SKV2X9tu79CP1al+FC0tl13WAfosqRwDDISUQeNspQDRtlKSmKKHxcPk70
	Ds0ysAHarZdXlyRZSdTtsih31sfdRWsybxZrjbADL9zM930hzoITvJwd4177hQjED5BcUDCHoWG
	ITF6QpFAyKnviatOtbeUHF0FgOjxqWMvlDGq2dl82kydlYRB3pLNPqE8QbyQG+BT+CbNSFRoxCJ
	Ps6yqt18CGCDRG95pTt1kkSsqlRoejWEUwPMOGiKaxKv8yYpF4OrCreNbJqfBRTpEeHuG2rFiJK
	KTD48IyNUCChJFW7afxAkBrco7zRYOVWr1c7hnQVgeUd9h6n8B+q9xKrE=
X-Google-Smtp-Source: AGHT+IHh2wqGu0ExNrwddXEATOjNKtBcULAJBbJEFjC5sgHg1pbE/2OBk6y9xSUU1xLzPcNt/U/tew==
X-Received: by 2002:a05:651c:1595:b0:372:17eb:1191 with SMTP id 38308e7fff4ca-3779793eaedmr35769721fa.18.1760944683996;
        Mon, 20 Oct 2025 00:18:03 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a921ae62sm18863341fa.21.2025.10.20.00.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 00:18:03 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 20 Oct 2025 09:17:28 +0200
Subject: [PATCH v3 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-i2c-mux-v3-5-908ac5cf9223@gmail.com>
References: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
In-Reply-To: <20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo9eIeQlAhgS2qIv+uQnFVrYg/iCLMq0RlKE/4e
 wSYKwI9FQ2JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPXiHgAKCRCIgE5vWV1S
 MldtEADRexPNmR5XRZqMic/rZNCi1v0rUBibNGFESL5UgamBrAak845xal3CxyKG3m3SI5rVXvI
 DS//zyQyKLg+R8KWvq6LG+z4Vp/tTlhaNmlgDd0hlepqQzWdREmNbyFI+p0ojE8mu55ZO1zzBr2
 6/2bt3n17WgXeijZ1cVb7cetWzCo9Ffx3sKinanq2TDwong0mdUHBWjBCS2xZIJl5d1Q3nbYnPb
 CYCpPI2KRIRPyWpkbOjY+pBUMvnZ0BPgge7LX2TCaz40T+JAcEcDnQP+MW5QmMpW10hd6SX9Tc3
 B5j3hpY+TQU09HrtkLNctxszOMW/sEhIst9Oo8WFaA0vMTVvHhyVIkOvvvpmB68y4TPtNzy74PP
 lElqXlf0pinALTB5BNoaUEKiTn9BfwAUPgLGQn+eySwdGy/EYrXNkffQLUOFi+jljALZvHKrUeR
 CCG3rp94cCFRNLONejMXKqXRPHpg5uM1lwHYOeY2Jj1ukfB+IhiT2VL+Mj9RWI1JmWg/kyJ6w1G
 Ygvrvr0Nj/KyMKZ5YeruFfpdjraUviQLJ3t1aVAnhiiJVFnq3uDgrb1A5pizhP0l0S4mHwuT3aN
 nsO12bVYq7N9qFtKObkYoz0jk62YMGiQGKi5JPu3Cz9bFWfzmWCeHEsuHZmPdRyIWjGS++LuMTR
 BQIJ+K7E9T7mj+g==
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


