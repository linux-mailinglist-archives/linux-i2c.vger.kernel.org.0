Return-Path: <linux-i2c+bounces-9670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F893A4AF4A
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 05:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDFFE3B272C
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Mar 2025 04:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87F6192D96;
	Sun,  2 Mar 2025 04:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgZPvZsi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9E8494;
	Sun,  2 Mar 2025 04:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740891316; cv=none; b=nTCMbznEsKuGsYEYSpV8pcQqjbZm9JGudZLlMvdCR4OX6Y7sZpMlPabhDM1Qs85CzQwL6XVDBnW2SfQzMV8wZXp8gAm+L/iNwmtnInPrcGi3cvevYSlehiaIIyijnRXb3Hi8S9OGmELjwfio4mr67pDZzDJbgrXOgrHO94kKb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740891316; c=relaxed/simple;
	bh=FrmHWqu9tneuHbHRnVzjaD8IgkYbtNFFjeVyUtqhsTE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=grS6Fm08zX2DWdEFzcAwjZoZQN9ACJvsQeDwQTv0K3cQUAc7HuqaCBjTR+jW6lfV74xF5jQvzIP5wAKVeRlK5J+Ufx/eE0Sna6cCOOq7VHhzYiHSGUfwSWKhQFJLGqG0N/ybIel1C7zYnSsCWyhaLCT5hkISmXnOX7ClTRm42Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgZPvZsi; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-22339936bbfso50208195ad.1;
        Sat, 01 Mar 2025 20:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740891313; x=1741496113; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYmuHsAAUbnqjSLtR+pm2EH1EhYbhj4zTMezGuOV6nI=;
        b=HgZPvZsi8PCWMXnfX0m1gZwMc8Vxg49ZRzggMdRD2BKO4o4aQQwyueUK9gH6yc41/t
         C2dlvzvj1oBmmNhoVqZBvK1Of3C3k5x07tBQkTQ1h47PwrCIXiXrsfM9ISnlEY9CoA0h
         wlUPU0OMUO0TtyWYytv70MU+shyjHMPz+fFTm7QnWF07preH8QNdDPSceBBH480cKbNj
         uiqb+CtZFSR8DS/oFPBhgqD4MqBpjOx4gMbtatoobmCdkuCcbV6bh7oIIu9BeVEvzigV
         XDdOrLhmcl5o8j4JeLDb2O5xVTQ3RhuO5EFLCiqDygyEgO38T2ju0n6Z/uMZZwThLtWn
         5ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740891313; x=1741496113;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYmuHsAAUbnqjSLtR+pm2EH1EhYbhj4zTMezGuOV6nI=;
        b=MyekhlnxQZuuTBCGgqoMLp+wuti6HInRAg0dXQsiIBl/FjgILoeeUsnbznxCTq8fqU
         IBLb11qGTf5vQ5NXtwegHSNiaUDZUWBniPUlcdATL6y3DGb8V0XxwXxUFNn3J/8Scp7N
         2FCidyDboVv4IPDgxAxqAJfWcN+grBEsSNJPMj+Vwy+Sz3pNq2aTHV+55v5xYG49th4O
         o9f1C2Ra8Dqrj4iH0cdtVDodA9sykp+YjZHkWIL3Mb1gbka6u4JIIp+OqcUAJER/2/Tf
         gzw8jS37vTGKefLqmxrtPJzD+3yBB78XLH5XOxYxN5vdyugvQh4knFYvif8fiO19f+q7
         KJfw==
X-Forwarded-Encrypted: i=1; AJvYcCUOkxx4qSAFcGihIkjCzpw1H+CYt8pOceeY8tGJ9MOk6/XRIIMmA6GSleY6rAQCsO12MGS8ivO0YTLp@vger.kernel.org, AJvYcCVoYbGX7ZdAbHvXPSiLzhgFpN3ctTWetP6HKrt4OlnLswbi5UuMPzEACi94TPHn2mZ9lDQ7pPPScL0OOG+h@vger.kernel.org, AJvYcCVxlzi9j213WLdVAN5TQj/FMwPlxOxWJEL5r/A+lq84smsFFCi0/TKpWzu0RXuoSiPjg0Ji9p6IOj0B@vger.kernel.org
X-Gm-Message-State: AOJu0YwmD/YTw0PIc/JUmr0P9+kIX8PtwiglhWzAb2fK3ejLso2zM26+
	p2bSfNcxgwNpXHgioWXkJJjHpLT42L1+kysgAtNZcJ+VUyXYYIoLqd6G7e/Yq9ZBnA==
