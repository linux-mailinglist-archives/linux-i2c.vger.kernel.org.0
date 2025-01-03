Return-Path: <linux-i2c+bounces-8869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F94A006A6
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 10:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3B43A34CB
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2025 09:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C081D0F50;
	Fri,  3 Jan 2025 09:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qt5Y8WIb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378531CEAC2;
	Fri,  3 Jan 2025 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735895954; cv=none; b=oNE7yMj1Fc+nzxzsC8cIQZtzRBstO/UFJt5KKibMAyGYaPm437GkmdIee6hGqVNFr8Z2wRH9j0BTNVEgDGZdx4SHLZLusqCf3HvSvGAEfbwEbHxp3NKm2ZjclHMDaScsXM88of++jdMmeNuGFEPoE6tYygDNYlsUxMqOkI42nN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735895954; c=relaxed/simple;
	bh=yOYVinbwj/xoOv82gqqmWleznmjYf7adcOq8gPVED88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RW2D3l7rAbBuCnS8tGJn5A0+/xUsbdtnm8tRAhUaLjXtQs4b/A6w7tora1hQ6FOjXjZrFQRf4TgbGT4xdD9NAdPbVskfZLL3Bn8cnRwWMHKVBIo1OOyw/erji6gElP2RA21sdmPF97BKp6850+KpjU9WjqWTmjTCjgo3CRxEBG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qt5Y8WIb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385dece873cso4480051f8f.0;
        Fri, 03 Jan 2025 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735895951; x=1736500751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FipiwNA8gdjPBvhGW8Pa4OHxz81j0CoQV0VISShOknM=;
        b=Qt5Y8WIb2DOzMcRFAyyC2jkavn09U3tLS1OFahDq6yO0gUbPEOOPPiCpb7k9L6ABRp
         Vf6IIER6wIgg39Nh1h/0xBPda0RS4NtdNL/2Ef3Yf1+EnhC8bNdroFY3IAWfmeAgMsF0
         1/wKnNEkmnl2hffbZc14iyCIFSx0qmpyOGQhWbg5LMGXmAymGoXrshZ6uAdrn2ClWNe7
         bf1+49kLLbTl0NU0rPD+ccakT5XXU1pI5iFT/UYqdsuhceyRZVJbLpr9WxdrY4X3IxDh
         poVDQ1POcNT1KhlYaXZCqzqosklWFO0gdFQKFdR4gjjdLGcGjSzBpJ43pHTlJ7hBvilW
         cr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895951; x=1736500751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FipiwNA8gdjPBvhGW8Pa4OHxz81j0CoQV0VISShOknM=;
        b=pPiwWY7BRsINoFIgyH9hd2DYi3vybGOfqqQRLXzb7t0vjS93OMeMKd0iDC1PlyGZ2n
         U4KqwmG1k1W65pqA5ueahvfgF4Ow5yWWkLmd4DtitKnHEe7OOT7qK8rQb/kx6iP0leWo
         w0Q6rsvIN78zABsxlPtDsx/Th+eVH650I8NnFwhL7KvvVHYxGkeLXSAjkMXyIk2yzyd4
         7sObsc1KoZkZZpVMlMzU6bsmQHm4ppA7jfI7i2Vz7nwr8B2XPc+n9yNbxZo6k22IOpG7
         fLraJ8TwYv+AGscJTE7g8xSkyMEF4cE0JC1d3hmzVAPPKFIw+SDsbtqSU97pAb2hGAEl
         JjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZm/wlrgIeaFfoiKqrhpSLCK24vA5sVIlj9rLVwU9qs8OC+2z+0tfHcMGgWOjrO4xjyCTQX9w+L6EmTlOW@vger.kernel.org, AJvYcCWzhI1ybNe+RB6vMoG227/g7YyuaezQw0EscZyV10R09WCX5awEur+001CGA4tI1o2ApLuTB3cRF1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXphh7lqkXFRR9heuEOwmCzm8gj+ZH/PAWDiAS08PtzyytlQ0
	6zQFb9hhRcdVX/DUjCrO5UXASw0r4A8iaqWmt4GNB7kiVjQpnmdT
X-Gm-Gg: ASbGncsxn8oU4ElPiZ144NVnpFONCXUo1c7+Xcz1N4mgV3OR622yyi2muTICATA2K+e
	KRFbGFh/5tDJtgbulZnlN6dx98zLzhx0ZyLf15R6p4vVmms/G2eHEv7NtVzWDzMkSOYXZwJPXtC
	Snyd8TnBEyq2u55Iame1oLi3lGD99uyysl1SXLE1mBA2lV+wTzVaA22eWaLNhKYNk19B/Xsco+x
	kKIRDSZbA/9xjPSvtaq2S/Bix7oqG/VVZmmO3i2va08DXtvKaXgKaSrfF4Kc0kjQ/eY6MJaYcUX
	AEoM8kyAZw==
X-Google-Smtp-Source: AGHT+IH2SqpESCQ6oyw3L3KhLHtOFtS9UxvC15UaQfTT3zQnG4jgGHs6g7FFzg2EHFlPp93mKnd8fg==
X-Received: by 2002:a05:6000:4022:b0:385:e879:45cc with SMTP id ffacd0b85a97d-38a221faa63mr39177180f8f.19.1735895951175;
        Fri, 03 Jan 2025 01:19:11 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366a093cbfsm452493275e9.22.2025.01.03.01.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:19:09 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
Date: Fri,  3 Jan 2025 09:18:51 +0000
Message-ID: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Simplify and modernize the RIIC I2C driver with the following changes:

1. Refactor error handling in `riic_i2c_probe()` and `riic_init_hw()` by
   replacing `dev_err()` with `dev_err_probe()` and using a local `dev`
   pointer.
2. Use `BIT()` and `GENMASK()` macros for consistent and clear bit
   handling.
3. Manage reset lines with `devm_reset_control_get_exclusive()` to
   simplify resource handling.
4. Mark `riic_irqs` as `const` and simplify clock tick calculations with
   predefined macros.
5. Add `riic_bus_barrier()` to check bus availability and improve
   reliability.

v3->v4
-> Created new patch 1/9
-> Dropped RB/TB tags from patch 8/9
-> Dropped `unsigned long` cast and updated the format specifier while
   printing bus frequency
-> Included required headers
-> Propogated the error

Cheers,
Prabhakar

Lad Prabhakar (9):
  i2c: riic: Introduce a separate variable for IRQ
  i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
  i2c: riic: Use local `dev` pointer in `dev_err_probe()`
  i2c: riic: Use BIT macro consistently
  i2c: riic: Use GENMASK() macro for bitmask definitions
  i2c: riic: Make use of devres helper to request deasserted reset line
  i2c: riic: Mark riic_irqs array as const
  i2c: riic: Use predefined macro and simplify clock tick calculation
  i2c: riic: Add `riic_bus_barrier()` to check bus availability

 drivers/i2c/busses/i2c-riic.c | 137 ++++++++++++++++++----------------
 1 file changed, 72 insertions(+), 65 deletions(-)

-- 
2.43.0


