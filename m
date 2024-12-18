Return-Path: <linux-i2c+bounces-8580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D399F5B31
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 01:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 837777A3C97
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 00:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66DE8B658;
	Wed, 18 Dec 2024 00:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apgA+OFT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEDC9460;
	Wed, 18 Dec 2024 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734480991; cv=none; b=GuvAdJ0qWfhen/0XyX6iEe5Q+dCr8En4RqLRawe3axWSNjQlEkGSeBTRsbAHnXPeNbJ0ynMd3mWK1O8KmbcHdUcFy4CGF2joXFCwxVscrH2HVgVfAd5WGiy60bZdYWCAn1QzLQikiFezK1ksM5VXWeZ/Psd+YYlKAHNxplj2MhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734480991; c=relaxed/simple;
	bh=62+1NukGtTCCodUqaZPcbIkpMNwqo4KEn8+JfXvmofw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJjrV1sERBhYycD9e8EFxswq4pffSbcoANBhWpmW7wRB2M7iCygQ03Jy8hHjw0G05ELtlHvUAtxbSmuwZB9oGb+CdE/4mrXqT4D4Awo4hjJFScjqFy2kH0CrSLbEdFb5ajbW0vF5tPw/taVMLmblXrc1/AhU4VWHYHtwepjVUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apgA+OFT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e27c75f4so4497734f8f.2;
        Tue, 17 Dec 2024 16:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734480988; x=1735085788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nVBKZDuo3CAI4LCxPrgsrD8l5ocw/8tCbgRC0gAzavA=;
        b=apgA+OFTKheLJe4Lv+RikBHklmbDvgTR8bgBbxjadNxBrLjGmYxYxaEFVWieGTjH5f
         9XbjvmlWN2o4AgpRhoKkaMwVLxKUEmJQ9J3ciS7LHzk4RaGbhlVG/Ud7dJUCUWV1ps4a
         64KQVnGi2+lWr8K6ZxMgt1r1A9oPBA5Xv2Z1eWm0Dp6PeTQh6dXQtY4ksKDcuyTno8ei
         Z+qSNO4QMIAllcB8kf6djpkOzhl3nW3xMIyqsQJnABuMTnXWmqg3tUTTo9ADqJablzEB
         NOKaYJF2oc1d67jyJPi1YabELTludpvQmI+AK/OURsp+RLRiWVTUwEwIVCPCGNCA/JHA
         ITiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734480988; x=1735085788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVBKZDuo3CAI4LCxPrgsrD8l5ocw/8tCbgRC0gAzavA=;
        b=plfXwNZLaHld3UQuuHzYM4qL4o8m7DItK6rcV3KJ74UmR6Lhy7TIy6rkYk23DEpzRL
         RWDSt70hyPhmTvZuXTcR0rUmo6CmEzUvzL92wpio+MzaMXDNjiqeOHJ+bL8Evv5N1UK+
         o68UVk361Yqv+Wkm22rtduU36IgNS+3PHc+8J1q4pnachHXTy4uci3HPWkoOIws7gLev
         zQyugYKelzqBO8MSKon6mSFH7zXKW9ZNJB4iTh+3/ptkyaoPIGCN8hn7YEdgwq2zntZg
         Hi8dT8sSYmjBrmdFEUXyFtdkhmX5ENV9ri5pWO2ObIbA/qdQ7yWOgb9+sgUQnBKSwA5X
         8siQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8UvJFmEtjWxVHm0EiJC8ew5h3LZyFNnWtx6e91ohjOcFBLMdyq3gc5HUh6RbuomrUFq7w+gwDLKTNNMWF@vger.kernel.org, AJvYcCX5Stk3LAHKKQ9+rDnSepd7XVkPCIhgFjHnYKQMH5k9Qj+/TAES65r8BrbB9aUz0aoGEl4qG/A+AcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN6f+VcL/QVwk75zocvlS6DrcdyD+n2UOAkEQmJ5TVmgjP9aV7
	J+EbOlV2exPw5M3xAoHFzfuMF7ejdKieyDxhCqWgkQn8YXK/HHSl+aADQQ==
X-Gm-Gg: ASbGncviHN3Jd0mQOiJDf+wh/Kwn3LQkrKPCcKeU8/pEYRIZWzU2n5wNSswNzdgfW05
	Yqf6itL4TDGRRpuiK1FSNhbUNe9KVpjAgbuPzK5XCK1WH+pJnlaXgjdIShUlCIq6FAp4T/HPNWR
	CZsdRdlcBRzTNRh+Y0uj9jpMsrn/2CLkpDabakYkbKyu35waFDqp9bAKu/LArqO6xVbQlhZVoVq
	ChnLK8wiSkaHCvn62qw7fTGL8fRub8/NIhdMr7J9NO96zqLNhVoN1YnnHw7S5dVfbK05wL/qUJ8
	Eeqiej27Hw==
X-Google-Smtp-Source: AGHT+IGdc8xFDjVbqQTaSU0NXgIqgZNdcGr4J4sacd1IX0P+l/LrAuKOZEznegXM/M7md8GOMp+ALQ==
X-Received: by 2002:a05:6000:1886:b0:385:df5d:622c with SMTP id ffacd0b85a97d-388e4d5e9b2mr503486f8f.30.1734480987665;
        Tue, 17 Dec 2024 16:16:27 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b1f638sm2135495e9.37.2024.12.17.16.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:16:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
Date: Wed, 18 Dec 2024 00:16:09 +0000
Message-ID: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces support for I2C bus recovery in the RIIC
driver, which is utilized in RZ series SoCs. The addition of bus recovery
functionality enhances the reliability of the I2C interface by allowing it
to recover from error conditions that might leave the bus in an unusable
state.

Alongside the bus recovery implementation, the series includes several
cleanup and improvement patches that simplify and modernize the driver
code. These include replacing `dev_err` calls with `dev_err_probe`,
consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
helpers for reset management, and improving code readability by marking
static data as `const`.

v1->v2
- Fixed review comments and collected RB tags from Geert

v1:
https://lore.kernel.org/all/20241213175828.909987-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (9):
  i2c: riic: Replace dev_err with dev_err_probe in probe function
  i2c: riic: Use local `dev` pointer in `dev_err_probe()`
  i2c: riic: Use BIT macro consistently
  i2c: riic: Use GENMASK() macro for bitmask definitions
  i2c: riic: Make use of devres helper to request deasserted reset line
  i2c: riic: Mark riic_irqs array as const
  i2c: riic: Use predefined macro and simplify clock tick calculation
  i2c: riic: Add `riic_bus_barrier()` to check bus availability
  i2c: riic: Implement bus recovery

 drivers/i2c/busses/i2c-riic.c | 222 ++++++++++++++++++++++++----------
 1 file changed, 155 insertions(+), 67 deletions(-)

-- 
2.43.0


