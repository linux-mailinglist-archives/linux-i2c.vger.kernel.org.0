Return-Path: <linux-i2c+bounces-14409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32660CA5E51
	for <lists+linux-i2c@lfdr.de>; Fri, 05 Dec 2025 03:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE1A7301BC7C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Dec 2025 02:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8887A2DF12A;
	Fri,  5 Dec 2025 02:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gz6BrHZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B211518FDBE
	for <linux-i2c@vger.kernel.org>; Fri,  5 Dec 2025 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901004; cv=none; b=CeBAmxOsBDHrKk8Lh1bRXgiv+OyHxjVUxFmNvDZvhoVvy9ivZj6BBvptEsD0HVezerpUHv2djrDuBEzpvzssaLbvRWbPADz/Y97+k9M/b86QTfmVnEF/C51NlCtCHMOgliMsZpZAa/rt07okdHAGgML4bvzqTok8JtllFSknlX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901004; c=relaxed/simple;
	bh=XN2xK0L6T8z2gUvj7EKa9rykXv4aaY2b2j4P32dthxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z01itky3OO4hpmRV2ZV6v7dd7g4Ld8oQan4qJWJfrKBiQSPwqdLvTawzK1+szl+3Iy+6oXiuV8OB2o8Z5EogmcFKOOptgRx/8tj9K/opjWyj98NI1kaKEezS8hqh5tX3lcvo983ZLHoWaXfHQIAG7hGzqZzIIzysDK8VYbDUPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gz6BrHZV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59578e38613so1797052e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 04 Dec 2025 18:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764901001; x=1765505801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=gz6BrHZVjWmIQRJIZLrtAH7dOhvWd+bbQMb85jql63+CnvW4HBQMSSTpFb1WNkjrhl
         WLHnKQk1jB9J5GX4/TSn/nfC8TOph0XxWeS4kEUHE5b0xi51vFpvgZoam9NqPnoRPlnW
         rPB24TMIOdbRxmqzJt2Kfb/3oJLeLK5jwN8fCY3HKS+LDqwr6CenD7KqlJQf43wUx1lV
         lrlajDKy7a32RmgF6PE5FceRQ9IZeLHbfDieRZIxgoxwxeWfu14TgKFcYnmHOkxwHZgE
         sbKpVgt04G2Z4uCe7m4fHlsiXtmvbI0279YteJuLfcLIGX26CDGr/5W7hJdB7RELEhaj
         RSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901001; x=1765505801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=Ue9SCW82+tGPKC+EZql/VK8dVgXXe8qahq1zXFnOfDtOsLhyljgqS8QbXL7QroCthj
         zEubYFlt+01OUXHYNjNADwVJIobpKWdBoCfgoSX4EzTfytg6KTuSontMsX1BDAUHk9QD
         inV2/HQWvwu1COG7Yfw406WS+DhFODWrbeyIaEFiJp0gtyZ96pqqW6IY6xPRCZahQAHG
         WhsMx1Ffga3kkA3dLW0VfCYBivToENDoBfs6mw0Pw0ubCSHmu3vUYLX+z+AGNG7Fa1pg
         EmC7EOX+cLsUqlran6NE9QXuHD4dUr7QF42MXi86NDRgrdAacr3Dq4ZMb5n5L+zU9bn1
         98WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHlc9JcmMx1eM0HgS11bfWR20WYp9aqHpMcW2tTh6wS8m9Sicny10rEgdZEVnuERuF+YCeUlFluI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxyBhmHl1vkNN9wz9um0vxuiY8bmRXR6bDkrrYzYugaba7Cre
	ZrFttTyj5tdRd0HbHlWPNjurIJpxVaIme26l6spbSzWLoIzLb2aVV7E8
X-Gm-Gg: ASbGncuxYb/3u9HIdU5VW+1YEU3YfAMLXs264w9nWHiuUOhBbtBD8afOTGgt6dWnhby
	1ZQ/t/e6eRAca+n67bohhDhZILWZx+QEZ3bVc9zNr7pN38tWO/ttFEX32VFrC/cIrpajlnovmfF
	869UuOEIPdYae/oLozJtVfrpjz8cMMq1JudzeSb9u2A2tRblscaNRs4hs5+4KfjRfx8UKvLg85g
	Dor83nniO/8InZwtB4DEEw9HwDh9YENohTaJUkYd8JM/EGmco61ILRrFC3Sme929YlgF/Tu8F1b
	qOr0zlGtAvTxMLaJoEfLJ36aNKHYT9ygleAY8I7oENDBqDE1MHu2LY7Jg4I2vtymiAuX2HUolxY
	B/hIU8TK2Q44z8InX7hoAUCyGmUseXD+0rN1JkK5GHP90lX2ObpYMY+kU66EPp6sMPVOhd12QpK
	bx367GW7cv
X-Google-Smtp-Source: AGHT+IEyFEkOELgyiHNROdiStkgWh5vG+sTc4f93bdHueEVTwDFr+UEZX+prSlamxC/7wi7A40g+fA==
X-Received: by 2002:a05:6512:39d2:b0:594:b2be:f3a with SMTP id 2adb3069b0e04-597d66c816amr1719792e87.25.1764901000513;
        Thu, 04 Dec 2025 18:16:40 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7b24862sm999822e87.29.2025.12.04.18.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 18:16:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Fri,  5 Dec 2025 05:16:16 +0300
Message-ID: <20251205021616.1570442-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aRDml95nMPeknmUM@smile.fi.intel.com>
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> > try to add a quirk to prevent touchpad IRQ from waking the system. That should
> > help I believe.
> > Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> > If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
> 
> It might be actually the touchpad controller name (as I see in the quirk table):
> 
> 	ignore_wake=VEN_0488:00@355

It worked!

First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".

I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.

I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!

Please, somebody (maybe Mario?) author a patch.

Thank you in advance.

-- 
Askar Safin

