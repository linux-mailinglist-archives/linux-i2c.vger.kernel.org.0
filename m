Return-Path: <linux-i2c+bounces-574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C178008E5
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 11:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE6A1C2092E
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 10:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE98208A8;
	Fri,  1 Dec 2023 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PNMZq2X+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959291704;
	Fri,  1 Dec 2023 02:48:51 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ShVCz1Y5jz9smg;
	Fri,  1 Dec 2023 11:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1701427727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OAm3AWMmCSZoFaeag4UwbvfiESQNmJ9RHnQR9xoyczs=;
	b=PNMZq2X+MZXStSKWZ7VCGPueqh+msF8bViqfNDrjLFTmh/4h0PTONnHUlZK8he5bsZkNP5
	W+kdpVwqcdIcmU7ikYr9UT6hfKcdheLoPoF/E91u5mFmJK8h6BAvQxT13B+RvF/RjXS1UB
	8mOGzVlof/FN0t90tcTypdqpxRqbqUE5/pMhoA8Q1YOZvFY6XS5jQakFvFasQ+PgZTF+d4
	uBgIgEEYgPRYCNpBpBzIfUHy7oaoHYuf4M/NM9qurHnLMSdhUPb5YuZm/7rLLVP+NgsINu
	3mgj2eCCSXhoydWqkHqgVCuvYdioGVUU2CQxk3B2AcIQ7JMJTmevgKClc2LVjg==
Message-ID: <13271b9b-4132-46ef-abf8-2c311967bb46@mailbox.org>
Date: Fri, 1 Dec 2023 11:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org
From: Tor Vic <torvic9@mailbox.org>
Subject: [Bug Report] [6.6] i2c: No atomic i2c transfer handler
Cc: benjamin.bara@skidata.com, dmitry.osipenko@collabora.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 3fe66d1d811e49dd83c
X-MBO-RS-META: kc6murww4t5z7k8uojbu6ipuokawx9gi

Hi,

Since Linux 6.6.3, I see some warnings in the late phase of shutdown.
Unfortunately, they are not logged because syslog has already shut down 
at that point.

I used a camera to capture a small part of the warnings:

   No atomic I2C transfer handler for 'i2c-0'
   [trace follows]
   i2c_smbus_xfer
   [...]

After checking the changelog, the culprit was found quickly:

   (3473cf43b) i2c: core: Run atomic i2c xfer when !preemptible

Reverting that commit made the warnings go away.

This is a voluntary preemption kernel running on a Skylake laptop.

Please tell me if you need more info.

Cheers,
Tor

