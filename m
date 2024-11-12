Return-Path: <linux-i2c+bounces-7934-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6518A9C4D0A
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 04:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA77F1F22F25
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Nov 2024 03:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08017205AD6;
	Tue, 12 Nov 2024 03:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IunehSHa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB419DF62;
	Tue, 12 Nov 2024 03:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731380947; cv=none; b=VLqrBQe/tZDMrGBl/yKwqxhDeUM81y15r6I7TvljscyjkVITPWnjiO2smPpHEHOHMrZ6QCB+jvR+gOO3zcrh54A2jk1ZN5Wi8Z9ST2ymabecC7epGFNjFgVK2TDwxGXZhpB7APD5EGGppizNHmT+/9buVOkx/lrqeKRl6vTpfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731380947; c=relaxed/simple;
	bh=gzs3+9anRTgv3Iily5Ls73R0Bqh3ICi77oS5UhFOCOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qo4oUz1BFvm0W3xJgKQLWA9R9yEWVD+kHM2JsmoFYYra3kgXdyQ1ce5rHlExkR236vZ/JAsOIWZyqH/462aB6moxdsLm33ug18MsAyB7sQ24qb/JMrCrJBhoNU6jXRr/ZlrAdZE1723r2+zsfwjb4bZo4kd8KYnBgavC2Nc2h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IunehSHa; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7ea8de14848so3130078a12.2;
        Mon, 11 Nov 2024 19:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731380945; x=1731985745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxbojmtPvDfIuSrydnIbvZP6Ty3ccGTNat4sE7E/fQs=;
        b=IunehSHafKdlLdgTDiD4anEy0g2+tp269+2YmEO6hbdpEw2qkLtHzT71xiYmL1vkc7
         tyILSDiqQfgIhG6SbSMIeBHzvB1XJ6IUAL9H6qnlgNvi+ipN6IKgFLm1p/xlPr6gmYNz
         xeRtbHbazTEvqwIXCmSO0dGoeH1csOdVm0fW9GnxVGrG3onJXfanjHUxg3lQ0q4NBAWA
         awQBlqpYie1ff2aQseqgqJfGZ7wywkKhUrgpLw7hggOf8uSj/yVdoxRkq0/kKflthc7d
         T3wSIMDAqD3TNU3Y7OmjTv/qbDcPsNQCplVjL2YW9tDXdbwF/dA4cWwvHtpAaJFeHm2+
         dPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731380945; x=1731985745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxbojmtPvDfIuSrydnIbvZP6Ty3ccGTNat4sE7E/fQs=;
        b=fqH3Stf3Lf6hG+q2BUviJJ9yYR7jYPFZZ+MEamhUvchR3vyX8Sad9Fk8a3IBmFh1qN
         6KuoYjIHKD9EHlQAXA8vqhKhSOoSc0DjMVuoNh4TmRLE9iwKimdRV7/ggNAKH1Lbr9Qf
         SLe1W1j/YKkR/khzHEM5/E0hFEXOBBafzGnnqSyHsa96+RFJOlLwyKCoq0hB90MWmWI2
         4EwOC97r+m+0SmCuVtiUmPZ4lBypP5mKEY0/rir/hjZrKBnxkaGPQuhWiwKZl8KPXmi1
         bGFD+mZqCaO79PkI3Siiyah7TwHbWOqJQpaWoHXOMme9vXuo1xyFZ6jNzwe+Uivjojpw
         Bffw==
X-Forwarded-Encrypted: i=1; AJvYcCUwR4s2QqcmqqbVwABV540x+p8QIrjav4xJC3sUdhza7iYe3MoTx89XJ+RQ2Yzes0CEmPW5AS7AV07ZzxfX@vger.kernel.org, AJvYcCWhCTVwwx/gTx6VU5imlM73YVDYBPv5bFn9HfukLtMDmakNIsHpdP1TFl91CkGb0vAoBN5ECA1Zes1X@vger.kernel.org, AJvYcCXlSRmeudXVeiS63ikv1Wr2HvjfjxxSgVHoxRLd0Zh0eTbEkC0nXD+KnYLU1p3GtL4wrauuXJmZuG3/@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWveJw/6wmJTZnOKyqetpImtBHXqBpml8rrcX7YXkG3ZkOn89
	xdi45f5xc27d8qc2l87bJB/34mZbro9idm5PKNkEhYZz4L4dhNsRKDigtzqptJoC5g==
