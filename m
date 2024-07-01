Return-Path: <linux-i2c+bounces-4535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C191E2E6
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66FC21F22E3F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF1616C86E;
	Mon,  1 Jul 2024 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjgTHRZS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C9616C852;
	Mon,  1 Jul 2024 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845770; cv=none; b=g3OZN/r+awOdbCO+O8tR2/y3blxlt315Tc4mifpxJFdrbVvZBmGFilKIcOGtuwhFqaKcoyW0bIcOUcNeVYWJWNTnbtQXUNRE8MSag72qzu+vTnrnN5ZBvffPxk8FMRx3vbQLq1rVr6AIZooIZVbxAxdrhEDNK0VJpeeX+EGYhSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845770; c=relaxed/simple;
	bh=gDLaedp6ZCoeI1AHF945YerUsiKNo6bTTIpeE2TW5cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l8EyAEJYgAZG81Ru5jEWzk99/mxD4ZobyZvb21dHqOXbaX2CtaJuGVp3Ig7meJtmnB/Y9p9QryFkqBk9jTce6IYrpc3y6NNPUumo0Wgod5RX6MOXbX/qZAJARTdQ4DB9OjiMUriMIIu7bGJMRYLgfTfCdV+atocaGbsPc+1aOWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjgTHRZS; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52db11b1d31so4449883e87.0;
        Mon, 01 Jul 2024 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719845766; x=1720450566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yva08AFW2IklrXoeu93ZqdsrKdX8Rmdq+Tv1uD2A/sA=;
        b=fjgTHRZSfZC8FYjUfQVCtTBt4qRWwhwdC2GbuxkpHG5okXiHEdKzSJE41hngjZJKgu
         nqO5Tc/k6F1W2Y3yat1kKmy8U+qLm9y2+JQprpzKelKEImw+O0tpnHkRiYtoo6TjQt2/
         hgRi2M4pa6W7/U4Rf68Rtc3Vfv7vMf5LLp/SHiAaVg3B/31a0pOD2ImHzyGIMM80GZFP
         BWvUyBpCviv8sJFv0iI11riCkDcZw0eh0vaV3zfJSCRJjBWwTN8upAwjzoGpRIQhAHLW
         n1fmYJtFaK0DKKsffsdtI6T7FMv5tt6BPuprgVAkcJQMiRJSgS0T9ChB2lLDWea8fwxN
         sNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719845766; x=1720450566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yva08AFW2IklrXoeu93ZqdsrKdX8Rmdq+Tv1uD2A/sA=;
        b=fKUQ0jHWHcuy4Bhh46gvTU6hT18G/QKolgNdbE/5fo3P3IUVoNc4JA/dEPkNfjsfEK
         vb9SXTOqzUtWH58tRy2MoRUVf+LKDbhSzDrTKDGFrwJgn2ADj2Ba2kaFXnPEl0Pox55w
         hoBVENaH2VUKvaJqXmIyzYP0IR+c4wS9bzYpVYXR1MxY7s8j/GUYg7yOuTRnn5buq1hX
         PCht1ZoRk71249G35x7J4Ectf03QNhwodyAQKPDV3B0GpCg9xl128EqPzfoiceaPs3Fl
         cFy9sea5kXslpFdmtW0Qw2K14jcJHeG23DNUGUYTRK8U2jjnX2D8IHUuyxSYdc2KL2wl
         ueog==
X-Forwarded-Encrypted: i=1; AJvYcCWMk8TqKpwidsjQG4UC+tDvmZlRUpcGBNHrBLrEXm/sVRrxYRayciYn4OBZqtikt7WRJH4kmetSAAMfhi9khxo+BvSkPJkR6s6bjry1AO1s0pecmNKHQosPwR1o/OCJhoO1sbJB/F2FYd7yCJbQPvUwYQGrixnCiXYcYxlOwR9ZLNL+unX2ypWb7IgWdbAZXQBA9Tji7bZRHd+ed1AS6mg=
X-Gm-Message-State: AOJu0YwrwIov6/i0rVdF3r6m6yQA348hHpx9NbgkwnWkoQ6PLvxVNmZq
	ctLCDO94jC7SEPLNWBzOUK3plT8kkI99If16lWoly4hQHrFfxTrX
X-Google-Smtp-Source: AGHT+IHUxEcvuIhBXTzt3U/lTyf8QzTdIyl1Qx8o1/Cw58EOFGJNsZPb/8S2tKeR5IOj/IiJx7l6Sg==
X-Received: by 2002:a05:6512:3497:b0:52e:764d:7409 with SMTP id 2adb3069b0e04-52e8266eac0mr3222713e87.19.1719845766289;
        Mon, 01 Jul 2024 07:56:06 -0700 (PDT)
Received: from localhost.localdomain ([195.239.203.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab3b1dbsm1450044e87.253.2024.07.01.07.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:56:05 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add MPS MP5920 Host-Swap controller
Date: Mon,  1 Jul 2024 17:55:59 +0300
Message-ID: <20240701145603.1507516-1-xzeol@yahoo.com>
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
Changes in v3:
  -  removed unnecessary license blob
  -  removed unnecessary headers
  -  edited device tables style
  -  added chip name checking in probing
  -  fixed typos in pmbus_driver_info struct initialization

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


