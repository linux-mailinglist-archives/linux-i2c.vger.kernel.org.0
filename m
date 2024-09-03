Return-Path: <linux-i2c+bounces-6061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28696A9BE
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 23:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB3C286219
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 21:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA5A1D799B;
	Tue,  3 Sep 2024 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="figUKZY/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639631D7987;
	Tue,  3 Sep 2024 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725397318; cv=none; b=tVRokt6RjvcZEQ7f1XSBOT0Jq6TJ9KAc1ETnZBA7CKxMLjKnC/XFl1sikqvVeYasyNCqHRAWSwk2vkaUDgOhifR8+nZmTw5rSH1Ne8VTSBIamftTNDXHL6opfEkZ1TPc3RWXcahKR3cVRHi7ObKSUfDKK9YIJknsIRktbNtlPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725397318; c=relaxed/simple;
	bh=YlgYWrov2J1Ssj0+EKTW9v1CpfXqfqZj60bm9Xzp8gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfH6jNWEhNcnuYelEimPq99emCf+7zco7tYi4HdDCJgrAYArJdqrhHo537bZ8zlIT9yoaTT2ViVw5Bte8YndWNd8vs/KrQnwMqfVdiT4qszle0l7z+eQHh7flSzMrXin1Z3kL4ng70v9vn578Hmggy81i3NZlHe1wCZaAPoRAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=figUKZY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD49DC4CEC4;
	Tue,  3 Sep 2024 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725397317;
	bh=YlgYWrov2J1Ssj0+EKTW9v1CpfXqfqZj60bm9Xzp8gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=figUKZY/IW8+qj7UyVP2DYHB0tHl/V0Pgl7XXGOIlJCbEkzSModtPUp0dan0N5Myq
	 Q7rk+ptZvZZSVnYv3dSL3VCISr8aMuhGm92zZCxaA6oLTVHLOgWQWGPCWuqrB+VVUK
	 YbjcW2ZsfYoYx9vadxljtW++8Rmn7juctFToFEUFzLwpfx8pADCMx2XMQWif7Rp10D
	 516BJHWIOMlx/QI7FXzzITM5Hb6YmryY8/YcMj9jdcv02+EkIGTa+uiwEtOpJXdhuG
	 sms353NOhmcFQ8tdzyfUcKzEVhO51qCmV4Zc+Ed1Nl6edZeevKQKcJn4WhY4yXh4TU
	 fH+9xY7y2v5zA==
Date: Tue, 3 Sep 2024 23:01:54 +0200
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
Message-ID: <3phynd24wmymhqugikbdwdzoa6vlzxwv5a6n6bk4446atbf7nu@c2kb766j3pcc>
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

Hi Jarkko, Andy,

...

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

I believe you know this code already, do you mind giving it an
ack?

Thanks,
Andi

