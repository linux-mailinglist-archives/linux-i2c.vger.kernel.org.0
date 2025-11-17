Return-Path: <linux-i2c+bounces-14111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D0C63102
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A40134FAE2
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67463329372;
	Mon, 17 Nov 2025 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMO6U8Jb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33656328B42
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370347; cv=none; b=XowZ3H4RkmJjd+SWbtoCEB7QG31Fejov2RubvlDSoKbtwGBNmxkpurgCzVotzJJko48HoE0W9TMp6AtEhuGna4lS4sLWuEpLX94EUrAp4u0P1XTrKq2KIstkglEIpCx4F+tS+6KPzNl1L93hQ6/2m6Nk8Z8DpgXkW5YFX6RhU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370347; c=relaxed/simple;
	bh=Pi8rg8aDh1DzKC60rhi2IjK0Atc4BXPx6hzEn3Z2p8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOv0aC2Jk0uYq33Y+/wvzKN6OCxb0qMXYiJh/vr9mqSusdXr592YoMZQFZKOaO1uQyAoav9T4Kp3CpaqqxfRjvIVm5ol2nxczWpEHDYQJxWDZP5fI+359Nn4HjdmCe/NCaLr9THE5CpuIwtIwzQBS20kLFfK72q7OCSwPsG9PRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMO6U8Jb; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a3340391cso33450081fa.3
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370343; x=1763975143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=bMO6U8JbRi7P8ayyWlCgqveHBls8aEM5yiNUTmREfNwMyFeDDXk3CSJxm6A6oHyQn9
         VOQlrPfprU1NnjqzJAfcGM1Tx2J9W7W3igHjo6o6sPz53UxHYnNHQGhFpmxwKXkPwTBB
         O/95gsdbe/Qr1T/bPddp80hYXRH0FpUAP5D0sKvwcmBFEn6NrPw6JbriVIs5Tz5vy1BQ
         /y5aJ5bqCbZM2ZWIXqyccuxu7oLy9fzGG3F2UDyVtAJvTHURbGUSoYKwLrHF2Rf3O2+m
         7StNPjSYhrw9w/a9MzIVx8CNWyKtXnfzEbWVAF9cujJz+gaEClOkoNWcIu+eEZDGySRI
         T6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370343; x=1763975143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IqroyQdOYaFGXyI0EFoglrlTY6uLJckjii9oPbBz5cs=;
        b=X8WFkngxmIju2j3uwc5Pg11LO6iGGuc8eH31UgQh0J2B2dhrhkaE3Q+Mvx6TWFu0m7
         wMPWjY2CfFLwfBAiEd1VIgCWPakHIrh1BZ60xFbBNOXhNsVFACm1D/W9rgrMMp1cCcsf
         ZAn3qMrdmf3XYN4S9h2mY5R5XyDj2MUgLOwUfvoWRCRn1ngjlgtNlaVMme2pn89cARld
         EdYStfBRa9mQf6fr0/eKPd3TDHAV4pw92av/tDmJQgmJBoxE64O3iTnf6A+isx/mOwjl
         DALNUaOr3QK8CHAn1B8aHvKkkoh0z/i2W/CquxoF6DdFn90/FGnvLePiSxXqrmaJUs8P
         xbDg==
X-Gm-Message-State: AOJu0YzTg4AcUvPuAoez+rzutFtgUoob6+MJ/6a+lWMC0+b/auVH6y5c
	xXbG6tw6Fo9cf61dDhvKq5G0A5t4xuY00UqE83MkydeNiOeFgRwp39o1
X-Gm-Gg: ASbGncumhC/VV7OXn2Xd6J2znujfbcZ/Fu8huXYU+/y+Wb/3PlSBhEFJg7IuWlvCyp9
	kE8UKKdpMhmiZGjnOKiiacW7tZs1efZhomsrZm1XsYej1M9+HBry2bnBUkcEiGQ6lPUqu9srjMo
	HNEx36sLgWhxF3kqjvNIh3zw6cApzbkgeD8kkI/2CT04XO2mQt/cM3/dXwK+E7oouL7LDtsiFSs
	UlHJCgLJvMbs7oG4hlO8rxGtS2dhij5v+9zpH+8rxdltBg+1bmV2eHFm1wPE7BH2Z1y5THturRw
	64bRLXaeqtQVyVQaW78OT6nrKul4oLsJ1x1Pxk/Erz6dvCWtfz3bD5kk28mL/wb5hNAkKJEG02T
	lImcLCMSMmORHfmdmqsMIsV7jRsZv13XN75l7wcW4lBXyEd3M94bch6uhRL9aLQACCqag2bA7hc
	NasqQQYjWu8cczglmGno7kahMh0dcD5pcQeqA3sP8Rkb4WqA==
X-Google-Smtp-Source: AGHT+IH1QlOEMHn/T48dJG9KlH+9zufr1/cuKa9qEA/HpIN2fSwsKbCmNjV+s1Ae9oWDFiNXgn3XjQ==
X-Received: by 2002:a05:6512:3054:b0:595:7fed:aae9 with SMTP id 2adb3069b0e04-595841ee9d7mr3951060e87.12.1763370343041;
        Mon, 17 Nov 2025 01:05:43 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:42 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:02 +0100
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
Message-Id: <20251117-i2c-mux-v3-5-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
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
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVYDNc2zbHJruLUp5iqBcRmx68oP2FwF21ZE
 olHkhj6ysaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlWAAKCRCIgE5vWV1S
 MnsMD/0dDrtOrZWY7f8n04gRG4qqZeolpcQCyrxdYCd88B8QfjW9T/eFOOEXL0dfOqGs6aTOZT4
 jEda0NvWG7OrdEvfHINxqTlEF8qAhrSrIInMMIphrfF45xdJYYXeaT11R7U4AXjvpuM2glCETAU
 FalnstcWYv2UypkNkJwqaQyB4Vu4PRbD+UiJAKDW+wkWnM26PJ8D0yDLzq58c00RSm2R7ARVWp4
 Nwr0wzUlw2x//y0JzCjF52yI5o6iPiAPMaa7XATtmZz5jR9mJaUQ2hZNtIWXZ2ZCtTjlFVfZEfB
 8HnnNi9qcZQm/usFqpgqgPywZyv6ClTFdiIW7FJJN6AdrpCOCm0kd5XfP9EC2Lkl2SGuAE0xfFo
 ThOizwU/S2lyQAPwSbdGFe2jrFohMUGwYf7lm08+jcc6wss4bRftPo1z5QbQAZoj0XEvIgTuTzo
 eb8UzVvIvJnPKWbo/1fTBF9VRSKMmWXHGsebm7Bm9WlED0Mfr5kVpRkDxKrL0twE33laabWsd/o
 O9ndpIq0JaxThshPaks6j5GixcvwmCJ6k/pfgKGCmqbiqlhrqbu1F5L8LA/lPQrqoZIZrw82irR
 /CkFgCmM3HN2CjGISZxTf5vn+uHSnlzxl42YGECS50F3tfywiZ68gXtsE/NaXcER3ybXx+mVaAV
 GvVa6kF1eJabsew==
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


