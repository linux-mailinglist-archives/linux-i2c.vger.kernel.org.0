Return-Path: <linux-i2c+bounces-3367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B18B9897
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 12:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93897281C02
	for <lists+linux-i2c@lfdr.de>; Thu,  2 May 2024 10:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D418B56B73;
	Thu,  2 May 2024 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="US0lC9wa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DF5B5D3;
	Thu,  2 May 2024 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714644711; cv=none; b=gLRUvYHw0z1XiFujCgpC2guidE9N6HRdReCrwW7J1LSEa2X2EDFMbqahyZ32Yr8uNSMKl7HzPULH+QpRnOsRNmf97kWCzUaAwXqoDAdUCoTEM46EsnpaC1yyIryM5PHSftieLZxAV8bBdNOiyt3q5L+Pqfeh4U76FGFbcuPLRcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714644711; c=relaxed/simple;
	bh=GUU+v+UJIqZI+g6ox/QR1gLsNl4vzZaTvvschNpsLRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHeCuW8LwO+el7IIBQAs0cGs9bk2LxeSteQNYT2Uj0oi7NNFowZufwlKOQu85LybL1EqQzOOJZCyYsDBK9h01r73JxliiQjB0rwkN1SApsPpr1Gx/e+RMWfLYfpewb7IOTqtoDk2wkeVLJYTHt/GLzjeTh0t33ozzcFvSu7c54s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=US0lC9wa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1878FC32789;
	Thu,  2 May 2024 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714644711;
	bh=GUU+v+UJIqZI+g6ox/QR1gLsNl4vzZaTvvschNpsLRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=US0lC9wa3NYxAnawMg86UNKE9Xb8wuRB5rxVj2FDjyQI+k2I4GdUXZ56ohM9Qmw47
	 zEjHHglUdkZ2n9BCW35vITjONMi9O5fRse2iWe1h7YBY9VgfzCqyJfWvY0IeCA1VBW
	 z5sYwP+76Uil1buhBZr5MXKgAhg1G7XYUgzmvJFiSgxLk/Zrm6YfLp4wTh6RK36I/r
	 ElaA02wuNHRkOdwyGg/yGvY44wKdNrX+z3TWK6/nTjrdErKQTzga9Lwux1aIEn0c5m
	 3o+ntGkwvxekOsNRiGpqHbZZCrUhDW3bJ+7Dxtwd3vGJVm2HSqjya/8E6EZ2Ts1aYl
	 vtl00Deidn2KA==
Date: Thu, 2 May 2024 11:11:45 +0100
From: Lee Jones <lee@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH v3 4/5] mfd: intel_quark_i2c_gpio: Utilize
 i2c-designware.h
Message-ID: <20240502101145.GT5338@google.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
 <20240425214438.2100534-5-florian.fainelli@broadcom.com>
 <Ziu6gDOqhEYQNhcH@smile.fi.intel.com>
 <fidbc7locp32lypdui67crj3qkj3nbcp5vpxcnlxrdmme2sn4c@npdan5ncxxog>
 <fdbf6547-7e6d-408d-8ed8-13e449de181d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdbf6547-7e6d-408d-8ed8-13e449de181d@linux.intel.com>

On Thu, 02 May 2024, Jarkko Nikula wrote:

> On 4/30/24 12:36 PM, Andi Shyti wrote:
> > Hi Andy,
> > 
> > On Fri, Apr 26, 2024 at 05:30:24PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 25, 2024 at 02:44:37PM -0700, Florian Fainelli wrote:
> > > > Rather than open code the i2c_designware string, utilize the newly
> > > > defined constant in i2c-designware.h.
> > > 
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > P.S>
> > > Note, my tags for MFD patches does not imply that I agree on the general idea
> > > of this series, it's just in case if it will be approved by the respective
> > > maintainers (I²C / MFD / etc).
> > 
> > I waited a bit to see if more comments were coming.
> > 
> Well I had doubts about the idea will it help maintaining code or do the
> opposite but didn't receive a reply from the patch author:
> 
> https://lore.kernel.org/linux-i2c/62e58960-f568-459d-8690-0c9c608a4d9f@linux.intel.com/
> 
> Also Lee Jones have similar concerns:
> 
> https://lore.kernel.org/linux-i2c/20240502071751.GA5338@google.com/

Right.  It's a NACK from me, sorry.

-- 
Lee Jones [李琼斯]

