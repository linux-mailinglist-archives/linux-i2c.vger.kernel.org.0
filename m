Return-Path: <linux-i2c+bounces-817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D13D3813F51
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 02:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF591C220E8
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 01:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA9653A2;
	Fri, 15 Dec 2023 01:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZCEXQo6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0509538A;
	Fri, 15 Dec 2023 01:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC62BC433C8;
	Fri, 15 Dec 2023 01:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702604571;
	bh=WpAhXUDP0156J7Qod8uxjWkADmlPCIE00X7Adp2r1e8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZCEXQo6pawTJBvo7W+kRFb/WNCmOGU/PI7DgARIcNi17ISz65nVpcg4f/pPzcJ5E
	 CNucasQGiaQe1/TWSM66jhPq+C4TpAgHr5mL5mo7ppCSbbSGjHc+UVmI4d2RPGj8ZJ
	 U20wj/8qiYQ0LaH3BpSL943jq7ESdoaqfM/UG/XrzhkOmoY+6THBgc6jxD4pMIUwEN
	 RisdElPzjsEUTLYYyLUp55lEMxUG+h0+1np7mcn8kPnr/xYPPmzmWCGrIpsFtnwzpR
	 827xHxZmmH7Cjzu/hpZ2b+C+xbhP+Wd69sFaWcHDtwMkQpmWVXTpq3D39QNkvrNCHj
	 x7qBkKncgHTqQ==
Date: Fri, 15 Dec 2023 02:42:48 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Wolfram Sang <wsa@kernel.org>,
	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: Handle the coalesced stop conditions
 with the start conditions.
Message-ID: <20231215014248.6f7sqh6n4kmhe4js@zenone.zhora.eu>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
 <20231211102217.2436294-2-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211102217.2436294-2-quan@os.amperecomputing.com>

Hi Quan,

On Mon, Dec 11, 2023 at 05:22:16PM +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
> 
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. Expected
> 0x00000086, but was 0x00000084"
> 
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
> v4:
>   + Add an extra empty line before the comment                        [Andrew]
> 
> Note: I'd like to keep adding Reviewed-by Andrew and Andi for this patch
> eventhough there is an extra empty line added before the comment as mentioned
> above. Thanks for the review.

that's OK and you should. You would remove the r-b/a-b only if
you do some major changes. Besides, this change was asked both by
me and Andrew.

Thanks,
Andi

