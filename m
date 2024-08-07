Return-Path: <linux-i2c+bounces-5184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0E94A4E9
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 12:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59EDA1C21330
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3EA1D1738;
	Wed,  7 Aug 2024 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRxUD3mq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54A81C9DD9;
	Wed,  7 Aug 2024 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723025001; cv=none; b=VQGUAJf4G0KfE7GEmDAVsESFh9ytDUe9gv5OgFz3PsWAZGLWZ34YDGEX/Z3Sn6/UaMRpscD/tIbqIoETRUWHMUsfElqhfthup1Gb1WpIXtNomOs6p5fgjybBpar2x/2njAjADNAFeGfK/lOxUu7hvAzK85HQhFAzTK+PGAxXxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723025001; c=relaxed/simple;
	bh=jMtvwaDw32VUxdovaGkZLEWnJCNOQokc0ali/5O3bsY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MXS0FNnUc4wXfEJb3PlbqecKliT+PByfUGndkf2zPfTdGI66/KY3lQmu5quHgeNF+s3YMuL6O0z+r5qPVrkt7polj0CnnhZzIkcugeBme2kkgkrFhICQZa7ccWti1FIePS16TJwL9AeWeXrM8jjn7k4by1VWJlMF4We8ML04ybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRxUD3mq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fd640a6454so13882205ad.3;
        Wed, 07 Aug 2024 03:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723024999; x=1723629799; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QZYXRPEg528ElfNUTSQ20mrku4XweYkGoPgtSo1AS4=;
        b=FRxUD3mqLlUsyEipRrTB3ENJjpoiJ1U3j+WuX/lAJhIqHywesUxPEf1P+wYGAh/hct
         W+Cf5pmRPI9VjPEbZeoLfq9JnfssgBS4pxG+rZBofdvEy9ZwRCDtC3Nbld0jgajVAgkG
         2EughltoIDCePwS0n1qGz+xvjEzkxAxppEk3nisp9IvEeCpXRsnppjkzYy8rSiRQStRo
         hz/LKFjyGJylw0B/4J0Jx0lC4EJVMbg542YF2oYDSwZg/cesr/Ijh90vrgOSiVBIK48J
         +ludaJIq0VrhBsiQ6N5wTwL7XDOZE+vGyzrZ3nojMaEdxFPXqpTjKrkR1B3YH6cC1TeW
         KqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723024999; x=1723629799;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QZYXRPEg528ElfNUTSQ20mrku4XweYkGoPgtSo1AS4=;
        b=e94GYoadfRkvco1JLf+OkVz7vy0T7RXVWMFATqTXliQEfznELN5dN5lH2fN0lHg/Ho
         4KKWJLDhY4Qo7eNul/TBfEY/jjpayI8dfw0CICPAgIPYFwMmMyp9GMhvu6K3Tpx9GAe/
         iMOEu2+dA3PzQ0jYA03mEG8jSnrESjLmUpCQOqSjrq58tEPa934bzZez7R9jfiqgdP39
         HSauHh9MPQf4uJ/DsT48RV/3xQbD62J+6USyPtfZJ7KEwUZiyT3CUt7G6uYPzT1f1+7Y
         6hO9XxFk952T96Jmpe0gcWHOj7KjKEYoCr5blcyV1dUJELibOw1RaeIG3jrQ623C4YQ9
         LcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+sVSQOk0FQZJ6NQNmW5IY2TsprX9wDA0s2YNrQ5PBwmI2979hopUjcJDfNtYx2TO7mMsA8NOGeyt4QxIHBxEfiNr+OQzX0EOg+rsW
X-Gm-Message-State: AOJu0YwhZeonDEFMlxavVQfWItN/aNUg4wBIFxkQYh3lXT+av1tA87LZ
	gsLSQxZ5/bz4Bbk8BTWmZzhBgPJPZ/B8iWSryzDSmOQlesIpe9M=
X-Google-Smtp-Source: AGHT+IGtt7yBZ4CfHFL434fO0nZ9TPo2uWQBtrGHO/+MhwTtlMQLPNCENUE0OdSburFSvWg21GelPA==
X-Received: by 2002:a17:902:e54e:b0:1fb:7f82:515 with SMTP id d9443c01a7336-1ff572a2c1emr198249685ad.15.1723024998874;
        Wed, 07 Aug 2024 03:03:18 -0700 (PDT)
Received: from localhost (2001-b400-e352-b705-880f-4661-e7a1-4abb.emome-ip6.hinet.net. [2001:b400:e352:b705:880f:4661:e7a1:4abb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592976b3sm102874295ad.252.2024.08.07.03.03.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 03:03:18 -0700 (PDT)
From: warp5tw@gmail.com
X-Google-Original-From: kfting@nuvoton.com
To: tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com,
	kwliu@nuvoton.com,
	jjliu0@nuvoton.com,
	kfting@nuvoton.com,
	warp5tw@gmail.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1 0/7] i2c: npcm: Bug fixes read/write operation, checkpatch
Date: Wed,  7 Aug 2024 18:02:37 +0800
Message-Id: <20240807100244.16872-1-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Tyrone Ting <kfting@nuvoton.com>

This patchset includes the following fixes:

- Enable the target functionality in the interrupt handling routine when the
  i2c transfer is about to finish.
- Correct the read/write operation procedure.
- Introduce a software flag to handle the bus error (BER) condition
  which is not caused by the i2c transfer.
- Modify timeout calculation.
- Assign the client address earlier logically.
- Use an i2c frequency table for the frequency parameters assignment.
- Coding style fix.

The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

Charles Boyer (1):
  i2c-npcm7xx.c: Enable slave in eob interrupt

Tyrone Ting (6):
  i2c: npcm: correct the read/write operation procedure
  i2c: npcm: use a software flag to indicate a BER condition
  i2c: npcm: Modify timeout evaluation mechanism
  i2c: npcm: Modify the client address assignment
  drivers: i2c: use i2c frequency table
  i2c: npcm: fix checkpatch

 drivers/i2c/busses/i2c-npcm7xx.c | 266 +++++++++++++++++++------------
 1 file changed, 167 insertions(+), 99 deletions(-)

-- 
2.34.1


