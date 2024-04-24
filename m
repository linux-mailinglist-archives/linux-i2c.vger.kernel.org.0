Return-Path: <linux-i2c+bounces-3111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 366FF8B0F78
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 18:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D261F22491
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 16:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B26D1607B8;
	Wed, 24 Apr 2024 16:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRFmMAUg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C4115B107;
	Wed, 24 Apr 2024 16:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713975253; cv=none; b=NQWbo7bWjq/nvZzmSkpN1s6EcOFktkE9JMt/K3mi8NocBxiJ83euTe8j+Wj3bjfx2hcujZN3Z4FS+6RbLkAC6G5F8JfA6cw1GOFAtjSBANll9Q3KoVD/MjU2yRe6kR+U1yZ5wQZjWcGp9dOPwKWUClzjz+Fcn9YSwlSDQ2hRyr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713975253; c=relaxed/simple;
	bh=0TexNRTyXcfX03x/jOWGmM/SoFKxgKt/qC/qIndL658=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYWMwmrRH6i3k+4DvRblVwQfB3Ey2sVsTdIDRieNIB0AWqGZ4qmrCxMtYYQytvrxkuRTuMWLSU3rFXVpuBp/Sf6hZz3sUvLyU4XuezI3+IyOqoZfKVsSjhr1qaC24h46A7Ff3rftrZMCBQ0d4wWFeHCBWBU0xyX2bunLhmBi7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRFmMAUg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16F8C2BD11;
	Wed, 24 Apr 2024 16:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713975252;
	bh=0TexNRTyXcfX03x/jOWGmM/SoFKxgKt/qC/qIndL658=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRFmMAUgnbfEicuP3c8YoxLCWx9PXXFqgf/ntWfZ2ZbgvvKMvFqgW+2NRlqrHHucx
	 WkSQ+I5RIbqS1n3WO5wGmt1SmenQL6cbP0fZkSDYkOPDfJHkDt1OEH/dl7KJ+4afAE
	 oP3eTNoYQL8WeZuCeqTWtyqGT5p1aUZ823Z96b5djgInRmocqvzQjkeSHT1R3XUKnK
	 SMumHe2C5i/c4pzvQvUJa3Enqb2eS0iYxobOJDQLjCwm7zDOZBGXnIuhCzQSuT6dLI
	 BBtpHCCH6SJhNL5odK+cy0wVgJ4Z30Zix9SPSvoYCNm8wBfW97hMVSTK/m/xKEDf/V
	 K70FB2dtGOa0g==
Date: Wed, 24 Apr 2024 17:14:06 +0100
From: Simon Horman <horms@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 4/4] net: txgbe: Utilize i2c-designware.h
Message-ID: <20240424161406.GM42092@kernel.org>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-5-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423233622.1494708-5-florian.fainelli@broadcom.com>

On Tue, Apr 23, 2024 at 04:36:22PM -0700, Florian Fainelli wrote:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Hi Florian,

FYI, this conflicts with:

c644920ce922 ("net: txgbe: fix i2c dev name cannot match clkdev")

But a patch-set has been submitted which reverts that commit:

https://lore.kernel.org/all/20240422084109.3201-1-duanqiangwen@net-swift.com/

