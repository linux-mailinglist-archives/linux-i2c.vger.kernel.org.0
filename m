Return-Path: <linux-i2c+bounces-13466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1761BD1904
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 08:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A47483AEBE1
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Oct 2025 06:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B822DAFAF;
	Mon, 13 Oct 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTV953Ho"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8D20B21E
	for <linux-i2c@vger.kernel.org>; Mon, 13 Oct 2025 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760335247; cv=none; b=FmWNHaem+T8DexgU66wXmJAFutNsmuyGZmOhrf8aBI63S2pC5cgyBfuPNoTFM7tbBC/LxR1yu0FlaGFykPgHWfagrqQ5SJ+I629o0fwXoxi0hl4rraRfoLDzkymOd4uYzOuzKf1UV+mP3g0U0Brc5TrmWZDj2n9YwhVGnTKKdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760335247; c=relaxed/simple;
	bh=0i8+DknoxQAjvpBVwLLCnjqj1KkrlAyOUec1giywe+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=abIBnqs9vjynRYW8WDje5QkPytNyORmFkvjptzsMK1/sfbxhLXu2ZtAxPjPWQqxUFPCbvL4BRLRNVd++YNJxRcateBFwa8YUMmw3MwvsLq4JXHa3DOVI0hYuP+87AvHPOfcDAUCv1hO7JZG1zgdVFScZTO889YM4SfopDK0h04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTV953Ho; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso7575167a12.1
        for <linux-i2c@vger.kernel.org>; Sun, 12 Oct 2025 23:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760335244; x=1760940044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uZUcnCRcwQHZ20XjWalfDU23D3XdkLxWMGXACq1syco=;
        b=ZTV953Hot+DxYkEcxv3+D2B9bswcTonClQ5Zg8uBpMdAkmglZCWmKFqs4OwT49WN4V
         t2leDM5uNXdU2SgVtj5hCs2p7rdkL5ugzG/dkT23q/qzY5RYWPH6ODQVvs4P7vh0wsOB
         3uYA6bL+E9Yn5khA9owjJUODZZS2jnX1ASC18N5iYhpfRgrXgPSiz5IsL2FbPavGqN/5
         4Omvh2tNy/wRNQVD1ffGyLGseD+qrntYtyBxIOTfv3kS5n8WxNzec0PxwQT74bwr4DWn
         npOZPqrZupGL1lq+MBUjjPah/QibtZxZBdqvkHNQqSUcxt+IZFgTNmXNAbh79KKeUHWk
         6n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760335244; x=1760940044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZUcnCRcwQHZ20XjWalfDU23D3XdkLxWMGXACq1syco=;
        b=agmveBm75On7YYyHOlFu2S99Ab3zxyBqZfSAT5u/dVm/0px1NeWCl2UrghiYFf+bUj
         YMDFm3Uf7JGDz3jWIQfTIgTKBwAzwF0w6dcnMcWRzhGlKdkudHnireR2F7C5WektMms2
         oM4CY9nwXLQxztxXHB8Qlt+c2Xi/MF5gYrx/Df+atg59lSpXoBRwpX164EgfJX8Eqy9k
         L9lJ6zXI/gQrZ37yCAXYZBF4iUH17OjUueBR+aYgmmkAdEvhuf/OZTdU24ie01QboJC6
         2MGWtWBv8qztS4bi2WOSaTz4XbPOwOkJFAluxE7sA7Dc2EPdgm2itKC4VdZU7daRqkaO
         g73g==
X-Gm-Message-State: AOJu0YyDVHYWzb0KdEPuxh/b+OiZnM+g9TCZ3ReF2EiLkmbWtpc42Jkc
	XRvRhpEU7To+dOQeK8w38eIV/GOnigt/eWEkuFk1GiOPL4xKXFqQBAFX
X-Gm-Gg: ASbGncuAETr5cwNTLrscRsod1XZzrDEIbE6RH2rmUujKBCQfbwpCVDkVehSfckPdWSI
	azP21qUgfzqTg9+qEE8N7lUzawaTJSIabkx2RBmCD0zbOPbfDBjyZJeKex0AKReQE+vSYUo5k6Q
	bm1I1r5C6cXsZZqIV5IgzL6bV7rBmEjoEU/MI9JVI8EmtqOsXETq8iMJDMD4jOYJ/1CXeM3/HpL
	YWbmYih26AAVoGr97SwsRu2wMKOQkIKsmg+ZIT4i58Y3Vc88FDwjRxx8pDibkbEvXOmKtrNzQag
	dlCwopZPlF/9oNYtvBuICbYXqSoT4z/e+Jh/eFHEQkHrExrajMqBfs5o2wRXfPjmlC6sFsNigwf
	EUmTwXEWzfJhIrz3VqrrdvwHtEh2yMlmwHsmSEJYW7nk=
X-Google-Smtp-Source: AGHT+IHWc/g3EJigTLvVfxiB8jWGoS53+EIwNWR6rz91UdvmkSEhoG6xGpbuNvbew3becTvy8KOkSA==
X-Received: by 2002:a17:907:3e14:b0:b0e:83e7:f6e1 with SMTP id a640c23a62f3a-b50bedbf399mr32638666b.15.1760335243865;
        Sun, 12 Oct 2025 23:00:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cacba7sm848329466b.5.2025.10.12.23.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 23:00:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Date: Mon, 13 Oct 2025 09:00:15 +0300
Message-ID: <20251013060018.43851-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement driver for hot-plugged I2C busses, where some devices on
a bus are hot-pluggable and their presence is indicated by GPIO line.
This feature is used by the ASUS Transformers family, by the  Microsoft
Surface RT/2 and maybe more.

ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
that line through optional dock accessory. Devices in the dock are
connected to this i2c line and docks presence is detected by a dedicted
GPIO.

Michał Mirosław (1):
  i2c: muxes: Add GPIO-detected hotplug I2C

Svyatoslav Ryhel (1):
  dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus

 .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
 drivers/i2c/muxes/Kconfig                     |  11 +
 drivers/i2c/muxes/Makefile                    |   1 +
 drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
 create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c

-- 
2.48.1


