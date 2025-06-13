Return-Path: <linux-i2c+bounces-11410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00187AD8AAF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BF013ADE74
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79072D879C;
	Fri, 13 Jun 2025 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzYVU4Oo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE60118BC0C;
	Fri, 13 Jun 2025 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814830; cv=none; b=IzF926XhTICNJJpZrs9ZBy/kCWqQtxDmfKBAfUNaFeXcokWz+JYWFYG+wNlNsrz/q4i2qT231eHKWoQAqB0JNWYV4lrCcz8w+/yuitvCcJ5FdtAuIwlQgULszu4QwwHLg4NuiYXx8WRCvMbcl9o4IvLe5IVMcSwDZbsv7LGngFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814830; c=relaxed/simple;
	bh=V5lJ2hIWhnXFQV4a3+LkhInaDQElio8+MoOpY/eeLAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hYXo7v+H8QLQVoWlOy8GARmXKsEr4Neu6+9WQoQS3qTnFi4wahIPhQyBxhOwcw/3jUDkG7p1Pv1gWQpn3Yrd9SxRmW/bqyHUmJMIzLH0uutwmgRwSkvPrj6KL4451l2aZHsfRllJfHOCeHoeUa+SfYH7seDN8I/d6qJYNnms8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzYVU4Oo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1275327f8f.3;
        Fri, 13 Jun 2025 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814827; x=1750419627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aXRE5967yTKLP6D/tyJ5JjE1OuczocY84JxX/Tj4Ns=;
        b=DzYVU4Oo54vGRxo5rwmX2Q+J337YT62nK7O9m5lmOeuQbLghgKi/jRjf8rSkoNBayb
         HrT/hFumyUMMOEnm+TPDOUG9nptI9opSzHIMZL/UYe/I0rOd052PNJJfWg9CJC6vbgn4
         vPVieTkU/T1aoes4LKnsh+9fWah3XapGobiR2X42aDL2n5cojrvLhIAk4iSaKsFBnrS7
         3/5lizcTR+GuKRgI76bCwmB2RHHPxYwFiW1q+q5aM+6ghrhLryACYLMWMrA/VbZyXZJD
         xE9oPNM/VstN6DfkCdvTcDAHwFpH8SGbr7F5Svk3U8CWeZM3l50Qbp5BgYLbuci0js8z
         5w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814827; x=1750419627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aXRE5967yTKLP6D/tyJ5JjE1OuczocY84JxX/Tj4Ns=;
        b=gpO/2qgnnRTw4pQutkF4zPdfCzBYExIVfAFdXAJvXkDZUajy1if0Bdb6LkpTuv67YW
         QPNi2r9+A1BlFpePqXxe65EtJW5lCPZ18K3NcQ9NB8H8scRsgeSEbONUf+IVn0ASk1WZ
         pEdsySNNXvoW6k5WdOM8TtgR6NW04y51UqYzYbvbNy3H5x7PIvyokzfrDknNE75bMaDd
         3XTDO7EufZWfSAYbmwU2kyRyyiZNZP/2gkBOvi6DN2lCOtKl0Qhtozv4QbnWtUgvTxam
         ZMblZJUPq2vBAVEk1/VPs2RhsSFHmLHnB0cLTYHf77KBq3jez0jcLNZuK1H8P58Tb6uK
         i67g==
X-Forwarded-Encrypted: i=1; AJvYcCWTZb/iPxLQWIEWpIAIh6vHE7gskRVruruSkbxR8b1aipRz2bN+q7qET3a+5bCHGSyrHzM54rpJW08VqoQ6@vger.kernel.org, AJvYcCXPtKBvG9w137m0Se4UXj/XTYYSkNzQc1EKQCwXbrAQpwCTunKDPaiIWyQKp3jfDOj5kfOsTULqy5dD@vger.kernel.org, AJvYcCXxSJct44XpgYyr/A/tz6DANhEQrr/MtBWOSPrBy3fkHrQ2mxct1aTpBaxlSwhjBu1BV8cv5w7fBMBd@vger.kernel.org
X-Gm-Message-State: AOJu0YwHsUGy7glji+ekcOxCmp2cxOlUtqvdKz8gJfKUNKiBCpxVcfS9
	yO7cAEFuk6zp1jsVEmvmoNxIFyKHb0IXC1EyPzSKXftaS0r3BG69tfbm
X-Gm-Gg: ASbGncvOlNtOeZSw5PHXeVR6ruF9MXjdCBJLLNfe3v1GAIrjPr3Od8/Mv9VdOi9sA2W
	XY6IIFi8ekE3qpsxWBiLFnpH+dpm2njTGE0bSiPhKQBk5jjfRxe+ngWANI3DjN/vchMaMf/DRf6
	VJPAV/p5se91SVkqPnyy6z4DDNwEK8zHh9M8+3J+IPyR2NVqS+58HWnaeI6/A4podrYFX0en8Bi
	mqLFJ72JaDwpII2SEb39nsMIZdrbOhAJZk89aFRC8QAZzQBbvw8XrgJHg3MwawMZauALnJWO8tQ
	KvG3u5tuQT3L26aDfQ8HryN3Kpz4g8BrBxahnvVhXRa5SYi8seiR7L3OyUcHcGyDYW6zVrRxHqJ
	xEtjup/EFug==
X-Google-Smtp-Source: AGHT+IEE3kM/7AcFNS8iE41ovrbVwXmY7+gABrFFMNoyszVhhCCWXMOf5WyqimbXn8T0FdDf7rIYFA==
X-Received: by 2002:a05:6000:2003:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a568655c20mr2646170f8f.2.1749814826981;
        Fri, 13 Jun 2025 04:40:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/6] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 13 Jun 2025 12:38:33 +0100
Message-ID: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for I2C Bus Interface (RIIC) found on
the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The RIIC
IP on these SoCs is similar to that on the RZ/V2H(P) SoC but has some
differences in interrupt handling and does not require resets.

v2->v3:
- Replaced `Transmit Error` -> `Transfer Error`
- Fixed the order of interrupts in the DT binding
  documentation to match the HW manual.

v1-> v2:
- Added Acked-by, Reviewed-by and Tested-by tags.
- Listed the interrupts in the order as mentioned in the
  HW manual.
- Renamed the interrupt names to match the HW manual.
- Initialized the members of `riic_of_data` in the order they are
  declared in the struct.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to
    the end
  dt-bindings: i2c: renesas,riic: Document RZ/T2H support
  dt-bindings: i2c: renesas,riic: Document RZ/N2H support
  i2c: riic: Pass IRQ desc array as part of OF data
  i2c: riic: Move generic compatible string to end of array
  i2c: riic: Add support for RZ/T2H SoC

 .../devicetree/bindings/i2c/renesas,riic.yaml | 105 ++++++++++++------
 drivers/i2c/busses/i2c-riic.c                 |  54 +++++++--
 2 files changed, 117 insertions(+), 42 deletions(-)

-- 
2.49.0


