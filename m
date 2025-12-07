Return-Path: <linux-i2c+bounces-14465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D25CAB145
	for <lists+linux-i2c@lfdr.de>; Sun, 07 Dec 2025 05:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9C0130080EA
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Dec 2025 04:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51CF284890;
	Sun,  7 Dec 2025 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnBIKHe1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E13D6F
	for <linux-i2c@vger.kernel.org>; Sun,  7 Dec 2025 04:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765080346; cv=none; b=OuMJAgQQpniEwO9UhMPyox3GB79WpCeKvbnKHuqOspnhDIxZ9E3UugNHIweQBeKmxLzazlsIhOLbXpf9lE8+nucmeSKQNTIGyy546A76XHxfIv6VU69dOvpbiVQarfXqO+TrzOaV5kha3WeV+GUSud429wqb+4PF9kRGQrUEUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765080346; c=relaxed/simple;
	bh=PWZ147u1Ppf7yNYMcL7wpdf1sLLMlRa3CTb2HAu1DTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QEpzNEIxIMZb95p9vRd/7+nmmqeZKVxNkjY+pc1AglE5ClS4uTMjmXtvTXeVuBU8PjrEDHw0Li7Cq4sMxCkkpIe82SUYZc3pYsgwyBFcMqO5dG/FuV+ULlh/PjbWYOZqXETdz+lc7JPlckkx1Vp50rA306XHCAif3PGotXLoj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnBIKHe1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-597d712c0a7so3479215e87.0
        for <linux-i2c@vger.kernel.org>; Sat, 06 Dec 2025 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765080343; x=1765685143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=OnBIKHe1NH4Mm+UVQtZHs0/F9daQpimjovUkHUhv76Je/Elpjbibk7j8wZNK8kJtxZ
         0AwZkfvTrrzja9Sq+jXQuLYhIXKA1uWdHJ+Oy9VthF7VBXqTD7sDPRLwbZoWSHySsF9l
         +4kaLtbSmRXNxLb5yOxKj6xRzlgk4PrJgqILzug+CIotJK+tl0i4IrzybaE8n0q9sMLk
         Ne6LhZUN6uoKMdyjnUGOMjTl0ZQkzArQfsoHHnHNnn2vfi5UFn22h5JEG2J5ommQU97w
         os8/i1PFzQzclAd8kcB8V6OlZJYNnA1nhMGtqtohqJ5TNjZNGL3EC8mZGUCR+GOuzca7
         Pg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765080343; x=1765685143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ex2lzVAczuwvkjLV+fgi87Xz5EH5RAk0RHJHjHXLtww=;
        b=gQOJU/vqwQC6Ux3EYP+0yh6m/JZST//JRGlmZ0XmijJRr1k1df/2tjw1ztHkHWyzRD
         5v51PB9SZN3R5jrihntHeARZq2COTBl2fYlfRdjZSEPEQ60+J8wUdony5W1P8Bq2wDQZ
         sJnBauadDkEnKru4hWUEpVIqRpisQ417L7qGf1HlmvBoEMYeDsJYsfjvysFfSZkd0uNR
         gCoMaPwI8y8cDSLt/+P4RZIGHv9YeiKbTHb7GupHAPMXiMlee9SjF0+ybXao/sm/EBFn
         rliPUa0oGrCunI9oqEEmuQ8iFnyUBZJ1meNbShR7pXqx5cRUJ7ZQXU2GDEVSwe9vCr9g
         mKew==
X-Forwarded-Encrypted: i=1; AJvYcCUfZ71fr2aeuvt7JwMLFApXQspZfccA9mMWOJMMIEp+pMYIRw86+WQsD5GLkuMWahf+At9j3gJq6q8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kB3/MA1bIACwoisiQfmdmyk8+2Nk4FKkFBVnaCUcFFs1dBq7
	6JsXm+naK2y/OT6C3PJI9SIYNI+dPNwDMdyvxZ8iOqBHwjEQiuNfFQRZ
X-Gm-Gg: ASbGncvJwsiZl1AAcfdpsKUeGPvQ6Gow4frK+Pnxzz8760uJ01ahW01jluXOASEFHuv
	KZwY3I8aowjPU6jHERJYpjdY5ZlpjQqNgbDCaGEMHOoRy7eYgPX76LDnpHc01kn1/WtJNn16K+E
	YATmlTv2KlZQaJj3+SWEwt+TljmKeGGRb+Hn7RG01/2KQ8tJDvxIldtO9gHFyquYlPGB49RlmLt
	RbhUlFhZ1Nl9AHk5J/1fj0C+cIWgtC2Dnzrk70YDo721oWY44xJm7qF5HfzYDiPyUOo+J2StNkO
	2srgZmsqByPWosA5cRVvfAusBSFGP6SwU4Z3yu2bPhWC5XHi13q8cQ0sbFgNSLWw0E418U1+kF2
	7wmANXOzVtaJmNM+tLwWCbiYSjAooKp3EC2ucaxjDH+nKbZbX0ZSYStR6wMVwvtMy0GbNi2Hs80
	8kc7Mqf242
X-Google-Smtp-Source: AGHT+IH8mx3P/9V/pAGu8lz10DNuwJ7kxmYDCtybY5oUGluuyAcyWcsd4RN6gkh3q7lmDuDfA7g2qg==
X-Received: by 2002:a05:6512:31c6:b0:595:80d0:b68c with SMTP id 2adb3069b0e04-5987e8bf711mr934848e87.25.1765080342615;
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7c270f1sm2912765e87.72.2025.12.06.20.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 20:05:42 -0800 (PST)
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
	safinaskar@gmail.com,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Sun,  7 Dec 2025 07:04:59 +0300
Message-ID: <20251207040459.3581966-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
References: <aTLjgEVfLCot0cSm@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy, Mario and others.

During these months I found zillions of suspend and hibernation related bugs.

It seems hibernation is not well supported.

For example, it seems hibernation is not supported on Chromebooks [1].

And Fedora intentionally disables it by default. [2]

Other operating systems do similar thing. Hibernation is hard-to-enable
in Windows [3]. macOS on Apple Silicon hibernate in very limited scenarios [4].

But I still use hibernation.

So, I have an idea. Maybe we should remove as many as possible hibernation-related
code from kernel to make sure that remaining code is easy to support? I. e.
maybe we should remove some even-more-obscure-than-hibernation features,
such as hybrid sleep mode, to make normal hibernation easier to maintain?

If you like this idea, then I will happily write patches for removing
some hibernation-related features, such as hybrid sleep mode.

Other ideas:
- Remove uswsusp (i. e. kernel/power/user.c ) in favor of normal hibernation
(or vice versa, i. e. remove normal hibernation and keep uswsusp only)
- Remove hibernation to swap partition and keep hibernation to swapfile only
(or vice versa)
- Decouple hibernation from swap completely (i. e. hibernate not to swap
partition, but to special designated partition or file)

In short, just tell me what should be removed, and I will happily remove it.

[1] https://www.reddit.com/r/chromeos/comments/y5pol9/anyone_know_what_the_status_of_hiberman_hibernate/
[2] https://pagure.io/fedora-workstation/blob/master/f/notes/hibernationstatus.md
[3] https://www.groovypost.com/howto/enable-hibernate-mode-windows-10/
[4] https://www.reddit.com/r/chromeos/comments/y5pol9/comment/ism352k/

-- 
Askar Safin

