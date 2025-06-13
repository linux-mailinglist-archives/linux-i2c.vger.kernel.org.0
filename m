Return-Path: <linux-i2c+bounces-11404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D16BFAD8405
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 09:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930423A00D6
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 07:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5936F25B309;
	Fri, 13 Jun 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AoIaen+J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B91EA7E1;
	Fri, 13 Jun 2025 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799824; cv=none; b=Kh37x93sY51sdGBPbLafokUE3Bgm5W0VtEKtMyawvQM8M2c0KNfk+uOm95qNsBVgcOlgKWEoWYMlaNXwV5TGTLeiZdIkfG06ZXvJv9ak5uciG22GddtIAQfdiApMzuPJfwa7gQoUd+LBwVxy2ZI26Eu5YyEg6OBM8PmpA0GF3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799824; c=relaxed/simple;
	bh=JaMvdmEB/xNxDbDBv2rfaj0AEG3Hnsd5q0m4mD/t37I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kj6TSFUlbLFALlgzYtuUzmQA3wLrNEmipeTat0VVpqKBzz/ZU8/b06kIcIVCVoSmi3K3EeQcpgALkoaWJqKdgqU3NASoM5gCzCvHK2fkkxl+2q+PmLNuUJ8/bYytvSMNlk1ZAh8DHcejEr12GBAXA40ovbXkkv1Feinkx1M7vM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AoIaen+J; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8D56443E0;
	Fri, 13 Jun 2025 07:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749799818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=49gLt15vu4mXbCU+te8YR47e4SuHu/CNyG4+R0GFtfQ=;
	b=AoIaen+JdHaQhT0muniYwYMTBLi5m28ommnG27txBGyXsFiV8yYOp66M7LgdeTx0JFqx60
	JHt/BALBmHTrKhpR6dlvnlrSL8dQr4RBrJcbCCkC8RQiJAEhaUk+iYIRMQ2usSQnJ5NoQz
	gAaFsOtk11Nc1jA+IJdFlmiGj/KDjtdUJahMxlwW7SezkEQd8HnOTdFmFi8yMcHtWhbKZM
	bEPd0NC9QpqAzqMhCdNzBLZdY7D/iEELhFF5XV1vJO+LrMJXp6yVEjsZDcgqql9c/bDOYx
	9IsEf4zUcBT+CtcMnk1cADsr4DwFQ8qi1jlMPhjUraOf4ZGNDA4UWD1aBRNlug==
Date: Fri, 13 Jun 2025 09:30:16 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 luca.ceresoli@bootlin.com, robh@kernel.org, thomas.petazzoni@bootlin.com,
 wsa+renesas@sang-engineering.com
Subject: Re: [RFC PATCH 0/3] i2c: Introduce i2c bus extensions
Message-ID: <20250613093016.43230e3b@bootlin.com>
In-Reply-To: <525877c8-6c64-45b3-b4aa-a52768e59b86@beagleboard.org>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
	<525877c8-6c64-45b3-b4aa-a52768e59b86@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Ayush,

On Thu, 12 Jun 2025 13:22:45 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

> I have tested this patch series for use with pocketbeagle 2 connector 
> driver [0]. To get a better idea how it looks in real devicetree, see 
> the base tree [1] and the overlay [2]. Since it also used gpio and pwm 
> nexus nodes, along with providing pinmux for pins, it can provide a 
> better picture of how the different pieces (export-symbols, nexus nodes, 
> etc) look when combined.

Nice. Happy to see that I am no more alone with a system using these
features.

> 
> 
> I also have a question for Herve. Do you already have any working 
> patches for similar extension for SPI and UART in some private tree?

No, I didn't do anything related to SPI nor UART.

On my system, no SPI nor UART are wired to my connector and so, I haven't
got any needs to implement extension busses for SPI an UART (serial dev bus)
nor any support for nexus nodes for other kind of components.

Best regards,
Hervé

