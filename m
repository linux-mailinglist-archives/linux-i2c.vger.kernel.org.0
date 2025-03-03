Return-Path: <linux-i2c+bounces-9675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFDA4B78E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 06:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 463263ABFA6
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 05:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3877F1D7E37;
	Mon,  3 Mar 2025 05:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlAbclwZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E923BE;
	Mon,  3 Mar 2025 05:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740980021; cv=none; b=IdxHL2Be9VmIXfRaGbGSca0CNDlp2idwKlHAOJBd1tt6VXRK77m5XCeuo+SOg8GvPZih4FRV0oqV1/KJ75ZAd/26oyr/r8wM3VicZTOQmMz+bwv9sFW3NxdZAjTaCj7RvYtALTr+RUtkdskR7AzMoKtwEW7Jbgpbv7bmX5OLkzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740980021; c=relaxed/simple;
	bh=6sHXAvzsP+r1/I6tpeLEGO+JZaMbG5gqUrghqgt3eew=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiVqDJqVz/scAetOZGxhz8UnddLsgq7SRCaF+3Rv6Uk4F/8V5hK5H7+18A5DqqKMJ1kfEDlWxc2T58Y/2BfsVUqvdJt4bXdxarAxo1sJ8dZSS4eCIVHQZZelHPX+L/FH4Wo6QNGZ0IW+3/1r4+vHjeKsl6XrO4JFnsrRLq3J0Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlAbclwZ; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-223785beedfso38019785ad.1;
        Sun, 02 Mar 2025 21:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980018; x=1741584818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=NlAbclwZNMgwAnQX9OId6IDca6MVlSmrZ31SnQJAFu3tnlk0vFLFD/po3IePU88Pf/
         1THmi1jxNctFSVExlkrr7A203weZoyvgqiXr3bTs+K9wKbbD/gFst80XTIBQ+7OU2qf1
         xtzsNz5WXZx0hyhj3NkoIeC1ek0VmDvcE7VHqKurftHjRN/bPIxFyU9JzK1BvfIVvnux
         P4jD1epDibTAPRsg+lR7+ApQ/zaPiCL9KK1Xc2/oNkgjvxmswgrOMI/15344mnnpaWwK
         JWKuYXmxXjZ9RhL9odEazFt++ReEOYzToTL69iKf19yY8kV1Xy6YQ3zFFLB60r4xNKWr
         zHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980018; x=1741584818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNzjTOUxxhbIheI57oMl3Xyjh6I6yF+qqVevEIma7Bs=;
        b=IIN5KkyBNwq3geQMPMSb6jTpXD0fbg1891wSBS3hBPr/hEL7t/E3Z7WIAEVMNvdKOL
         sR+5982aewjpp1Dj0ujdr9IUxl24aoOuPA5G9N0o56gFZd1UXzSw+/Iv/kQxWWDvaJxZ
         YmLrWKt8hYXhqWu/XH7Qd0jOl14ZphaV3SnwnsoggwuY4D/u+6WhVKU/+pyt95Ax/9f9
         XamxjnDF1m1CKBMqaYLt5itjDiKz3TySco7O7RLjVoxMSkcMubSimhtDkzUwJDsPd9qH
         CkH3yE1KJVZqD0W7vm1OfbysVspYJYNx+240yOPxigPggjmwusasrbNsenlTLJSDuKSt
         X+2g==
X-Forwarded-Encrypted: i=1; AJvYcCVLI4gnRuZP1QNmh6B8w4ydmV35T5uC4CBF41fXtDEZNkVbNBpv3sG9NR1+JpjoPxXVPuV7a3aOTnlI@vger.kernel.org, AJvYcCW6tktlL/p5Fla5ri3KwC7ryFcini68Cgdh77Wn3kXZazA0YkINxTPjTFsCp1wl083qvRa7UKTVeYSymezZ@vger.kernel.org, AJvYcCWWrU6HUgddiUrOz6zCwaDSgx8TMpp8dN+gfmgWeRNUMVOrBDE3uKm3cPk37Ex58WbxU2rewWIsqjjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgowQ8L28hWURXcgxOsglqxQ9zSAhZdpmM4Ko0U9W0GENuYJM4
	5uDEMGaoslWsxDuLMOlXRy5xDjF9T+4XwzIq76+zyFNKP8JFHJOl
