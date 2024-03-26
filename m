Return-Path: <linux-i2c+bounces-2590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42AF88C20D
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 13:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46106B22ECC
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 12:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBE271B20;
	Tue, 26 Mar 2024 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve96Y1hn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D6A70CDA
	for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711455985; cv=none; b=o51QEOdM/jNhtwhwFhUrV/uQdxiFAQrmRJjyZjPDIJc9G8LfqxJGK+1ghgLVQ0yv6DaNrqeNyKCHmZ+DaKImDAg3z8gGRLqutpZfEukZ5iYAgu9BGHWokRvYUCPkEoPYmFmrj5GeGSgXSbh3OUKHM0D/4VoRpAYz6CnJK0VhSwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711455985; c=relaxed/simple;
	bh=Rcxhgt4VTrrSeH0gM3np5nh+XRGRpIX4KzDou4prTDM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PFZwz6L3DbJzFyKIEQcV954G4w0UEBk5f/rnQclB5JmQ1+6mXfCToH9UzXLjFgSEb1O639z9ucNdDhzHBxSx1EGiWp0TflhAE8Ip7VF+3QpWtX2qGPiSVj2RsaBsneYMzszfm1bYAIJ6aMUWvePy74AnWmdZ4cmd5X//wVJK1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve96Y1hn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56c1364ff79so2472029a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 26 Mar 2024 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711455981; x=1712060781; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rcxhgt4VTrrSeH0gM3np5nh+XRGRpIX4KzDou4prTDM=;
        b=Ve96Y1hnZrLvsH4mXQW5reyeYTwRtqwXY53r/hu9O4eilP8u89h4Xn/bB5vVo93rQx
         vyDunFl/YILOu4YKhl7Foxl8Rp5wZE8FF4e10oG72FbqYLjuOTarOd9C3pHM3oxWWnHL
         08R1QxD/QxrwXL6MNJgKMf7i0hLEuzMM8Nasg4ZROsKCFwqsWydwXRtgLl1qAQjtvYEe
         bMa6LmWQUrxDhv2udMBqabB8aCFMJSA5Sppg4w0iQ1FlZnpyN3dwcrP7gjfMk4PENRty
         wEiS/KI5tjIt7EvENrrmRPG9/2gVq1Uiuqc3KobGCilHn/20keuboFPX2pjflekdJOnV
         L6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711455981; x=1712060781;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rcxhgt4VTrrSeH0gM3np5nh+XRGRpIX4KzDou4prTDM=;
        b=SGLgEs/UESQw8SrHpIYRpqC7CKRc5Luhbhww8rl+GgQ4fz8/faJhbHSF45EAasgGvb
         CZQ6O0l4AEPp874WHo/BMuEXhAVwFtBK6Tk5i2lHR3IqCMx/qbgglogIK5J7oqFRtpJc
         +d8BpQNCZf78HoFweWB6D8GSolZ/5/Cz/VA1Y1duv+jKpD2ejJo8nq8d/3UZpkgBzduA
         Ubxz1b9686AwdARn1yzSZE8DWv+kaVj5L7EK2KMgFq1gsFUgMDZHvoPwJk3N4dMSv/9k
         2rEzbfGJeMg5d1gI13SUiHmcFtEUBlTuk1J/lnmnDg5Pl6HuKQ6Uw8965ynRFBcTEURh
         u4SQ==
X-Gm-Message-State: AOJu0YyNLol6yqpUSK4oy4JA4RHqxzdVr6Ea8zVh0gGmR+T6xctLM9kr
	wOlIev0+8N1A1SgkSaJOu0Ovr5bvwz6bUc5/DpT/WQ8UXC+alH1HWht1CrvJxU/w4FkDQ6n1Bqj
	VOJIv/p6L7dnFqXLoLqwckcN/EEnIfy6/
X-Google-Smtp-Source: AGHT+IHz9h7R2+KPJObrO0HYJtBNIG7ZOHFvCP/suOFnozvG3eu3OJ+KCkyg62EpRfXL0Ji9aWplMV+7qfOzXCu/dtM=
X-Received: by 2002:a17:906:b001:b0:a47:fdd:e97d with SMTP id
 v1-20020a170906b00100b00a470fdde97dmr5959491ejy.51.1711455981405; Tue, 26 Mar
 2024 05:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Patryk <pbiel7@gmail.com>
Date: Tue, 26 Mar 2024 13:26:10 +0100
Message-ID: <CA+DkFDbsa2tApdHJGDos5jvD7Q3o4Px_O7RxVBqA07ffbWPiUA@mail.gmail.com>
Subject: User userspace access to I2C device acquired by kernel driver
To: linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
Suppose that I have an I2C device (CPLD MAX10 with custom
configuration) that implements the following functionalities:
- GPIO Expander && Interrupt controller
- Watchdog

Suppose that I want to create a Kernel driver that will handle GPIO
Expander and Interrupt controller parts whereas the watchdog
functionality will be handled in Userspace using /sys/class/i2c-dev

Correct me if I'm wrong - but if the kernel driver claims that it
handles the communication with a particular device, does it
automatically prevent userspace programs from communicating with this
device using i2c-dev? So splitting responsibilities between kernel and
userspace which both handle the same physical device will not work,
yes?
For me it makes sense because accessing the device that is already
used by a kernel, from userspace might be unexpected by the kernel,
however, I haven't found any solid confirmation (it may be my poor
research though)

Best regards
Patryk

