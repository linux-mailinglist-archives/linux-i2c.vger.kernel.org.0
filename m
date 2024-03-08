Return-Path: <linux-i2c+bounces-2292-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FD78769D8
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 18:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38FCD28359A
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 17:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F0A55C35;
	Fri,  8 Mar 2024 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCzNHgIS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B001A4C627;
	Fri,  8 Mar 2024 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918894; cv=none; b=n+0waCucP+a3hfW8uH2X0cjGeb6CzzUnur27vk2zdEOylwXmRpX6FmjYrypFwa+v/BiVEsED7txoLOBNGlmDCogalL+cq6I/4HEKb5yuVDfZ/6UZU8gogh7ay71vUiuGte+TI72Wg98zGHbFdbplmb4kk+XmrPfEsEiUnX7pIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918894; c=relaxed/simple;
	bh=q/GUb55IkyG4qoMcRVLxKhTyKVmh1LUM8fkvsCNl65A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q4ul0F3N5/4zrTKqkrelOpXQzxWo/aaKRsgL2+1OUbPY+bOWI+QkBUX4V20R/Cu9a7f1nCfpkz9n9LZQNfiCE91/hvo3mQdOogHGfQRrKrdlrzv942TVJ2bucVwJ65yS062RqCHoyR+fIxFPPePjq1cuOGw9X1i84lncfgUBb8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCzNHgIS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4131804e695so5515415e9.0;
        Fri, 08 Mar 2024 09:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709918891; x=1710523691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFSPC0+9XUKCrz4oj5rscpxZLJOGUPY8MqqR495Uv2Q=;
        b=UCzNHgISnQexQjNsvF2JjL8ugTMNDhC8yc2m/YiVPy1zcNyIzpagZy9uTvGb6xzJls
         xJmZTVzo4ow3lwhFVGZ+LxOdl8rbOnWOeo4B2Lf848U5whxCeiWIwfo+EcwvRtyDpGzr
         CS//LC9meZPCJ3C80pVinyNFax0hw9+2iwdlkG9DuDmzb8QkeyCM2PQZhaWU5Z1RuHGl
         3QHT6KXrkkHBSCCp6+gAcvN4EggXiJMaIdGbqLBAWzE3e6AQkI4bPn+VaT3TzjTBw2IL
         ZI52Pi9+VaQokbKBh6JjvMK5j9e3nqeSEHcqlCqUHmxkw9p2qSUj+BbWZKuOFf+WJMZ7
         6LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918891; x=1710523691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFSPC0+9XUKCrz4oj5rscpxZLJOGUPY8MqqR495Uv2Q=;
        b=UCUKFOU9fhi3NmZFem/5VnLkMCnJexT/quRH5TIC8vimrKtFSkGGzT5CJV7rlI8HjX
         Y5yG8mnbAJug8ylr4Ls71ZAUzzR6ORyNJfM29y7Xr6/FOnyPiT7VdBUT7BXqyDig3+lF
         3mmPQl0lAt69sItqi+Gi9c0hLQx43VgxM2Dnae8Ovs6h5KSYvGT1d04NF11IqvvXzIDQ
         U83LIFf8/5PIW5t1qMKb4rXtkeg84Nnia2EgTROChtwWM5M2UzSYBfzekrnts8qQVQnU
         MSvKywVOOJFmSEMiyAKjw/5vh1pHVxphwGUDKL0/z+TTmQLkH8B0KyJXHses70LAd+5+
         JwFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Fqvv58kWtpg9lcKZk3eOzlePaSTqc5zqPTdvgNFOhtKCnhpryl/GcwPOA4YwElO8xeTuF3NGQuGhTRP/v/UXsqWoRbAW8PPt8OfmzHk5dEamuV8CDPAUtgxWnyfNFXgEasNmX+CpWkR9UkFsnWVzmECWTvwIrhDCV+iV10eq7v5Q7w==
X-Gm-Message-State: AOJu0Ywxvv3MHFE87AaPv66UywUxSGrirrdGOSr4KH1H2OUhqXl+Zuo0
	gwHK8fnjukIz+/X8oMFG7gX6/kn3xil0ph8OSONpomMuDs1aq7dy
X-Google-Smtp-Source: AGHT+IHxg8PW/lt2DWsxTiUXTXbdh694MbxHMGuryEAQETkhR+VngBzgx5omErapHeUpnXPJxbolpA==
X-Received: by 2002:a05:600c:19d0:b0:412:ee33:db93 with SMTP id u16-20020a05600c19d000b00412ee33db93mr877248wmq.3.1709918890916;
        Fri, 08 Mar 2024 09:28:10 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:3c2e:cd45:f50f:f083])
        by smtp.gmail.com with ESMTPSA id jh3-20020a05600ca08300b0041304100fa9sm6445317wmb.45.2024.03.08.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:28:10 -0800 (PST)
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
Subject: [PATCH 1/5] dt-bindings: i2c: renesas,riic: Update comment for fallback string
Date: Fri,  8 Mar 2024 17:27:22 +0000
Message-Id: <20240308172726.225357-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

With the fallback string being utilized by multiple other SoCs, this
patch updates the comment for the generic compatible string.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 2291a7cd619b..63ac5fe3208d 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -22,7 +22,7 @@ properties:
           - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
           - renesas,riic-r9a07g044  # RZ/G2{L,LC}
           - renesas,riic-r9a07g054  # RZ/V2L
-      - const: renesas,riic-rz      # RZ/A or RZ/G2L
+      - const: renesas,riic-rz      # generic RIIC compatible
 
   reg:
     maxItems: 1
-- 
2.34.1


