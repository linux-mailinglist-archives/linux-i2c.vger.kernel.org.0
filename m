Return-Path: <linux-i2c+bounces-11313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4AAD25E0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 757271891797
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C7D22370F;
	Mon,  9 Jun 2025 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCXvbvtf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0691D21FF3C;
	Mon,  9 Jun 2025 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494489; cv=none; b=MHHfdFLRbwoptI7jwQvGBk5DkJVsSemUhJ9ExLcqIXmqBO48Limk2uWKLPA4u1BBZkU0baFxZLpfZ7UY+wz9CB/RtX29/Ln9wdLELJoezSKvhDwIAi5Fhx31ynJDp3uSo2LaREBxnhi6amrwIqUQkXUPoCyK84UxEHYbmviFBqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494489; c=relaxed/simple;
	bh=8WkrYG2ROdFz6b0dqhlufqUuG9kEMXvwvFqEncPPT30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6tNQLybDGapC+V0xqgHdRJRqd1+vopPq7QWnGPYAcJC4boQ7DJiUoC/5qZplEO1cO3XMcGV30Q1QIRBp+RM0IrN5Bh33LAeanw7NV5XNeqXer7xQy53F5DV4vPardFYd30a5Ob7XuoibysLEnSf5GOS20e6oosXFYzYYC03yVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCXvbvtf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54700a46eso1089083f8f.1;
        Mon, 09 Jun 2025 11:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494486; x=1750099286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eATZK9LTxc+Q/57vhk5VgJDdIQR6Pv8cExv4343Ziqk=;
        b=aCXvbvtfOswvlUO9h6054ZZKjCsZSSxgA65kzGul5Y7Oo5N0bCP0Stwp4lG7Y/izBz
         gVJZoQKHty4FEli+0EwlZXIi+jpGjHHV1+fjyMooR+RioBshgrYQQshwmTiSctdCeHNE
         02hvNUnDvOKAOKyfT0dU35in+XcuhLXYHSMSDZabmoFMYvjZFbbN4vuyUmkB9IaY9Rms
         3kXLdWwI7OOZ9enGxcqZiGR2VlxKTkc85LVmJVJHg0nqiCqedfz8/6k3EhcXY7ZAZGoQ
         65FMqRxymlON0UAHlM4IqV+HqSrTeAnyjsEgnxMz1aLCESR83f+oO9vcoK6nCmrWlR/i
         bYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494486; x=1750099286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eATZK9LTxc+Q/57vhk5VgJDdIQR6Pv8cExv4343Ziqk=;
        b=jSgQGF5LopCmi5UMASD5sIo8Izjnl9TfSWsKtW0QS2Z3lmBgkeXc/pKKizgYfEX5ld
         z4zKTzmFjXT3kOl/oJhxAY0RlTyOS4RF9WtDtm/BOqmiJTP/DUZCf1/1C7uEgWYLa4gV
         Uz0062n0jjp2a7QqEUe1Nk4zF6Gpg4h11P46L9zdo2ZCuAy4e+S1Zr0XsMVywPtr3M4V
         NHKQwFC454lw79OcHI9uFh2JRBEMquyPRtguGoDV7kEZy1YZyD1OjTpFRLpAeelRIUxG
         9ikKSTv/N+pdCJmSSSeHEsKYAoNoig+iZD6pBaox5TrC7Y433OFE6XUgKWC/DVk4RVAr
         TJjA==
X-Forwarded-Encrypted: i=1; AJvYcCVP4oTpx//n1lFYMr15UWuzf+qKIq4Fz5D0GY3R6G69BGd3qnTBkK+ts1bwzuom0LSlryo76v9rfzeM@vger.kernel.org, AJvYcCWAlT4rnGt1Nb6PO4vV0Tr+2P785VZJaJdTFFmYnAYYtlLVu+bj0PxottosfgQK0VHWf+FK36A0je8m@vger.kernel.org, AJvYcCWOUKgjSBWLm70aZ/6gDaXw1xttRLpntGUlP6LvUSsa8ITlzYZXmKCOa/4s+8ClLk+6RgpbO40s8eqxWznt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj1aCXkpPIMM2M4GYWesePjgBS+SwwS1HH4yfVGsvdGXFO+2Yd
	FWicUMm2lu9MsAQKl6aKZdGSTrwHsaVEbhEVa680Ky022eytz+9V6FRE
X-Gm-Gg: ASbGncuGqn8Dljyz+48lSqAigcNFKOaNK7Arb52Ou2kPjPM7qwyjOPA/5ZpLTHG413P
	haGvvhy9rNC8s4+SGzTU+6RVaOenRSVbdTcEskFrziZIbOfFLz8FSPkjJghU7Jl19nDz3MJ4nkA
	NYw/Bs0c9yH1mEIN2v5I2ugUvpCTKo6bokvPTEWF/XI7/m/Zi7Tdj7XNhTUXq+xSXgUWDG498YO
	ZjBJoMAFO08uqNPWZZpS0zE6ynZ8WVIL0d6hy5gppeFKNm7LNvfLC2wj1TmcoT3FMvz/RO/xUD6
	HQ8TXIP0W1DfxOX+4ZTgEmbNu9BvntcVJQwircpUxpx3RL4ZwMpAwz/U9/gCWbPZVnp3Y63fglR
	0was+A9NI
X-Google-Smtp-Source: AGHT+IF3u6esObRGWd7zdM8ilUJja5wm0YLo0cZEH/+bQq3bXaIQgpKJBTiKUxEZSuDINb2JdJrHpw==
X-Received: by 2002:a05:6000:4305:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3a531cf5cbbmr10504693f8f.59.1749494486263;
        Mon, 09 Jun 2025 11:41:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:25 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H support
Date: Mon,  9 Jun 2025 19:41:11 +0100
Message-ID: <20250609184114.282732-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the I2C Bus Interface (RIIC) found on the Renesas
RZ/N2H (R9A09G087) SoC. The RIIC IP on this SoC is identical to that on
the RZ/T2H SoC so `renesas,riic-r9a09g077` will be used as a fallback
compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 412eaa28b077..6609007e2cd8 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -33,6 +33,10 @@ properties:
           - renesas,riic-r9a09g057   # RZ/V2H(P)
           - renesas,riic-r9a09g077   # RZ/T2H
 
+      - items:
+          - const: renesas,riic-r9a09g087  # RZ/N2H
+          - const: renesas,riic-r9a09g077  # RZ/T2H
+
   reg:
     maxItems: 1
 
-- 
2.49.0