X-Gm-Gg: ASbGncshelDlVNqWn00XMppfr8kGmYkYJ/DTK592WyzrvX6OQ6tATsBP7BswCIxnJi2
	3rEEo6h+fiKxOKoetoBAFe002H2oiBSOVGqnSZ+qAtGzP0zuuiVDM19fIwABRqJiBTkpbOwSSIw
	HGIUWbIhPuB7ft03wyV060K1vO9RYTTJD8GyHb+wP3BnwBKvTQ6OqbLhoV5qaygF7AHu0uFmsYr
	mpQpVsMrz9H0QzJgRaxObJZnMOYMzQIu1Zkjvr6RSQ5dcPnLRCaAcfxF9zLb6FB6b9oTJ6Z4Pi+
	PC2tIU1R8BVscjv2Kn/Viyq13ZYqFmHuUwrtD3N8+OWqPpGfgv50
X-Google-Smtp-Source: AGHT+IGbXxluxQW6FaZUoHMuYCLcvcCCJ9B5cuRUXONbMkfPqLEfzADvL4kkgN3LWbLuD7i5KGYwOA==
X-Received: by 2002:a05:6a20:3945:b0:1ee:d17a:d632 with SMTP id adf61e73a8af0-1f2f4c95d1bmr18909910637.9.1740980018507;
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:38 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Subject: [PATCH RESEND v5 0/2] riscv: spacemit: add i2c support to K1 SoC
Date: Mon, 03 Mar 2025 13:30:54 +0800
Message-Id: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4+xWcC/5WQPU/DMBCG/0rkGVf2+SN2JgY6wgBsiMFxLo1F0
 4BjIqqq/x0nqiDqgMR4Zz2P33tPZMQYcCRVcSIRpzCG4ZAHdVMQ37nDDmlo8kyAgeRMcPrGaQB
 PezcmjLTFsi1r1ni0gmTmPWIbvhbfC3ncPm0f7shr3rdx6GnqIrqVDQxTAoBthNRgBOX0OQ7H+
 5B8h/u9NeZ217uw3/ihv7gjfnzmiOnywU/CqpiNTIOe8zFOazcGT5tEuXOCI2LtG6gmNXvyG9L
 s7EOqCoMWrK+V1IgSvHWaNyBbh5ppptCi4BaEkssVXRjTEI9LWZNcIiyXcFBXvUySMspa0Shjt
 BC6Xp0ymyaxojlc0yLTijFVl7laYOaahl/6Xy0uMF/BXLFScSE3XEorlfmbPp/P39Z+HygxAgA
 A
X-Change-ID: 20241031-k1-i2c-master-fe7f7b0dce93
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=4909;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=6sHXAvzsP+r1/I6tpeLEGO+JZaMbG5gqUrghqgt3eew=;
 b=AyIGByemAuDfgV4XZYaeJW7eawBah8yzyZfzbqVnQTLWMfG8F3tLcKIJJ3XCF3bigU/GuK3ZW
 1yYt5t3MJQuD51BBNof6Eb/g4fUy4sdWNFRCKXIoZPduh5CsgPnMtKc
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
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
I'm sorry for forgetting to CC Yixun Lan and SpacemiT, and for not syncing the Kconfig.
This re-send also corrects the warning mentioned in the CI test.
That's why I'm resending this.
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
 drivers/i2c/busses/Kconfig                         |  17 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-k1.c                        | 617 +++++++++++++++++++++
 4 files changed, 694 insertions(+)
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
Troy Mitchell <troymitchell988@gmail.com>


