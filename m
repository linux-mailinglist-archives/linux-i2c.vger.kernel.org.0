Return-Path: <linux-i2c+bounces-12186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7BAB1F704
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071BB17EC8F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524572BFC9D;
	Sat,  9 Aug 2025 22:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCGKJ8do"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A64D2BDC32;
	Sat,  9 Aug 2025 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777250; cv=none; b=ZtxXd7PRDRiLn0iUfqSK4H3NUX3fIAIlFKgLp0yRHBjrC1eO2rc5QSpxNys8M15Ve9m/EnW1x62UI0majuops1VZE9mPfFY+s4oTJC6LBTgf8KXkVR+dWC+LezFEggvEUlM7tTpOUR01i82T2yKWZ51LaKU39sWCezPy5K1J2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777250; c=relaxed/simple;
	bh=7hiLsYxvYuIF07WUP2WjKckl1lJjtDcB9Xa27kuBacs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sc5rm/cqsVOQhZ5sorM8afUerBrJLnC8vvWvNrtWSYMQZ1y45nUOOBuqh9KO+qca47MSHHTuZtW0PuQ9la89OAHpuE1GnMYdAylzjYUxWu/zVjaBs6aGXf78FzjsyjpP1q8T1YXHwKjYGPetXz/SxDfJ7pOrzHXK0m0/g2PEHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCGKJ8do; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b783ea502eso2372206f8f.1;
        Sat, 09 Aug 2025 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777246; x=1755382046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUd7o6G3ClNdXfqPmcKfcjQzBdJ4F+0Un9pbWq7cHys=;
        b=eCGKJ8doKwhjteX9gWVDYPRzNOpgdyzbMyCvKvZNAVeGQntUs/Cjk/ou3GokmaOmqh
         FQAtO0l9kXXgrHP50GIElVzLuFcKvr1ZmKUADG0M6jf03C8hkOHtvkUTVqtBLFs7VpOr
         Au9IKbUiUTU4+0xOhrlcMME5MIVJYpnO+XVNWbZq7vMtoGRsagKxjNLIhHteepw70KHJ
         7Iz+QavSdY/nuUkdJtl7Fp1er2DTGqeJQOjSlo5mFxq+B59SPPEGTqAwKVEiTnsAyG6c
         FJEWhFzb0qkpE9RTiLLKOvCYA/lz7w+3aKTQyt4p48jJ+8Ksb7GYvmY9pf2AcIseZpWb
         n2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777246; x=1755382046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUd7o6G3ClNdXfqPmcKfcjQzBdJ4F+0Un9pbWq7cHys=;
        b=mvWXV90DI3F8MQrwy4HdFXvWKxxRVZH/5KLketCT5q8nqNvfkMsSJi9wAsoy7ICSdU
         kE2u/5KKHcd+D5H9sp8Fmuy3Nj+FO/fhy/rWa73hP+0ii1/fw7dfs8SgUg3IRPpCOT34
         thS2kTAK5laPlKVaLWygoTeV8i3ZCqE+nyY4M8cKl4Ab2D/y1Y2Ht3oTPCI6OpguXeCZ
         9Sm0bxtxzLOn2/HC7HnGh027bhMWhFrI7e9XGPj53nZO3PmoesPD/24xGVtaEKbf086O
         8V1QoiG5/OsDoAEiNKW8HYxvoTx7xPoom92VoMQWRH/5tZrlzLykLPBGTeRx+bUdR/jW
         RKsg==
X-Forwarded-Encrypted: i=1; AJvYcCX72FFO01qWOWkbAC6u8mXjQDgoa/VTbQw5iG1zR4oHcvwLakgdBRaIuYVQZPPZzZQ91ud8S5yquMOn@vger.kernel.org, AJvYcCX8CmbqsBxW1sZ9GiIzYITH6xFkxiuWutei20Ytxq23NsklCV2fHuRKdcOZdMyzgJe2eF/vRe4+ugzLRP3d@vger.kernel.org
X-Gm-Message-State: AOJu0YyIG1NLCufUtxzDidV41ivLeCKltjdZMlHNkIUG6ONVDbqWFSJn
	uZ7HLemGck5ForD2dizqpsL66goxX1mz4Pnq8U0p2psUHTT5nzyqRqi3
X-Gm-Gg: ASbGnctiaXALSCQSSgp/W0Z6jlmleEnKlzkEA/mShuf/YQNyk7ckUWt9p83IqkarL/u
	sz5Rm7sf4sM7jmFudJxravtU749d8LRo26dXGoUPnDz0NLisublr1PatFRPTh+JLcEfzcjIuFBS
	HvEypugwt8J11ltDy0ZwVVYVmCcdHk7K2sCgd8ZPnMEGvqbo5O9DBEltkqdauAk+4unJD/3DnlQ
	wTnPSgulhpo5phiEnC4gmSFeqZv14WnI/+NWac2bbdU1HrPQeXHXPogz+AwY11fEQzCWXuKOWMR
	qduA7HMYWSDk4zYM4yZ/APrHKzHpYgif3fqoaR5FTyTQrBOSt4CUme2ktPQ2C/qRSUBMhZKkNVF
	GONS4u7yFwRFwe+TG+knOkr8l3Wm++bsMueiqYqofNpe/oF+alvdx
X-Google-Smtp-Source: AGHT+IGMB7q6qYlAvV6OD8Oy2nOw1bRX7C3gfUPCIchR0IC7F+ia/5nAfafimXjE4Is5ZEJqZB3vSQ==
X-Received: by 2002:a05:6000:26d3:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3b8f97e1aedmr9614254f8f.13.1754777246490;
        Sat, 09 Aug 2025 15:07:26 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:26 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 05/11] i2c: rtl9300: check if xfer length is valid
Date: Sat,  9 Aug 2025 22:07:06 +0000
Message-ID: <20250809220713.1038947-6-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an explicit check for the xfer length to 'rtl9300_i2c_config_xfer'
to make sure a length < 1 or > 16 isn't accepted. While there shouldn't
be a length > 16 because this is specified in the i2c_adapter_quirks, a
length of 0 may be passed. This is problematic, because the code adopts
this value with

(len - 1) & 0xf

because the corresponding register documentation states that the value
in the register is always used + 1 ([1]). Obvious reason for this is to
fit allow xfer length of 16 to be specified in this 4-bit wide register
field.

Another consequence of this is also, that an xfer length of 0 cannot be
set. Thus, an explicit check should avoid this. Before, this actually
led to writing 0xf into the register, probably causing unintended
behaviour.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index fb1ea2961cfb..35b05fb59f88 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -118,6 +118,9 @@ static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 {
 	int ret;
 
+	if (len < 1 || len > 16)
+		return -EINVAL;
+
 	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
 	if (ret)
 		return ret;
-- 
2.48.1


