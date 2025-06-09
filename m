Return-Path: <linux-i2c+bounces-11310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC15AD25DF
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 20:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8356A3ACE56
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A229921D5BF;
	Mon,  9 Jun 2025 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EBRRoiMa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65221CA02;
	Mon,  9 Jun 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494486; cv=none; b=nem8vg6/PUt/CLaWtKaidSLtQf1Y21drZ0pfNHGC41i2JJc+gPfCR4JqFjotVKa12Kh5PVTuL3FT3hPfVatyWgMzj8AyP2ZFZv09fAVYQnEdNAATteUp3jfhMiEN8Jgv6z7kFeJrtPUP1nBx6vk8qJQ1QMaTxul6EsBT8Ej8FmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494486; c=relaxed/simple;
	bh=4u+tYDo4Z6oyTfw/tjdMaPiAXa/QC8dHXjJB+mLspOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GLRExudQNwBWYbkeaxOHnP0ql9F4gkUCNilqH3nAPxtxZnBA7x5QlGbUcakCil2md1RAAYlBrYf4Y4aHaC+/ACix0cNYd9oDQOV7iaCPti1VAS6POnrpWjwqukUELL7+XlKIrojLPJDe5ArSBoDPX0VOczJcGhajqDJyPaqGY/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EBRRoiMa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450dd065828so31401185e9.2;
        Mon, 09 Jun 2025 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494483; x=1750099283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cYKuvwM+srGbswuASTMUDYF9Ja90yc+7aABWG2NE42M=;
        b=EBRRoiMaVASBQtG6psiL4UzvQ9yRGQgY5aqEgRSKWT9sIWpUMpWREEZEX5E2bPH+rU
         GVsS462b02DVX5x9RY8NgqSJBMjsDym0eTOqpiFtcrMDePK0F5lVeykBfdpeuw5sT6ak
         XeiHACLPVUaNiW36xYjTec5Ok+1nGEY0INYvGYB5iXjUT9PviyKwIWwwcPltQA5IoOzu
         26J6Iw1tVQ0LBOLPYA+xCabP1hC5noqbZw1PjI3wAL+UPztbV5qqsHw1tMH5UoYhEAtn
         dt/qi20vq2/evaPCLukDJfWotCyg0Em77lxuQJeqmHMFipZ2zehjXHOG7CpEQVyOOVHu
         Iesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494483; x=1750099283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYKuvwM+srGbswuASTMUDYF9Ja90yc+7aABWG2NE42M=;
        b=nJroqEoj19Z7oNvSD9u02fpU2GJGUXXbDz327X1vBsPZUwiWlOy51FmytEcu/NC5ln
         WdzAC8rpZZjfPe80UB3N+6gi4Pi/fNn/ttZjK17D78SeoRVElEHnNaGk0NFmxnSve/M+
         IRcFFgrNj6NcegUClKS6V4KdmYTkBiEZr1BeI0WZOkSamlSWsoczfvDNGXH+LFl9OCbw
         JhAV5TdT5N6KwvMdcfOr+fscqf5BLkHIwzuLDsXYR+Ono9nZtg+56zGtQg4D2iKs8zMT
         h3nDwqA/Z7Epk3ljC8QqKWgGGZeEGQ8aDMYKVzyEjmw3xlrx7w37tIJXSLAsQinbwSOQ
         pYJg==
X-Forwarded-Encrypted: i=1; AJvYcCUFzvMwEdrmRHSNv5SUe84sT4tR2604c4SuCKA6TXYNf6ng31umbO1DTqqvfg+CGtZQKdQ8YWQm/ubs@vger.kernel.org, AJvYcCV02OPkLn73nwPwWSgfKfmnyNja4vlgAnvjtVI5ozMcR1/qnaJsxDoiM2EwFSaJ2M/AvXWsjowQw6pC@vger.kernel.org, AJvYcCWeGe+NihBdbFYFuK2t9oZbrqTSdfFlGeB+IPYRAXAKTMdRdlvW9NUd8BhMJlgdxw3veyNq4e8T+Ki6Vmoi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Y4oPknc+DuTlXbMQ9MgfQhF2y8IYhTiurPJv8qfXEFKmC9SK
	Ag72ELjcb1LjxtrDHZN/+1tHVWGyLZk02o7C8996+A9K7XPASQlCt+h4
X-Gm-Gg: ASbGnctsvPRobv8kQo96zNp8Z8OWVbBUACX7HU+QQQScdDjoWVeQeto0EkuH8eS4qsV
	HIo6YprJh2eKBJuRLVwfT4/rz+oTNr5I9TPaSUz5uQGWrRXw7gAJ3C2Znbnhbn8rUZGWzoCbUia
	aBnNz6a0EO1wgHfG4tPDwa1RpLhr3u8lOCMiutcZCXoJFMClpaf0gVjy5yVRdsUVfYi6gmuWNDf
	HXOh9r9D0ug6uNsAlelzYsl2Y02ug8OAGFw+ZZsd3R2kiuPgpUiHTADZLJ0Z2mEvuc1wiis/pID
	54+WEpFgJIYlChHOsDnKiRyWpF4dCTvosVr8mrmSU/9aNreGmOiAzZWvHH9c+TIZ8OVz/ycHSA9
	69rziuAovV5w3ywFVgg8=
X-Google-Smtp-Source: AGHT+IHOabJiFJbCuAFLqzXcxYeYU3JL0zS+CCR+Wbnnxh4lUjtaXRh0OIl+Pb7iDtrdA2jWE9kd7Q==
X-Received: by 2002:a05:600c:1e8a:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-452014976b1mr117774755e9.21.1749494482634;
        Mon, 09 Jun 2025 11:41:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f04dsm10137865f8f.73.2025.06.09.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:41:22 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Date: Mon,  9 Jun 2025 19:41:08 +0100
Message-ID: <20250609184114.282732-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


