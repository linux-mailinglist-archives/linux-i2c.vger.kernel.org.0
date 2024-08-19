Return-Path: <linux-i2c+bounces-5474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3C4956478
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 09:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A03B285E8A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 07:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53DB157A67;
	Mon, 19 Aug 2024 07:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTYZ6oWn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8F15820E;
	Mon, 19 Aug 2024 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052057; cv=none; b=OlCXzW/l9VdnOJx+UVNE3oW8idqISwdsXqTSk8CxMrE/6d/hGuyVwt8sv+eDN4rgmdV4C56cO5vyShWL8RU+x0wdv3JSJUFzfddgCTSsh1nJoULpWwc8eBRNg1eF3aqLGLFFB2fQxUcxAVtT14K+duyxOxSTFB9e7MJ+YjVvd+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052057; c=relaxed/simple;
	bh=/eNdDVOVDYiWGkkSl9pird/Ta/uKb5lEJFwZikWN/Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBJ8rJ5sXwgEUwHk4jZlmlicxI7ywkPFyquzhrnMNDWFSNBdDMSW7CBa7xMnPH10a/fwdXqKYV3l/BfjhD9QZ2O437cDq3cP9p6Qx1UF+3j2oyhN9hZKMB/T5lJ6znlPKR7/X06kVwq7HdUj//+w3D4ZqwnOIOBKbnoxwJOT4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTYZ6oWn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428141be2ddso30506025e9.2;
        Mon, 19 Aug 2024 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724052054; x=1724656854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QBJBMpVP1Qqp6dsvradH2JN9txbqE2dyspVTQ3WIhME=;
        b=cTYZ6oWn8BCxXsH6BSiNG208pm8h8m87Xva6emghw9Dv+RDjHcvn2BWnXIg/+JPQrV
         Ew20jdkFeSotOzwPqn0DaHSYzJmcHVjs/bY92U1f/bhs+XK70HIrw1HyQ+BTRZi82ixR
         IQEZEl0QeBuv6881ZzM+4naZZK93vuEOFdj+XiI141Rbh9sAcB9vw93u6e5tKFbDHyZp
         kXtt8EVvJl19EfRI0tlsJkt+jx50yy/OC9+mb7ZAnwWlgG1BVzFb7KdDNB+pa3dCKd7I
         qFNx8C17eVO0qpJkfNMuqvbcyMq7ykHZVros/26/A7D2EbT7+yxXDFGEmayhirvf4nPq
         Mmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724052054; x=1724656854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBJBMpVP1Qqp6dsvradH2JN9txbqE2dyspVTQ3WIhME=;
        b=leLyyZyg+igJMr5oF44MkPkDI+7DWUblvqhFTBkPnvo4EyTGAEkv5pdn3AsvyoZ4nZ
         /4JNHWw4S6Wg8Nhq6L1RuQV0nQMdsKX9pYv4w8S0O8r2LtqpeCf9vMlAG+JhIYPn9v0H
         1APc43TihuSE6kaGXQ4D6CuSEDzzIor5nKKOOWs9VqiXHV/OIogdpu1W7nH/loKNqIQg
         W4xUxVcZe7LNDK3/mLzs3TXqOglIsTsFNK3kP8Vy2Kez2z1XOipp2TrOaGlk4eyzV7GY
         XWS8aUN+BVoD4q2TRAA+xAvTeDqYZ3rWeAXrGzNImt9K1PBP5yHtMvBd8+rENpNeUdiF
         ReAw==
X-Forwarded-Encrypted: i=1; AJvYcCVDMEmg8gxX50aVzBYwlrjfWw13PzvL5soMEcTSV4Fj7+sWEyQGQVsNEpLccHi3qVxeV/soLKDpedkyp21cRW+r9bJDq0Ek0O38hw1L
X-Gm-Message-State: AOJu0YxXHDVWSItAlGkw+wxtj9t+iT4uxIVdY6xbpE/jlAV8DUCW74xa
	Sa5PfZ69ZSNaeNtuA0Iq1bdXpXOTJLMvcCWRPVA2cB3J98Xwises
X-Google-Smtp-Source: AGHT+IGxcSb67STOheDAxoW59TY02P8MKyR07H01z1D1mGbC+c92uKM/LcrctGwWt4LjNXGv3QUZUQ==
X-Received: by 2002:adf:c00d:0:b0:367:4e05:bb7b with SMTP id ffacd0b85a97d-371946c309bmr5852163f8f.53.1724052053868;
        Mon, 19 Aug 2024 00:20:53 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189896a9csm9683734f8f.79.2024.08.19.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 00:20:53 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon, 19 Aug 2024 09:19:06 +0200
Message-ID: <20240819072052.8722-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While running tests on an i.MX8M Mini connected to a TI ADS1015 ADC, we
found that the ADC would stop responding to i2c requests because it
would timeout after the bus was idle for 25ms. This timeout could be
traced back to the rescheduling events in the i2c-imx driver. The
problem is that if the system is under heavy load, the schedule call and
the wait_event_timeout may be rescheduled too late to reach the 25ms
timeout. The same problem may occur with other SMBus devices. Therefore,
this patchset removes the scheduling calls for non-DMA mode by handling
the interrupt events directly in the ISR instead of scheduling a task to
handle the events.

This patch will introduce some bigger changes because the logic for
handling events in the ISR had to be rewritten. Therefore we have tested
the following combinations:
- i.MX8M Mini with dma
- i.MX8M Mini without dma
- i.MX8M Plus with dma
- i.MX8M Plus without dma
- i.MX7D with dma
- i.MX7D without dma
- i.MX7D atomic mode

Because we do not have any devices that use the SMBus block transfer
mode, we were not able to test it. 

The ideas are based on the RFC:
https://lore.kernel.org/all/20240531142437.74831-1-eichest@gmail.com/
However, the handling of events in the ISR is new, because further
testing showed that it was not enough to simply remove the schedule
call.

Changes since v1:
- Add Reviewed-by tags from Frank
- Add new patch to use readb_relaxed and writeb_relaxed (Frank)
- Update commit message for patch 1 with some clarifications (Frank)

Stefan Eichenberger (4):
  i2c: imx: only poll for bus busy in multi master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: use readb_relaxed and writeb_relaxed
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 357 ++++++++++++++++++++++++++++++-----
 1 file changed, 305 insertions(+), 52 deletions(-)

-- 
2.43.0


