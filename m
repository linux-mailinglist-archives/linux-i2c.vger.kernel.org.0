Return-Path: <linux-i2c+bounces-7542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB19AE603
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 15:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09ACDB25B4C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 13:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307901E2009;
	Thu, 24 Oct 2024 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UE3qlqoc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AB41E1A1D;
	Thu, 24 Oct 2024 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776181; cv=none; b=UPhgEfocjM1cycxGEpn0GZmjzMAfu2pWlkXGZZ3gCFSaGftLZxr+JL//H1tT+Xy+zxx0z3j1dP48WQmTDC4cGBWw01qIjXPWbyjt9YSfziAisnjWuLHhWD4jtNZtS+UfOWfCq9CmxBiy5/40jnYfkA6mp2zkmmmoEDxvK+GV+FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776181; c=relaxed/simple;
	bh=xYOd1PGCn+k3tNRpgbdP98I0aYi1W9inhgTkL3ocTDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Prze2YW4/px6dNjvgIQiUZi5AYlp2OISDWognSmw1z5vGRc5OyNGKDkJHnwcZdYIroEwE9m8DJ/pfHH3t0b/qWqRMc0JrhimnxSjNCn5rM80g9EKO3XOfAxNKIk/pHdCM3BwFyHAYOSUipjd/mVvOrmDDl0c72YmvI9FlYEXV5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UE3qlqoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B136AC4CEC7;
	Thu, 24 Oct 2024 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729776180;
	bh=xYOd1PGCn+k3tNRpgbdP98I0aYi1W9inhgTkL3ocTDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UE3qlqocUQQwG7+oevrCYRcqdU5t6igksP5NXhM/w/Avp9vTWc9do/b/XFIaLNfV5
	 nF5Mu09+yamxjgYhYGBEQmyp0jczN/DdGoDW33UtiPMUXVeEbuIhBF22CiQpgWVwV0
	 qUkHRqiDvnAE6+n+Gx1vJ81KFaa+9tUo6F6L3DmpRpnwHnc377u3qWPsgOaTM457VE
	 v9l5/b2mhN5jG+3lRx8YjH+eLwlL5IZ6wRAjXlWNtm0ptENvdOtcjvulFw+AvWDq6L
	 LQWX29+MFnAHc+tALWO1lyKg/mbG/pBQ6CBRa5K0LSHIpv+WZigHO6oDUKFVVqZmqs
	 gAPURf4qcQhJA==
Date: Thu, 24 Oct 2024 15:22:56 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"brendanhiggins@google.com" <brendanhiggins@google.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, BMC-SW <BMC-SW@aspeedtech.com>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Message-ID: <c3ss6ralf4tpyknsda5p745a65xjprlzecdq3s4zy4dpckuxi4@izf7emrzykay>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
 <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
 <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>

Hi Tommy,

On Tue, Oct 22, 2024 at 02:42:08AM +0000, Tommy Huang wrote:
> Hi Andrew,
> 
> 	Thanks for your comments.
> 	I want to fix the situation when our controller is set as target mode and reading / writing by other i2c host.
> 	However, this host is stopped by any other reason (DC on/off..etc).
> 	It will cause the controller is stuck in this situation.
> 	But I find it might not have clear hints to identify this situation is normal or abnormal.
> 	So, this patch should not be applied into mainstream.

Please, avoid top posting, I don't understand which part of the
original message you are trying to comment on.

Second thing, please, before sending a patch, always always
always make sure that checkpatch.pl reports '0' errors and '0'
warnings, except for few sporadic cases.

Andi

