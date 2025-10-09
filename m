Return-Path: <linux-i2c+bounces-13434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98450BC9405
	for <lists+linux-i2c@lfdr.de>; Thu, 09 Oct 2025 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1FAE1A61D44
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Oct 2025 13:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC29E2E764C;
	Thu,  9 Oct 2025 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="q/G8x5nm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB9A134AB;
	Thu,  9 Oct 2025 13:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016043; cv=none; b=VmkOXwq0omIoCl+YXx7GnVqEX2itCJ3uOik8oK/lxAPYCLhaoDWokcLcJCYrUd8+4s+/Ou5yRORSB5lotEWGEOo5VLudhcptgDqfb4jAKeE7QrfMWmAFKNveTrdQKh7ZqbIIeglnywPznQS9BEMl0aTeRR+WwxhXi8+Lt/+u500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016043; c=relaxed/simple;
	bh=FlQdNG0dA0OIp1Q2tAisZaotCOS8dFYHInHZXi6W5X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv885QTGM9W8NbT7bzHo2wVd3Xji5OCvM5zeTj2L0U5UndikDw8gy9UWOr6v7KySHQ7sfdhTMD/Sfx8d9HNBlPa79UGe5G7Lh8MVi/Z0LKmnk+5q2dh2zaYwgjgf+1XgNWlET54Q+bU5TTOXGdAmCtCcOH7DtN/BSgpn0hkuCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=q/G8x5nm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aRDi+opmOQQW8sJWvpMrmG918tJ06ixNqU31GpHI2F8=; b=q/G8x5nmTnNF1+7Psu57GAkeQs
	Z5grC76eqVgaobUJLI75998Mi+mnAJLgrJom3gyh8snkaQCLEN8zHPkwK2vPVzBK5IA+HSGKs+Nu1
	OJLCmyuMombpal3M7JSwwapdHl6LiQ00VgApmZg8pUttRvjHWLlD1AsD3nQgqUuUSlZ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6qZQ-00AWzI-FL; Thu, 09 Oct 2025 15:20:36 +0200
Date: Thu, 9 Oct 2025 15:20:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Peter Korsgaard <peter@korsgaard.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 1/2] i2c: ocores: increase poll timeout to total
 transfer timeout
Message-ID: <60744be2-1a22-4056-bf05-22f64fb8b484@lunn.ch>
References: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51a72ceca0154d7be85c3cc67722e7dd0b364a2e.1760000254.git.matthias.schiffer@ew.tq-group.com>

On Thu, Oct 09, 2025 at 11:19:49AM +0200, Matthias Schiffer wrote:
> When a target makes use of clock stretching, a timeout of 1ms may not be
> enough. One extreme example is the NXP PTN3460 eDP to LVDS bridge, which
> takes ~320ms to send its ACK after a flash command has been
> submitted.
> 
> The behavior in the regular case is unchanged, spinning for up to 1ms,
> but the open-coded poll loop is replaced with read_poll_timeout_atomic()
> as suggested by Andrew Lunn. In cases where 1ms is not sufficient,
> read_poll_timeout() is used, allowing a total transfer time up to the
> timeout set in struct i2c_adapter (defaulting to 1s, configurable through
> the I2C_TIMEOUT ioctl).

Thanks

Did you test with CONFIG_DEBUG_ATOMIC_SLEEP enabled? I don't think it
is an issue, but the old code could be used in atomic context because
it never slept.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

