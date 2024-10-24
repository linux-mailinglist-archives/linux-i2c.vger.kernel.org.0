Return-Path: <linux-i2c+bounces-7531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC69AE0C8
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72BFC1F2342E
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CA51B6CF9;
	Thu, 24 Oct 2024 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spum1RnW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B05F1B6CE4;
	Thu, 24 Oct 2024 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762103; cv=none; b=dOzKv5MCs40raIAClw6jkkFP7PJlIJdhvl27J0I3rI4WxzTcalonKAEdbSXu1uxks0DWVNWxN7Zn4ASG2zqmyta25OIRu2fvbNTBkOAznRuk3RHNXChGoplBYaYSFvnLROwW+QNigGXO2t6Q9KLeI57KCcdwYzv/1iS3Lw0o5jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762103; c=relaxed/simple;
	bh=fpZS2foOhIzknpZzRCdMwXYMyunLK4oDNzT92es9hpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvIrwQ2uRRLhIY2Pz4YHBEQ2oJlICOGGE/lMB/lRoJ1eKVQzqpRT2FjHT+3E/DDleg83WNUvVRsuQebwLXg7b5lwJ7J1GfP6IhlpbQ2d6ch8Q91E6xC/3+rm8Hl1XSvLt/sZbM4UMgIQ3+77We0V2B1GTokEZR4tkho1/eslXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spum1RnW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAD4C4CEE7;
	Thu, 24 Oct 2024 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729762102;
	bh=fpZS2foOhIzknpZzRCdMwXYMyunLK4oDNzT92es9hpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spum1RnW6kPn60EfTEu9IM4h+2F4Z7UJECedzefe49Z9psqdU5WQRu5PSa5xHxvB0
	 ctap6yaNpLrPTEGPliSbg/2b8U3iKGr1BzlAbWSL9PQkXt8k64vVzUrNGIXaKPxfWa
	 UZHOengOghgPQchAgCRJXgypakIbIVHmkZBMeDnDd7CfC3KXJXWCpbDRNVDQCe05NT
	 RzatV5taDaZ9WVPM81j5qjyHMPHM4iJk2nJIVLOn/mxxskGqKjFRwu6i8BBnYW7PVS
	 EiSwQGcfefHX5FltuvrextsD6jjRf3PE6Iqs+lr3tEFP9jpq2QkBHC4HklaqJwBYa6
	 68TZu8Lquwrnw==
Date: Thu, 24 Oct 2024 11:28:09 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com, andriy.shevchenko@linux.intel.com, wsa@kernel.org, 
	rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
	kfting@nuvoton.com, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <n4buyofrjkgvbgimcziqpm7hfba6du64lbe4aa42d4dhyx6zdn@m4ofnrx66ww6>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
 <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>

Hi Tyrone,

On Tue, Oct 22, 2024 at 04:08:46PM +0800, Tyrone Ting wrote:
> Hi Paul:
> 
> Thank you for your comment.
> 
> It'll be addressed in the next patch set.

No need to resend, I can take care of it.

Andi

