Return-Path: <linux-i2c+bounces-11413-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD028AD8AB9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A279116CACF
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45CA2E2EED;
	Fri, 13 Jun 2025 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5MAmyea"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18E2DFA27;
	Fri, 13 Jun 2025 11:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814834; cv=none; b=INkEKtIIL787FNEicM4Q79V9jqe1tvpEiguWInJdsza/aUQSghheSGJAV0stpBrOVWDh+CiotjxjEtj4XhKLzlZneRdHIkxiXz8DJ92X+UVf4ob87RQRM49i5hCbc5dV/bLFfJeccwZSD/yPs96hRP4x+snRq/SE1TAnoC2CtoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814834; c=relaxed/simple;
	bh=M1Uo2Shnsi6a13XBeaJolf3tUHSPInHwR7ojeNNtd3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfh/ljzZ0ogDPFQHVkbjlmLWCfL3G+cYmKCvM7dHybMgpqud5wjXql7QZp32zhhaPXVQEJpvAKPqF4vHC5CVQczjCPoW17VP3v9dhEKyPgWdP9SBgegx3/bX2gQV9hB6DPdL3ah9eXXW2lUHIDHp3uFkZNieoPJeWSO0oQyhZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5MAmyea; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1733931f8f.2;
        Fri, 13 Jun 2025 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749814831; x=1750419631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=66IQ1AHK4USdWNNZyhULIRBVAOsclHhgOFB2bs7+AZc=;
        b=S5MAmyeanFIPIuAECmFJqbTSkNewRr+pzh1PrQxdaIyz7ZSJJRuQeIYRk/pdGYfi/T
         m/cQAWGRPKMM48GdJWKV84IyrQ9eESOh8T63XeMAQ8FdRqn3xSoaix0PjzbodC9OvQ8m
         v1GKgGyTq9AC4VdMKTYGxzGrwjm4Tedn1tXeP1uZwe22Sj3/wJZW/PaOMkn+TxDNUZll
         AvJI+bTVuhyurACaT9vd4DqWkwguzKJroj+38IzHZeajPlMsUnC91px8nNWZtnamHVb6
         HXxIOIA5sxvXroLBV4bbRpLkL5N5dgNmKagelhsqmjNoDiufXZMZfbWsg5VTuDms4MI6
         PKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814831; x=1750419631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=66IQ1AHK4USdWNNZyhULIRBVAOsclHhgOFB2bs7+AZc=;
        b=qQqAbwnEnDvyn9XfaYNbxsFvpLZg+/x6zQ+J+Emy969nuI1mEmFaHN/dLrGrptZ/YE
         O6L9wqX5sChD2HCy0dIO3y6J2nhWA//9JGcyNpISDgRAVK0ZPfKOQ3lSiyLFfNK7tVwL
         wQafpSlJFTSraul7zbxPLadfvJKmZEmWCxwCHvUqAC1F0hcXXPYAYxk2Xp+Skd7kh+rj
         3h8oq8wMVJrH3Nvot4AFWJN4FbLQbS7Ji03xgCcB1u2QHYJ+q7JQ2LUXqCBIVWOqC2ik
         Ywg+piKh95BxUSMggx8iKlLpzTyFUobjxprn43bHlMEGmp1VXoTPAuT/MlMN7puit2Bp
         P4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCU7XZW7aI+pfspcJgzo3zMrOEXPyCvY6Ju+X14HImZlBlrlyccdYk2deyCR4SilHD4MSGXmg0MhKEiL@vger.kernel.org, AJvYcCVPT4I9MnOoYKCwIG3Nrbr6Q9Bz1VNE2NGQmQfsmsV/rief/+D/a+7qlQ613VlpvEtCYgWMCW6lKFxmXWT/@vger.kernel.org, AJvYcCXE9EE7Gv9gmuEToVbOIj6Qk8GtzkAi6gHsqYDgzxbhQJMuPp6kl1oLDG3YBquZOGEnL5noZwwVoM0Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqgrX2CZcCkju1Kgj4cyPjsy0L3CkvBefXjZt9BmVrcOxdVcP
	9EmvemLPiEg8wmsquA0Ac4tx3JG0s6zDZKQoucQQpQTN9yLOnfp4+GQvEbfu9+t0+cY=
X-Gm-Gg: ASbGncvrqlcRRmuGkNAwRqOWRSQwIv2L0oatThF4eS9RQV3t14CaIS4ZZI30PZB3Edp
	lWbTOJsdLnShLZg6d1G9oxmnPetCYWojcOJ5ljSuB44ktmVKnkzABfu27dsLZcSXZlclApEvv+t
	8jhqAht1yjjXsukIemKPFIW22qhinUgB/8G/uJRQcL/ddjqH9kp9i8AXHAO4Uh6GHPpT/+RlBxj
	GMVChJ8RPgVDcGyw4PW9GMQbcwBS2SWvYzDPgBAVswKceKOOdTVwQquWu5x8WQ7BlsK62VLnfeu
	/Kyer3/jRBQZGCJIcmvAckicGBFoTYDQLUcbOJvlFTbLh8aGg2d6YVDzDq6aeXyvmgZRC32JkbG
	zafBoHFBBttsRubpVdKz9
X-Google-Smtp-Source: AGHT+IGTupXzonTS7yCpiw1e75Xc5HTYVPx6NVErGZpKEp0rS21AtAM7xHoNhFXI8vB7THT+QLjwdg==
X-Received: by 2002:a05:6000:400e:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a56876be6fmr2376719f8f.42.1749814830900;
        Fri, 13 Jun 2025 04:40:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm2171519f8f.14.2025.06.13.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:40:30 -0700 (PDT)
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
Subject: [PATCH v3 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H support
Date: Fri, 13 Jun 2025 12:38:36 +0100
Message-ID: <20250613113839.102994-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250613113839.102994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 86d79e167547..6876eade431b 100644
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


