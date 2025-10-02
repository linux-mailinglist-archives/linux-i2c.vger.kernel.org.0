Return-Path: <linux-i2c+bounces-13355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F1FBB4319
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 972703274AD
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2B0A312803;
	Thu,  2 Oct 2025 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1SXI5zt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30062EC08E
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416135; cv=none; b=Y1YCypKNpyyIOvE2DFhclF2UzYGGbv8Ke6b40+TaiDDR6n/7kw+Go6aQrkJGXNWBdvWensiueG8SG4OhjWR0mcj5ujSraE3IsahR3SG/BmOlV/i8Esac4u/8OFcmpDKq5Iccjfm0DQjFjwtMIRJ7gjtvu33l3rA5tLHg9kC1Y4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416135; c=relaxed/simple;
	bh=39T0ma2tQY2ash6Qo2ada6hVH3JsIkkZza4MfO3ZBHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7/qaR1lZvk6kRitk0iTjuxXhQWUepFleaOIlmLh/JHsGJG4YlGAnH53pOMoX9aZm+37SNYaCQn+FRBuwcf472yzpX26sGYglxPKGk3EIJHzu22pvhskRViziNP1XXmbZLhhrjJgy8w9ezvl5DKvuWVC36rvz2KcNK8V4o9NX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1SXI5zt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-36bf096b092so15200661fa.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416131; x=1760020931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XkEhPQwNtmSlycuLC3g8JLSdLRDEM4aNuSFfkt353w8=;
        b=V1SXI5zt0jAlbFiOMt+KN1jh1J6lyRSz39JKswbHYwsXT5XlPZeybsgr4u+81nSYym
         i844+qSfp10r2gyTxzrvH6HGq/w5kAfeGaPzaE2XNF9EDhwzZW+1lRwPL8a4eWHwsCBX
         m32W+1FvtKn6NelcFQjCI5uvuk0+zgB1jCWrolaJ1YdGpzcQfQn9pNu8yNrzuC9jBGV7
         Efy3IDt9r3j8y8YPAnTuBqi/wtcjQGEG6wVrMfJ+oAowz6go+KSd89fgHqwHXY9tmyfh
         xMEcau7OeadqZ3kT5m6X8XkBv8wIiNsuEArz4+mYYRkWb+sMSuiANxsWd+OFUqIbYiUg
         iROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416131; x=1760020931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkEhPQwNtmSlycuLC3g8JLSdLRDEM4aNuSFfkt353w8=;
        b=c21DIDp2zDD8tVNHSAuuMGM71+/PSgQTbxjfpXvuOVxGo/cOL7S9yFHPegXBKLbsmo
         9jOv91SAXJeyl9M1VBE3kkEX9OuDkW4gX7/FTZBcZP+bTmPJ2jFNlcbqSGIf35pj9j6s
         WK2IGD6NpDFUi01Ra1NltKxSwo6cq1mjVChRb0CeZLi6A4O+X28TwyVe6RR3LuQjMDUx
         PK7ALyHNp1uuFIenPIa9Lmj6z8VQ8j0/pJVPsNN15HdoPBSbRqcFVa1xt7baPc7HlttI
         nUd2b/o8GzQGwdWsB0xS27wrKmheOQHP4C7w1STiIJ4Elrh4tipabfqjReijYtPoePGr
         y3bA==
X-Gm-Message-State: AOJu0Yzl9fBYRUGilSmGPSU/+m9kPP534+nmA5xggqKtsnoI/UZIPwHP
	MCapeDZ4lJ7siXbH/h3DsdcijhA7CEsNC66hEcNyMo06GUss/npVjMlkdXRKw8l9aJM=
