Return-Path: <linux-i2c+bounces-3101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0588B0919
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB96D2888A2
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 12:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4295015ADA7;
	Wed, 24 Apr 2024 12:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="1lbAuKeu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57963157468;
	Wed, 24 Apr 2024 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961124; cv=none; b=efK59Egq3IkhpoFZMqckIjRJkQIWoa7sh6BjfvKTINaHHhAMeZX1QigwPPG1bp0K1nyzUXoIJD7AQjazxp1OF5B+367JNY3RxOr1s5ST2XTGpJcwQ1YjD3FDbHDlmr7f3AlPKAT00lib0pmjM7ND6uetfMN67v31hALIDS+duso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961124; c=relaxed/simple;
	bh=SULN04cta+fMxT+A7uGTXzI3Jjh1sMkfuGFHWvafAXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV6W/hyAxg1pwBggmBMRijMdYaS5Dmp0QMDKDyPl9qRGHfJprTyi1mx/PTSCakMFmriBN1tbCUglT9DpCYKsREIUOvVUSRqi+nyOuHY0kWwTRcC05LwDx6tKHYKqtwcsLHntumhFlla6zosS+JiaCg+gVKiyUxZ+Ef2/IpFxGQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=1lbAuKeu; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5YU6RLfJEcQkDYGp0nVtAW9ea3dToWjX8XmP9WmB4qY=; b=1lbAuKeuHQtGR5Xoqex+Vz8IKD
	R14cRiF09njBi1f0wxU9n9ZAZ+VTdwMBSHHPn1ashAK0Rlpsa0EjCaUXqXosheKd/okYE74UdJjnd
	faVQ4WN9xtHb8y5C8zN+wTZYzg3bOfkdqgdSIRS0Wf5fNjz4DbprPh2Rw/6hGYimsuQc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rzbZx-00DoLZ-13; Wed, 24 Apr 2024 14:18:25 +0200
Date: Wed, 24 Apr 2024 14:18:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org,
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
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 1/4] i2c: designware: Create shared header hosting driver
 name
Message-ID: <b3cdfeb7-6eb0-4522-96ae-d3155d677002@lunn.ch>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-2-florian.fainelli@broadcom.com>
 <ZihLSKe_BHxasBql@surfacebook.localdomain>
 <0aac2975-42d0-4abe-9405-bf8a38a94104@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aac2975-42d0-4abe-9405-bf8a38a94104@broadcom.com>

> > >   #include <linux/i2c.h>
> > > +#include <linux/i2c-designware.h>
> > 
> > Can it be hidden in the subfolder?
> 
> That would require the MFD and ethernet drivers to include relative to where
> they are in the source tree, do we really want that?

Maybe linux/platform_data/i2c-designware.h ? There are a few NAME
macros in there.

       Andrew

