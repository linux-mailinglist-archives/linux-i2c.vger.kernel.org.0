Return-Path: <linux-i2c+bounces-4981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91F931773
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 17:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C50828268A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Jul 2024 15:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A775258;
	Mon, 15 Jul 2024 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL3s5AZ+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4215E1DFFD;
	Mon, 15 Jul 2024 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721056708; cv=none; b=s1ngnn3wBuxrNjVq/9rK7/WyReBhJ/FfiJOv/d/sQbKmbLswh00AAAiVtQ0ZonMNMhRf+EJM0J6wqr06v084pjKBjvV3MdqqjoWkMzi9a3bNQx7MBm9AmImerTN0nOZnhaxN5QLtmcBX201yfTqxzCdWlOP9FWwIWCCvpbi1FX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721056708; c=relaxed/simple;
	bh=NKRudhiuwsTQkqIaLO8AHYDOO8EPapCrBjsIDdxzWJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eJMfhR8iLEHYyXeTK4k+C+MNYp5B6Y4YaEiYv1L2fVqZ3h0WdyMbtzyb2z/t7xW6uHAYhGfS/lrReTyZ1xA3aKlceq7yLKzIPSkIzlI/5obQa+pR5ZX7XJ44HXzVn63Y2aErG7VcBthjAacBc64ZiQ8ZqwWTwFlG1k1XFM4HuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL3s5AZ+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-367ab50a07aso2801136f8f.0;
        Mon, 15 Jul 2024 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721056705; x=1721661505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaxYW18928fApQX7NIAaL07nRV5h6qNSI2LYfiTcfsY=;
        b=BL3s5AZ+OowQoGk0iSFsk1Do9RPncnVSNxIpQ/c7Hh95ip233LqzHv8/YAnzZG4KH1
         ekr8KCVZ4BLYI3dG9a6iTV0ByJqO5ScOTSdWnAVTu3rThme8cyxCnjYvmzNmltU4rfat
         ScUukC8Qjir1OyUc4shbonOHn+Db3hCsrKbXVG1tGzaqgqCm1rMW3yW8K1q0DYD8OByR
         cxyThNHe7jOpAPIGFkvaP5MdLkfy3+D2bPvyYjhstE8BYTZ2hTtuEs+ll0YT/r4DtWdG
         43akAyL+wsQ03CfwKzerUHoJ8DydGYmsJOyEy/x6RFH4XWadJWrqH8WZKZHuvMxbxMx8
         dXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721056705; x=1721661505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaxYW18928fApQX7NIAaL07nRV5h6qNSI2LYfiTcfsY=;
        b=SyMch92tHj9eAGqKFjVuBgF7DzOkTme5QWgOn38HMxkvtKakFpgjF26orOLmB89g3t
         ZNdxQ6y3izCvYkv5fO49hjZv8ab6Dys0sarH+/ClJKr+thrdN8jn7iYR1H3aCs4xz7GL
         Wc0oFbKiTHkmRt5qPdJB1KVT+ORPH5FoAqTpuxEwFMY7gM9P+mEu2G7RR65BsISbPD3B
         t6dIwRnzm+0PdXZfBtYGClMMaHEj2fgb+exErxrnPpDVnQXPYlqrG4E85NOAxGIxVH+y
         qCwJ+RHcgt9KHDe5F2z77Vw8WXATOoFKIJOKc7YrB9weOfkshO/5z3B4vdW5BzNDdXHx
         rJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzmK7WkxBuo1RS0L28q66cwAM3HpNXrQn6Cz6uRdLKbf6uYHUl0ipGIFJhyoABopNBEDDCpLKm8h9sQ2HbUMVZDNCgtlJQjC5o4xuH
X-Gm-Message-State: AOJu0YxGnNK//NIZ6WvvOW6G7eQFwLh8LMuYLZ7mYBXfph1COPm2alyq
	Qb9bKu0FAshf7mib1FHzuq2CMmQzgXE3KEcq70itTrMx2lE+6Xj0
X-Google-Smtp-Source: AGHT+IEhStM/DudKKCc45zVD28c8qJn9CETVW5rZ4uUz3HCOhvrgHcPsLwDzZKsocKkAt3opZvqtEQ==
X-Received: by 2002:a05:6000:255:b0:367:96bd:127e with SMTP id ffacd0b85a97d-368240beb76mr22926f8f.46.1721056705292;
        Mon, 15 Jul 2024 08:18:25 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbb5bsm6682609f8f.80.2024.07.15.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:18:24 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	wsa+renesas@sang-engineering.com,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] i2c: imx: prevent rescheduling in non-dma mode
Date: Mon, 15 Jul 2024 17:17:50 +0200
Message-ID: <20240715151824.90033-1-eichest@gmail.com>
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

Stefan Eichenberger (3):
  i2c: imx: only poll for bus busy in multi master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 353 ++++++++++++++++++++++++++++++-----
 1 file changed, 303 insertions(+), 50 deletions(-)

-- 
2.43.0


