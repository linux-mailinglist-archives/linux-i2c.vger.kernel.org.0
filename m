Return-Path: <linux-i2c+bounces-3019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD68AA912
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 09:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83081C20C0E
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Apr 2024 07:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403044AEDE;
	Fri, 19 Apr 2024 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Ajstnip1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF84688;
	Fri, 19 Apr 2024 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713511371; cv=none; b=geFI45h73cI9PXcGcZmmIGx9+WLZgZzUQW1StYrhI62OeDv3a49p7TVS6+MWsAnsfny28m1tWJGh2m11rAZVnMttUKTE2cBKTEretrlj7q/JxCgZHeTdqUetl3br7sG8Sgl3jpDHOBsaF5HKpNS0SzDfvjnTOSYvCTQJSZGlFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713511371; c=relaxed/simple;
	bh=CEuAYloiZrQnIKJVjmfowJD2YH1xfOErl7xwt1bPHhM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D1R/rtHQXl6WlT8ccY5N8Y4dDp3Z+ml9NlJd/qhYEZOO2wtOwhJpk+ZB4HRf3e3sv+hZICvY0xaKNe1ZfvQCU9AEAOs4mSXHlmLpJiJ7H+sB+u/kCMOuXkVFz2AAIuxf9ZS+JKq5O0AcL/VeHd4kvHG0GM9hXcptRKJmsUS1gxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=Ajstnip1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713511364;
	bh=y6+LJ/HKVZ3t3mY/lApMl/GxR/GrG1RUjmP1/5KDxJs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ajstnip1AJQziYYZob5+/WWQw9OkiQ6HqYW6enqSgR3T/CWGp6JpdFQzdsfgccveC
	 waF4b2KpmGDJhW0uaIjTruByYiknefTsAbDI1CsuVxIlgr8/egc0ybcsQUt/stAUIl
	 raR314f9lFE/RXTMwibjefIPDZ5AB0qSRczs793ZKaBylcevAra8Aht5IRKNIO774t
	 aG3dAb/4j2sOMbQ5Iwk3E6LlLVt1iq7SfpU3a55AkDG8Tl4O8gD7WxKyVt/tO8JQz4
	 7Nt41dgDBlJelLCvurGlsjRwLg8I8J1MJ2FAUJ37oJvYirJXZTHvc5s+9d7acvo/rM
	 EtC7Y6dv3fK3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLR1c0rdDz4x0D;
	Fri, 19 Apr 2024 17:22:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Andi Shyti
 <andi.shyti@kernel.org>, Abhinav Jain <jain.abhinav177@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, Julia
 Lawall <julia.lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
In-Reply-To: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
 <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
Date: Fri, 19 Apr 2024 17:22:43 +1000
Message-ID: <87plulakak.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chris Packham <Chris.Packham@alliedtelesis.co.nz> writes:
> On 16/04/24 08:54, Andi Shyti wrote:
>> Hi Abhinav,
>>
>>>   	/* Enable I2C interrupts for mpc5121 */
>>> -	node_ctrl = of_find_compatible_node(NULL, NULL,
>>> -					    "fsl,mpc5121-i2c-ctrl");
>>> +	struct device_node *node_ctrl __free(device_node) =
>> How have you tested this?
>
> I'm not sure I know anyone that still has a mpc5121. Maybe someone on 
> linuxppc-dev?

Not that I know of.

The driver loads on my T4240, but doesn't hit the right paths to test
this patch.

No objection to it being merged though.

cheers

