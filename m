Return-Path: <linux-i2c+bounces-11684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD01AECA3C
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 22:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E847AADD5
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 20:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD1E24888E;
	Sat, 28 Jun 2025 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cRccKSrM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A793B1DB13A
	for <linux-i2c@vger.kernel.org>; Sat, 28 Jun 2025 20:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751141397; cv=none; b=puHTVnrhlBuHyL5CngJUeLjW/LpR0Hc3hpoyyMY3mafWzTvOjLF/eK8MoB/RxEYgPfUwn/CtqptK+2hofFEvOfKe0r6VWdMhWEcnuzD6g8mZmXnSnTYf7wNkrdLXxe7YU5jFT7Hws8MRkmAWHG3n5WWIcFHeZTG4pJfPGvKfLc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751141397; c=relaxed/simple;
	bh=f0a4USs8i2mvWvTWq8g8LuHUKhjCSiBButMrbCa/mH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mjqt5K+3qxhwvhwktj/gxyoRHv++aUXI9BYQpCemZmd0gVOY3Qs/scFTI5D4znwz2PGYcRpMYuBMM05gGeKoSJH++HMYKMSgh0Qce0Qkw3xVlogoL9Fw67fNov5dZLP9CMYkQXJzC2o8ofSCmOyHxqj7DJMSkMpR1B+pJjZe8Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cRccKSrM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f0a4
	USs8i2mvWvTWq8g8LuHUKhjCSiBButMrbCa/mH4=; b=cRccKSrMuLEV25A9nnIC
	sWKdKpgFQRGtgH2xx2EGOKIZcLJ7cNNTjGeCT8XDCbp0pvHfRM07JdMTvK8zv20f
	H8Yilak3wSwsRnzRpffpVRqTfNprO40+wdV07A06qaLpQSEXFWSrIPWpxfomhu4X
	Oh+4sQqg9Y0uRCHb9pSAlnmjRAH2JYlt7dGB5rBmhmbRlOY05rXnl8bdJSgtV5Cp
	x3PW98NBeRa0szF/V5B2WViZvUmkqx94S8n477Utb2gem7Xm3/oG+udwFezJU6gA
	qLCY/pTIoQmVzTHq9xPf15Z0Z6yiaRSvxVzEnsiYaOUnweXJlmrY/ovZcvsGB0mE
	AQ==
Received: (qmail 1928467 invoked from network); 28 Jun 2025 22:09:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 22:09:50 +0200
X-UD-Smtp-Session: l3s3148p1@rcR2YKc4ZgdtKPCO
Date: Sat, 28 Jun 2025 22:09:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alex Guo <alexguo1023@gmail.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	andi.shyti@kernel.org, linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <aGBMDFLH7aJGFyQ2@shikoro>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615234919.525431-1-alexguo1023@gmail.com>

On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.

Okay, okay, instead of adding these limits to all these drivers, let me
start adding SMBus3 support to the kernel which allows for bigger block
sizes. I probably won't have time to export this to user space yet, but
let's at least make sure the kernel, and thus the drivers, won't suffer
from buffer overflows anymore.


