Return-Path: <linux-i2c+bounces-6438-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5F097227A
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6907128439B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 19:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D904189518;
	Mon,  9 Sep 2024 19:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaV47taX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D3E28DBC;
	Mon,  9 Sep 2024 19:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725909673; cv=none; b=MNsMtfMRZxb59TJknARdlgobTfd63WMm/LtOjL53crjf+iseU769OamRypc5sAxG3unFGdgoEKZH8bUYVzSsGD70lhM18AJgfKDCa128OU0A0rWzBDcF7mWIbN5hl5AKbxJSAF24raRbjsq67WaMrSfRN35CjQRyjmEQ1XRyrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725909673; c=relaxed/simple;
	bh=9bJSDQBGO7k0Jh0GnFnt1TFpIGhSJEn1itkvE6YG00w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVr7cXmLBfT+NLbWNcgI4zGgWz3mn5ClfoR2JHhiOVg0Lb3LPcqF91tAJSNhikKxqaupNi1KPABia2qQV5o01ZUlx7YnpmS4SSfSvxxgxmmJicQidkj1xYDtd6azdgX9E1dU4A9gppk5L4DF6jCs2tUXMGRu6GeqvF5ksENkHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaV47taX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF463C4CEC5;
	Mon,  9 Sep 2024 19:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725909672;
	bh=9bJSDQBGO7k0Jh0GnFnt1TFpIGhSJEn1itkvE6YG00w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaV47taXUvlO1IM/k32cr5uPBzJDKZbuBq1ir7Km9ali579z3EsSWJZ3uqvn4pt82
	 mrwJHXJ4Oi1oaOXPUU5TTDr5F6XrmRrUPPaAy5Vkkc03quK+06VsS4FQtazG7pYIbl
	 QxWUcd6IzmAL9nuuQjPPzYrUXLoZi3FwADB4sCrsxMmlff6xaSwNBTR+NyWTHQU0Oh
	 PAKzvKsHz8hIuiPKUjoE/h2PxenDYTMv5b3sE/TdDO1u5IHGM7mwtNsY4cDmHu16WN
	 nAKAkvv+xm63cCPYbRYmV4/nNBGpHPq9ouwePxQ0gKsEls1ZyqVd8WYD8v1U81pySk
	 HWylKm5zar/Fw==
Date: Mon, 9 Sep 2024 21:21:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Dinh Nguyen <dinguyen@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, UNGLinuxDriver@microchip.com, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2 0/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <y3b5aalxlqifobajynik3b7v4xicukuq66kwmpydvcntij4k5b@epqcjrureczj>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>

Hi Heikki,

> Heikki Krogerus (7):
>   ARC: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   ARM: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   arm64: defconfig: enable I2C_DESIGNWARE_CORE with
>     I2C_DESIGNWARE_PLATFORM
>   mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
>   RISC-V: configs: enable I2C_DESIGNWARE_CORE with
>     I2C_DESIGNWARE_PLATFORM
>   net: txgbe: Fix I2C Kconfig dependencies
>   i2c: designware: Group all DesignWare drivers under a single option

Merged to i2c/i2c-host.

Thanks,
Andi

