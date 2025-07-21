Return-Path: <linux-i2c+bounces-11983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14356B0CA3B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 20:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 470843B9A55
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Jul 2025 18:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E762D9EDD;
	Mon, 21 Jul 2025 18:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFbPGZ4E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C0A522A;
	Mon, 21 Jul 2025 18:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753121249; cv=none; b=HYEgmkbIbQWsevI0b3QbOfC6WDhxanur7Gf6UmOJSB0oB7dlw1yDZJT7E9N8KgY+/RN0miwNL8SQ6F9Qn7PrVLYX2nsXwsHOyFSnHCrx9wUP7XsX14PJ2o3caOYp5hZBY+IiDgUISQpz3zqhv0lKTKrtWjHsBdUCrU/0TTBf1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753121249; c=relaxed/simple;
	bh=ITJV3d+L5X6RFWwxsHto+3tbOPZnXVRYqCgPw49SUNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPy0QpTwcCTT6Ctm2lg0b2d5qBhFLsd4T5Wo0ZRhYAYtHP9pCPhcO3iIbR0QvYCABAAuB5IbfXFIeYGNyU1iFspMfmilrOIpRKvaGDpRL1oJAL0OM1AU+yTRwlBE3Ze+3sFjgcf1kRunTtF9xbwyHLmW1dddVsXw37ljY7z7zQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFbPGZ4E; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a575a988f9so2776544f8f.0;
        Mon, 21 Jul 2025 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753121246; x=1753726046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpXq6+eg5tvg1F9qpCoZtJ7h2TZAfgNg6/RIL3iNiQQ=;
        b=gFbPGZ4EHUWdEbgCrFWqifo3R7vzjZrHmOYnbc8yDCIVNaXlJaOajf7GSCcp1zQ8tF
         Au4w6AnNP0nig7vjUDXnXvpdBBCEqCxMD/65Q54tszrz/f8djvxJbW3VVUcXgAEb1wy7
         OR42xOwFobtYc1d3wsH8qtD2mjrsdmz915JFldPANMYBBZp0+VG5e3V4wzZDXQslfuAQ
         XvFaGXH5cU+q3MDWmQCYFKeHR3FfOiJtBYx1GMDf7+iioLx8FUug+X4WmXb+jKEKg5zx
         CFnWyt/s566tPt7P1DPQOqI7hCR8FTNrkf95ITewtNIZRVc+RbJJ8jN01GGhmrfNpmEr
         Az8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121246; x=1753726046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpXq6+eg5tvg1F9qpCoZtJ7h2TZAfgNg6/RIL3iNiQQ=;
        b=wLiY4sZqOgWhOfIMI21/GuuVbG63eQdiIn+3Wk5Wwd5J00A4ESNg8FCzWPWjT83GHz
         2qdH73qg+ZI60k+o3aWjK7GgJeKcTkuU1VG7iC0KkPmYtVy26cXKFGEgwjgTS3yeXRy6
         jUlkXrizzmaUceMBfrKGO3hmA2YgXbd/CxKE4lzXz/kfWbOHfhznpd+KlYEqUfMHUVKd
         deVqLE+QEPwMdlFUaoolHwlmMrnV1fgy7wzHoHmaYZSHtAqfy8GLI54wMBooV/l3ksgh
         c/b81cwBf1vfteei/Mg1GyeY+0B1xJiha/4SHGpGIrZrj5BmUpXbw6Uc2Swnmkt1Jj2g
         mxIw==
X-Forwarded-Encrypted: i=1; AJvYcCU0zu3indLXg8Z+r3GV2L4HGioWgP0VEDre8DuHm3yRi9rulCeApkzM6RpU+chvu8z5+mFjnLCnk8MV@vger.kernel.org, AJvYcCWSCW8hiBPKaqvXKG0ir2AqaJPw2Mmdh7BOSuc8Jbpce2hVCwCunf7lwmZGURKo7V0SYal6sSjFlMc+@vger.kernel.org, AJvYcCWd6ux0NDkYq8ZYMbLDj2K2TvuJU2OTIyqCbYcyGKa+TFvtXpqxU5NY7tyIt6hKpKKiqkyu5Nj6BIUUOtjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6z000mmpWC+vosUVnVdLV1dPjANsPmSxh6vbHg/1ZdQQ3y5QN
	+eGcDqs38CoHB3IDdpfOwoidJsJ7HagKTLPWL9sK5JsilxwtXzVK8mxS
X-Gm-Gg: ASbGncv+ZgA9TYOAW5n6sZQJwW5yabrRdR7ZgBKJ9xBYP4bhcy9aPhrSClQA+718pLe
	VVtd2EgKPXAfNZN5TYPjZw/XuGEqTc8Z0RJBEDr15DwoJnchArFLgcPyi8cmuOpVIhVQycbS3w9
	0QRZcRoAwWHZrxezTLbXzfyMweOISQ8q6BJqEr+AsqxlWE7bPB4/zLKRgUNhTtPiGK/wCUWoD9V
	vxYUR3Jw4ZWFCtTiq04tDKQF/SBKtO1JPmQZdwAg+nys6vzUsu2+p+jm66E4dg3GVuXVh4D9IdM
	AYiBvHJ0NWSd7ohcTqCQVKSnDaUxZG+Ezri4p4FFyZq5A2SM3hNzE217svdjNJcrgBtJoFbyQvu
	mnzyCHblAJ7vbjLezJt7cPxY=
X-Google-Smtp-Source: AGHT+IHLX+hGhgJq3pglvcmk9f8UypfiB0r68+BjcFY7GFFAJdEE4toG3w3gRJtCT/wiIl8UNiWi0Q==
X-Received: by 2002:a05:6000:2011:b0:3b7:5cae:52b3 with SMTP id ffacd0b85a97d-3b75cae530emr3707606f8f.57.1753121245802;
        Mon, 21 Jul 2025 11:07:25 -0700 (PDT)
Received: from Ansuel-XPS24 ([109.52.136.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca25443sm11183370f8f.9.2025.07.21.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:07:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/5] i2c: mt7621: improve support for Airoha
Date: Mon, 21 Jul 2025 20:05:51 +0200
Message-ID: <20250721180710.2116-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series improve support for Airoha SoC that use the
same MT7621 implementation. Some additional tweak are required
to better support it.

Also we add support for atomic variant of .xfer required for
some attached pheriperals on the Airoha SoC.

Changes v2:
- Fix compatible order for schema patch

Christian Marangi (5):
  i2c: mt7621: rework cmd/wait OPs to support atomic afer variant
  i2c: mt7621: clear pending interrupt on i2c reset
  dt-bindings: i2c: mt7621: Document an7581 compatible
  i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
  i2c: mt7621: make device reset optional

 .../bindings/i2c/mediatek,mt7621-i2c.yaml     | 14 +++-
 drivers/i2c/busses/i2c-mt7621.c               | 73 +++++++++++++------
 2 files changed, 64 insertions(+), 23 deletions(-)

-- 
2.50.0


