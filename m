Return-Path: <linux-i2c+bounces-11169-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D59EAAC919B
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65E3188C038
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C2A2356B3;
	Fri, 30 May 2025 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOtql9Gr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672E235070;
	Fri, 30 May 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615512; cv=none; b=qw3Io3lt7XE0xvSOskZSGShBlOBhjRRNlo/u5iYrXXhVONlctdXVtNmE6KAYdYlDAO2ASgLzBKgqTJsHQOkvWGnCvbAl9pOLl9cOeaLqSkRpw3XdL/McvCkKqrThYU6FrAGBZdPLNgriG+ounwTyJx9rXQ9J/GEE265R0Bd713g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615512; c=relaxed/simple;
	bh=xV+fHxaa9Q53cwSIeL64xueXN97ZQ7TcSSYmPPrHGMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHoeTm4b+l6wKQyDJ+ZXU2ejEGzpG5wCsWCnkODfWqNKp1nS1fZ3Z3E77sbYYyDxy//+B5QqTww28c9/YykV6nbWyN+3U00RrDQlTBe1aIaqmFDXHdgEH43BgZpYVcRkin6wWDgPrBTHKvNHlmMktHphP2Y+WPvkQdYEAKAyIN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOtql9Gr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so17438445e9.1;
        Fri, 30 May 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748615509; x=1749220309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3skent0p6Y2In4FgYhIiU1BW8SbbC0ov6YQaaw83jZg=;
        b=BOtql9GrhXPkp1qXGoAczcM6+MhF5ol7w+qOF21GoEAqJTl7d6RzcLdes4I88+oYsu
         4Y3CJi16zZTxxhvYYlZe0qdV2I/Ckmz75zrECxDHMA3d+KbioumzCUWaU00mkskVObAd
         S/fexFZ8KsYVO/UhpjPpK/iRYV8EKdbJTJFpKoq3nyiQJRzbVyf5TXbTXDOb5/ZIiMWn
         MVfVmaysepsOQXyjtf88ZqXDXmWsWz+W+QmTX7PcBKkb5qqNNuqvJg4RN3Vc3OSX7pMR
         822VQrfSbhfFVbg3sW2UA9TI1oy7kAxuQ2Bh260YoskQnZXNMDXT24BxUZi080J+Q9NB
         0hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615509; x=1749220309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3skent0p6Y2In4FgYhIiU1BW8SbbC0ov6YQaaw83jZg=;
        b=F1CvfniPZtKu9pXg5z31QTlPo1o50WBU/E2hMefOhO1i5qEeaDkvFPcW2o3fnsPWtk
         bUGgg04hh+Id+4seHntPG6LXPT4m7vw7GHEWR5WG2QR+Vp/1CENjvjtmdKldYifIcV0Y
         iEDMcLuogp/WSIaEPWiqR8EHuXXIYHTtVkVqrMW+q+dRpmt1kXECWz2oI+jaYJZHOuDH
         ttkww9majLZzGFz1XbdtJLVuuZHXHP17xs8t2iC+b0iR9HpplOsu+nIMizwR2mbi1gUZ
         1WJ9TaYPSZ5hAQucOLXtiL2oYmBGWiDOYhqCdbVM+42Rror2fVXeaaJNKHM6F0hVUEIx
         wE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHuMCG1zsgRNSVYQpkTvoapnXWwcCeRFAQP5U8V4cEeGCGJD/dKf+iqOpdqbKpY2HYwF+CVOlo7Ffh@vger.kernel.org, AJvYcCWI8zRUtqN4+i3Cn604/kMiQ01ObQhtYQN+PH8gOKRR6L7XCrPQ7/WweE2xszOaTvKRLbn+/CbjAwP44z23@vger.kernel.org, AJvYcCXEpzyHGU0a71j8DH9RG9OqNXV16xG2Z5ecJSoLVGG5ziLZDcmolSQtfF1F4DLvXufM8aG+56NX0mXV@vger.kernel.org
X-Gm-Message-State: AOJu0YyHiolX0C1xrK0843xFkl9RJa3W3C69vA/zg8ptlh9lE/RfOaAt
	VIUxCt5xezsJ27BMnnM0GpJeP23cR/l/QRRqu9q3evuOoB6tnOwH8kCb
X-Gm-Gg: ASbGncvXYcENQ+XuwxyZdbBveKZbfgCIjk86GNIlUK7ke5rQ4Ix83wxnGgLSYZ383Il
	cgkIvd6B5Et2ZUn2pkQiaL/gV955Z9RRXQG6oa4A7ek/XKLGAEJ7SNNHI93qTm9m/hjKbAk89IB
	Il9rs0BGZ7XE/l+RvSgR9KrXfgt6gxzPkNiu55jkHU36uxLIwy38UFKQrtzve+eOceF66Lm00wA
	0Uyj8meECF3KSFTu2UwQE2bOEDeMoy6KHb6FaQKyoe02+KUTMij9ACkP2x6Vd2sqyfFO0Ev4/IY
	tMov2ouAtveVkJyuFlMZOul/BfJEfBKayjL2Pk88zNPRSztaebw99RqA+NDE7HYvDALIQwKO+o8
	sw9oLPVlLc0aFiu4S0EJ7
X-Google-Smtp-Source: AGHT+IFDkF0u99t4lif9yLD1bBoFVlUlBXrc6HZ+EELK/E2uOffIWduyb1dmfhY4+H7rhFLChr9Vuw==
X-Received: by 2002:a05:600c:1910:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-450d65898dfmr33304385e9.25.1748615509076;
        Fri, 30 May 2025 07:31:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f194sm20107445e9.4.2025.05.30.07.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:31:48 -0700 (PDT)
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
Subject: [PATCH 3/6] dt-bindings: i2c: renesas,riic: Document RZ/N2H support
Date: Fri, 30 May 2025 15:31:32 +0100
Message-ID: <20250530143135.366417-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530143135.366417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index d2b11a702be0..6d4713e384a7 100644
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


