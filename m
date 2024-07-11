Return-Path: <linux-i2c+bounces-4883-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBAE92E176
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF601283C59
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 08:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E19914B96C;
	Thu, 11 Jul 2024 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/Ez6KzP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20B3D548;
	Thu, 11 Jul 2024 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720685136; cv=none; b=eW1wMZgYW4HlWQ5jGqpX0n05/h2Z2xr+FLcKJN2XOs0jZaoW5RFHDbsMFpSOHYEfYoOZE63tAZ/wzb9AJnhe2y1aFBV3+Plzz8vMIl8KraqRz76FQupW/iYqGS+W/jf5+ACX2C1Ubw0QdOZXzaWinatHJY0yPHZ+VaOl0TA3LEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720685136; c=relaxed/simple;
	bh=iMYVilzNme3Zuwb9jJHPsoEzYVhANRS1B/wM502yU2s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oykpy1EHCJurpLLqkkeKk3r/YDek5eCV0BNeCOGQX9QDriewImq2ODeynWlf44o35gMLmmH4S+Ka3HTh8CznzOHxcUvjdKaDfFvf5TQOc9ESNadN6TUmSBSqlzJuJT8KMTSXI5nzaeALq3FpIuJlt8hi2wpcdq//Cei77UKk08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/Ez6KzP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CC9C32782;
	Thu, 11 Jul 2024 08:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720685135;
	bh=iMYVilzNme3Zuwb9jJHPsoEzYVhANRS1B/wM502yU2s=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=n/Ez6KzPG5UOKIkL2L8B2CzhUG0yCohRkr2lRL35JTbvSVDspVskkHg7nhtxzeeDq
	 V7htnsHXfdYYT8YAXsiiUVxYCL4ytUMyqTqc2z7vH+zN5CxjgjA+/FEIGlgBcIRqwU
	 E5uIiOkMw+X/g81wpJRnChc2bEWjB+VIyIWpoAH5QSJRWo+dVlXjWRvlLyF5CESF2D
	 h9pVuwl37AHQr1doorRqw4XaIgbsmb7hHW8cj5nLWI9K3JYimu72FrwBWAjc/qB+QH
	 qJ40HsWTZGLk5svjt8p9KwxjDx7W9/7fgUE2qDeFwWwqmBLIFpYvckxL+GYcl2Q+ez
	 0qr1NcOAcjIAA==
Date: Thu, 11 Jul 2024 10:05:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest
 specification
Message-ID: <3dwf7ivoybpicavorbfvxinlr5rjef5bgksk3esrknzdl52sea@q2dcnb3ox4f2>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
 <7szxutsq35uaydvbo6bzrpsvnx765de7ps3kpvzs3b4ubczq6x@weaxji5u2p7c>
 <Zo8JUWIfmHhKs4jd@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo8JUWIfmHhKs4jd@shikoro>

> > > -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
> > > -	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
> > > +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
> > > +	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,
> > 
> > I searched online for the datasheet but couldn't find it. It
> > would be helpful to know if the SLAVE naming comes from the
> > datasheet or if it is arbitrary.
> 
> I was considering datasheet names, but obviously I concluded that these
> are custom names.

Yes, I understand, but sometimes even the action names are
defined in the datasheet, e.g. as a state machine. That's why I
wanted an ack from someone who has the datasheet.

Or, if it's publicly available, I can check it myself, but I
couldn't find it.

Thanks,
Andi

