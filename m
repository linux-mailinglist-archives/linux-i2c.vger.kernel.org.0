Return-Path: <linux-i2c+bounces-4386-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5784691A20A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8887B1C215EA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 09:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD151350FD;
	Thu, 27 Jun 2024 09:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/FYRl4T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D44D8B1;
	Thu, 27 Jun 2024 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719478881; cv=none; b=nUldaBQxXMEwPagkvWRaCCvUIJZZ5bIncVPq7sHnbvGroT0jtRExQkMhNfXsZM2w7GI3KiSa803L058wzuo8vVIn/nU2oK2EEQSKDr0Ji+Y/lfOj6fFx8DiZwgMcFKYYCbgOvwOmMSYecsRApHM/WueQ5EpCd4tmk08sy7d58YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719478881; c=relaxed/simple;
	bh=jo5kbagPfG5zRbGwbJWMSySw76EqebcWrQo4sAkttvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BucY17hbgUJqovt2t7USHm3j38DMsO5r2t8/mkRRNbTbaxOSJYAEwIxrr/CdnmhpiWUT8qhahrCCoT1zgJZ5jJKaR3n6P6e3DoGbp7EkZj2GbYrIqwtnwW8K4Svd9DMwJ9m9EOf/jX9ITRTyGDxXu7lhWsFKeO1Bo04U2hDLcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/FYRl4T; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52caebc6137so7118755e87.0;
        Thu, 27 Jun 2024 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719478878; x=1720083678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dd4PgV9kEHk407J57+4fyGHkc3MrwqgZyw5fYcht/HE=;
        b=H/FYRl4Tuef6bJma1/Qxd4+GYvnp7AQIQc5t/hSEj3DEtq8Yq6WeuUA5g0hZ95DVkU
         efibwYBkezLH7JidwduTBPOqO7EGcIAeRKG+iSnCtWYdmAiYDV7exHBdJcRNWmRddl5h
         MAIhhrKAafInS06xEcnCnWynMMaegrw3HiYIlnwXWtLcpZyDvjojThs84ASPNRr6xbMY
         5oGxzYbwIrcMnmZEZDT/EoGKwMh896fHOlRPcBh8i17Q+FgqeE8meku0Gb8dIqGl7t39
         Wonol9XD4LrIuSHcty6M97dGpQH118Godj2HUkEKqUq0g0ARXyeRA80wzSFyNGcxvQQc
         24KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719478878; x=1720083678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dd4PgV9kEHk407J57+4fyGHkc3MrwqgZyw5fYcht/HE=;
        b=VZ3WdhbUjb+nsTbfUKIjd5ENB4nyJ0cjK0KksAI5wk+FdtF7wl1p1mgY21OeRDTQfo
         4Eigwq6ZwLK6pH/fF7UqqRz8kFTe3eBV1FFM6FKQFSviYDRmM0hMA2G41Xcdu4EFOT1r
         QiywF56SrOeLV00U26emUC4Mzz43oTb2C5YudfhDhbcdFA4wh3dv1M3pMcOAbr7WtyKL
         BwNg+KblmFac1F1hhA+NI5MKkafQ/gs/W0xTkTxDO0FOkcLZwqHDNL6fOJ4PgDyxPWHU
         1Fhpnsc3mhtjgGU465iBSng8X2QhUgkelKb5GnpmwY4wZ3F9O0zs0mY4Cm4/j0ke85Af
         QsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjnDHLG/3/+4o5R3hJ40+0Jem2eVuvuhO6Nhfa0ZsIoE+MjoZdGaMk62UUcdS2CZGffM5T21Yu7vp2wPZfGBG5HBPKCJn6AJQIJEh95ZgYE18UzqbzGhmgCYLutuQ8aKsEjTlYB2zyfsRckfL9Ed9g9e6FxC0gpl9kLepGIcNZcTuAb+M2nVmdHJIntmncTorSJdY5SKoPU6hf9ia6Ui4=
X-Gm-Message-State: AOJu0Ywcpi62DFl4U3CuYghW4fg6Iw5WtsiyEAXToAt2buiyEmZCCDAa
	/n4Kx0ETK7o1qNcwE5X2lzsPEUB2/FBLwSmiNVsMlbFGze/UzkiA
X-Google-Smtp-Source: AGHT+IEZttafwpgGmpOq3tc3FXPGW6BezfbQ62nm9ZDNg7kVPe1BZ3lV4obZfHal0dE0mQVZSumCwg==
X-Received: by 2002:ac2:5639:0:b0:52c:deb3:e3cf with SMTP id 2adb3069b0e04-52ce183504bmr7348270e87.24.1719478877944;
        Thu, 27 Jun 2024 02:01:17 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712a75cbsm128557e87.38.2024.06.27.02.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 02:01:17 -0700 (PDT)
From: Alex Vdovydchenko <keromvp@gmail.com>
X-Google-Original-From: Alex Vdovydchenko <xzeol@yahoo.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: [PATCH v2 0/2] Add MPS MP5920 Host-Swap controller
Date: Thu, 27 Jun 2024 12:01:06 +0300
Message-ID: <20240627090113.391730-1-xzeol@yahoo.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series of patches adds the MP5920 Host-swap controller, which is used
as a protection and control IC for devices that are being inserted into a live
backplane. MP5920 acts as a voltage regulator (MP5911 etc) supervisor. IC
utilizes pmbus and provides monitoring, statistics and limits to electrical and
thermal characteristics such as:
- input and output voltage
- output current
- output power
- IC temperature

One must take into account the nonlinear character of readings, so there will be
a statistical error in the range 5–10 percents, depending on current passing
through. In order to use the IC, make sure to specify a valid I2C address
(consult to datasheet and dts-bindings)
MP5920 datasheet: https://www.monolithicpower.com/en/mp5920.html

Changes in v2:
  -  fixed typos

Alex Vdovydchenko (2):
  dt-bindings: hwmon: Add MPS mp5920
  hwmon: add MP5920 driver

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/mp5920.rst                | 91 ++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                   |  9 ++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/mp5920.c                  | 93 +++++++++++++++++++
 6 files changed, 197 insertions(+)
 create mode 100644 Documentation/hwmon/mp5920.rst
 create mode 100644 drivers/hwmon/pmbus/mp5920.c

-- 
2.43.0