X-Gm-Gg: ASbGncv9ZVZDtgmebb7jhYr0w0c/nW/LbESN/Ao/z0cb+G1OzzQjIw1aMmppuPFt+Yj
	m1MAdvPI20dklyjW5dfD/wM1nlpc/KwyDwQCNy0VAtiQFcYvFG51xHZ0RJ+/cBdXLf6ucTe690M
	mA6rz/6mFD5a9Pu9j/S59hUrzQwY0hoG1TUlbqWHhwf33Z13EmpRZNkjVbuz9UJW4ajleNyixBW
	97j9uFZsns7S7qQUkylNIYS5zxaw4e8wZpOtc+I5fQgFaEc/GT69yllohCqDxHIi+M03JA0JG1i
	3xKnatMesDlSYfpAmTyfVHzO1jxEc9fFesy1xtrtRw/S+lHYF5zRKglsftqYVjlwY2ASBVv7azV
	cJWwPn6/1OeNv4+63bykWxfIqHEfXWe3J0M7k5yWlk3h4B8MldEUxsm5qKe9jWcRsgr3FFQ04em
	PnEfJbBZtKPO4iE5M=
X-Google-Smtp-Source: AGHT+IEJrVmC9w57f3G5Kl4iwhrNotYoJdOTKctK4lxmuohghlxTqkB5k3mcuvU7EJGSvorrZ8awuQ==
X-Received: by 2002:a05:6512:ea7:b0:57b:5f02:e9e9 with SMTP id 2adb3069b0e04-58af9eadd91mr2337387e87.7.1759416131104;
        Thu, 02 Oct 2025 07:42:11 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:10 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/5] I2C Mux per channel bus speed
Date: Thu, 02 Oct 2025 16:41:31 +0200
Message-Id: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABuP3mgC/z3MQQrCMBCF4auUWRuZTGqxrryHdBGTsR2wrSQaK
 iV3NxZx+T8e3wqRg3CEU7VC4CRR5qkE7Spwg516VuJLAyEdsNVGCTk1vhZ1RWyMZ7JceyjvR+C
 bLJt06UoPEp9zeG9w0t/1ZxD9jaQVKjq6traNxtbguR+t3PduHqHLOX8Atnmbq54AAAA=
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=39T0ma2tQY2ash6Qo2ada6hVH3JsIkkZza4MfO3ZBHI=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8jY8sNNc0W7j8+Y80la2dbww0CwGRU2EPcx
 iK+iv54Ty6JAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PIwAKCRCIgE5vWV1S
 MtdpEADCljn+7Mdpkj70JlrseklPeiZHTd2xkmb6vlLy+z8HENjFXbtsU6NJjeswQ2kPPcJxlY3
 2KC0ukpz1U+3e+iLYJmFRxA39N8xEWhYET6juCq57IDIwUsJU7e82ZDsGsPnJykYYJ/F2I0peC5
 a68188K9FFLFR4q1zT5kANMW4ODO4Mkps1ohqYWjNAabOoazrEZL4g5HuzJe1UPHoC/1D/7u2X0
 BDFjWcRKvbiIVT4t7pyvNRws7iCp9VCU3g7u0C6uzOud/zzhHVg2sjM7PCqa5b6WpKkbEmPxSBV
 wQX2NAV1dTcFoXst5RavMMtdKPcv1JIxYGCpZ+4wAQAJGr+hDS7sJP+lZi3g15qIJzCDJyyPy26
 eQXldCCW4BZ/Ht6KFmrneaMeyKG3pJ3b8RKWzEI0D0KxYCvMEf0F7XitMahVf3+hkuCZ3T0XIKa
 vWWpYh6qSC7H1RlAL8CakxoOrW/+muBNEJP1bRyA1cq7VxX8eFzWgeY+ptSpzNHYDF9JOwgCN8F
 +cPFfC+6IHMO7v7MzifND4uvVXIiLIZY7FUam/wZtClm1zMXHqBAUW1OwPaUfBiHwNqwQgdK5C0
 ToEo7rK7JUQZAWIWvnQSWV+NsZmGsHaWsccya3JAWbK9QZqw09u1e0ITEEu5i6bOINIO8qO2pzQ
 coHzCHjqmE1S8Ew==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev
- Removed idle_state from mux core
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 115 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 323 insertions(+), 22 deletions(-)
---
base-commit: 22f20375f5b71f30c0d6896583b93b6e4bba7279
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


