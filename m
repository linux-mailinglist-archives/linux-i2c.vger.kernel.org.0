Return-Path: <linux-i2c+bounces-9045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C07A0B6DB
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 13:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F281889A25
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C12231A45;
	Mon, 13 Jan 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBI9DACe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719122AE49;
	Mon, 13 Jan 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771221; cv=none; b=Z50e7DJWwIP9BfRIjBnRO+4dXYfH1E+bmWhYf7FfgGFrGgoKtdwhzaoX9Hc7taMqujAjxvVWoZ26Q5kI/a4i8T5fRd7ipXiGReS8ins+/E+br4stFROUiC3OQ3yDSRzZnuuxagIG7EO1Ke+oFtYa7zcCMMmvJ0zO9zM35P53T+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771221; c=relaxed/simple;
	bh=4pAohm9PgiohpzQ+nzLusuwNomgnJTKczSn8upU0tFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROEhhiQNfrIDTT2bsb/5YR4GMjh0oj9OdyZa9uZWMjpaQtcKJKcVBMp5eDtgJqnVo/2vIjoBW0VFBXA6/JVtDXOFHy1YDmSf5s/rxd9GBX4vFdi7UNpQ/ZL9s/zQXnSSBY6AsI0qFvjTRIvNWzdy6CgV/NIwlkqT51bpaOznwFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBI9DACe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385de59c1a0so2015103f8f.2;
        Mon, 13 Jan 2025 04:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736771218; x=1737376018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CQU+DVYlAO+oIq3UJzRqfbMr0HitdK160Letc85i8Q=;
        b=FBI9DACejVceFcC0ClTTVHujkvx+3bYJJzeDXW3KIKpiNYES4mwCbUlmL9GvcXIRsz
         8mp4OQvDgtH3D1KsN4M47BxJijNAVUciCmlGHXLJ4ikl3GNqKwIc+J56D+in1K8yKDTa
         fLXfUzMu7iWal+NcQAs5gLrrT8+o5exaGEa2/UaGbQFTwhGAwWocWR8rsJ7bnXQuV/FY
         wf5U3EOUI8vajQrC5j3or1IftP989uRlg+CmyyTrlG1LThAG3g27AmwMmPKxAQG02Hh/
         +ivrLg8O4BG0mfYdeX2AGkaPl1ukVa+mLb79voac3Y8Tk00SCZ7w+uzioE04BRTWvRjb
         1fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736771218; x=1737376018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CQU+DVYlAO+oIq3UJzRqfbMr0HitdK160Letc85i8Q=;
        b=GNejgqWwnGPe0MncDuqpLX2XPqpAxEXoN2kX40No0HHKjttv0YJyov/VY8WoxYDUEV
         vQj4TUwEq+09WMVLqYilFiHxjgwfIKIngY1lP49h6uI/YALjOr3bnmaeRJZXwwcv+YJE
         JmL6aCSenX6qfrVQROhNwgXuIxlUX4cP/jEXh9zUemXQIfIQeSd1VPO0ZYnitSwDw6L7
         gJZJCSzHjyx/5bINfllj93hVu2LN82gNUiBbV+ZPEkAWwHDRYlscJ1T7KK0b6DoYcUyg
         9wmtH7ULBDJ1nEtuPjTzYuoBCzO8fPaz3q8cFHqeHAu/S98cyymh221wTIGafE5z8Whl
         ISwg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+z+89Y0yzvHIKnWxGyRPgZ8WwVQnO6IHJZh2lN+VsEV7LS42yLvvT0hpXYnEbAbBuQ0DeCFMITM=@vger.kernel.org, AJvYcCWL5XgkdAaSQlfgssZTaDACqHIpKYAT1BMedgvwP2R6Fz0DsJ5B7+rGuSAIjW5XN3UQF6dDyMoFZfzEJh5i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7U3Y2nKddsXtP2bNfNlL//wPSeNsRpQTMuloQzJy8a0bNJY7d
	3+ceRxg/ajnZEmTmBnFgWFG+juRl0Wio01kP5tPAH3uUDsqMfvP0
X-Gm-Gg: ASbGncsIPigo8DuO4BMXIyIh9kHHGtBMCUGcADbGyCgQqUyaxKjuUH2YAVHueuy4iTW
	qU3WzGDOKyxgj3u1rMT5QW12PMp3A9QlWqQr2KnjSR8F4t6kM7h5n+1NzYijKPrzNPblyWmGzXM
	nyqBWvCG/HDvQo++tjQYFwndouWDMitDaJzQ1BkVhlghe/tk+EXnAWAr4WPRL9k7odhphcSLsaP
	xEZQQmOCUe2kZyL/i+zaURUq12AgBybQLFxkFpH+5b35Fl3aKsL1iCAcHdoK2/qBpWEyMzTVcJB
	k5DbogFdHQ==
X-Google-Smtp-Source: AGHT+IGC9DFGOG62gGkAFLoAPAC0GixW8o1Xy5xI6YUgpzDHJiXwzZYTQrub0EvnDhbOYWrR9yNROQ==
X-Received: by 2002:a05:6000:470d:b0:385:df2c:91b5 with SMTP id ffacd0b85a97d-38a87085becmr18908243f8f.0.1736771217635;
        Mon, 13 Jan 2025 04:26:57 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c23dcsm11812720f8f.101.2025.01.13.04.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:26:57 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 03/10] i2c: riic: Use local `dev` pointer in `dev_err_probe()`
Date: Mon, 13 Jan 2025 12:26:36 +0000
Message-ID: <20250113122643.819379-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250113122643.819379-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the `riic_init_hw()` function to use the local `dev` pointer in
calls to `dev_err_probe()`. Previously, `riic_init_hw()` used
`riic->adapter.dev` in error reporting. Since this function is invoked
during the probe phase, the I2C adapter is not yet initialized, leading to
`(null) ...` being printed in error messages. This patch fixes the issue
by consistently using the local `dev` pointer, which points to
`riic->adapter.dev.parent`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v4->v6
- No change

v3->v4
- No change

v2->v3
- Moved replacing dev_err -> dev_err_probe into patch#1
- Dropped fixes tags
- Updated commit message
- Collected RB and tested tags

v1->v2
- Collected RB tag from Geert
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 4e2add343c9e..c555b6220e66 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -320,7 +320,7 @@ static int riic_init_hw(struct riic_dev *riic)
 				      : I2C_MAX_FAST_MODE_FREQ;
 
 	if (t->bus_freq_hz > max_freq)
-		return dev_err_probe(&riic->adapter.dev, -EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "unsupported bus speed %uHz (%u max)\n",
 				     t->bus_freq_hz, max_freq);
 
-- 
2.43.0


