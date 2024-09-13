Return-Path: <linux-i2c+bounces-6675-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE716977A9B
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BAA91F21E54
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CCA1BD02E;
	Fri, 13 Sep 2024 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="clI3M+cH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pOBA17xi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5C15443F;
	Fri, 13 Sep 2024 08:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214754; cv=none; b=CDCj15qIadDXo87qXkvtJ8NmCNj/U4hS9QqD/P/lO7dNqUa2lppyaux89Gwvod7z+ekIxldo8GvG5pkUhaAGKtbTOqPjYmdp/6K29tZN6NOV4SMepjLEWxSSLrqHc5LjQnGCy5Wx9lflaZ6VyBqnLKrr0TynLkUqd7e5ceA0iJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214754; c=relaxed/simple;
	bh=LLn5E9J+PxLONJXmbsnj9w3ddIvlQBZYSeKCjZreX+A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TsI7Tgegh8Aht0PfO4SR/HAkl71ThK4h0TTuVBUnOX1FscIAEZDOgxQzbGTjXFWXE4z66Zxlqzy6XV8TfqaTRUsbmnZJ3DPVL/zu8xnvoe+tw+x4+aHcne/I3sSZfvlRixweWEyVYX65BwYXSPUgfAS4zjnvAN+a4AH3E6ZzGmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=clI3M+cH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pOBA17xi; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 251661380301;
	Fri, 13 Sep 2024 04:05:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Sep 2024 04:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726214752;
	 x=1726301152; bh=rJJl7AEVEXkfFdfdgqNhXocXRXFkhcMCEDe5TyRtIaE=; b=
	clI3M+cHMGVbjM0issp7aiohLJP9jLCTBaTJJ39+hUATbI5pWO4fYMFXWDCA0XYg
	HBX9+oYpUp8RvBcOJZgoV7aHw8CEWKpVs27d0zfubvVnUZn59SaFWHWPHuD9OEBE
	DDCgReAwAXc4Ozc3WSS4QliNPI7fCUaiCuJUqavoFV5XNxYpk9Oz50hONe22XLn7
	KNlqyeXsnhzcvedDgNZPdAHqNBjKxKCTnJeUF3XPl7+V2XN8v83Y0hFI9iV3m9HD
	ijYAcgDllc22XUuTBpJdd7atJXFqNrIUHrMf3H1AUE7iaAWi9MPQOLB0VP/FyE+g
	qviiYM7U/XQrqvmI5Jk5ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726214752; x=
	1726301152; bh=rJJl7AEVEXkfFdfdgqNhXocXRXFkhcMCEDe5TyRtIaE=; b=p
	OBA17xi47wHY5p3ig9NHZZl35IUh7T4bGs/SusFo1nodn+MAtFgvkJgFctUK/jwt
	0rXHf9KYAtP2IFd65ZxEtuxc7vTjMeeO67Bo1PwYIV15eOZXk+/bIIkMiyzOu42w
	IEzZKZRTEoBYQdG82CoHL2RsSVfPLwZPPSkLxwXy1lHYxD6q1VgaBULlnC5xuDhw
	/OM82TOov8o2cBgK4FiD1L7qAFL7Wwihb3AyYfL7skScJoBlSRtGPJkRC5UeJ3fm
	Q1dPp/c1xN6YnPi/56Ry8L3gVOEAHo0QHBiNo4N9QkC25xcsQD162toCXZNYhGrD
	h8bMfpKwQY8/lmDxJxbrQ==
X-ME-Sender: <xms:X_LjZjWBOmqr21j0I1BNAhOHQJHGAaGeMeW0SPOf5Dz65RBx_fGx_w>
    <xme:X_LjZrm90CXV0PH64gQfJS9Axwejm-6vfmzX996xa_Omwmiv1Aj5s7mhyw88v8kI1
    YYKPDYhgtLIZz690tY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejiedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehuthhsrghvrdgrghgrrhifrghlse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrughsphdqlhhinhhugiesrghnrghlohhg
    rdgtohhmpdhrtghpthhtoheprghrthhurhhsrdgrrhhtrghmohhnohhvshesrghnrghloh
    hgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtgho
    mhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrnhguihdrshhhhiht
    iheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:X_LjZvZVQfA26BXmdinJ_DBWe2jr2tZMGDRlMGf_FWfJdeJB4BCAeg>
    <xmx:X_LjZuUJuNZwiZGTBOPnM06so16dGui1VSuIrlyBty0tn158fZB5Ew>
    <xmx:X_LjZtm4n7Z_4KGQpUrtZL955T9gMCzLthkqUfRSaElBbP0sPsG1Hw>
    <xmx:X_LjZrdGB1mHS4FpK7FR6X3oOv9hpTsDcjmx6GZP8MrL-cPmP2XBaQ>
    <xmx:YPLjZv0aXh4EGZoo8e7PHR9cghLoi32TVauR4_UC2o-teY4MX0Hiv66X>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A1B05222006F; Fri, 13 Sep 2024 04:05:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 13 Sep 2024 08:05:31 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: arturs.artamonovs@analog.com, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Greg Malysa" <greg.malysa@timesys.com>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Utsav Agarwal" <Utsav.Agarwal@analog.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Andi Shyti" <andi.shyti@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 adsp-linux@analog.com,
 "Nathan Barrett-Morrison" <nathan.morrison@timesys.com>
Message-Id: <00860eb3-8c88-45d3-84f5-5f8f0f03c28c@app.fastmail.com>
In-Reply-To: <20240912-test-v1-19-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-19-458fa57c8ccf@analog.com>
Subject: Re: [PATCH 19/21] arm64: dts: adi: sc598: add device tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, at 18:25, Arturs Artamonovs via B4 Relay wrote:
> +/ {
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "earlycon=adi_uart,0x31003000 console=ttySC0,115200 
> mem=224M";
> +	};

You should not need the mem= and earlycon= arguments, as that data
is already part of the stdout-path property and the memory node.

> +	aliases {
> +		serial0 = &uart0;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};

The aliases are board specific, please only list the ones
that are actually enabled and wired on on a particular
board, and make the aliases match the labels on the board
rather than the internal components of hte chip.

> +	cpus {
> +		#address-cells = <0x2>;
> +		#size-cells = <0x0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0x0 0xdeadbeef>;

Is that the actual address? It looks like some placeholder
that should not have been here.

       Arnd

