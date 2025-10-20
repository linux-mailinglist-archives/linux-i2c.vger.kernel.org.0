Return-Path: <linux-i2c+bounces-13656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0659BEFA4C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 09:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B58574EF618
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEEA2D979F;
	Mon, 20 Oct 2025 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkibIWjZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9692D94B8
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944510; cv=none; b=LXRM2R0PW3AvX1kI7kMMnJ6Vj0xxgzdz67mdTb6fsgjZVyj3dCjteUpDVlrUu4HX7qoRV3NL9k8uFWkOmdoKCfAJy0Ys+vWqtbFxmCQAOJudoWS5zNwpFdomLttkz+W9d5nDPY5cNrCp03LSnDd+xH7xt7/mmmGJFyDdareoydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944510; c=relaxed/simple;
	bh=swIJykyNqVoob/Kf9bG6wI/Zt/NTBlVA3DhF/hZBRRc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PtKSrbfA8hlcDFFIMaX2p6oNhEyJRgziFt7zhCSta5QCzWsyJMgHrfp9vtB0tO/OdctBBx4bvo2b9+8eeNimz2ri8J2JQQhHu6DdtQRue6Hz3opOPOcd2GyN7UgeX8AP2aNPOfoWS7OKHAZV5kbEx/0PUStzoqDDiiWZEhSO8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkibIWjZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C425DC4CEF9;
	Mon, 20 Oct 2025 07:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760944508;
	bh=swIJykyNqVoob/Kf9bG6wI/Zt/NTBlVA3DhF/hZBRRc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=KkibIWjZY+mCKhuYL4bJdDfcj2roEqU13JKWzDX7E83vAFs92jMg5oQctOUuuuOmy
	 Cgow1dP/msWaYeOYcpb7hXA0e4msuTRC9jXb1HLQqwxEyhUl9Pb6mqLHRfPhVqrSKl
	 rRoi/GlaO613OWdof4o/DDkn1hCkFZPi+wD0Btx+wukUmgCNnZUsEw+qY8rZjysmTx
	 y7BUp27QpNF6+slvaVxY7mKUQ39xPpwLYfqUDpl9Lk7lro8a2nod9DveECFqOXl3Ph
	 v09p7zb7Ty0ESh/eeUo9PlgQROw8QHL58qZQWIkK8LY7G5QSvh+DdQipi2+ROmUGGo
	 7Sk63zxiOIsMQ==
Message-ID: <9da780fe-fa4e-4534-9d97-0c321103e9cb@kernel.org>
Date: Mon, 20 Oct 2025 09:15:05 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: i2c-designware: not possible to write to different i2c addresses
 in one transfer?
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <ee6afdd7-3117-43cd-831f-e0ec5ee46f46@kernel.org>
 <aO-KuJ_T9cXsNpIh@ninjato> <aO-kZUwqcoqnFfTh@smile.fi.intel.com>
 <aPUltv8jbxDJ8DcC@shikoro>
Content-Language: en-US, nl
In-Reply-To: <aPUltv8jbxDJ8DcC@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/10/2025 19:53, Wolfram Sang wrote:
> 
>> May I ask a dumb question? Why do we need such an awkward transaction
>> to begin with?
> 
> Because it is allowed per I2C specs? So people will use it.
> 
> Interestingly, a patch has just now been proposed which I haven't looked
> at but I wanted to let you guys already know:
> 
> [PATCH 2/3] i2c: designware: Enable transfer with different target addresses
> https://lore.kernel.org/r/20251017-i2c-dw-v1-2-7b85b71c7a87@bootlin.com
> 
> Maybe you guys can have a look at it?
> 

I'll give it a spin today.

Regards,

	Hans

