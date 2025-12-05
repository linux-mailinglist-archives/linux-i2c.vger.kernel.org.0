Return-Path: <linux-i2c+bounces-14411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4CCA6123
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 05:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A94A31AF46F
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 04:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAF828688E;
	Fri,  5 Dec 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE887RGV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3EF256C83
	for <linux-i2c@vger.kernel.org>; Fri,  5 Dec 2025 04:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907321; cv=none; b=mZC3rWjAATt2NGqN9k8++nqXipPu0/9qzgPjIHMn5vbKwmYwerHROL4uEXaD6h7Jk9SbkC0pCPeg0X/VDTYqlSUKAjKpNxjucbdgH9gRi9w4dHjClwLrxKM39ektyybYnJjuXWR65xORIciTOQZhJf7UIfLdCIXFA/7gzkGlAWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907321; c=relaxed/simple;
	bh=pFzSwLOIY7gcuMiT2jqZdWntJgk8Vq0j1sPKw9ztY68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrMQ7iWSlv5sDyFqz7X+jhrXB0r1kBwbHUFUFYxPKIzg7jODrfwXsTO/C+new1rg1upCzP+jNK9lzNitOd8wEg6qDLqFrbEIoAFVlIUe+Pc0NO/tKrk+2gnrTiKcuBcH71CzlaE02bRqC/0ulQJ9QRsHQs7KdWK4mDKI+eMqxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE887RGV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5959187c5a9so1310290e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 20:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907318; x=1765512118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS03XI/NqHnaZdyjNXmpSaRmEsgm36XDq9ZRwSJmwYU=;
        b=CE887RGVibHCjnp6/xOklJ26swzLi8jYEvFqgQT+TiYOePyF9/ICi3wQSUsARV7rgm
         M9XU04lOEJMp4F1lfEkBvpBqIdoeeOWGHVuMIrIXNoLhdOshP35x+pHZcSM6/km3YViF
         L1bdwuRe8/404PbrH3Secv4gmbaRgaajRV37OAGFN7eOmLjwbvOtZ6uG2k6AnigEC0eG
         +cGql9R2n+Tr8CcAruiOLcY+hqr15mSnarBMeoJZUsOxMgakh974CCq7Y7qgD26uBShV
         KSrHZpfi693UyJ8ERWFdCV5liXLLbcRZ5lGoVZbwIb7UGoIiTWZuq49OGc8vlEKtgg3F
         QhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907318; x=1765512118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TS03XI/NqHnaZdyjNXmpSaRmEsgm36XDq9ZRwSJmwYU=;
        b=CfcWgJe0/HWIIhJfwJoqxlc40OXiGAIsO1/X5k6nGMXs+DgK7YnH+YIDbZNv6pGL54
         FeE4Utpq4ci0TY65wrPH/vKXhVXMLjpk4533waRz4OfsSHpG7vyvhuH1DAZBoU5P7gbo
         5HUuJl6hLrP4oe+kZa+2vePceyYne+96QUUddCGygm7Mgoq8x8Rek3TffQ3jGZKePWl/
         mt55zstSKQ8LN9g39Ivxeydlngl7qkKibo3LessqEttC+UPqkLPJnZk8TxnMyoCnBGfk
         10n0eTrdjsY3oqoQbCJrtmXGja36+zklpd0Nezlp5bHTXQRHGrHbMY9U4hgkwdVhaKbg
         IHrw==
X-Forwarded-Encrypted: i=1; AJvYcCUAkg0tTtQWsGkTwBjYZa0r7tTbOHODtvsG/uoH+DT09h9FbHXjS73ljl3qKpJ0XI2KANpBJLGlRpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIlpDP5+OfAE7Y0kN79pCApn8pddHRbC/YtYGrGhWe60tp0hO
	w4RCsjSrMPL7EiSatrGDw/tTUlkcajPJtnUKheTumxV1iQgBwqZvoWTo
X-Gm-Gg: ASbGnctwZ895u8HgBhpGJGFz5KCHnO1J+12oaTg6L2RqdUSSqbLYSE+f08j1MthImGN
	7dOOWzpQKkLPu4rXFslz+2SYMyEU74/ZmGDXepd59vF/9g4UIWqsf4ve+8BU98e7a4ZGKG1XYZq
	1L31nNEVmKBmt6WAxJbrBw706zu3Z+rMsMNxw1SoSscZ29rSmsywt8lOgUO6Xtl7JZZ4Yk0u+6D
	x0G7agoCO+b/HpovYKuWhq5jRj5FB+fTHFL6NMyB9yrEtS2sWxoxEgZKHk89Ql3Yqb55dPqbTeE
	iF+fSFJFRB7Ey0vlS5S4HIXPoqeR0opmVtfLUUWIm4+MkyTPbQ75/7dwTEBoJrJXhY6ZKKbDFik
	WfJoV77kzLvSMJj1N7mFF0zVGMSc0qgNw+7I+8kSTqeH3X/c2ien5PdylCZwdQc/uvHhKeDk2W6
	jgQJ9ISxmDwtw9ODhd3Mw=
X-Google-Smtp-Source: AGHT+IHN7KA3JaGcYZ1b5MDiLqZ7+5bt4dnsWETdVylDcRKkhYslMrpS+MPrq0JtQ1kOV8Bjuks7vw==
X-Received: by 2002:a05:6512:1090:b0:579:8bbb:d61b with SMTP id 2adb3069b0e04-597d3feec96mr3249945e87.46.1764907317846;
        Thu, 04 Dec 2025 20:01:57 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7b24814sm1084405e87.40.2025.12.04.20.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 20:01:57 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: superm1@kernel.org
Cc: Dell.Client.Kernel@dell.com,
	andriy.shevchenko@linux.intel.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Fri,  5 Dec 2025 07:01:41 +0300
Message-ID: <20251205040141.1735580-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
References: <f983382a-821c-40f0-a41e-ba9f47ae73c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>:
> Random thought - is this happening specifically when the lid is closed 
> and you're applying "pressure" to cause the touchpad to click with the 
> lid closed?

No.

I already sent script, which calls rtcwake in a loop. This script reproduces
the bug. I don't touch anything when it is running.

> If that's not it, I would check if you have the latest firmware for the 
> touchpad.  Unfortunately this isn't something "commonly" flashable with 
> Linux like is the case with BIOS and other components.

I already downloaded "touchpad firmware update utility" and did run it
within Windows. So, yes, I have latest firmware.

> Maybe @DellClientKernel could provide some guidance.

Dell.Client.Kernel@dell.com was in CC all this time.

Also, I contacted support via web chat (and said my service tag, of course).
(My laptop comes with Ubuntu preinstalled.)
They said I have basic support only,
so they will not look into the issue too deeply. We had lengthy chat,
and in some moment they said that they will not debug OS-related issues.
I. e. if I want help with this bug, I should reproduce it without OS,
i. e. in BIOS setup utility. Of course, this is not possible, because
one cannot suspend BIOS setup utility.

I sent them link to this thread and said that the bug is probably in firmware.
But they seem to ignore this.

Also, they said I can send the laptop to them, they will try to fix it and
send it back. I don't want this.

> But yes; failing all that it's viable to make a quirk.  You can follow 
> any of the ones I've submitted for modeling how to do it.  Here's the 
> most recent one I've done.
> 
> https://github.com/torvalds/linux/commit/23800ad1265f10c2bc6f42154ce4d20e59f2900e

Thank you! I will write something like this:

+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Precision"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "VEN_0488:00@355",
+		},

I will test it and then properly send (hopefully today or tomorrow).

-- 
Askar Safin

