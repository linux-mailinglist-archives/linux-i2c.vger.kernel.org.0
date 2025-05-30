Return-Path: <linux-i2c+bounces-11166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D1CAC9191
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2606188A398
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FA4233D9E;
	Fri, 30 May 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjDSsQy5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F4211710;
	Fri, 30 May 2025 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615507; cv=none; b=F9lhLyiMoGBPYnGPLs2w/sa8t/6jNYsyjjJa9NLQVdBlGXqAqJqHzKTZCaWz/BZCGLbwzHOESewVftVv53GaWGo29zMfN3qEYeuSs/hiLY+gL1DQrVyDfVVcTf1xdLxx0tLTYuC89XCOqiSyRy3i15PBozmp6zUsGKfXpqaEeoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615507; c=relaxed/simple;
	bh=SZWt4JCpF5L/WiPC3MVeuse0tlcFjK8Mhs6NPZCaSGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJYZFcLMvPo3SUGe4jOPV+2Gwpwx+9aWJuG3u8Shmc+zUaOybJXdw+/th1OFEdVxoQ+c0cWSno4XdzLb+fbT1KTcAkR37UATfm7MXBe/Yfj9zh8tp0aWCz0O7rlwovLQe7AHWAf/oI5kddVChj2JuGrcX8G2utcMfk5eV8qBOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjDSsQy5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so17509225e9.3;
        Fri, 30 May 2025 07:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615502; x=1749220302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VfMWoMXwYpUSV6S/+4p59hdv+A8UUv/BqKKKoXkqqDc=;
        b=JjDSsQy5nbhpJPGhuZzo62Vhk+oR3NQiCRDkjyYc0kZRbJaoJosFfZQVRAVv4WefeR
         0LsaHYX9FRos8T6G1uXqLJY7LwJiq8p5RPdm9NoM5EUi9ZQpnuSOCP8HwGkeTh6BkNdh
         Dd1zt+A/D5/l99dMIWHBqr7j9rN9Jl973VCqxs2YEPLYdPA3mbfEdKlmGGeYADXLHMaL
         TexAr1+whGmSccwLGpIo5SwIJeS0PXiaXBGMr4CIwNRaFWrDM9a9lxFzMfVQCT/AjSOt
         xSBjZ5/t+pBFjZkqWX9F9mzscR5OXzxQlqd64GhiwXM7aMDol4TQn4sM2THZT42vOF6T
         XgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615502; x=1749220302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VfMWoMXwYpUSV6S/+4p59hdv+A8UUv/BqKKKoXkqqDc=;
        b=wE/4+09L/D9eDOjPGT6w91uiI4jAJCdqQxi9uaMroU4TNf7XcikWuokP2UHK9M8Sjk
         ynKnd43cmoym1td4qdpNwPgcqmPK9lixnjBc0IWe+rIxiV9xvKcZnZhjEA65IOnfzlJj
         z/JbIdUcaLnD51A3VoscQJl2Ral32I2Oktfn5oQxbHOLd/N6giprMF2dMn0wuvGzK7B1
         xwHA79x7KpkLHjOLakQEv4DyC5fAG8YgnqDBamgIyDeZ9hcXBEnVx2lS43euzWKnBpJj
         7vt8RUUsjX5l0N3DBBr3GQm7zOlQcx1LDBZu2YAQGYD9CES6JbFt58IM6e2TaHuRqgah
         24vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh/+90zaE5KBkHfvavlECKr28IjnYXSKWSfpKe5engoMxKEq4qcSU04GAZ3YgBJkO0JqsVro2GQl4lX4EQ@vger.kernel.org, AJvYcCWk3wCmL14tUizIoW176z6Ho898404TGqL80Pr3HP08NSKLGdfe+NF16Z5QLiN9FDdInwptbk69d1WP@vger.kernel.org, AJvYcCWo6urj6Z3T6hgiAe4tPTuE/cHZueMbcE0w94PJIiwR01bPIOltTZ3oWoNKDC6VnuRcHELxHDXM1Jat@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6L5LFhofY945qnlWfKW+NBSQYonWqsm6bAZ1urG4gUWVWHPoh
	Zd/NfDJp7l7LVpnqMOxonvCP2xqXZm8cK+7IzN+JEIoMX+wGTw1DkxOI
X-Gm-Gg: ASbGncsERgtFYPatvbrF5L9D/MtGW11vu+N/i5l90G2oLsbo4EBQMVTyMBHm/92zE/1
	57HvSgYs30wfxez8JlQIbo9JIbMhszgjiIuZL9nT7uJz8zyvaS8fDEky83w5o3rqQNRzV2BsrOO
	/NQ3QAmsGzVMX9ElVklgzmN6CSAw3McaxKXmmgOcPV9nW4dYgesipUuEOgMQ8ePBTE60EIMAFpT
	kWulYdQz2PHLMl6gXoa0cyMjDaJeclEeu040gb1YE+cGPgt5g9QQSgMkLVpnTHm/IrBlp9ltbhs
	/sUzODxu7ZgYqjakEgbwRhu5IxoQs0UPxTvFzOyohqV92jRxrXAoLNyQrCK8X8tAsdsc1UrCV8m
	9/RmU8rKIfQ==
X-Google-Smtp-Source: AGHT+IGCLYmfPH2L+MRH4l6tQuEHd6huQLMg2cdlcl6lwBC57yh6MjtKFixS6CNbw6CRzs+cV63b+A==
X-Received: by 2002:a05:600c:5249:b0:442:faa3:fadb with SMTP id 5b1f17b1804b1-450d64cef41mr37947575e9.2.1748615501918;
        Fri, 30 May 2025 07:31:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH 0/6] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Date: Fri, 30 May 2025 15:31:29 +0100
Message-ID: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


