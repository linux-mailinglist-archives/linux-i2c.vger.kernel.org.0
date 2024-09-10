Return-Path: <linux-i2c+bounces-6506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4BD973CF9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62921F25339
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2901A19FA77;
	Tue, 10 Sep 2024 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tlG7et86"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F6199FCC
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 16:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725984419; cv=none; b=WAByThFQs0DUvMoffjkXSG/emHqA5gMF7hbQOojfvlR719EtON3lZ2InWKpYeQvCGy8I19CO8jElSMy5myU81LY6rFYRgIXGeR6O+4Yo20eqbdiiOg/DrBmu/RQaxQ3EmiChmQsnz5aSc3p8G0wWmKZ0xA9AVkxdWOPlvtFMCjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725984419; c=relaxed/simple;
	bh=RY70o9wi1r9R2mbb5CK6OpKEML94TIiy4wd4Gp/aiKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0y+xLWkQDQdfREbezVXWRNXE/GOyosZHET8e9TnR5/2hvAz27LrxnyuctIhH3pKyH7qbuRRThzzhwrNv3hKihBA6XDD28JFYaGLqQR4e0VXtgg1aS7k5m3TbaZb/aCiGoAYXdgrUwLDW6j+gOgFgtXesBq8RHZDAql5R9zile8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tlG7et86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDC3C4CEC4;
	Tue, 10 Sep 2024 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725984419;
	bh=RY70o9wi1r9R2mbb5CK6OpKEML94TIiy4wd4Gp/aiKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlG7et86iQ+ukOiqofLbDiOGfJ6+bsnZUPb/2I/CKYXB2F4l4e+xVPd1lZyIbaYsE
	 imvZaU+8JaRLbwSoBQd0cd+W5tI+/b5CmajLSSodYeAC77VcVrlkLagn2u04SZBbdA
	 oNUwMKi7ULAhP/P1A70WXu5Z7aCkbeAewT+ZQYfRXWmhTi5rpyJVud+gB1pznt9eRA
	 MyBsHSSNuSvoq0CQGsyDOjcu0N6O9+QiBe+WnWEoeBIGlbezxOH5nWJZCS402ZbdgK
	 j8itaxnv0Oe8RCFdj4/rKQKn6WpzoP/yw4T5yeDLz+KKJovBRemvHL0jXbAL7GQNqo
	 3EX+SsJT3hSew==
Date: Tue, 10 Sep 2024 18:06:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Bruce Li <Bruce.Li@alliedtelesis.co.nz>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	John Thompson <John.Thompson@alliedtelesis.co.nz>, Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>
Subject: Re: [PATCH] i2c: designware: Adjust LOW period of the SCL clock
Message-ID: <lqugubxyfiit7muepjdfipuniwnoerkf7vgigx37rpspkuncix@ve6tqpsx6ao3>
References: <7bb85fcde1dc477bb897d89dd0ddeb3b@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bb85fcde1dc477bb897d89dd0ddeb3b@alliedtelesis.co.nz>

Hi Bruce,

On Fri, Jul 12, 2024 at 02:25:17AM GMT, Bruce Li wrote:
> Hi i2c list maintainers, 
> 
> This patch adjusted the LOW period of the SCL clock for a more accurate
> i2c bus speed frequency. The given LOW period of the SCL clock 4.7us
> would result an i2c bus speed of 105kHz (observed by oscilloscope).
> Using 5.2us will have i2c bus speed frequency of 100kHz that match the
> setting of I2C_MAX_STANDARD_MODE_FREQ 100 kHz.

Thanks for your patch but the way you sent it is not totally
right and this is the main reason no one has looked into it.

Please, after having done "git-commit" and "git-format-patch",
please use "git-send-email" and add in Cc the right people by
using

./scripts/get_maintainer.pl 0001-i2c-designware-Adjust-LOW-period-of-the-SCL-clock.patch

Andi

