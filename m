Return-Path: <linux-i2c+bounces-2291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3918769D5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6E71C20AFC
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B573551C4B;
	Fri,  8 Mar 2024 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpfUZI2l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D4240873;
	Fri,  8 Mar 2024 17:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918893; cv=none; b=PxuwlhqlyEIxpE32MLi0bVtBbcQaLdbCaVxmpc+PSBnHbJ4t5KYm99eS2IejvpZRrMrjN+SKMBU8UzRg0Z3qoM5fDzTINhm4s84PpGJi+zENb7Bov8OVRptJXpHo0GkacduzUnXVrkJISl0tQVDV/s2WP+CAdxJUwCdErGCgv3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918893; c=relaxed/simple;
	bh=4hHUnGXuaiO8AHvEDB9MWiIozPnZ+g3QRXMnBCM2jKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oAJGda1Szp4QiN0joP4g9yg2xAum3VOL0FcpUHjRd0dy10AZ0y1JdG48mwG7AgaGGBxRje2CkspyYsAfEZ4bGhMHuIWYwZ4wdhwX4pfRYA0c5sIMWSNmZNG8zxduMFQtpLUxsOpJzzLK0NDiNcdAJhtjgQjIkqt+5zDNs2ZRemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpfUZI2l; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4131804e695so5515325e9.0;
        Fri, 08 Mar 2024 09:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918890; x=1710523690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSvcLp54V6bd+QfJj8hs/Ha+wibZoBQb6WsMRZIVEYc=;
        b=bpfUZI2lM1Dzi1wIPbCIvAHq0h3qwACSowIqFkANm7hvdKDC5qbK8ZQh5YYGaPlRVM
         YRlPq2jyRdNA9QACKyF91J1DLjZyU89SWoA1YOCEIm2LDEtSsXlFsCJwHPi8fOOYglcm
         FZE1sg5MZyzOccY71HNdg6N+XkpMxW2ucdlqkYL8eOYT5j43C9JctJGjYDwRHbuQWOJz
         kAHWh7VdXtf8D/HPWSzK2ElRM77TjYj/LYSQ/RYc1+VAXkIC4s5PjpwpZvA97QXRptU1
         0MuHsbR7wKGcdajojA6NRLY7l9D+/nfCoIabUwPuqEWg6s75uvo5uBiRlGMQVdgrJmUt
         yUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918890; x=1710523690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSvcLp54V6bd+QfJj8hs/Ha+wibZoBQb6WsMRZIVEYc=;
        b=TrHCjAq8b6C/ZUKHpjqNqdEaM8Lb9VG1OhizLFy6epdhVxSLrNl5lqcE9UW0KX0OkE
         QZAuzfYRXCtUsdeyK/8S4XvkPSmqDclZBOSibhD8np8jmqS/4FQe/KbOaAYtoNaM37K9
         MEoX82SvralEeBvaZsxC0sXA9yvsVJFKhNkSbRIoYx+jlNadFWWGHMvcsOTNc/S1YUDA
         A5gHWN6wOSZ/N9orzJGvTes8u6EfEQR8SqO9FSBpMjRpRhOJYkHWEXo+JkrOPHRBl+ns
         FMGcNS9kZkNqTQkzgT6mRdDYIGzUPdRxvn5YTkI8e6UTjrqpZFqKIk1LdeAOnsA5Onl3
         tpDg==
X-Forwarded-Encrypted: i=1; AJvYcCX5GH/QJVeogbkGPkCev7py4Nixnkr1OVn+j9DDJrYRvl5G1pZi7YO3sAMR8aO55+poEZeNGRT/oQMdGhiUCmUrLrvxYjSMKMTGHL5fuFEU4Z9SGF8a3qOjYBoDXSOfjRgvLKFGUHZ/yr5XwnHIzglY+zPia2e577sSHMFRRMiSMsJyqA==
X-Gm-Message-State: AOJu0Yz+6G1zlpbLHmu/qgMKV21JNgLYY1LIsrDE4JAVO2FzC7NVzYe4
	DwIT4xevX6++dB13AwVnxlbtK6lqSfCDlrq5jd6gwA+QCRbZvdRQ
X-Google-Smtp-Source: AGHT+IFSNu17CNBwJ6aaJDmlYNJicTkFkbIrk0c+zyw0kVHx0fxpdINlt8niAZByIg6naBZlyoe/LQ==
X-Received: by 2002:a05:600c:1d23:b0:413:74e:a417 with SMTP id l35-20020a05600c1d2300b00413074ea417mr792791wms.17.1709918889894;
        Fri, 08 Mar 2024 09:28:09 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:09 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Add RIIC support for Renesas RZ/V2H SoC
Date: Fri,  8 Mar 2024 17:27:21 +0000
Message-Id: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add RIIC support for Renesas RZ/V2H SoC.

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: i2c: renesas,riic: Update comment for fallback string
  dt-bindings: i2c: renesas,riic: Document R9A09G057 support
  i2c: riic: Introduce helper functions for I2C read/write operations
  i2c: riic: Pass register offsets and chip details as OF data
  i2c: riic: Add support for R9A09G057 SoC

 .../devicetree/bindings/i2c/renesas,riic.yaml |  21 +--
 drivers/i2c/busses/i2c-riic.c                 | 132 +++++++++++++-----
 2 files changed, 109 insertions(+), 44 deletions(-)

-- 
2.34.1