X-Google-Smtp-Source: AGHT+IFoUAjVIGTXbKt7DslLUHLm4w0RUW3celgY5+JUErt1NqK2BrRy8QgwIoCq10JGItaM5Q+17Q==
X-Received: by 2002:a05:6a20:a108:b0:1db:dc13:735e with SMTP id adf61e73a8af0-1dc22b57621mr22128698637.30.1731380945508;
        Mon, 11 Nov 2024 19:09:05 -0800 (PST)
Received: from [127.0.1.1] ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a3a9csm9873447b3a.110.2024.11.11.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 19:09:05 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v3 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Tue, 12 Nov 2024 11:07:38 +0800
Message-Id: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrGMmcC/03OQU7DMBCF4atEXjOVPXbcOKteoLvuUBeO89JYJ
 A04pgJVvTsOIMHyaTSf/rtYkSJW0VZ3kXCLa1yuZeinSoTRXy+g2JctWLJRUit6URQ50OzXjEQ
 D9sO+k32A06L8vCYM8ePbez6XPaRlpjwm+H8KN7LWzHKnjeVGk6JTWj6PMYcR0+Sa5nCZfZx2Y
 Zl/zYS395KWf+C/srbaRGnZbl1SUefXGKjPpLzXCkAXem5v9eaUG6iYc8xt1cCxC11tLGA4OG9
 Vz2bwsNLKGg5aOda1EefH4wv5hfguJQEAAA==
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731380939; l=3842;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=gzs3+9anRTgv3Iily5Ls73R0Bqh3ICi77oS5UhFOCOo=;
 b=JvPvC2GL3etgvFd/M22MaGFDmFSc4l8snAfZvarYe7eSru1zOAS7/H1u2aXvS7mB04H3IX2nn
 QJb/ywzquJRDn+wPiTmMBovkK/FO5BWSKjrQKG19W78EvsGUne2pxpX
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
---
Change in v3:
- Patch #1:
	- Change the maxItems of reg from 2 to 1 in properties
	- Modify reg in dts example 
	- Changed the enum selection for clock-frequency to a range,
	  setting a minimum value of 1 and a maximum value of 3,300,000.
- Patch #2:
	- Drop unused judgement in `spacemit_i2c_xfer_msg`
	- Fix the dangling else warning in `spacemit_i2c_is_last_msg`
	- Fix the error check for `i2c->base`
	- Modify Kconfig dependencies
Link to v2:
https://lore.kernel.org/all/20241028053220.346283-1-TroyMitchell988@gmail.com/

Change in v2:
- Patch #1:
	- Change the maxItems of reg from 1 to 2 in properties
	- Change 'i2c' to 'I2C' in the commit message.
	- Drop fifo-disable property
	- Drop alias in dts example
	- Move `unevaluatedProperties` after `required:` block
- Patch #2:
	- Alphabetize Makefile and Kconfig
	- Change `.remove_new` to `.remove` in `struct platform_driver`
	- Change `dev_alert` to `dev_warn_ratelimited` in `spacemit_i2c_bus_reset`
	- Change `spacemit_i2c_read/write_reg` to `read/writel`
	- Change `spacemit_i2c_dt_match` to `spacemit_i2c_of_match`
	- Clean up code flow
	- Fix unnecessary line wraps
	- Move `spacemit_i2c_handle_err` to a suitable location
	- Modify Kconfig dependencies
	- Use `PTR_ERR(i2c->base)` directly as the `dev_err_probe` parameter instead of
	  the intermediate variable
Link to v1:
https://lore.kernel.org/all/20241015075134.1449458-1-TroyMitchell988@gmail.com/
---

Troy Mitchell (2):
  dt-bindings: i2c: spacemit: add support for K1 SoC
  i2c: spacemit: add support for SpacemiT K1 SoC

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

--
2.34.1

---
Troy Mitchell (2):
      dt-bindings: i2c: spacemit: add support for K1 SoC
      i2c: spacemit: add support for SpacemiT K1 SoC

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  52 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 656 +++++++++++++++++++++
 4 files changed, 728 insertions(+)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241031-k1-i2c-master-fe7f7b0dce93
prerequisite-change-id: 20240626-k1-01-basic-dt-1aa31eeebcd2:v5
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9

Best regards,
-- 
Troy Mitchell <TroyMitchell988@gmail.com>