X-Gm-Gg: ASbGncsQoAB1wFakAvVFBgIg+VACovgSP8J8st38T1QanfleFyyYtg6X6JFwt2HihuY
	yBNasI86NsKL87vw+VwkelXs4r905++5w/qxuJww2xSP6/OpsKJaiXLCD2GW/lL/MLMDbcpr4LK
	hxlRzU8iMiixWpz0hizzL7GpfeTGicVIO8VJcRYnOChq1GMQcGgfIUUfLFiJI8uN2Dpd1gj+xOw
	EUAKNNfPPMTpVWUxyOC/mSegjmywDwiDRQwvSgavaJkc0KoLryJYRWvDYkuGsuz2X7M4bW4xNkC
	sDH3U6wIeSV3oKabWHFZRlETgkhB
X-Google-Smtp-Source: AGHT+IG6Iwp0TrpvriEEZQrBvVBPTnqh9uCoi9nytOh9CfsNqhNI7A98OXxP9DSNRJnxmuVzrqlqcQ==
X-Received: by 2002:a05:6a00:99c:b0:730:75b1:720a with SMTP id d2e1a72fcca58-734ac42cd7fmr13617283b3a.23.1740891313195;
        Sat, 01 Mar 2025 20:55:13 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb70sm6359319b3a.124.2025.03.01.20.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 20:55:12 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Subject: [PATCH v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Sun, 02 Mar 2025 12:51:47 +0800
Message-Id: <20250302-k1-i2c-master-v5-0-fd77ad3c7e18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPjw2cC/5WQy07DMBBFfyXKGlcz40fsrPgBduwQC8eZtBZNA
 06IqKr+O05AatQFEsur0Tm6cy/lyCnyWNbFpUw8xzEOpxz0Q1GGgz/tWcQ255KAFIJE8YYiUhC
 9HydOouOqqxpoAztZZuY9cRe/Vt/La85dGnoxHRL7jYUsaEkEO6kMWSlQPKfh/BSncODj0Vn7u
 O99PO7C0P86E3985mrTj/jWrC4WIxgySy9A0fgxBtFOAr2XyMxNaKme9eLJNxbZ2cepLiw7cqH
 RyjArCs4bbEl1ng0Y0OxYoiOpVbl8cYjjNKTzOtKs1grrJ0j6bo9ZCRDQyVZba6Q0zeaVxTTLD
 Y10T8tMawDdVHlSAntP043+14orjBsYNVQapdqhUk5p+zd9vV6/ASg7D4kpAgAA
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>, Alex Elder <elder@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740891166; l=4719;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=FrmHWqu9tneuHbHRnVzjaD8IgkYbtNFFjeVyUtqhsTE=;
 b=4qT/Q3RrnxDSRGAkE//HG3Ygs6CW3XBMp6XX/NzAz1S76t0D75YNN50QUyG+y0QuwHddM5aMk
 HT0YmLWd/0wAxWCQhbpBl5K4ZiKbI0lKvzoCTOp0zgGogI+pHT07RoK
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
Change in v5:
- Path #1:
        - Add `clock-names` property
        - Modify the clock property into two
- Path #2:
        - Enable the APB clock
        - Fix comment and code styles
        - Fix typo and drop unnecessary description in Kconfig
        - Prefix all macro definitions with SPACEMIT_
        - Rename `spacemit_i2c_bus_reset` to `spacemit_i2c_conditionally_reset_bus`
        - Remove all `unlikely` and `likely`
        - Remove unused register and bit macros
        - Remove the "err" field, as it only contains a subset of the status field
        - Retrieve `clock-frequency` from the device tree instead of using a macro
        - Use a local variable to track the current message
        - Use `i2c->read` to represent read and write statuses instead of `i2c->dir`

Link to v4:
https://lore.kernel.org/all/20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com/

Change in v4:
- Patch #1:
	- Change the default value of clock-frequency from 100000 to
	  400000. This is to correspond to the driver's default value.
	- Drop the minimum of clock-frequency
	- Modify the description of clock-frequency
- Patch #2:
	- Drop the `inline` qualifier from the `spacemit_i2c_xfer_core` function
	- Drop the initialization of `ret` to 0 in `spacemit_i2c_xfer_core` function
	- Drop useless wrap
Link to v3:
https://lore.kernel.org/all/20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com/

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

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  59 ++
 drivers/i2c/busses/Kconfig                         |  19 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
 4 files changed, 696 insertions(+)
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


