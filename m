Return-Path: <linux-i2c+bounces-11577-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4838AE8007
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 12:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB774A39AA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 10:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C572D8DA2;
	Wed, 25 Jun 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fETzP+Wx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEE22D8762;
	Wed, 25 Jun 2025 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848339; cv=none; b=SOxJymVuzxwXavql1U00gVvAKq/CUOnjncuiU0Bc8oBjp31TcxZXmCWsiIj0Gh54LSgCjUb1amn5ubqzJVnRnRfLrCSL9JUvUX3r/ITFSVOl6WabhKWZJhMV4R6xmiJ42Iw0llEewxN+KZekIIKlia4u5ozbHEETvkHmVr+TfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848339; c=relaxed/simple;
	bh=3CxHp1TGay9ZGXz33grGZBOt3lLRZaab+Cmaf5i7/0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyovE4El3hWCOW1NPW+etnXpnzNpg5g9D3aCmJz9DoVFVx9Z2XEmhNdPNRCSdJu3Lbbm96ECjuJcfFkk+OvzpHSql6TA+8nJ7kA2+LgFjSabydzQ0XQpw8b8juHF6A0b+E3Y9lGt4HdW/ZahS5272FyK0zWb9vRCyKjm9WrgMDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fETzP+Wx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso53709565e9.2;
        Wed, 25 Jun 2025 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750848334; x=1751453134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTT8M9lvOnuNo47cLpUQJQekotV2eBvCU0pRSn/QWrY=;
        b=fETzP+Wxg6whK3zik2T0AHimZBdJ2LOpNm+hBRe397QVFoHpcJyt8qbZ4pfic7F2Vn
         Z3hA5mEkCJ4nPVks3xXmO2mXSMGA5DVx+2zU0bmFI0J9d1gwE/lf5jSDKkMH72275Mjs
         LL0FvSiLstUOnYS1h2h+gvBikIzxg3cviJtiWEHGpyR2RkDnxr5YSHWWdWMoOd5KXUeW
         J/zKMbFCc333IdMhaBW+nheuyIoG5Nmv+ojAbBlw65REN0BNrNHE2+X/owuNs0yctQY0
         f1YN8C21/wth7pRRaDla9n0Aeuk1jLn/IDmwShdunLz34MX/zsqrHwjkfDkBtDDPlI9L
         ZICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848334; x=1751453134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTT8M9lvOnuNo47cLpUQJQekotV2eBvCU0pRSn/QWrY=;
        b=f+0YJY2o5qiRN6HhkwXxlrIgiqa83AiuUniVGZ1ESGmQ3yTgiklNnQ4PzMwQFg8ZMs
         M0Iw68ddnaOtbC/k8KkhvcIKuGKc9OSbyx8c9biTGGEosXTmqMn739dyS8KbsIEVJwxq
         vA1QF+NH5GoD5T53bXC0Qr7BM+BOFygZoQo16o7AswKEsqpSz29SaCtHJpdTHIY0iytY
         bokUnMntvd/AKyGf7KpFVW6a9vNtVEX5MwiPuwDh5ucYotiQaUVkHW3hA3joVTuCwrHT
         17E/EBksNsCWDNAg/yY9Qm+8I335sZ6nBsXx1idelffdWOGWLxXAMURftfwVCRj1MNfq
         a/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVFIcfSWBDnNgbGVxLCilLxTe5hR4IFCkARy/8IoMpURJ4EsQAXUxAgutXhgYj8/YO3XeL0xenicrYhhk5L@vger.kernel.org, AJvYcCW0Sbxh+F8WskZlnLA+WzZe4QPjlApxpQsDP1L21i3Qwd+O4dzLRnenq+e+R85iZJ71bXtzprG53OUM@vger.kernel.org, AJvYcCWYwZQFHnKmCr206c+NYL5+qbRaLHK0eYfTuJ+l2Koq4YZ6RHjRimxGguuOij8r6Z01W6Pr5EutfPJo@vger.kernel.org
X-Gm-Message-State: AOJu0YwqgQkjQ+8RWoXFn3hPUwjmtLM6a3lxeuSs9a842fEQ4sLfgxil
	sZdt+aAvWL/LGpFY2/aPQMRwRJq7T9IhD8J1LhtQJGyD1n3es3YEMLCb
X-Gm-Gg: ASbGncsJAr/Bx1tAKN23OjhD4FFzsU5F31ry4eZErpkp3qKF0KFi7NkMPoBCXomiyGE
	n2mNyoGct6/DkOzPktXDkS+FDm9LVaIPpfs1EAJg9TPbrZkpeKJQms1yUZgyOp4zkuDe6rGwm8s
	SMYCamBS509L3LjVe4F3iukEA9hX3i+QwuY1n0EqOX7ldZgNzReqlmaOWhGT14hAaChLvx0fPi4
	Miz7WU8cgy0vEh7gYt9XlGy4V7vVfgbP7NaWCgFmgOzbK/whvDgQC5A8Qp4mCNEu73zvvyQxSw2
	EMrtdiwADdNMx0DY59YjjEyHtLm6kzCqOaJ9FNhX+OtA9Ew/fsojvEXKqSn1fD0nFi+43DcC7IV
	7n4WG9Wpbk+CFqrwTpwnO
X-Google-Smtp-Source: AGHT+IGKPYsJWUF5K8s7+an7VhPz/9OGomk5Q2CRXWrqQKmk402hv6nhjeXiw6R5slm5rTdfE9EjuA==
X-Received: by 2002:a05:600c:5490:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-45381ae9142mr21753105e9.26.1750848333570;
        Wed, 25 Jun 2025 03:45:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm16036175e9.3.2025.06.25.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:45:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/5] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Date: Wed, 25 Jun 2025 11:45:21 +0100
Message-ID: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v3->v4:
- Collected RB tag from Geert
- Squshed patch 2/6 and 3/6 into single patch

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

Lad Prabhakar (5):
  dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to
    the end
  dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
  i2c: riic: Pass IRQ desc array as part of OF data
  i2c: riic: Move generic compatible string to end of array
  i2c: riic: Add support for RZ/T2H SoC

 .../devicetree/bindings/i2c/renesas,riic.yaml | 105 ++++++++++++------
 drivers/i2c/busses/i2c-riic.c                 |  54 +++++++--
 2 files changed, 117 insertions(+), 42 deletions(-)

-- 
2.49.0


