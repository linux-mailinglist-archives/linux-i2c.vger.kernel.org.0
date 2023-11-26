Return-Path: <linux-i2c+bounces-460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C27F931F
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EE561C20C69
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2453DD51D;
	Sun, 26 Nov 2023 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbzMyO0Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2512D517
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19BCC433C7;
	Sun, 26 Nov 2023 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701009019;
	bh=TLLNQA2VXYNSg4iw436Him1x6VjVGm1YWNWyuFM/u4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbzMyO0YssbdHB/JPvPVODgrCt0suqRszKTI/l7lRIJYgZAwm52GvFBEGG2/D8TET
	 6SCHkDSxn33BTdpXCFyGpLV4WX1UQpzH/EDdQ66e6A0ZSuP8kfDHcxIFa3v0QUEcJJ
	 MtQQLH8AVsEjySbTo79MCGxHy3budSA3FrdEM6O8BlBKliESGn2TvndXNWBdHX/Xl/
	 zdEG5DGJwriJgu4Ac0G9+vC8c3sJshnEniuc1MDnU+jCkWXmhkWKUVf3Ev0C91e+17
	 IBPBXUOFXbsy6g6VBUuoolLi2HRV8LhCmAApLMjM6kwETgeJqgAiBOCPtOCH1oregS
	 Pke7V/Fbb+V8A==
Date: Sun, 26 Nov 2023 15:30:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jim Cromie <jim.cromie@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/10] i2c: scx200_acb: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126143014.sz4jjwuqcl5biz5p@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-11-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-11-hkallweit1@gmail.com>

Hi Heiner,

in this last patch I will add a couple of minor comments valid
for the previous, as well.

On Fri, Nov 24, 2023 at 11:16:19AM +0100, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.

this sentence is grammatically incorrect, I guess you meant:

"The series was created with support from Coccinelle and its
splitpatch feature."

Please fix it if you are going to resend it.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 

Just for you to know, all your patches have a blank line after
your SoB, it doesn't really matter as I guess git removes it.

In any case, as before:

Acked-by: Andi Shyti <andi.shyti@kernel.org>                     
                                                                 
and I believe:                                                   
                                                                 
Acked-by: Jim Cromie <jim.cromie@gmail.com>                      
                                                                 
so that patchwork takes it.

Thanks,
Andi

